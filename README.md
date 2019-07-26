# Cookiecutter for JDF LaTeX

A cookiecutter template for writing LaTeX articles in Joyner Document Format (JDF) 2.0!

Here is a [sample PDF](https://github.com/curiouslearner/jdf-latex/blob/master/{{cookiecutter.project_name}}/sample/sample.pdf).

## Basic Workflow

### Get LaTeX

Install [LaTeX](https://www.latex-project.org/get/). If you are on Linux, then you might already have `texlive` installed, but it is suggested to get the current [Tex Live Distribution](https://www.tug.org/texlive/).

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

4. Now, you can start writing your document. Either directly add your text in `main.tex` OR, create a new `.tex` file and include it in `main.tex` using:
```
    \input{<file_name>.tex}
```

### Build the PDF

After writing your LaTeX document, give `make` command from the project directory.

```shell
    make
```

And your `main.pdf` shall be good to go!

__NOTE__:
- Every time you make changes in `main.tex` file you need to re-generate the PDF with `make` command.
- If there is _no text_ present between 2 successive headings, then add the custom command `\notext` between them to match their linespacing with JDF2.0.

## Thanks to Contributors

Many thanks to the creator of [cookiecutter](https://github.com/audreyr/cookiecutter).

This cookiecutter template is based on George Kudrayvtsev, Shiva Saxena and other's work. We're thankful for their contributions.
