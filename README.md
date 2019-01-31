# Cookiecutter for LaTex Article

A cookiecutter template for writing LaTeX articles.

Here is a [sample PDF](https://github.com/curiouslearner/jdf-latex/blob/master/{{cookiecutter.project_name}}/sample.pdf).

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

4. Now, you can start writing your document. Either directly add your text in `your_project.tex` or create a new `.tex` file and include it in `your_project.tex` using:
```
    \input{<file_name>.tex}
```

### Build PDF

1. After writing your LaTex document, build it from project directory using:
```
    pdflatex your_project.tex
```

2. In case your document contains references (citations/images/links/etc) use:
```
    bibtex your_project.aux
    pdflatex your_project.tex
    pdflatex your_project.tex
```

__NOTE__:
- Every time you add a new reference, you need to run these 3 commands.
- *.aux* file is generated automatically after using `pdflatex` for the initial build.

That's it!

Many thanks to the creator of [cookiecutter](https://github.com/audreyr/cookiecutter).
