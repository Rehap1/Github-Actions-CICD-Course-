# LAB-07: Final Assessment Setup and Validation Prep

## Goal

Your goal is to prepare the environment and checks needed for the final deployment assessment.

By the end of this lab, you should have:

1. one Ubuntu VM ready
2. GitHub secrets ready
3. one clear validation path ready for `/health`, `/version`, and `/status`
4. one public Docker Hub repository ready

## Why This Lab Matters

This lab prepares you for the final assessed exercise without changing the main course story.

It keeps the same CI/CD ideas and removes avoidable setup surprises before the assessment starts.

This readiness lab directly prepares the final assessment path used in this course.

## File for This Lab

Open this workflow file in your repository:

`.github/workflows/07-final-assessment-readiness.yml`

Use these support files alongside it:

- `docs/assessment/README.md`
- `docs/assessment/01-standardized-assessment-setup.md`
- `docs/setup/04-prepare-assessment-vm.md`
- `docs/assessment/02-prepare-ubuntu-vm.md`
- `docs/assessment/03-configure-secrets-and-ssh.md`
- `scripts/install-assessment-deps.sh`
- `scripts/assessment/prepare-ubuntu-vm.sh`
- `scripts/assessment/prepare-local-machine.sh`
- `scripts/assessment/validate-deployment.sh`

## Before You Start

Use these pages in this order:

1. [Final Assessment Support Overview](../docs/assessment/README.md)
2. [Standardized Assessment Setup](../docs/assessment/01-standardized-assessment-setup.md)
3. [Prepare the Assessment VM](../docs/setup/04-prepare-assessment-vm.md)
4. [Prepare the Ubuntu VM](../docs/assessment/02-prepare-ubuntu-vm.md)
5. [Configure Docker Hub, SSH, and GitHub Secrets](../docs/assessment/03-configure-secrets-and-ssh.md)

You should already be comfortable with:

- `LAB-03`
- `LAB-04`
- `LAB-05`

You should also already have:

- one Ubuntu VM reachable on port `8000`
- one public Docker Hub repository named `tiny-health-app`

Important:

This later assessment-prep lab is no longer browser-only.

You now need a local shell on your own machine because you will use `scp`, `ssh`, and the local validation helper.

## Step 1: Read the Workflow Shape

Before you run anything, find these jobs:

- `verify`
- `check-registry-access`
- `check-vm-readiness`

This workflow does not deploy the app.

It only checks whether the final assessment setup is ready.

## Step 2: Prepare the Ubuntu VM

Use:

```bash
scp scripts/install-assessment-deps.sh <vm-user>@<vm-host>:~/
ssh <vm-user>@<vm-host>
chmod +x ~/install-assessment-deps.sh
sudo ~/install-assessment-deps.sh --target-user <vm-user>
```

Then confirm on the VM:

```bash
curl --version
docker --version
docker ps
```

## Step 3: Confirm SSH and Local Support

From your machine, confirm SSH works:

```bash
ssh <vm-user>@<vm-host>
```

If you want one quick local support check, run:

```bash
bash scripts/assessment/prepare-local-machine.sh
```

## Step 4: Configure GitHub Secrets and Docker Hub

Create these GitHub secrets:

- `VM_HOST`
- `VM_USER`
- `VM_SSH_KEY`
- `DOCKERHUB_USERNAME`
- `DOCKERHUB_TOKEN`

Make sure the Docker Hub repository exists and stays public for this course:

- `tiny-health-app`

## Step 5: Run the Readiness Workflow

Open the `Actions` tab.

Open:

`07 Final Assessment Readiness Workflow`

Use `Run workflow`.

## Step 6: Inspect the Workflow Result

Confirm that:

- `verify` passed
- the VM was reached over SSH
- Docker Hub login worked
- Docker worked on the VM

## Step 7: Review the Validation Path

Read:

- `scripts/assessment/validate-deployment.sh`

Know what it will check later after deploy:

- `/health`
- `/version`
- `/status`

You will run this script after the final assessment deploy succeeds.

## What You Should Notice

This lab is still part of the same story:

- prepare the deployment target
- prepare the secrets
- prepare the validation path

The important difference is:

- `LAB-07` checks readiness
- `EX-11` builds the real deploy workflow by combining ideas you already know from `02-ci.yml`, `03-build-artifact.yml`, and `04-deploy.yml`

## If You Get Stuck

Check these things first:

1. confirm SSH login works from your machine
2. confirm port `8000` is reachable
3. confirm the VM secrets are saved
4. the VM has Docker installed
5. the Docker Hub repository exists and is public
6. all five GitHub secrets are saved

## Success Check

You are done when:

- the VM is ready
- SSH works from your machine
- the GitHub secrets are saved
- the Docker Hub repository exists
- the readiness workflow passes
- you can explain what the final assessment workflow must do

## Reflection

After the lab, try to answer these questions:

- Which parts of the final assessment are already familiar from earlier labs?
- Which parts are really setup tasks, not CI/CD logic?
- Why is a readiness workflow useful before an assessed deploy workflow?
- What should the final assessment workflow prove when it runs?

## Next Step

After this prep lab, continue with:

- [Assessment Success Criteria, Validation, and Rubric](../docs/assessment/05-success-criteria-and-rubric.md)
- [EX-11: Final Deployment Assessment](../exercises/EX-11-final-deployment-assessment.md)
