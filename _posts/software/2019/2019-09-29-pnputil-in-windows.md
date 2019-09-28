---
layout: post
title: Pnputil in Windows
categories: [Software]
---

Through pnputil you can obtain a list of packages containing the drivers of the hardware currently present on the system. For rollback purposes, the system keeps a few old versions of each driver along the update timeline, unfortunately not always with good outcomes. One of the disadvantages is the considerable amount of space used in some cases, adding to the complexity of fragments and clutter in the master file table. Some may well become the origin of system instabilities due to mismatched or leftover entries. 

The majority of external uninstallers(i.e. InstallShield) do a poor job of cleaning leftovers, not always using the setup information file(INF) as a source for reverting back the installation process, contributing in the end to that messy situation. 

Calling the unnistall capabilities of the Windows' pnputil tool forces the usage of the INF file as a source, resulting in a complete and thorough uninstall of previously added files and registry entries. 

To obtain the list of oem\*.inf packages currently present in the system, just run the following command: 
<p class="message">pnputil /e</p>

Searching for the oem\*.inf files that could be discarded is not always a straightforward task. The bullet proof solution I've found is knowing the installed version numbers beforehand. For instance, if I am updating my graphics card drivers(usually the largest driver packages in a system), I first obtain the current version through the command center solution of that driver or by consulting the Device Manager entry correspondent to that hardware. This way I can know which oem\*.inf to uninstall later on by comparing their corresponding versions. 
To call that routine, you can use the following format(replace [number] with the numeric value of the file): 
<p class="message">pnputil /delete-driver oem[number].inf /uninstall</p>

You should get the successful outputs on the prompt, and immediately see the improvements in occupied space plus prevention of possible leftover issues. 
