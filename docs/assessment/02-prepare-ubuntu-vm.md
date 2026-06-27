# Prepare the Ubuntu VM

## Purpose

This page is the fuller operational reference for one Ubuntu VM used in the final assessment.

If you want the quick setup gateway first, start with:

- [Prepare the Assessment VM](../setup/04-prepare-assessment-vm.md)

## Before You Start

Use this page only after you already know the standardized assessment model:

- one Ubuntu VM is the deployment target
- GitHub Actions reaches that VM over SSH
- the deployed app must answer on port `8000`
- Docker Hub carries the image and the VM must support Docker

This page goes deeper than the setup gateway page.

Use it when you want:

- the fuller VM checklist
- the dependency expectations
- Docker user and relogin notes
- firewall and cloud-network reminders
- quick recovery guidance

## What the VM Must Support

Your VM should be able to:

- accept SSH login with a key
- answer HTTP requests on port `8000`
- be reachable from GitHub Actions on its public IP or DNS name
- run Docker containers

## Supporting Script

This repository includes:

- `scripts/install-assessment-deps.sh`
- `scripts/assessment/prepare-ubuntu-vm.sh`
- `scripts/assessment/prepare-local-machine.sh` for optional local support checks

Use `scripts/install-assessment-deps.sh` as the main script.

Use `scripts/assessment/prepare-ubuntu-vm.sh` only as a thin shortcut wrapper if you want the older shorter command.

If you only want the short first-step commands, return to:

- [Prepare the Assessment VM](../setup/04-prepare-assessment-vm.md)

The main script installs or checks the common VM dependencies used in this path:

- Git
- SSH client tools
- Docker
- curl
- `wget`
- `unzip`
- `jq`
- common networking tools
- firewall and port `8000` checks

## Local Shell Reminder

This later assessment path is no longer browser-only.

You now need:

- a local shell on your own machine
- `scp` and `ssh` available locally
- a local copy of the repository, or at least the assessment script files copied out of it

If you do not already have the repository on your machine, return to:

- [Prepare the Assessment VM](../setup/04-prepare-assessment-vm.md)

and use the simplest local-copy option there first.

## One Practical Way to Use the Script

From your repository on your machine, copy the main script to the VM:

```bash
scp scripts/install-assessment-deps.sh <vm-user>@<vm-host>:~/
```

Then connect to the VM:

```bash
ssh <vm-user>@<vm-host>
```

Run the script with `sudo`:

```bash
chmod +x ~/install-assessment-deps.sh
sudo ~/install-assessment-deps.sh --target-user <vm-user>
```

If you want the shorter wrapper command instead, you can still use:

```bash
scp scripts/assessment/prepare-ubuntu-vm.sh <vm-user>@<vm-host>:~/
ssh <vm-user>@<vm-host>
chmod +x ~/prepare-ubuntu-vm.sh
sudo ~/prepare-ubuntu-vm.sh <vm-user>
```

## What to Check After the Script

On the VM, always confirm:

```bash
curl --version
```

Also confirm:

```bash
docker --version
docker ps
```

If `docker ps` asks for root permission, sign out and sign back in once so the Docker group change can apply.

If you want the script to validate the machine again later without reinstalling packages, run:

```bash
bash ~/install-assessment-deps.sh --check-only --target-user <vm-user>
```

## Port Check

Your deployed app will use port `8000`.

Make sure:

- your VM firewall allows `8000`
- your cloud security rule or VM network rule allows `8000`
- the VM is reachable from the public internet, because GitHub-hosted runners must reach it too

This script can detect local firewall state, but it cannot open cloud rules for you.

## Why This Matters

The workflow can only deploy successfully if the VM is ready first.

This preparation step removes the most common remote-deployment blockers before the workflow runs.

## Quick Recovery Notes

If the VM still fails readiness checks after the script:

- confirm Docker service is active with `sudo systemctl status docker`
- confirm the target user has Docker access after signing in again
- confirm port `8000` is free on the VM
- confirm your cloud or VM network rules still allow ports `22` and `8000`

When this page is done, continue with:

- [Configure Docker Hub, SSH, and GitHub Secrets](03-configure-secrets-and-ssh.md)
- [Assessment Success Criteria, Validation, and Rubric](05-success-criteria-and-rubric.md)

If you want the full script details again, return to:

- [Install Assessment Dependencies](06-install-assessment-dependencies.md)
