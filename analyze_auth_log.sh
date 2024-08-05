#!/bin/bash

# Define the input and output log files
input_log="/var/log/auth_log.log"
output_log="/var/log/suspicious_activity.log"

# Define the keywords that indicate suspicious activity
keywords=("Failed password" "Unauthorized access" "error: PAM" "invalid user" "Could not load host key")

# Clear the output log file if it exists
sudo bash -c "echo '' > $output_log"

# Loop through each line of the log file
while IFS= read -r line; do
    # Check if the line contains any of the keywords
    for keyword in "${keywords[@]}"; do
        if [[ "$line" == *"$keyword"* ]]; then
            # If a keyword is found, write the line to the suspicious activity log
            echo "$line" | sudo tee -a "$output_log" > /dev/null
            break
        fi
    done
done < "$input_log"

echo "Suspicious activity log created at $output_log"
