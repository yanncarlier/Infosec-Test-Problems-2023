# Update Remote Hosts

### A Python script that:

- takes a list of hostnames or IP addresses from a newline-delimited file given as a mandatory argument,
- SSHs to each host with an SSH key using [Paramiko](https://www.paramiko.org/),
- upgrades all out-of-date packages (the hosts are running Ubuntu) and
- runs any other command passed in as `--on-upgrade "command to run"`.

The script clearly report errors (e.g. host unreachable), but should not halt until it has tried to run on every host.

### Ensure you have Paramiko installed before running the script:

`pip install paramiko`

Make sure to replace `<your_username>` and `<your_key_path>` with your actual SSH username and key path.

You can run the script as follows:

python3 ssh_upgrade_script.py host_file.txt your_ssh_username /path/to/your/private/key.pem --on-upgrade "your_custom_command"

For example:

python3 ssh_upgrade_script.py hosts.txt ubuntu ../Cloud_infrastructure/infosec0.pem --on-upgrade "sudo snap refresh"





disclaimer: this code needs a loot more attention, it was done in a fast pace due to unexpected events and a fixed deadline

note: Some code was generated and adapted from chatGPT version 3.5





## Some security considerations for the provided script:

1. **Key Management:**
   - Ensure that the private key (`key_path`) is stored securely and not accessible by unauthorized users.
   - Consider using an SSH agent for key management, especially in production environments.
2. **Host Key Verification:**
   - Instead of using `AutoAddPolicy`, consider manually verifying and storing host keys to prevent man-in-the-middle attacks.
3. **Exception Handling:**
   - Improve exception handling to avoid exposing sensitive information in case of errors.
   - Avoid printing detailed error messages to the console, especially if it contains sensitive information.
4. **Passwordless Sudo:**
   - Using `sudo` in the upgrade command assumes that passwordless sudo is configured for the specified user. Ensure that this is done securely.
5. **Custom Command Injection:**
   - If the `on_upgrade_command` is provided as an argument, ensure it does not allow arbitrary command injection. Validate and sanitize inputs to prevent unintended commands.
6. **Logging:**
   - Consider logging actions and errors to a secure location instead of printing directly to the console.
   - Implement a logging mechanism that logs only essential information and not sensitive details.
7. **File Permissions:**
   - Ensure that the script file and associated configuration files have appropriate permissions, allowing only authorized users to read or execute them.
8. **Network Security:**
   - If applicable, ensure that the hosts are in a secure network and firewall rules are configured to restrict access.
9. **Secure File Handling:**
   - Validate and sanitize inputs, especially file paths, to prevent directory traversal attacks.
   - Ensure that the `host_file` and `key_path` parameters are properly validated and sanitized.
10. **Regular Updates:**
    - Regularly update the script and its dependencies to include security patches and improvements.
11. **Least Privilege Principle:**
    - Follow the principle of least privilege by ensuring that the provided SSH user has the minimum required permissions to perform the necessary tasks.
12. **User Input Validation:**
    - Validate user inputs thoroughly, ensuring they meet expected formats and criteria.
13. **Network Isolation:**
    - Consider running the script from a secure and isolated environment to prevent unintended access.

These considerations depend on the specific deployment environment and use case. Adaptations might be needed based on the specific security requirements of the system.
