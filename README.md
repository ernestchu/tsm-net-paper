# Report

[PDF](tsm-net.pdf)

## Dependency

- LaTeX

## Build

### Build PDF

```sh
make clean all
```

### Auto build on file change

```sh
make latexmk
```

Note that this do not copy the PDF file out of the build directory.

On macOS where the built-in Preview.app does not support auto-update, an alternative PDF reader [Skim](https://skim-app.sourceforge.io) is recommended.

In `~/.latexmk`
```sh
$pdf_previewer = 'open -a Skim';
```
to specify the PDF reader for latexmk.

### Clean intermediate files

```sh
make purge
```

### Clean all generated files

```sh
make clean
```
