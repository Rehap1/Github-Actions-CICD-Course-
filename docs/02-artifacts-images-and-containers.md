# Artifacts, Images, and Containers

## Purpose

This file explains the new ideas we need before the build workflow.

We will keep the explanation practical and shallow.

## What Is an Artifact

An artifact is a file produced during a workflow run.

For this course, the artifact we care about is a saved Docker image file.

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

In this course, a tag like `run-123` helps us talk about one exact built image.

That matters because we want to say:

"Deploy the exact image from this build run."

You may also see tags such as `latest` in optional examples.

For the core course, the traceable run tag is the most important one to remember.

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
4. build a Docker image with a traceable tag
5. save that image as a file
6. upload that file as a workflow artifact

## What You Need to Remember

For this course, these three sentences are enough:

- an artifact is a saved output from a workflow
- an image is a packaged application
- a container is a running instance of that image
