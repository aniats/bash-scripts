#!/bin/bash

mkdir playground
cd playground
mkdir dir1 dir2
cp /etc/passwd passwd
cp -v /etc/passwd passwd
cp -i /etc/passwd passwd
mv passwd fun
mv fun dir1
mv dir1/fun dir2
mv dir1 dir2
mv dir2/dir1 .
mv dir2/fun .
cd ..
rm -r playground

