
---

# 🔮 Gemini CLI Tool — Talk to Google's AI from Termux

---

## Features

- **New Chat**: Start fresh conversations with AI-generated names or custom names.  
- **Continue Chat**: Resume existing conversations seamlessly.  
- **View History**: Review entire chat transcripts.  
- **List Chats**: See all saved conversations at a glance, complete with custom names and creation times.  
- **Delete Chats**: Remove individual chats or clear all history.  
- **Markdown Rendering**: AI responses are beautifully rendered using `glow` (optional but highly recommended).

---

## Installation

### 1. **Prerequisites**
Ensure you have the following tools installed:
- Termux (or any Linux-like environment)
- `curl`, `jq`, `glow`  

Install them using:
```bash
pkg install curl jq glow
```

Additionally, you will need a Google Gemini API key.

### 2. **Get Your Gemini API Key**
- Visit [Google AI Studio](https://aistudio.google.com/app/apikey) and generate an API key.  
- Save this key in a file named `.gemini_key` in your Termux home directory:
```bash
echo "YOUR_API_KEY_HERE" > ~/.gemini_key
```
> Replace `YOUR_API_KEY_HERE` with your actual API key.

### 3. **Clone the Repository**
```bash
git clone https://github.com/Abdulqoreeb/gemini-cli.git
cd gemini-cli
```

### 4. **Make Scripts Executable**
```bash
chmod +x gemini generate_chat_name.sh install_requirements.sh
```

### 5. **Install Dependencies**
Run the following script to install required packages:
```bash
./install_requirements.sh
```
This installs `curl`, `jq`, and optionally `glow` for Markdown rendering.

### 6. **Add to Your PATH** (Optional but Recommended)
To run `gemini` commands from any directory, add the `gemini-cli` directory to your shell's PATH:
```bash
nano ~/.bashrc  # or ~/.zshrc
```
Add the following line at the bottom:
```bash
export PATH="$HOME/gemini-cli:$PATH"
```
Apply the changes:
```bash
source ~/.bashrc  # or source ~/.zshrc
```

---

## Usage

All commands start with `gemini`.

### ➕ Start a New Chat
```bash
gemini new "Tell me a fun fact about space."
```
Or with a custom name:
```bash
gemini new --name "Space Facts" "Tell me a fun fact about space."
```

### 🔄 Continue an Existing Chat
```bash
gemini talk chat1 "What else can you tell me?"
```
Or use the custom name (if unique enough):
```bash
gemini talk space-facts "And another one?"
```

### 📜 View Chat History
```bash
gemini view chat1
```

### 📂 List All Chats
```bash
gemini list
```

### ❌ Delete a Chat
```bash
gemini clear chat1
```

### ☠️ Reset All Chats (WARNING: Permanent!)
```bash
gemini reset-all
```

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---
