# bash-exercises

## References

- [The Bash Guide](https://guide.bash.academy)
- Bash Idioms
- The Linux Command Line

## Exercises

🏗️ Project Setup

🧪 Exercise: Write a script that creates this structure:

my_app/
├── src/
├── tests/
├── .env
└── README.md

Key Concepts: mkdir -p, touch, if, functions

⸻

🧪 Test Automation

🧪 Exercise: Write a script that:
	•	Runs a test command (e.g., pytest or echo "Running tests")
	•	Exits with failure if it fails (exit 1)
	•	Otherwise prints “Deploying…”

Key Concepts: $?, if, exit, echo

⸻

🔄 File Management

🧪 Exercise: Write a script that:
	•	Copies a file config.yml into a backup/ folder
	•	Renames it to include today’s date, e.g., config-2025-04-17.yml

Key Concepts: cp, date, basename, mkdir -p

⸻

⚙️ Env Config

🧪 Exercise: Script that:
	•	Accepts an argument: dev, prod, or staging
	•	Copies .env.{env} to .env
	•	Echoes what env is being used

Key Concepts: $1, case, cp, if

⸻

🔍 Linting or Formatting

🧪 Exercise: Script that:
	•	Finds all .sh files
	•	Runs shellcheck on each (or just echo "Checking $file" if you don’t have shellcheck)

Key Concepts: find, for, echo, xargs

⸻

🚀 Deploy Script

🧪 Exercise: Script with:
	•	--dry-run flag that only prints steps
	•	--force flag that pretends to deploy
	•	Default is to ask the user to choose

Key Concepts: getopts, functions, if, $@

⸻

📦 Install Helper

🧪 Exercise: Script that:
	•	Detects if you’re on macOS or Linux
	•	Installs tree if it’s not installed (use brew or apt)

Key Concepts: uname, command -v, if, functions

⸻

🧼 Cleanup Utility

🧪 Exercise: Script that:
	•	Deletes .log files in ./logs/ older than 7 days

Key Concepts: find, -mtime, rm, mkdir

⸻

🧰 Health Check

🧪 Exercise: Script that:
	•	Pings google.com
	•	Retries 3 times before giving up

Key Concepts: ping, for, sleep, if

⸻

📊 Disk Usage Alert

🧪 Exercise: Script that:
	•	Checks current disk usage
	•	Warns if / is over 80%

Key Concepts: df -h, awk, numeric comparisons

⸻

🛠️ Build Script

🧪 Exercise: Script that:
	•	Compresses all .txt files in a folder into archive.tar.gz
	•	Moves it to builds/

Key Concepts: tar, mv, mkdir, basename

⸻

💬 Git Wrapper

🧪 Exercise: Script that:
	•	Takes a message, does git add . && git commit -m "$msg" && git push
	•	If no message given, asks the user interactively

Key Concepts: read, $1, if, git