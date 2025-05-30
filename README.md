# Gemini CLI Tool

A command-line interface (CLI) for interacting with the Google Gemini AI model, designed for quick and easy conversational access from your terminal.

## Features

* **New Chat:** Start fresh conversations with AI-generated names or custom names.
* **Continue Chat:** Pick up where you left off in existing conversations.
* **View History:** Review entire chat transcripts.
* **List Chats:** See all your saved conversations at a glance with custom names and creation times.
* **Delete Chats:** Remove individual chats or all history.
* **Markdown Rendering:** AI responses are beautifully rendered using `glow` (optional, but highly recommended!).

## Installation

1.  **Prerequisites:**
    * Termux (or any Linux-like environment)
    * `curl`, `jq`, `glow` (install with `pkg install curl jq glow`)
    * A Google Gemini API key.

2.  **Get Your Gemini API Key:**
    * Visit [Google AI Studio](https://aistudio.google.com/app/apikey) and generate an API key.
    * Save this key in a file named `.gemini_key` in your Termux home directory:
        ```bash
        echo "YOUR_API_KEY_HERE" > ~/.gemini_key
        ```
        (Replace `YOUR_API_KEY_HERE` with your actual key).

3.  **Clone the Repository:**
    ```bash
    git clone https://github.com/Abdulqoreeb/gemini-cli.git
    cd gemini-cli
    ```

4.  **Make Scripts Executable:**
    ```bash
    chmod +x gemini generate_chat_name.sh
    ```

5.  **Add to your PATH (Optional, Recommended):**
    To run `gemini` from any directory, add your `gemini-cli` directory to your shell's PATH.
    Edit your shell's config file (e.g., `~/.bashrc` or `~/.zshrc`):

    ```bash
    nano ~/.bashrc # or ~/.zshrc
    ```
    Add this line at the end:
    ```bash
    export PATH="$HOME/gemini-cli:$PATH"
    ```
    Save the file, then apply changes:
    ```bash
    source ~/.bashrc # or source ~/.zshrc
    ```

## Usage

All commands start with `gemini`.

* **Start a new chat:**
    ```bash
    gemini new "Tell me a fun fact about space."
    # Or with a custom name:
    gemini new --name "Space Facts" "Tell me a fun fact about space."
    ```

* **Continue an existing chat:**
    ```bash
    gemini talk chat1 "What else can you tell me?"
    # Or using the custom name (if it's unique enough):
    gemini talk space-facts "And another one?"
    ```

* **View chat history:**
    ```bash
    gemini view chat1
    ```

* **List all chats:**
    ```bash
    gemini list
    ```

* **Delete a chat:**
    ```bash
    gemini clear chat1
    ```

* **Reset all chats (WARNING: Permanent!):**
    ```bash
    gemini reset-all
    ```

