#!/bin/bash

echo -n "===> Would you like to initialize this project as a git repository? [Y/n] ";
read -r git_init;
if echo "$git_init" | grep -iq "^y"; then
    git init;
    echo -n "===> Would you like to create the initial git commit? [Y/n] ";
    read -r git_commit;
    if echo "$git_commit" | grep -iq "^y"; then
        echo -e "#Latex\\n*.aux\\n*.glo\\n*.idx\\n*.log\\n*.toc\\n*.ist\\n*.acn\\n*.acr\\n*.alg\\n*.bbl\\n*.blg\\n*.dvi\\n*.glg\\n*.gls\\n*.ilg\\n*.ind\\n*.lof\\n*.lot\\n*.maf\\n*.mtc\\n*.mtc1\\n*.out\\n*.synctex.gz" >> .gitignore;
        git add -A;
        git commit -m "Create base LaTeX project";
        echo -n "===> Would you like to add a remote as origin? [Y/n] ";
        read -r git_remote;
        if echo "$git_remote" | grep -iq "^y"; then
            echo -n "===> Please enter the remote address: ";
            read -r remote_address;
            git remote add origin "$remote_address";
            echo -n "===> Would you like to push inital commit at origin? [Y/n] ";
            read -r git_push;
            if echo "$git_push" | grep -iq "^y"; then
                if ! git push origin master ; then
                    echo "===> Error: Couldn't push to origin. Remote address ($remote_address) seems invalid."
                fi
            fi
        fi
    fi
fi
