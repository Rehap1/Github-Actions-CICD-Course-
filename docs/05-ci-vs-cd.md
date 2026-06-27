# CI vs CD

## Purpose

This page gives the shortest useful explanation of CI and CD for this course.

Use it after the main labs if you want the terms to feel clearer.

## Short Version

- CI asks: is the change still safe?
- CD asks: how do we carry forward and deliver the verified thing?

That is enough for this course.

## In This Course

You have already seen both ideas:

- `02 CI Workflow` shows CI
- `03 Build Artifact Workflow` and `04 Deploy Workflow` show the delivery side
- `LAB-05` connects the full story from code to delivery

## Why Teams Need Both

CI helps teams catch problems early.

CD helps teams avoid rebuilding or delivering in a different way later.

Together, they help a team move from:

- a code change
- to verification
- to a repeatable package
- to delivery

## One Small Beginner Warning

Some teams use `CD` to mean:

- continuous delivery
- continuous deployment

For this beginner course, you do not need to split those two ideas.

It is enough to understand that CD is the delivery side of the pipeline.

## Simple Memory Rule

If the question is:

- "Is this change safe?" think CI
- "What exact thing do we deliver next?" think CD

## Related Pages

- [Course Map](00-course-map.md)
- [Final Recap](04-final-recap.md)
- [Next Steps: Matrix and Secrets](06-next-steps-matrix-and-secrets.md)
