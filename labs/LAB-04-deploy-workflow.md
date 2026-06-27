# LAB-04: Deploy Workflow

## Goal

Your goal is to see the built artifact delivered and checked automatically.

## Why This Lab Matters

This lab completes the course story:

1. code
2. verify
3. package
4. deliver

## File for This Lab

Open this file in your repository:

`.github/workflows/04-deploy.yml`

## What This Workflow File Contains

This workflow teaches delivery using the package created earlier:

- `workflow_run` starts deploy after the build workflow finishes
- `Download build artifact` gets the saved package
- `Load Docker image` restores that package as an image
- `Start container` runs the exact same tagged image from the build run
- `Smoke test deployed app` checks that the app responds

## Step 1: Read the Workflow File

Read the file once before running anything.

You should be able to find:

- the trigger based on the build workflow
- the artifact download step
- the smoke test step

## Step 2: Start the Build Workflow

Open the `Actions` tab.

Open `03 Build Artifact Workflow`.

Use `Run workflow` to start the build workflow manually.

## Step 3: Wait for the Build Workflow to Finish

The deploy workflow depends on the build workflow.

Wait for the build workflow to pass.

## Step 4: Open the Deploy Workflow Run

After the build workflow succeeds, open `04 Deploy Workflow` in the `Actions` tab.

You should see a new deploy run.

Open it.

## Step 5: Read the Deploy Steps

Look for these steps:

- `Download build artifact`
- `Load Docker image`
- `Start container`
- `Smoke test deployed app`

## Step 6: Confirm the Smoke Test Passed

Open the smoke test step.

You should see a successful response from:

`http://127.0.0.1:8000/health`

## What You Should Notice

This workflow is important because it uses the exact packaged output from the build workflow.

It is not rebuilding the app.

It is loading and running the same tagged image that the build workflow already created.

That is the delivery idea we wanted to reach in this course.

## If the Deploy Workflow Does Not Appear

Check these things first:

1. make sure the build workflow passed
2. refresh the `Actions` page
3. open `04 Deploy Workflow` and look for the latest run

If it still does not appear, ask your instructor for help before changing workflow files.

## If the Deploy Workflow Fails

Read the first failed step carefully.

In this lab, the most important questions are:

- Did the artifact download succeed?
- Did the image load?
- Did the smoke test pass?

## Success Check

You are done when:

- the build workflow passes
- the deploy workflow starts automatically
- the smoke test passes
- you can explain why deployment used the saved artifact

## Reflection

After the lab, try to answer these questions:

- Why is it useful to deploy the saved artifact?
- What problem does the smoke test help us catch?
- How is this different from testing source code only?
