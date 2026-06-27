# Final Recap

## Purpose

Use this page at the end of the course to review the full story one more time.

## The Main Story

The course followed one simple chain:

1. code
2. verify
3. package
4. deliver

If you remember that story, you remember the main point of the course.

## What Each Workflow Taught

### 01 Hello Workflow

This workflow taught:

- where workflow files live
- how a run appears in the `Actions` tab
- what a job and step look like

### 02 CI Workflow

This workflow taught:

- CI means automated verification after a change
- tests can run automatically
- logs give fast feedback

### 03 Build Artifact Workflow

This workflow taught:

- passing tests is not the same as having a package
- a build can create a reusable output
- that output can be saved as an artifact

### 04 Deploy Workflow

This workflow taught:

- deployment should use the saved artifact
- the packaged app can be started and checked automatically
- a smoke test gives a quick delivery signal

## Final Hands-On Lab

The last lab connected the main workflows into one path:

- a code change triggered CI
- CI verified the change
- the build workflow created the package
- the deploy workflow delivered that same package

That is the full course story in action.

## Beginner Mental Model

For this course, these sentences are enough:

- CI asks: is the change safe?
- build asks: what exact package should we carry forward?
- deploy asks: can we deliver and start that package?

## If You Forget Everything Else

Return to these two short ideas:

- GitHub Actions is the tool.
- `code -> verify -> package -> deliver` is the story.

## Useful Pages to Revisit Later

- [Course Map](00-course-map.md)
- [CI vs CD](05-ci-vs-cd.md)
- [How to Read Actions Logs](help/01-how-to-read-actions-logs.md)
- [Glossary](help/03-glossary.md)
- [Next Steps: Matrix and Secrets](06-next-steps-matrix-and-secrets.md)
