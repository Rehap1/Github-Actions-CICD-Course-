# Course Map

## Purpose

This file shows the full story of the course before we start using tools.

During class, follow the student `README.md` and the labs first.

Use this page as a reference map when you want the big picture.

The goal is to understand why CI/CD exists and how each new step solves a real problem.

## The Main Problem

Teams want to change software safely and quickly.

Without CI/CD, teams often face problems like these:

- code works on one laptop but not on another
- testing is skipped when time is short
- packaging steps are done differently each time
- deployment depends on one person remembering manual steps
- failures are discovered too late

CI/CD exists to reduce those problems.

## The Course Flow

We will follow one simple story through the whole course:

1. Understand the problem
2. Verify the change
3. Package the application
4. Deliver the same package

This order matters.

We do not start with GitHub Actions syntax.
We start with the delivery problem that needs to be solved.

## The Running Example

We will use one very small application.

That application will help us practice this end-to-end flow:

1. code
2. verify
3. package
4. deliver

We will keep the application intentionally small so the course stays focused on CI/CD thinking.

## Day 1 Story

Day 1 answers this question:

How do we know that a change is still safe?

We will cover:

1. Why CI/CD exists
2. What CI means
3. How to think in pipeline stages
4. How GitHub Actions represents those ideas
5. How to run a first workflow
6. How to build a small real CI pipeline

By the end of Day 1, students should understand:

- why automation matters
- what a workflow is
- what a job is
- what a step is
- when a workflow runs
- how to read a basic workflow result

## Day 2 Story

Day 2 answers this question:

What happens after the code is tested?

We will cover:

1. Why CI alone is not enough
2. Why artifacts matter
3. Why reproducible builds matter
4. Why containers help with packaging
5. How deployment fits into the pipeline
6. Why CI/CD should be seen as one system

By the end of Day 2, students should understand:

- the difference between verification and delivery
- the difference between source code and a build artifact
- why we want to deploy the exact package we already verified
- how build and deploy workflows connect together

## What Success Looks Like

By the end of the course, students should be able to say:

- I understand why teams use CI/CD.
- I can follow a simple GitHub Actions workflow.
- I can connect code changes to automated verification.
- I can explain packaging and delivery at a beginner level.
- I can troubleshoot a basic failed workflow without panicking.

## Learning Advice

If you are new to this topic:

- do not try to memorize everything
- focus on the story of the pipeline
- change one thing at a time
- read error messages slowly
- ask what problem each automation step is solving

That mindset will help you more than memorizing YAML.
