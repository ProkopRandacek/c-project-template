# A C project template
For developing on Linux and building for Linux/Windows.  
Works with `gcc`, `clang`, `tcc` and probably others.

## Usage
Change the project name in `.gitignore` and `Makefile`

- `make` - builds both Linux and Windows binary
- `make defualt` - builds Linux binary
- `make cross` - builds Windows binary
- `make run` - like `make` but runs it as well
- `make clean` - cleans build files

## Features

- All directories in `src/` are included. You don't have to use relative paths when including headers.
- Only files that have changed and their dependencies are rebuild.
- Cross compile from Linux to windows.
- Embed assets directly into the executable.
- Write Python scripts that generate parts of your C code at build time.

