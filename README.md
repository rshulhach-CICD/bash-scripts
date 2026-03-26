# Bash Scripts for Learning and Linux Administration
This repository contains Bash scripts created for learning and practicing shell scripting, as well as basic Linux administration tasks.

The project includes:
- basic Bash syntax examples,
- conditional statements and loops,
- input/output redirection,
- functions and command-line options,
- password generation scripts,
- local user management scripts,
- account disabling, deletion, and archiving scripts,
- log analysis and security-related scripts,
- remote command execution and automation scripts.

These scripts were created as part of hands-on Bash practice and are intended for educational purposes.


## Repository Structure
- `basics/` – introductory Bash scripts covering variables, conditions, loops, redirection, functions, and options.
- `admin/` – practical scripts for local user creation, password assignment, disabling, archiving, and deletion.
- `security/` – scripts for log analysis and failed login investigation.
- `automation/` – scripts for executing commands on multiple remote servers.


## How to Run
Make the script executable:

```bash
chmod +x script_name.sh
./script_name.sh
```


## Notes
Some scripts require root privileges because they create, modify, disable, archive, or delete local Linux users.

Some scripts also depend on external Linux utilities such as:
- `ssh`
- `tar`
- `awk`
- `grep`
- `geoiplookup`

Examples:
```bash
sudo ./admin/add-newer-local-user.sh username "Full Name"
sudo ./admin/disable-local-user.sh -a username
sudo ./admin/disable-local-user.sh -d username
./security/show-attackers.sh /var/log/auth.log 10
./automation/run-everywhere.sh -f servers.txt "uptime"
```

## Featured Scripts
- `add-local-user.sh` – interactively creates a local user.
- `add-new-local-user.sh` – creates a user using command-line arguments and generates a password.
- `add-newer-local-user.sh` – improved version of the local user creation script with better error handling.
- `disable-local-user.sh` – disables, deletes, or archives local user accounts using command-line options.
- `show-attackers.sh` – analyzes failed login attempts in log files and shows repeated attacker IP addresses with location data.
- `run-everywhere.sh` – runs a command on multiple remote servers using SSH.
- `luser-demo11.sh` – password generator with command-line options.
- `luser-demo12.sh` – deletes a local user.
