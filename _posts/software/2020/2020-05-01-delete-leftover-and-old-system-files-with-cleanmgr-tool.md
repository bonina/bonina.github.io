---
layout: post
title: Delete leftover and old system files with the native Windows cleanmgr tool
categories: [Software]
published: true
---

It is widely known that the native processes of keeping and updating Windows generates a considerable amount of leftover files that in some cases occupy considerable amounts of disk space, especially after stepping up to a newer Windows build. Some of these leftover files are purposefully put aside by the system, for it (or the user) to be able to rollback to the previous Windows build after a major update failure, or the user be able to uninstall a specific update package after observing issues or system instability related to it. Rule of the thumb, I would suggest that after a while on the newer build or after package update installation without apparent bugs or issues, you may safely delete those. Nonetheless, considering the worst case, I strongly recommend that you avoid rolling back your system if possible, and opt instead to wait for a fix to become available if possible, since there are potentially less risks in a posterior bugfix situation than in a local rollback.

Albeit apparently unharmful in systems with large amounts of free storage space, those "leftovers" add to the existing resource load, increasing the MFT size and complexity while augmenting the chances of fragmentation(particularly relevant for HDDs). A lighter index base will always improve latencies and file system agility, not to mention less pressure on the NAND controller with more overprovisioning space and potentially fewer NAND bit switches due to the reduced amount of written files(on SSDs).

Fortunately, Windows has a tool that helps us accomplish the task of safely cleaning the system of those files.

So the first step is to run the Command Prompt as an administrator. We can opt to run from the Start menu > Windows System > right click in Command Prompt > More > Run as administrator, OR by right clicking in the start button > Command Prompt (Admin). Then just write the following command and argument followed by Enter:

<p class="message">cleanmgr -sageset:1</p>

A small window will appear, allowing us to choose which elements we want it to scrutinize in the cleaning process. I personally recommend all checks with the exception of "Downloads", since that would delete the entirety of the standard path for the download folder. After that step, just click OK and go back to the Command Prompt. To initiate the cleaning process you just need to write the following command and argument followed by Enter:

<p class="message">cleanmgr -sagerun:1</p>

This process may take some time to complete, especially on systems with considerable amounts of files left by successive update runs.

As an alternative, there is a simple script that concatenates the above and additional native tools/commands with the goal of further minimizing the size of the WinSxS folder. This will further uninstall and delete packages with components that have been replaced by newer versions. Previous versions of some components are kept on the system for a period of time, allowing you to rollback if necessary. After successful updates, these older components can be safely removed.

[Download cleanup script here](https://github.com/bonina/cleanupscript)
