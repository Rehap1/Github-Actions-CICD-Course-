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

## ARG

A Dockerfile instruction that lets the build receive a value at build time.

In this course, one exercise uses `ARG BASE_IMAGE` so the workflow can choose the Python base image.

## Environment Variable

A named value a workflow can reuse.

An environment variable is not automatically secret.

## GitHub Actions Variable

A normal configuration value stored in GitHub settings and read in workflows with `vars`.

It is useful for non-secret values such as ports, image names, or version strings.

## Branch Strategy

A team rule for how branches are used, such as `dev`, `staging`, and `production`.

It helps teams control where code changes go before release.

## Branch Protection Rule

A GitHub repository rule that protects a branch such as `main`.

Teams often use it to require pull requests and required status checks before merge.

## Hosted Runner

A runner started and managed for you by GitHub.

## Check Out

To copy the repository files onto the runner so the workflow can use them.

## Image

A packaged version of the application.

## Image Tag

A readable label attached to a Docker image, such as `2026-04-08-123456789`.

It helps us refer to one exact built image.

## Matrix

A workflow pattern that repeats the same job across multiple values, such as Python versions or operating systems.

## Needs

A workflow key that makes one job wait for another job first.

It helps make job order explicit in larger workflows.

## Job

A group of steps that runs on one machine in a workflow.

## Log

The detailed output produced while a workflow step runs.

## Latest

A common Docker image tag name.

It is convenient, but it is less precise than a traceable tag such as `2026-04-08-123456789`.

## Push

To send local commits to GitHub.

## Pull Request

A proposed change that asks to merge one branch into another.

Teams often use pull requests for review, discussion, and automated checks before merge.

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

## Status Check

A pass or fail result reported back to GitHub for a workflow job or other integration.

In branch protection, a required status check must pass before merge.

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
