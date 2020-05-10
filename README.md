# ICFP 2020 miniKanren Workshop Paper

This repo contains the source for the tentatively titled "miniKanren for Statistical Computation" submission.

# Requirements

The source document is in `org-mode` and it is exported to LaTeX using a customized exporter provided by the [`org-btw`](https://github.com/brandonwillard/org-btw) package.

The generated LaTeX document uses the `amsart` style, which can be installed on Debian variants using
```sh
sudo apt install texlive-publishers
```

# Building

Use the `make` targets to build the PDFs and/or the intermediate LaTeX files.
