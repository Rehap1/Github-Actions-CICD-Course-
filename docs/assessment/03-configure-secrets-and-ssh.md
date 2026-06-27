# Configure Docker Hub, SSH, and GitHub Secrets

## Purpose

This page shows the minimum setup needed before the final assessment workflow can run.

## GitHub Secrets to Create

For this course, create these repository secrets:

- `VM_HOST`
- `VM_USER`
- `VM_SSH_KEY`

- `DOCKERHUB_USERNAME`
- `DOCKERHUB_TOKEN`

Open:

`Settings -> Secrets and variables -> Actions -> Secrets`

Create the secrets listed above in this page.

## Docker Hub Setup

You need:

- one Docker Hub account
- one access token from Docker Hub
- one public Docker Hub repository named `tiny-health-app`

Use:

- your Docker Hub username for `DOCKERHUB_USERNAME`
- your Docker Hub access token for `DOCKERHUB_TOKEN`

The workflow uses them to push the built image.

Keep the repository public for this course.

That way, the Ubuntu VM can pull the image without a second Docker Hub login step.

Keep the repository name exactly `tiny-health-app` for this course.

## SSH Key Setup

Generate a key pair if you do not already have one:

```bash
ssh-keygen -t ed25519 -C "gha-course-assessment"
```

Then:

1. add the public key to the VM user's `~/.ssh/authorized_keys`
2. add the private key content to `VM_SSH_KEY` in GitHub secrets

## VM Values

Use:

- the VM IP address or DNS name for `VM_HOST`
- the VM login name for `VM_USER`

Use a public VM host value here, because the workflow validates the deployed app from GitHub Actions after the remote deploy step finishes.

## Quick Local Check

These commands run from your own machine, not inside the GitHub browser.

Before you run the workflow, check SSH once from your machine:

```bash
ssh <vm-user>@<vm-host>
```

If this login does not work, fix it before you open the workflow.

If you want one quick local support check before the lab, you can also run:

```bash
bash scripts/assessment/prepare-local-machine.sh
```

If you want the full local Ubuntu dependency check directly, run:

```bash
bash scripts/install-assessment-deps.sh --check-only
```

## What Should Be True Before You Run LAB-07 or EX-11

Before you run `LAB-07` and later build the final assessment workflow, all items below should be true:

- the VM accepts SSH key login
- the VM is reachable on port `8000`
- the VM secrets are saved
- one manual SSH login from your machine has already worked

- the Docker Hub repository exists and is public
- the Docker Hub secrets are saved

## Why This Matters

This setup gives the workflow exactly what it needs:

- registry access to push the image
- SSH access to reach the VM
- one clear remote target for deployment

## Next Step

After this page, continue with:

1. [LAB-07: Final Assessment Setup and Validation Prep](../../labs/LAB-07-docker-hub-vm-deploy.md)
2. [Assessment Success Criteria, Validation, and Rubric](05-success-criteria-and-rubric.md)
