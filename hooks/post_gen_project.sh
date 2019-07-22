#!/bin/bash

if echo "{{ cookiecutter.initial_git_commit }}" | grep -iq '^y'; then
    echo -e "\e[1;33m==> Intializing a new git repository \e[0m"
    echo -e "\e[1;32m==> git init \e[0m"
    git init
    echo -e "\e[1;32m==> git status \e[0m"
    git status
    echo -e "\e[1;33m==> Staging all project files \e[0m"
    echo -e "\e[1;32m==> git add -A \e[0m"
    git add -A
    echo -e "\e[1;32m==> git status \e[0m"
    git status
    echo -e "\e[1;33m==> Making the initial commit \e[0m"
    echo -e "\e[1;32m==> git commit \e[0m"
    git commit -m "Create base project"
    echo -e "\e[1;32m==> git log \e[0m"
    git log
    echo -e "\e[1;32m==> git status \e[0m"
    git status
    if [ $(echo "{{ cookiecutter.enter_git_origin }}" | grep -i '[a-z]' | wc -c) -gt 4 ]; then
        echo -e "\e[1;33m==> Setting up {{ cookiecutter.enter_git_origin }} as origin \e[0m"
        echo -e "\e[1;32m==> git remote add origin {{ cookiecutter.enter_git_origin }} \e[0m"
        git remote add origin {{ cookiecutter.enter_git_origin }}
        echo -e "\e[1;32m==> git remote -v \e[0m"
        git remote -v
        if echo "{{ cookiecutter.push_initial_commit }}" | grep -iq '^y'; then
            echo -e "\e[1;33m==> Pushing intial commit to origin: {{ cookiecutter.enter_git_origin }} \e[0m"
            echo -e "\e[1;32m==> git push origin master \e[0m"
            git push origin master
            if [ $(echo $?) -ne 0 ]; then
                echo -e "\e[1;31m==> Removing invalid origin: {{ cookiecutter.enter_git_origin }} \e[0m"
                echo -e "\e[0;31m==> git remote remove origin \e[0m"
                git remote remove origin
            fi
            echo -e "\e[1;32m==> git status \e[0m"
            git status
        fi
    fi
fi
