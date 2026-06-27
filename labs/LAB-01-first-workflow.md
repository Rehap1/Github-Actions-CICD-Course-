# LAB-01: First Workflow

## Goal

Your goal is to see your first successful GitHub Actions workflow run.

## What You Will Do

In this lab, you will:

1. open the first workflow file
2. make one very small change
3. commit that change in GitHub
4. open the workflow run
5. read the result

## Why This Lab Is Small

This first lab is intentionally small.

We want your first success to come quickly.

Right now, the main goal is not writing YAML from scratch.
The main goal is understanding what a workflow run looks like.

## File for This Lab

Open this file in your repository:

`.github/workflows/01-hello.yml`

## What This Workflow File Contains

This workflow teaches the smallest useful GitHub Actions shape:

- `name` gives the workflow a visible title
- `on` tells GitHub when to run it
- `jobs` groups the work
- `runs-on` chooses the runner machine
- `steps` lists the actions inside the job

## Step 1: Open the Workflow File

Go to the `Code` tab.

Open `.github/workflows/01-hello.yml`.

Read it once before editing anything.

## Step 2: Edit the Hello Message

Click the edit button in GitHub.

Find this line:

```yaml
run: echo "Hello from GitHub Actions"
```

Change it to:

```yaml
run: echo "Hello from GitHub Actions and from YOUR_NAME"
```

Replace `YOUR_NAME` with your own name.

Change only that text.

Do not change indentation.

## Step 3: Commit the Change

Use a simple commit message like:

`Update hello workflow message`

Commit directly to your main branch for this lab.

## Step 4: Open the Actions Tab

After the commit, open the `Actions` tab.

You should see a new workflow run.

Open the latest run.

## Step 5: Read the Workflow Run

Inside the workflow run, look for:

- the workflow name
- the job name
- the step name
- the final status

Then open the logs for the step and find your updated message.

## What You Should Notice

After this lab, you should be able to identify:

- workflow: the full automation file
- job: a group of steps running on a machine
- step: one action inside the job
- run result: passed or failed

## If the Workflow Fails

Do these checks first:

1. confirm the file path is `.github/workflows/01-hello.yml`
2. confirm the YAML indentation still looks correct
3. confirm you committed the change
4. refresh the `Actions` page

If it still fails, ask your instructor to help you read the logs before changing more things.

## Success Check

You are done when:

- you can open the workflow run
- the job passes
- you can find your updated message in the logs

## Reflection

After the lab, try to answer these questions:

- What event triggered the workflow?
- Where did the job run?
- What is the difference between a workflow and a step?
- Where do you look first when a run fails?
