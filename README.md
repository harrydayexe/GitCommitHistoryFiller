# Git Commit History Filler

## Usage
Git Commit History Filler generates a Git repo of empty commits at dates in the past in order to fill your GitHub contributions graph with commits from other sources, such as self-hosted enterprise GitLab instances. The tool takes a CSV as an input with the format such as the following:

```csv
01/12/2023,8
02/12/2023,0
03/12/2023,0
04/12/2023,2
05/12/2023,14
06/12/2023,14
07/12/2023,11
```

```console
$ GitCommitHistoryFiller -h
OVERVIEW: A utility to generate a Git repo from a csv file of dates and number of commits

USAGE: git-commit-history-filler <commit-data-file> [<output-location>] [--verbose]

ARGUMENTS:
  <commit-data-file>      A csv file to read commit data from
  <output-location>       The folder to create the Git repo in. If omitted, a new folder ./Output/ is created

OPTIONS:
  -v, --verbose           Include extra information in the output.
  -h, --help              Show help information.
```