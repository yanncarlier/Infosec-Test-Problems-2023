import paramiko
import argparse
from subprocess import PIPE, run

def ssh_upgrade(host, username, key_path, on_upgrade_command):
    try:
        # Create an SSH client
        client = paramiko.SSHClient()
        client.set_missing_host_key_policy(paramiko.AutoAddPolicy())

        # Connect to the remote host with key-based authentication
        client.connect(hostname=host, username=username, key_filename=key_path)

        # Upgrade packages
        upgrade_cmd = "sudo apt update && sudo apt upgrade -y"
        stdin, stdout, stderr = client.exec_command(upgrade_cmd)
        print(f"Upgrade output on {host}:\n{stdout.read().decode('utf-8')}")

        # Run additional command if provided
        if on_upgrade_command:
            stdin, stdout, stderr = client.exec_command(on_upgrade_command)

            # Print the command output
            print(f"Custom command output on {host}:\n{stdout.read().decode('utf-8')}")

    except Exception as e:
        print(f"Error on {host}: {str(e)}")
    finally:
        client.close()

def main():
    parser = argparse.ArgumentParser(description="SSH into hosts, upgrade packages, and run a command.")
    parser.add_argument("host_file", help="Path to the file containing hostnames or IP addresses.")
    parser.add_argument("username", help="SSH username for authentication.")
    parser.add_argument("key_path", help="Path to the SSH private key.")
    parser.add_argument("--on-upgrade", help="Custom command to run after package upgrade.")

    args = parser.parse_args()

    # Read hostnames from the file
    with open(args.host_file, "r") as file:
        hosts = file.read().splitlines()

    # Loop through each host and perform the upgrade and command execution
    for host in hosts:
        print(f"\nConnecting to {host}...")
        ssh_upgrade(host, args.username, args.key_path, args.on_upgrade)

if __name__ == "__main__":
    main()
