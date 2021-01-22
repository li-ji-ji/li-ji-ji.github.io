#!/bin/bash

function saveSitemap()
{
    find $1 -name '*.html' -type f -print0 | while IFS= read -r -d $'\0' file; 
        do echo ${file/public/https://blog.evil-scream.cn} >> updatesitemap.txt
    done
}

saveSitemap $1
