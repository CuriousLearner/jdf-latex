# Cookiecutter for JDF LaTex

A cookiecutter template for writing LaTeX articles in Joyner Document Format (JDF).

Here is a [sample PDF](https://github.com/curiouslearner/jdf-latex/blob/master/{{cookiecutter.project_name}}/sample/sample.pdf).

## Basic Workflow

### Get LaTex

Install [LaTex](https://www.latex-project.org/get/). If you are on Linux, then you might already have `texlive` installed, but it is suggested to get the current [Tex Live Distribution](https://www.tug.org/texlive/).

### Get the template

1. Install cookiecutter:
```
    pip install cookiecutter
```

2. Generate a new LaTeX project:
```
    cookiecutter https://github.com/curiouslearner/jdf-latex.git
```

3. Answer a few questions.

4. Now, you can start writing your document. Either directly add your text in `main.tex` or create a new `.tex` file and include it in `main.tex` using:
```
    \input{<file_name>.tex}
```

### Build the PDF

#### Method 1: Use the makefile

After writing your LaTex document, give command `make` from the project directory.

```shell
    make
```

And your `main.pdf` shall be good to go!

__NOTE__:
- Every time you add/remove a reference you need to re-generate the PDF with `make` command.

#### Method 2: Build PDF the hard way 

1. After writing your LaTex document, build it from project directory using:
```shell
    pdflatex main
```

2. In case your document contains references (citations/images/links/etc) use:
```shell
    bibtex main
    python enumerate-refs.py
    pdflatex main
    pdflatex main
```

__NOTE__:
- Every time you add/remove a reference you need to re-generate the PDF. For which either run command `make` as described [above](#method-1-use-the-makefile), OR do as follows:
```shell
    rm main.bbl
    rm main.aux
```
And [build the pdf](#method-2-build-pdf-the-hard-way) again.

## Thanks to Contributors

Many thanks to the creator of [cookiecutter](https://github.com/audreyr/cookiecutter).

This cookiecutter template is based on George Kudrayvtsev, Shiva Saxena and other's work. We're thankful for their contributions.
