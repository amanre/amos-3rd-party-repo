#!/bin/bash


function banner() {
	term_cols=$(tput cols) 
	str=":: $1 ::"
	for ((i=1; i<=`tput cols`; i++)); do echo -n ‾; done
	tput setaf 10; printf "%*s\n" $(((${#str}+$term_cols)/2)) "$str"; tput sgr0
	for ((i=1; i<=`tput cols`; i++)); do echo -n _; done
	printf "\n"
}

repoargs=("-n -R amos-3party-repo.db.tar.gz *.pkg.tar.zst")

rm -f  amos-3party-repo*

banner "Updating Repo Database..."

repo-add $repoargs
sleep 5

banner "Repo Database is Updated!"