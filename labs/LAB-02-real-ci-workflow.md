# LAB-02: Real CI Workflow

## Goal

Your goal is to see a real CI workflow run the project tests.

## What Makes This Different from Lab 01

In Lab 01, the workflow only printed a message.

In this lab, the workflow checks the repository and runs tests automatically.

That is closer to what teams use CI for in real work.

## File for This Lab

Open this file in your repository:

`.github/workflows/02-ci.yml`

## What This Workflow File Contains

This workflow adds the first real CI ideas:

- `on` includes the triggers for code and test changes
- `actions/checkout` brings the repository onto the runner
- `actions/setup-python` prepares Python on the runner
- `Run tests` is the verification step that gives the main CI result

## Step 1: Read the Workflow File

Read the file once before doing anything else.

You should be able to find:

- when the workflow runs
- the job name
- the step that runs the tests

## Step 2: Run the Workflow Manually Once

Open the `Actions` tab.

Open `02 CI Workflow`.

Use the `Run workflow` button to start the workflow manually.

This is the easiest safe first run.

## Step 3: Open the Run and Read the Steps

Open the new workflow run.

Look for these steps:

- `Check out repository`
- `Set up Python`
- `Run tests`

Then open the logs and confirm that the tests passed.

## Step 4: Trigger the CI Workflow with a Code Change

Now make one tiny safe change in `app/app.py`.

Find this line:

```python
print("Server running on http://0.0.0.0:8000")
```

Change it to:

```python
print("Server is running on http://0.0.0.0:8000")
```

This change does not affect the endpoint behavior.

## Step 5: Commit the Change

Commit the change in GitHub with a simple message like:

`Update startup message`

## Step 6: Watch CI Run on Push

Open the `Actions` tab again.

You should now see a new run of `02 CI Workflow`.

Open it and confirm it passes.

## What You Should Notice

This workflow is real CI because:

- it runs automatically after a code change
- it verifies the project with tests
- it gives feedback without waiting for a person to run checks manually

## If the Workflow Fails

Do these checks first:

1. make sure you changed only the text shown above
2. open the failed step
3. read the log message slowly
4. compare your file with the example in this lab

Use [How to Read Actions Logs](../docs/help/01-how-to-read-actions-logs.md) if you need help.

## Success Check

You are done when:

- you have one manual CI run
- you have one push-triggered CI run
- you can point to the `Run tests` step
- you can explain why this workflow is more useful than Lab 01

## Reflection

After the lab, try to answer these questions:

- Why is this workflow closer to real CI?
- What is the value of running tests automatically on push?
- Which step gives the main verification result?

## Exercises After Lab 02

After the lab is complete, continue with these exercises in order:

1. [EX-02: CI Visibility and Schedule](../exercises/EX-02-ci-visibility-and-schedule.md)
2. [EX-03: CI Matrix](../exercises/EX-03-ci-matrix.md)
3. [EX-04: CI Secrets and Matrix Patterns](../exercises/EX-04-ci-secrets-and-matrix.md)

These exercises extend the same CI story in three different ways:

- `EX-02` adds visibility and schedule
- `EX-03` adds matrix
- `EX-04` adds advanced secrets and matrix patterns

They all keep working in `.github/workflows/02-ci.yml`.

## Assessment Preparation Link

Later, the final assessment still starts with this same idea:

- verify the change first
- trust tests before packaging or deployment

If you want to see how the final assessment builds on this lab, use:

- [How the Current Labs Prepare You](../docs/assessment/04-how-current-labs-prepare-you.md)
