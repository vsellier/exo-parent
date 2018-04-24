#!/bin/bash -eu

message="commit message here"

list="$(git status | grep modified: | cut -f2 -d":" | grep content | cut -f1 -d"(")"

echo Commit projects ${list}
echo Press enter to continue
read

for i in $list
do
	echo
	echo $i
	echo
	cd $i
	git diff
	echo OK ?
	read
	git add pom.xml
	git commit -m "${message}"
	git pull --rebase
	git push origin develop
	cd ..
done
