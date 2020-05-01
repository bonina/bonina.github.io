---
layout: post
title: Delete leftover and unnecessary old system files with the native Windows cleanmgr tool
categories: [Software]
published: false
---

It is widely known that the native processes of keeping and updating Windows generates a considerable amount of leftover files that in some cases occupy several GBs of disk space, specially after stepping up to a newer build. Some of these leftover files are porposefuly put asside by the system, for it (or the user) to be able to rollback to the previous Windows build after a major update failure, or the user be able to unnistal a specific update package after observing issues or system instability related to it. Rule of the thumb, I would suggest that after awhile on the newer build or after package update instalation wihtout apparent bugs or issues, you may safely delete those. Nonetheless considering the worst case, I strongly recommend that you avoid rolling back your system if possible, and opt instead to wait for a fix to become available, since there are less risks in a posterior bugfix situation than in a local rollback.

Albeit aparently unarfull in systems with large amounts of free storage space, those leftover files add to the existing resurce load, increasing the MFT size and comprexity while augmenting at the same time the chances of framentation(relevant for HDDs). A lighter index base will always improve latencies and file system agility, not to mention less pressure on the NAND controller with more overprovisioning space and potentially fewer NAND bit switch due to the reduced amount of writen files(on SSDs).

Fortunately, Windows has a tool that help us accomplish the task of safely cleaning the system of those files. Not so fortunate is that it needs to be launched from the Commmand Prompt, which does not aid in the user friednliness department. Still, may that not detain the less tech savvy, just one simple line needs to be written.

So the first step is to run the command line as an administrator. We can run from both the Start menu > Windows System > right click in Command Prompt > More > Run as administor, OR by right clicking in the start button > Command Prompt (Admin). Then just write the folowing command and argument proceded by Enter:

<p class="message">cleanmgr -sageset:1</p>

A small window will appear, allowing us to choose which elements we want it to scrutinize in the cleaning process. I personally recomend all checked with the exception of "Downloads", since that whould delete the entirety of the standard path for the download folder. After that step, just click OK and go back to the Command Prompt. To run the tool you just need to write the folowing command and argument proceded by Enter:

<p class="message">cleanmgr -sagerun:1</p>

This process mmay take some time to complete, specially on systems with considerable amounts of files left by sucessive update runs.
