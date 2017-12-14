#!/bin/bash

#should add argument capability

push()
{
	cp -r ../kicadw/printer_mec/ .
}

pull()
{
	echo "Are you sure you want to replace the file in this computer?[y/N]"

	read response
	echo $response
	if  [ "$response" = "y" ]; then
		echo "replacing"
		cp -r printer_mec ../kicadw/printer_mec
	else
		echo "not replacing"
		echo "exit"
	fi
}

usage()
{
	echo ""
	echo " usage: "
	echo "./copying.sh <cmd>"
	echo "	where <cmd> is one of:"
	echo "		--push		before pushing to git repository"
	echo "		--pull		after pulling from git repository"
	echo ""
	echo " examples:"
	echo "	./copying.sh --push"
}


if [ $# -eq 1 -a "$1" == "--push" ]; then
	push
	exit
fi

if [ $# -eq 1 -a "$1" == "--pull" ]; then
	pull
	exit
fi

usage
