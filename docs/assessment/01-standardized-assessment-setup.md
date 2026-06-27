# Standardized Assessment Setup

## Purpose

This page explains the one setup model used for the final assessment.

## The Standard Target

Use one shared deployment target for the final assessment:

- one Ubuntu VM
- one SSH-based delivery path
- one simple validation path with `/health`, `/version`, and `/status`

## Standardized Delivery Model

For fairness, use one shared delivery model for the whole cohort.

The course standard is:

- build a Docker image
- push it to Docker Hub
- deploy it on an Ubuntu VM over SSH
- run it as a Docker container on that VM

## Why Docker Is The Standard

This Docker setup balances simplicity and realism well:

- simpler than ACR or ECR
- more directly aligned with the current packaging labs
- easier to trace with one exact image tag
- easier to validate from the browser and from workflow logs

## What Makes It Beginner-Friendly

The setup still avoids heavy infrastructure:

- no Kubernetes
- no cloud orchestration
- no managed registry administration
- no complex platform networking

## Exact Thing You Deploy

You should always be able to answer:

"What exact thing did I deploy?"

In this assessment, the answer is one clear Docker image tag:

`YYYY-MM-DD-GITHUB_RUN_ID`

That same tagged image is:

- built in GitHub Actions
- pushed to Docker Hub
- pulled onto the VM
- started as the deployed container

## Docker Hub Repository Shape

For this course, keep the Docker Hub side simple:

- use your own Docker Hub account
- create one public repository named `tiny-health-app`

That public repository choice helps the VM pull the image without another Docker Hub login step.

## What Stays the Same in the Assessment

The assessment still measures the same course story:

- verify first
- deliver a known output
- validate the running app
- explain what was deployed

## Backup Path

If the Docker registry path is temporarily unreliable during teaching, the instructor can fall back to this recovery shape:

- copy the built image tar file to the same VM
- load it with Docker on the VM
- run the same container there

That keeps the same Docker deployment target and the same validation path.

It is a recovery path, not the main assessment model.
