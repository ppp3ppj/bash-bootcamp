# bash-bootcamp

A simple script runner that executes all scripts in the `runs/` directory.

## Quick start

```bash
curl -o- https://raw.githubusercontent.com/ppp3ppj/bash-bootcamp/main/setup | bash
```

This will clone the repo into `~/bash-bootcamp`, then run all scripts automatically.

## Usage

### Run all scripts

```bash
DEV_ENV=$(pwd) ./run
```

### Run a custom script using a grep filter

Only runs scripts whose filename matches the given string:

```bash
DEV_ENV=$(pwd) ./run keyboard
```

### Dry run

Log what would happen without actually running anything:

```bash
DEV_ENV=$(pwd) ./run --dry
```

Dry run with a filter:

```bash
DEV_ENV=$(pwd) ./run keyboard --dry
```

## How it works

- `DEV_ENV` must be set — it is exported and made available to all child scripts.
- Scripts must be placed in the `runs/` directory and be **executable**.
- An optional positional argument is used as a `grep` filter against script filenames.
- `--dry` prints what would run without executing anything.
