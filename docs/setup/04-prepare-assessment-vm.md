# Prepare the Assessment VM

## Purpose

This page is the quick gateway into the later Ubuntu VM assessment path.

Use it only when your instructor asks you to prepare the VM-based deployment path.

You do not need this page for the early browser-first labs.

Unlike the early labs, this later setup path uses a local shell on your own machine.

## When To Use This

Use this page:

- before `LAB-07`
- before `EX-11`
- when you are preparing one Ubuntu VM for the final Docker-based deployment path

Do not use this page:

- before Day 1
- before `LAB-01`, `LAB-02`, `LAB-03`, or `LAB-04`
- for the early browser-first course flow

## Script To Use

The script lives here:

- [scripts/install-assessment-deps.sh](../../scripts/install-assessment-deps.sh)

## Before You Run These Commands

For this later assessment path, you need:

- a local terminal on your machine
- a local copy of your repository, or at least a local copy of `scripts/install-assessment-deps.sh`

If you do not have the repository on your machine yet, use one simple path now:

- clone the repository if you already know basic Git
- or download the repository ZIP from GitHub and extract it

The early labs stay browser-first.

This later assessment setup is the point where local shell commands become necessary.

This page gives you the first commands and the timing for that script.

If you want the fuller VM checklist and deeper reference notes, use:

- [Prepare the Ubuntu VM](../assessment/02-prepare-ubuntu-vm.md)

It prepares or checks the common tools needed for the assessment VM:

- Git
- SSH client tools
- Docker
- `curl`
- `jq`
- basic network troubleshooting tools

It also checks:

- Docker daemon status
- Docker group access
- whether port `8000` is already in use

## VM Commands

From your repository on your own machine, copy the script to the VM:

```bash
scp scripts/install-assessment-deps.sh <vm-user>@<vm-host>:~/
```

Connect to the VM:

```bash
ssh <vm-user>@<vm-host>
```

Run the script with `sudo`:

```bash
chmod +x ~/install-assessment-deps.sh
sudo ~/install-assessment-deps.sh --target-user <vm-user>
```

## Check-Only Mode

If you want to validate the machine again later without reinstalling packages:

```bash
bash ~/install-assessment-deps.sh --check-only --target-user <vm-user>
```

`--check-only` means:

- no packages are installed
- no Docker group changes are made
- no firewall rules are changed
- the script only reports what is ready and what still needs attention

## Optional Firewall Flag

By default, the script does not change firewall rules.

If you explicitly want it to add `ufw` rules for ports `22` and `8000`, use:

```bash
sudo ~/install-assessment-deps.sh --target-user <vm-user> --configure-firewall
```

Use that flag only if:

- your VM uses `ufw`
- you understand that you are changing local firewall rules on the VM

If you are unsure, skip that flag and keep the default safe behavior.

## What Success Looks Like

At the end of the script, the important checks should show `PASS`:

- Ubuntu release
- Git
- SSH client
- Docker CLI
- Docker daemon

This result may show `WARN` the first time:

- Docker user access

That usually means the user was just added to the Docker group.

If you want the fuller meaning of each check, use:

- [Prepare the Ubuntu VM](../assessment/02-prepare-ubuntu-vm.md)

## Common Warnings

`Docker user access = WARN`

- The target user was added to the Docker group.
- Sign out and sign back in once, then rerun `--check-only` if you want to confirm it.

`Firewall rules = WARN`

- The script did not confirm that ports `22` and `8000` are both allowed locally.
- This script does not manage cloud firewall, NSG, or security-group rules.

`Port 8000 = WARN`

- Something is already using port `8000`.
- Stop the old process or choose the correct VM before the assessment.

`Docker Compose plugin = WARN`

- That plugin is optional for this course.
- The current assessment path does not require it.

## Important Reminder About Network Access

Even if the script passes, your VM may still need external network rules that allow:

- SSH on port `22`
- app access on port `8000`

That part is outside the VM itself.

If your VM lives behind cloud networking rules, security groups, or NSGs, you must still allow those ports there.

## What To Open Next

After this page, continue with:

1. [Prepare the Ubuntu VM](../assessment/02-prepare-ubuntu-vm.md)
2. [Configure Docker Hub, SSH, and GitHub Secrets](../assessment/03-configure-secrets-and-ssh.md)
3. [LAB-07: Final Assessment Setup and Validation Prep](../../labs/LAB-07-docker-hub-vm-deploy.md)
4. [Assessment Success Criteria, Validation, and Rubric](../assessment/05-success-criteria-and-rubric.md)
