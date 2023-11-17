# Infosec Test Problems

## Overview

These problems are intended to test your engineering knowledge and problem-solving skills.
If you run out of time, leave a placeholder and comment noting that.
Regardless, your code should run and be of high quality.

If you use significant content from other resources (e.g. code snippets from SO), cite it in a comment.

## How to Submit

Make a pull request with your proposed changes, pretend we are your colleagues reviewing your work.
Each problem should be in its own directory with accompanying documentation.

## Problems

### 1: Update Remote Hosts

Write a Python script that:
* takes a list of hostnames or IP addresses from a newline-delimited file given as a mandatory argument,
* SSHs to each host with an SSH key using [Paramiko](https://www.paramiko.org/),
  * up to you what assumptions you wish to make about how this works, but document them, especially if there are security considerations,
* upgrades all out-of-date packages (assume the hosts are running Ubuntu) and
* runs any other command passed in as `--on-upgrade "command to run"`.

The script should clearly report errors (e.g. host unreachable), but should not halt until it has tried to run on every host.

### 2: Cloud Infrastructure

Use Terraform to deploy some AWS infrastructure.
Pay particular attention to security.

* Spin up a Linux EC2 instance in its own VPC and subnet. Don't hard-code the AMI, get it based on constraints (up to you what they are).
* Configure it to run `bitcoind` (you may wish to set the `prune` option).
  * Strictly speaking we're not using Terraform for this, but the idea is that the whole thing can be deployed via a `terraform apply`.
* Output the IP address or domain name.

Here we only deploy a single EC2 instance, but write it in such a way that we can easily scale horizontally.

Use S3 for the backend and handle locking. Configure this in Terraform too.

### 3: Bashisms

We often need to glue some programs together, or run quick commands either locally or remotely. When this is small enough, Bash (or some shell language) is often the best tool for the task.

Query the [Pokémon API](https://pokeapi.co/) for your two favourite Pokémon and:
* where relevant, log what the script is doing,
* print out a list of the moves that each Pokémon has in common, newline-delimited,
* in a temporary directory:
  * create a clearly named file for each Pokémon and save their respective moves to the file,
  * create a clearly named file containing exactly the union of all moves,
  * log the location of these files.

We expect to be able to run this like `./pokemon.sh eevee pikachu > moves.txt` and get the list of common moves in `moves.txt`.

Use `jq` for parsing the API response.
Ensure that you handle errors.
You are free to make assumptions about the availability of different tools, but document them if you use anything non-standard (e.g. GNU coreutils or BSD-specific versions of anything).
