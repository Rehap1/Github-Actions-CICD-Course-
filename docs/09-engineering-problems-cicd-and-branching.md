# Engineering Problems, CI/CD, and Branching Strategy

## Purpose

Use this page before the first hands-on labs.

It explains why teams need CI/CD, and why automation still depends on clear GitHub working habits.

## Engineers Solve Problems

Engineers do not add tools just to have more tools.

They add tools when the same delivery problem keeps showing up.

That is the right way to think about CI/CD too.

## Problems That Push Teams Toward CI/CD

Teams often face problems like these:

- code works on one laptop but not another
- tests are skipped when time is short
- packaging is done differently each time
- deployment depends on memory
- failures are discovered too late

CI/CD exists to reduce those problems.

## What CI/CD Means in This Course

For this course:

- CI = automated verification after a change
- CD = carrying forward and delivering the verified output

That is why our story is:

1. code
2. verify
3. package
4. deliver

## Why CI/CD Alone Is Not Enough

Automation helps, but teams still need shared working habits.

Examples:

- clear commits
- clear branch usage
- clear review flow
- clear idea of what should be tested before release

Without those habits, automation can still run, but the team can remain confused.

## Simple Branching Strategy Example

One beginner-friendly example is:

- `dev` = active development
- `staging` = pre-release checking
- `production` = live version

The lesson is not that every team must use exactly these names.

The lesson is that teams often separate:

- ongoing work
- release preparation
- live delivery

## Why the Early Labs Stay Simpler

In the first browser-first labs, we still use direct commits for simplicity.

That is a teaching choice, not a claim that direct commits are always the best team process.

We reduce moving parts first so students can clearly learn:

- what a workflow is
- what triggers it
- where the result appears

## How This Connects to the Hands-On Path

Use this core order:

1. [GitHub Actions Foundations](10-github-actions-foundations.md)
2. [LAB-01: First Workflow](../labs/LAB-01-first-workflow.md)
3. [LAB-02: Real CI Workflow](../labs/LAB-02-real-ci-workflow.md)

If your instructor wants one small extension after `LAB-01`, continue with:

- [EX-01: Hello Trigger and PR Merge](../exercises/EX-01-hello-trigger-and-pr-merge.md)

## Reflection

Before the first lab, try to answer:

- What repeated team problem is CI solving?
- Why is automation alone not enough?
- Why might a team separate development, staging, and production work?
