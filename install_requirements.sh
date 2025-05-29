#!/bin/bash

echo "🚀 Installing required packages for Gemini CLI..."

# Update package lists
pkg update -y

# Install curl, jq, and glow
pkg install curl jq glow -y

if [ $? -eq 0 ]; then
    echo "✅ All required packages installed successfully!"
else
    echo "❌ Error installing one or more packages. Please check your internet connection and try again."
fi

echo "Setting up Gemini API key file..."
if [ ! -f "$HOME/.gemini_key" ]; then
    echo "No API key file found at ~/.gemini_key."
    echo "Please get your Google Gemini API key from: https://aistudio.google.com/app/apikey"
    echo "Then, create the file and paste your key into it:"
    echo "  nano ~/.gemini_key"
    echo "  chmod 600 ~/.gemini_key"
else
    echo "API key file (~/.gemini_key) already exists. Skipping setup."
fi

echo "Installation script finished."
