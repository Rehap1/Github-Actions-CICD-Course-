# Artifacts, Images, and Containers

## Purpose

This file explains the new ideas we need before the build workflow.

We will keep the explanation practical and shallow.

## When to Use This Page

Read this page right before the related Day 2 lab.

Use it to understand the concept first, then open the workflow lab.

## What Is an Artifact

An artifact is a file produced during a workflow run.

For this course, the artifact we care about is a small artifact bundle:

- a saved Docker image file
- a tiny metadata file that records the exact image tag

That matters because we do not want to say:

"The code passed once, so we will rebuild something later and hope it matches."

We want a concrete output we can carry forward.

## Why Artifacts Matter

Artifacts help us answer this question:

"What exact thing are we moving to the next step?"

In beginner-friendly words:

- source code is what we write
- tests check the code behavior
- a build creates a packaged output
- the artifact is that packaged output saved for later

## What Is a Docker Image

A Docker image is a packaged version of the application.

In this course, think of the image as:

- a prepared package
- a snapshot of how to run the app
- something we can save and move to another step

You do not need deep Docker internals for this course.

## What Is an Image Tag

An image tag is a readable label attached to an image.

In this course, a tag like `2026-04-08-123456789` helps us talk about one exact built image.

That example means:

- the date part helps us see when the image was created
- the GitHub run ID makes the tag unique for that run

That matters because we want to say:

"Deploy the exact image from this build run."

You may also see tags such as `latest` in optional examples.

For the core course, the date-plus-run-id tag is the most important one to remember.

## What Is a Container

A container is a running instance created from an image.

Simple rule:

- image = packaged app
- container = running app from that package

## Why This Helps Our CI/CD Story

Until now, we proved that the code could pass tests.

Now we add the next idea:

We want to package the app and keep that exact package as an artifact.

That gives us a better delivery story:

1. verify the change
2. build the package
3. keep the package
4. deliver the same package later

## What the Build Workflow Will Do

The build workflow will:

1. check out the repository
2. set up Python
3. run the tests
4. build a Docker image with a date-plus-run-id tag
5. save that image as a file
6. save a tiny metadata file with the exact image reference
7. upload both files as one workflow artifact

## What You Need to Remember

For this course, these three sentences are enough:

- an artifact is a saved output from a workflow
- an image is a packaged application
- a container is a running instance of that image

## Related Next Steps

- [LAB-03: Build Artifact Workflow](../labs/LAB-03-build-artifact-workflow.md)
- [Simulated Deployment](03-simulated-deployment.md)
- [LAB-04: Deploy Workflow](../labs/LAB-04-deploy-workflow.md)
