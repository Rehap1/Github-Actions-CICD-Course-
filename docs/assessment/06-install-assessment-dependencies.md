# Install Assessment Dependencies

## Purpose

This page explains the assessment dependency setup script.

Use it when you want one clear install-and-check path for the Ubuntu VM or one quick validation pass on a local Ubuntu machine.

For the main student-facing setup flow, start with:

- [Prepare the Assessment VM](../setup/04-prepare-assessment-vm.md)

## Main Script

The main script lives here:

`scripts/install-assessment-deps.sh`

Focused helper wrappers still exist here:

- `scripts/assessment/prepare-ubuntu-vm.sh`
- `scripts/assessment/prepare-local-machine.sh`
- `scripts/assessment/validate-deployment.sh`

The wrappers are only shortcuts.

The main install-and-check script is the source of truth.

## What the Script Installs or Checks

The script prepares or validates the tools used in the final assessment:

- Git
- SSH client tools
- Docker
- `curl`
- `wget`
- `unzip`
- `jq`
- `python3`
- common networking tools such as `ss`, `ping`, and `nc`
- firewall and port `8000` checks

It also checks:

- the Ubuntu version
- whether Docker daemon is running
- whether the target user can run Docker without `sudo`
- whether port `8000` is already in use

By default, it does not change firewall rules.

Use `--configure-firewall` only if you explicitly want it to add `ufw` rules for ports `22` and `8000`.

## When to Run It

Run this script:

- before `LAB-07`
- before `EX-11`
- any time you want one clean setup check on a fresh Ubuntu VM

## VM Usage

Copy the main script to the VM:

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

## Local Ubuntu Usage

If you only want a quick validation pass on a local Ubuntu machine:

```bash
bash scripts/install-assessment-deps.sh --check-only
```

If you want the script to install missing packages on a local Ubuntu machine:

```bash
sudo bash scripts/install-assessment-deps.sh
```

## What Success Looks Like

At the end, the script prints a summary table with:

- `PASS`
- `WARN`
- `FAIL`

For the assessment path, the important items should be:

- Ubuntu release = `PASS`
- Git = `PASS`
- SSH client = `PASS`
- Docker CLI = `PASS`
- Docker daemon = `PASS`

This item may be `WARN` right after installation:

- Docker user access

That usually means the user was just added to the Docker group and must sign out and sign back in once.

## Common Failures

If you see `FAIL` on Ubuntu release:

- the machine is not Ubuntu
- or the Ubuntu version is outside the supported list

If you see `FAIL` on Docker daemon:

- Docker did not start correctly
- check `sudo systemctl status docker`

If you see `FAIL` on Docker user access:

- the target user is not in the Docker group yet
- or you are using `--check-only` before the user was added

If you see `WARN` on firewall rules:

- the script did not confirm that ports `22` and `8000` are open
- check the VM firewall and any cloud security rules

If you see `WARN` on port `8000`:

- something is already listening on that port
- stop the old service or pick the right machine before the assessment

## Related Next Steps

After this page, continue with:

1. [Prepare the Ubuntu VM](02-prepare-ubuntu-vm.md)
2. [Configure Docker Hub, SSH, and GitHub Secrets](03-configure-secrets-and-ssh.md)
3. [LAB-07: Final Assessment Setup and Validation Prep](../../labs/LAB-07-docker-hub-vm-deploy.md)
