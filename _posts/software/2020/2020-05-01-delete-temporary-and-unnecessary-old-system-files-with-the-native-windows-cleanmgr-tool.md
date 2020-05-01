---
layout: post
title: Delete temporary and unnecessary old system files with the native Windows cleanmgr tool
categories: [Software]
published: false
---

It is wildly known that the native processes of keeping and updating Windows generates a considerable amount of unnecessary old files that in some cases occupy several GBs of disk space, specially when stepping up to diferrent builds. Albeit aparently unarfull in systems with large amounts of free storage space, those files add to the existing resurce load, increasing the MFT size and comprexity while augmenting at the same time the chances of framentation(relevant for HDDs). A lighter index base will always improve latencies and file system agility, not to mention less pressure on the NAND controller with more overprovisioning space and potentially fewer NAND bit switch due to the reduced amount of writen files.

Fortunately, Windows has a tool that help us accomplish the task of safely cleaning the system of those files. Not so fortunate is that it needs to be launched from the commmand line, which not aids in the user friednliness department. Still, may that not detain the less tech savvy. We can run from both the Start menu > Windows System > right click in Command Prompt > More > Run as administor, OR by right clicking in the start button > Command Prompt (Admin). Then just write the folowing command and argument proceded by Enter:

cleanmgr -sageset:1

A small window will appear, allowing us to choose which elements we want it to scrutinize in the cleaning process. I personally recomend all checked with the exception of "Downloads", since that hould delete the entirety of the standard path for the download folder. After that step, just click OK and go back to the Command Prompt. To run the tool you just need to write the folowing command and argument proceded by Enter:

cleanmgr -sagerun:1



So the first step is to run the command line as an administrator. 



MFT and fragmented files

Junk files 

2020-05-01-cleanmgr-sageset-sagerun.md
