

⸻


This script automates logging for Terragrunt apply operations and work directory tracking. It helps maintain structured logs in CSV and log files, making it easy to track applied infrastructure changes and work activities.

⸻

📌 Features
	•	Logs terragrunt apply actions with timestamps, directories, and Git branches.
	•	Tracks work-related activities, including ticket numbers and descriptions.
	•	Saves logs in both CSV and log files.
	•	Organizes logs automatically in ~/Desktop/Workspace/work-trackers/log-files/.

⸻

📥 Setup Instructions

1️⃣ Save the script

Copy work-tracker.sh into:

Work Tracker Script (work-tracker.sh)
```bash
#!/bin/bash

###########################
# Note: This file is currently used in ~/.bash_profile to save terragrunt-apply and work track/directories log
###########################

# Function for Terragrunt Apply Logging
tg_apply_log() {
    # Get the current timestamp
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    # Get the current working directory (location)
    local location=$(pwd)

    # Get the current Git branch (if inside a Git repo)
    local branch=""
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        branch=$(git rev-parse --abbrev-ref HEAD)
    fi

    # Get the Terragrunt configuration directory (where terragrunt.hcl is located)
    local tg_config=""
    if [ -f "./terragrunt.hcl" ]; then
        tg_config=$(dirname "$(find . -name "terragrunt.hcl" -print -quit)")
    fi

    # Define log and CSV file locations
    local csv_file1=~/Desktop/Workspace/work-trackers/log-files/tg-tracker.csv
    local log_file1=~/Desktop/Workspace/work-trackers/log-files/tg-tracker.log

    # Ensure directory exists
    mkdir -p ~/Desktop/Workspace/work-trackers/log-files

    # If the CSV file is new or empty, add a CSV header
    if [[ ! -f "$csv_file1" || ! -s "$csv_file1" ]]; then
        echo "Timestamp,Terragrunt Apply Directory,Terragrunt Config,Git Branch" > "$csv_file1"
    fi

    # Escape commas in directory paths to maintain CSV format
    location=$(echo "$location" | sed 's/,/ /g')
    tg_config=$(echo "${tg_config:-N/A}" | sed 's/,/ /g')
    branch=$(echo "${branch:-N/A}" | sed 's/,/ /g')

    # Prepare CSV log entry
    local csv_entry="$timestamp,\"$location\",\"$tg_config\",\"$branch\""

    # Prepare human-readable log entry
    local log_entry="$timestamp - Terragrunt applied in: $location | Terragrunt Config: ${tg_config:-N/A} | Git Branch: ${branch:-N/A}"

    # Save log entry to CSV file
    echo "$csv_entry" | tee -a "$csv_file1"

    # Save log entry to LOG file
    echo "$log_entry" | tee -a "$log_file1"

    # Confirmation message
    echo "Log entry saved in:"
    echo "  - CSV: $csv_file1"
    echo "  - LOG: $log_file1"

    # Run Terragrunt Apply
    terragrunt apply -auto-approve
}

# Function for Saving Work Directory with Logging in CSV and LOG format
swd_log() {
    # Get the current timestamp
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    # Get the current working directory (location)
    local location=$(pwd)

    # Get the current Git branch (if inside a Git repo)
    local branch=""
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        branch=$(git rev-parse --abbrev-ref HEAD)
    fi

    # Get the Terragrunt configuration directory (where terragrunt.hcl is located)
    local tg_config=""
    if [ -f "./terragrunt.hcl" ]; then
        tg_config=$(dirname "$(find . -name "terragrunt.hcl" -print -quit)")
    fi

    # Ask the user if they want to enter ticket number and description
    echo -n "Would you like to enter Work/Ticket Number and Description? (Y/N): "
    read user_choice

    # Convert user input to lowercase for consistency
    user_choice=$(echo "$user_choice" | tr '[:upper:]' '[:lower:]')

    if [[ "$user_choice" == "y" ]]; then
        # Prompt for Work/Ticket number
        echo -n "Enter Work Details or Ticket Number: "
        read ticket_number

        # Prompt for Description
        echo -n "Enter Description (e.g., 'Terragrunt applied for UAR Automation'): "
        read work_description
    else
        # Default values if user chooses 'No'
        ticket_number="No Ticket Provided"
        work_description="No Description Provided"
    fi

    # Define log and CSV file locations
    local csv_file=~/Desktop/Workspace/work-trackers/log-files/work-tracker.csv
    local log_file=~/Desktop/Workspace/work-trackers/log-files/work-tracker.log

    # Ensure directory exists
    mkdir -p ~/Desktop/Workspace/work-trackers/log-files

    # If the file is empty or does not exist, add a CSV header
    if [[ ! -f "$csv_file" || ! -s "$csv_file" ]]; then
        echo "Timestamp,Work/Ticket,Description,Directory,Terragrunt Config,Git Branch" > "$csv_file"
    fi

    # Escape commas in user input to maintain CSV structure
    ticket_number=$(echo "$ticket_number" | sed 's/,/ /g')
    work_description=$(echo "$work_description" | sed 's/,/ /g')

    # Prepare CSV log entry
    local csv_entry="$timestamp,\"$ticket_number\",\"$work_description\",\"$location\",\"${tg_config:-N/A}\",\"${branch:-N/A}\""

    # Prepare human-readable log entry
    local log_entry="$timestamp - Work/Ticket: $ticket_number | Description: $work_description | Directory: $location | Terragrunt Config: ${tg_config:-N/A} | Git Branch: ${branch:-N/A}"

    # Save log entry to CSV file
    echo "$csv_entry" | tee -a "$csv_file"

    # Save log entry to LOG file
    echo "$log_entry" | tee -a "$log_file"

    # Confirmation message
    echo "Log entry saved in:"
    echo "  - CSV: $csv_file"
    echo "  - LOG: $log_file"
}

# Determine which function to execute (Must be at the bottom!)
if [[ "$1" == "tg-apply" ]]; then
    tg_apply_log
elif [[ "$1" == "swd" ]]; then
    swd_log
else
    echo "Usage: work-tracker.sh [tg-apply | swd]"
fi
```

~/Desktop/Workspace/work-trackers/work-tracker.sh

2️⃣ Make it executable

Run:
```
chmod +x ~/Desktop/Workspace/work-trackers/work-tracker.sh
```

3️⃣ Add aliases for quick access

Run:

```
echo 'alias tg-apply="~/Desktop/Workspace/work-trackers/work-tracker.sh tg-apply"' >> ~/.bash_profile
echo 'alias swd="~/Desktop/Workspace/work-trackers/work-tracker.sh swd"' >> ~/.bash_profile
source ~/.bash_profile
```

(For Zsh users, use ~/.zshrc instead.)

⸻

🚀 How to Use

🔹 Log terragrunt apply actions

Run:

tg-apply

	•	Saves logs in:
	•	tg-tracker.csv
	•	tg-tracker.log
	•	Runs terragrunt apply -auto-approve automatically.

🔹 Log work directory with ticket number

Run:

swd

	•	Prompts for ticket number and description.
	•	Saves logs in:
	•	work-tracker.csv
	•	work-tracker.log

⸻

📂 Log File Locations

File Name	Purpose	Format
tg-tracker.csv	Tracks Terragrunt apply actions	CSV
tg-tracker.log	Human-readable Terragrunt logs	Log
work-tracker.csv	Tracks work activities & ticket numbers	CSV
work-tracker.log	Human-readable work logs	Log



⸻

🎯 Benefits of Using This Script

✅ Automates logging – No need to manually track Terragrunt applies or work activities.
✅ Easy search & filtering – CSV logs can be opened in Excel for analysis.
✅ Ensures accountability – Work logs help track applied changes and ticket history.
✅ Saves time – Quickly retrieve logs without searching through terminal history.

⸻

🛠 Need Help?

If you face any issues, ensure:
	•	The script has execute permissions (chmod +x work-tracker.sh).
	•	Aliases are correctly set (source ~/.bash_profile).
	•	Required directories exist (mkdir -p ~/Desktop/Workspace/work-trackers/log-files).

⸻

🚀 Now you’re all set to track your work and infrastructure changes efficiently! 🚀

⸻

