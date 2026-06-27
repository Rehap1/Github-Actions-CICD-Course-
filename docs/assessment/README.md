# Final Assessment Support

## Purpose

These files support the final assessed deployment exercise.

They keep the same course story and reduce setup friction before the final assessment starts.

## Standardized Assessment Setup

For this course, the final assessment uses one shared target and one shared delivery model:

1. verify the code
2. prepare one deployable output
3. deploy it to one Ubuntu VM over SSH
4. validate what is running

The standardized delivery model is:

- Docker on the Ubuntu VM
- one public Docker Hub repository
- one clear image tag

We keep one model so the assessment measures CI/CD thinking, not setup variation.

## Why This Model Was Chosen

This setup keeps the deployment target real enough to matter, but still simple enough for beginners:

- Docker Hub is easier to reach than ACR or ECR
- one Ubuntu VM is easier to reason about than a cloud platform
- SSH gives one clear remote-deploy step
- the deployed app is easy to validate with HTTP endpoints

## What You Will Use

- one Ubuntu VM reachable over SSH
- one lab readiness workflow
- one student-built final assessment workflow
- the same app you already used in the earlier labs
- one small Docker image
- one Docker Hub account and access token

Unlike the early browser-first labs, this later path also uses a local shell on your machine for `scp`, `ssh`, and the local deployment validation command.

## Support Scripts

This assessment support set also includes small support scripts:

- [scripts/install-assessment-deps.sh](../../scripts/install-assessment-deps.sh) is the main install-and-check script for Ubuntu VMs and local Ubuntu checks
- [scripts/assessment/prepare-ubuntu-vm.sh](../../scripts/assessment/prepare-ubuntu-vm.sh) is a focused wrapper for VM preparation
- [scripts/assessment/prepare-local-machine.sh](../../scripts/assessment/prepare-local-machine.sh) is a quick local helper that defaults to a check-only pass
- [scripts/assessment/validate-deployment.sh](../../scripts/assessment/validate-deployment.sh) checks `/health`, `/version`, and `/status` after deployment

Use them to reduce setup friction and to validate the deployed app clearly.

If you want the full script guidance first, open:

- [Prepare the Assessment VM](../setup/04-prepare-assessment-vm.md)

## Recommended File Order

1. [Standardized Assessment Setup](01-standardized-assessment-setup.md)
2. [Prepare the Assessment VM](../setup/04-prepare-assessment-vm.md)
3. [Prepare the Ubuntu VM](02-prepare-ubuntu-vm.md)
4. [Configure Docker Hub, SSH, and GitHub Secrets](03-configure-secrets-and-ssh.md)
5. [How the Current Labs Prepare You](04-how-current-labs-prepare-you.md)
6. [LAB-07: Final Assessment Setup and Validation Prep](../../labs/LAB-07-docker-hub-vm-deploy.md)
7. [Assessment Success Criteria, Validation, and Rubric](05-success-criteria-and-rubric.md)
8. [EX-11: Final Deployment Assessment](../../exercises/EX-11-final-deployment-assessment.md)

The final validation command and self-check now live in the rubric page so you have one final assessment reference instead of two.

## One Important Note

`LAB-07` prepares the final assessment setup.

`EX-11` is build-it-yourself.

You create the final assessment workflow file in your own student repo, and the prepared solution stays in the instructor repo.
