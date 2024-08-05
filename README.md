# Analyze Authentication Logs Script

## Overview

The `analyze_auth_log.sh` script is a Bash script designed to monitor and analyze the authentication logs on a server. The script scans through the `/var/log/auth_log.log` file, searching for specific keywords that indicate potentially suspicious activities. If any of these keywords are found, the corresponding log entries are extracted and written to a new file called `suspicious_activity.log`.

This script is intended to assist in identifying unauthorized access attempts, authentication failures, and other suspicious activities on the server. It is particularly useful in environments where security is a priority, such as financial institutions, where monitoring and responding to potential security threats is crucial.

## How the Script Works

- **Input Log File:** The script reads from the `/var/log/auth_log.log` file, which contains all login attempts and other related events on the server.
- **Output Log File:** The script writes all identified suspicious entries to the `/var/log/suspicious_activity.log` file.
- **Keywords:** The script searches for the following keywords that are commonly associated with suspicious activities:
  - `Failed password`
  - `Unauthorized access`
  - `error: PAM`
  - `invalid user`
  - `Could not load host key`
  
  These keywords help identify failed login attempts, unauthorized access attempts, and other security-related issues.

- **Clearing Old Logs:** The script clears the previous content of the `suspicious_activity.log` file before writing new entries to ensure that only the latest suspicious activities are recorded.

- **Processing Logs:** The script processes each line in the `auth_log.log` file, checks for the presence of any of the keywords, and writes the matching lines to the `suspicious_activity.log` file.

## Execution Frequency

The `analyze_auth_log.sh` script is scheduled to run **daily at midnight** using a cron job. This ensures that the authentication logs are regularly monitored, and any suspicious activities are promptly identified and logged for further investigation.
