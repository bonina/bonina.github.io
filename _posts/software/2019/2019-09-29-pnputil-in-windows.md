---
layout: post
title: Pnputil in Windows
categories: [Software]
---

Through pnputil you can obtain a list of packages containing the drivers of the hardware currently present on the system. For rollback purposes, the system keeps a few old versions of each driver along the update timeline, unfortunately not always with good outcomes. One of the disadvantages is the considerable amount of space used in some cases, adding to the complexity of fragments and clutter in the master file table. Some may well become the origin of system instabilities due to mismatched or leftover entries. 

The majority of external uninstallers(i.e. InstallShield) do a poor job of cleaning leftovers, not always using the INF file/Setup Information file as a source for reverting back the installation process, contributing in the end to that messy situation. 

Calling the unnistall capabilities of the Windows' pnputil tool forces the usage of the INF file as a source resulting in a complete and thorough uninstall of both files and registry entries. 

To obtain the list of oem\*.inf packages currently present in the system, just run the command with this argument: 
<p class="message">pnputil /e</p>

Searching for the oem\*.inf files that could be discarded is not always a straightforward task. The bullet proof solution I've found is knowing the installed version numbers beforehand. E.g. if I am updating my graphics card drivers(usually the biggest driver packages in a system), I can previously obtain the versions throught the command center solution of that driver or just by consulting the Device Manager entry correspondent to that hardware. That way you can know which oem\*.inf to uninstall later on. 
To call that routine, you can use the following format(just subtitute [number] with the numeric value of the file): 
<p class="message">pnputil /delete-driver oem[number].inf /uninstall</p>

You should obtain the sucessfull outputs on the prompt, and immediately see the improvements in occupied space. 
