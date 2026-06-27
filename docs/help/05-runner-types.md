# Runner Types

## Purpose

This page adds one small next step to the runner idea:

What kinds of runners exist?

## Short Version

There are two common runner types:

- hosted runner
- self-hosted runner

## Hosted Runner

A hosted runner is started and managed for you by GitHub.

For beginners, this is the easiest model to learn.

In this course, we use hosted runners.

## Self-Hosted Runner

A self-hosted runner is a machine that a team manages itself.

Examples:

- a company server
- a private virtual machine
- a controlled internal machine

## Why Teams Use Self-Hosted Runners

Teams may choose them when they need:

- private network access
- special tools already installed
- custom hardware or stronger control

## Why This Course Uses Hosted Runners Only

Hosted runners keep the course simple because:

- students do not need extra infrastructure
- the workflow story stays easier to follow
- the focus stays on CI/CD thinking, not runner setup

## Beginner Memory Rule

Use this short rule:

- hosted runner = GitHub starts the machine
- self-hosted runner = your team starts and manages the machine

## Related Help

- [Runner Mental Model](00-runner-mental-model.md)
- [Trigger Reference](06-trigger-reference.md)
- [Glossary](03-glossary.md)
