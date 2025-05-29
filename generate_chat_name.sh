#!/bin/bash

# This script generates an AI-suggested chat name based on an initial prompt.
# It requires an API key in ~/.gemini_key and 'jq' to be installed.

# Function to get an AI-generated chat name
get_ai_chat_name() {
  local initial_prompt="$1"
  local api_key=$(<~/.gemini_key) # Reads API key from ~/.gemini_key

  if [ -z "$api_key" ]; then
    echo -e "\033[1;31m❌ API key not found or empty. Please check ~/.gemini_key\033[0m" >&2
    echo "untitled-ai-chat" # Fallback
    return 1
  fi

  echo "Thinking of a chat name..." >&2 # Output to stderr

  local instruction="Based on the following user prompt, generate a very concise and descriptive title (1-5 words) for a conversation. Do NOT include any conversational filler, just the title. Example: 'Quantum Entanglement Explained'."
  local full_prompt="$instruction\n\nUser prompt: \"$initial_prompt\""

  # Safe JSON using jq to construct the payload
  local json_payload=$(jq -n \
    --arg text "$full_prompt" \
    '{contents: [{role: "user", parts: [{text: $text}]}]}')

  # Make the API call
  local response=$(curl -s -X POST \
    -H "Content-Type: application/json" \
    "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$api_key" \
    -d "$json_payload")

  # Try to extract the generated name
  local ai_suggested_name=$(echo "$response" | jq -r '.candidates[0].content.parts[0].text' 2>/dev/null)

  # If invalid, print debug info and return fallback
  if [ -z "$ai_suggested_name" ] || [ "$ai_suggested_name" == "null" ]; then
    echo -e "\033[1;31m⚠️ Failed to generate a chat name for: \"$initial_prompt\".\033[0m" >&2
    echo -e "\033[0;33mHere's the raw API response for debugging the naming request:\033[0m" >&2
    echo "$response" | jq . >&2 || echo "$response" >&2 # Pretty print if possible, else raw
    echo "untitled-ai-chat" # Fallback name
    return 1 # Indicate failure
  fi

  # Sanitize the name
  local sanitized_name=$(echo "$ai_suggested_name" | tr '[:upper:]' '[:lower:]')
  sanitized_name="${sanitized_name// /-}" # Replace spaces with hyphens
  sanitized_name=$(echo "$sanitized_name" | sed 's/[^a-z0-9.-]//g') # Keep alphanumeric, dot, and literal hyphen
  sanitized_name="${sanitized_name:0:50}" # Trim to a reasonable length
  sanitized_name=$(echo "$sanitized_name" | sed 's/^-*//; s/-*$//; s/^\.*//; s/\.*$//') # Remove leading/trailing hyphens or dots

  if [ -z "$sanitized_name" ]; then
    echo "untitled-ai-chat"
  else
    echo "$sanitized_name"
  fi
}

# Call the function with arguments passed to the script
get_ai_chat_name "$@"
