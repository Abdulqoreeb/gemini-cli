---



▄████████    ▄████████ ███    █▄   ▄██████▄  ███    █▄     ▄████████ ███    ███   ███    ███ ███    ███ ███    ███ ███    ███   ███    ███ ███    █▀    ███    ███ ███    ███ ███    ███ ███    ███   ███    █▀
▄███▄▄▄       ███    ███ ███    ███ ███    ███ ███    ███   ███
▀▀███▀▀▀     ▀███████████ ███    ███ ███    ███ ███    ███ ▀███████████ ███          ███    ███ ███    ███ ███    ███ ███    ███          ███ ███          ███    ███ ███    ███ ███    ███ ███    ███    ▄█    ███ ███          ███    █▀  ████████▀   ▀██████▀  ████████▀   ▄████████▀

🔮 Gemini CLI Tool — Talk to Google's AI from Termux

---

## Features

- **New Chat:** Start fresh conversations with AI-generated names or custom names.  
- **Continue Chat:** Pick up where you left off in existing conversations.  
- **View History:** Review entire chat transcripts.  
- **List Chats:** See all your saved conversations at a glance with custom names and creation times.  
- **Delete Chats:** Remove individual chats or all history.  
- **Markdown Rendering:** AI responses are beautifully rendered using `glow` (optional, but highly recommended!).

---

## Installation

### 1. **Prerequisites**
- Termux (or any Linux-like environment)  
- `curl`, `jq`, `glow`  
  > Install them with:  
  > `pkg install curl jq glow`  
- A Google Gemini API key

### 2. **Get Your Gemini API Key**
- Visit [Google AI Studio](https://aistudio.google.com/app/apikey) and generate an API key.  
- Save this key in a file named `.gemini_key` in your Termux home directory:

  ```bash
  echo "YOUR_API_KEY_HERE" > ~/.gemini_key

> Replace YOUR_API_KEY_HERE with your actual key.



3. Clone the Repository

git clone https://github.com/Abdulqoreeb/gemini-cli.git
cd gemini-cli

4. Make Scripts Executable

chmod +x gemini generate_chat_name.sh install_requirements.sh

5. Install Dependencies

./install_requirements.sh

> This installs curl, jq, and optionally glow for Markdown rendering.



6. Add to your PATH (Optional, Recommended)

To run gemini from any directory, add your gemini-cli directory to your shell's PATH:

nano ~/.bashrc  # or ~/.zshrc

Add this line at the bottom:

export PATH="$HOME/gemini-cli:$PATH"

Apply the changes:

source ~/.bashrc  # or source ~/.zshrc


---

Usage

All commands start with gemini.

➕ Start a New Chat

gemini new "Tell me a fun fact about space."

Or with a custom name:

gemini new --name "Space Facts" "Tell me a fun fact about space."

🔄 Continue an Existing Chat

gemini talk chat1 "What else can you tell me?"

Or using the custom name (if unique enough):

gemini talk space-facts "And another one?"

📜 View Chat History

gemini view chat1

📂 List All Chats

gemini list

❌ Delete a Chat

gemini clear chat1

☠️ Reset All Chats (WARNING: Permanent!)

gemini reset-all


---

License

This project is licensed under the MIT License. See the LICENSE file for details.

---
