# Assessment Success Criteria, Validation, and Rubric

## Purpose

This page gives clear and observable checks for the final assessment.

Use it as the final reference for:

- what success looks like
- what should already be ready before `EX-11`
- what command to run after deployment
- what should be visible in the workflow
- what should be visible in the deployed app

## Before You Start EX-11

Confirm all of these are already true:

- you completed `LAB-05`
- you completed `LAB-07`
- you have a local shell on your own machine for `scp`, `ssh`, and local validation commands
- you have a local copy of this repository, or at least the assessment script files available locally
- your Ubuntu VM accepts SSH key login
- port `8000` is reachable on the VM
- Docker works on the VM
- your public Docker Hub repository `tiny-health-app` exists
- all five required GitHub secrets are saved

## Core Success Categories

### 1. Verification

- the workflow starts
- the test job passes
- the student can point to the verification step

### 2. Deployable Output and Traceability

- the workflow prepares one clear Docker image as the deployable output
- the image tag is shown clearly with `YYYY-MM-DD-GITHUB_RUN_ID`
- the image is pushed to Docker Hub successfully

### 3. Remote Deployment

- the VM is reached over SSH
- the VM pulls the same image that was pushed earlier
- the container starts on the VM successfully

### 4. Running Application Checks

- `/health` responds successfully
- `/version` responds with build details such as `app_version`, `commit_sha`, and `image_tag`
- `/status` responds with runtime visibility such as `app_version`, `commit_sha`, `image_tag`, `environment`, and `deployment_mode`

### 5. Explanation

- the student can explain what exact thing was deployed
- the student can explain which image tag was deployed
- the student can explain why this deployment is repeatable
- the student can explain how this extends `code -> verify -> package -> deliver`

## Beginner-Friendly Rubric

Use this simple rubric:

| Category | What a passing result looks like |
|---|---|
| verification | tests pass in the workflow |
| output | one clear deployable output is prepared and traceable |
| deployment | the VM runs the intended updated container |
| validation | the app responds on the expected port and endpoints |
| explanation | the student can describe the deployed output clearly |

## A Fair Pass Standard

A fair beginner pass means:

- the workflow works end to end
- the app is reachable on the expected port
- the status endpoints show useful deployment details
- the student can explain what was deployed and why the flow is trustworthy

## Observable Evidence

When you or your instructor review the result, these are the clearest things to point to:

- the passing `verify` job
- the image reference shown in the workflow logs
- the running app responses from `/health`, `/version`, and `/status`
- one clear explanation of what exact thing is now running on the VM

## Final Validation Command

After the workflow succeeds, run this from your repository root on your own machine:

```bash
bash scripts/assessment/validate-deployment.sh http://<vm-host>:8000
```

Replace `<vm-host>` with the same public host value you saved in `VM_HOST`.

That validation script checks:

- `/health`
- `/version`
- `/status`
- the required JSON fields used in this assessment path

## Final Self-Check

You are done when all of these are true:

- the workflow passes end to end
- the deployed app responds on port `8000`
- the validation command passes
- you can explain what exact image was deployed
- you can explain why the flow is repeatable
- you can explain how the final workflow still follows `code -> verify -> package -> deliver`
