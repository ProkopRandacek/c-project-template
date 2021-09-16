# A C project template
With a fancy Makefile. Works with `gcc`, `clang`, `tcc` and probably others.

## Usage
Change the project name in `.gitignore` and `Makefile`

- `make` - builds the binary
- `make run` - like `make` but runs it as well
- `make clean` - cleans build files

## Features

- All directories in `src/` are included. You don't have to use relative paths when including headers.
- Only files that have changed and their dependencies are rebuild.

