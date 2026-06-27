# Glossary

## Purpose

This glossary gives simple beginner definitions for the words used in the course.

Use it when one word is blocking your understanding.

## Commit

A saved change in the repository history.

## Repository

The project and its files inside GitHub.

## Artifact

A saved output produced by a workflow.

## ACR

Azure Container Registry.

In the optional example, it is the place where the built container image is stored.

## Build

The step where we create a package from the application.

## CI

Continuous Integration.

In this course, it means automated verification after a change.

## CD

Continuous Delivery or Continuous Deployment.

In this course, it means the delivery side of the pipeline after verification.

## Container

A running instance created from an image.

## Deploy

To deliver and run the packaged application.

## Dockerfile

A file that tells Docker how to package the application.

## Endpoint

A URL path the application responds to, such as `/health`.

## GitHub Actions

GitHub's automation system for workflows.

## Action

A reusable building block used inside a workflow.

In many workflow files, an action appears with `uses:`.

## Environment Variable

A named value a workflow can reuse.

An environment variable is not automatically secret.

## Hosted Runner

A runner started and managed for you by GitHub.

## Check Out

To copy the repository files onto the runner so the workflow can use them.

## Image

A packaged version of the application.

## Image Tag

A readable label attached to a Docker image, such as `run-123`.

It helps us refer to one exact built image.

## Matrix

A workflow pattern that repeats the same job across multiple values, such as Python versions or operating systems.

## Job

A group of steps that runs on one machine in a workflow.

## Log

The detailed output produced while a workflow step runs.

## Latest

A common Docker image tag name.

It is convenient, but it is less precise than a traceable tag such as `run-123`.

## Push

To send local commits to GitHub.

## Marketplace

The GitHub place where many published actions can be found and browsed.

## Registry

A place where container images are stored, such as Azure Container Registry.

## AKS

Azure Kubernetes Service.

In the optional example, it represents the place where the packaged app is updated and run.

## Runner

The machine that runs the workflow job.

## Secret

A protected sensitive value such as a token or password.

## Self-Hosted Runner

A runner machine managed by your own team instead of GitHub.

## Smoke Test

A quick check that the packaged app starts and responds.

## Step

One individual action inside a job.

## Trigger

The event that starts a workflow.

## Template Repository

A GitHub repository that is meant to be copied into new repositories.

In this course, students create their own practice repo from the student template.

## Workflow

A YAML file that defines an automation process in GitHub Actions.

## Reusable Workflow

A workflow file that can be called by another workflow instead of copying the same jobs again.

## YAML

The text format used to write GitHub Actions workflow files.

## Related Help

- [Runner Mental Model](00-runner-mental-model.md)
- [How to Read Actions Logs](01-how-to-read-actions-logs.md)
- [Troubleshooting](02-troubleshooting.md)
- [YAML Cheatsheet for GitHub Actions](04-yaml-cheatsheet.md)
- [Runner Types](05-runner-types.md)
- [Trigger Reference](06-trigger-reference.md)
- [Finding and Reusing GitHub Actions](07-finding-and-reusing-actions.md)
