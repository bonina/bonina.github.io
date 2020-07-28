---
layout: post
title: Manually update Intel graphics drivers
categories: [Software]
published: true
---

The release timeline of the Windows' update catalog is lacking to say the least, even on Microsoft's own devices. E.g. the Surface Go was released back in August 2018, but to this date (May 2020) the Intel's graphics drivers automatically pushed by Windows Update are still stagnant in a release back from 2018. In the meantime, Intel has released countless public updates for that iGPU (HD 615) to the rate of approximately once every 2/3 months, fixing bugs, improving the package optimization for newly released software, and even new features such as a completely new Graphics Command Center built from the ground up. Microsoft has no excuse to at least update the graphics drivers every 6 months, considering the few PCI IDs related to their own devices in their update catalog.

It's staggering that the majority of clients with such devices are still facing the same initial lack of improvements in the video enco/decoding and 3D graphics spaces simply because Microsoft is ignoring these relevant updates from Intel. Worse is that since Windows 10, in the Home version (which represents the largest pool of users in the domestic market), any driver update on the user side is forcefully overwritten shortly after without an easy way to disable it. If you consider the S Mode users, it’s even worse since you are completely stuck with what the Windows Update gives you. Only Pro versions have the option to disable such enforced overwrite "feature".

Albeit not perfect, fortunately there is a solution for the Home versions. Embedded in the depths of Microsoft's knowledge base, there is a troubleshooter package (link below) that makes possible hiding specific driver updates considering an uninstalled initial state, which serves as an workaround to disable the overwrite altogether. In this particular case (Surface Go), just hide these two entries (for other devices it may differ):

![Surface Go hide update entries](/public/download/show-hide-updates.png)

The downside is that in case Microsoft updates that hidden driver in their catalog, it will revert and forcefully overwrite the one already in the system. The only fix to this is to repeat the process of running the troubleshooter package and hide that new driver right after uninstalling it. Only then you should update to the newer graphics driver available in the Intel's Download Center (link below).

[Microsoft's "show or hide updates" troubleshooter package](https://support.microsoft.com/en-us/help/3183922/how-to-temporarily-prevent-a-windows-update-from-reinstalling-in-windo)<br>
<small>(click on: 'Download Download the "Show or hide updates" troubleshooter package now.')</small>

[Intel Download Center (graphics driver updates for HD 615 - Surface Go's iGPU)](https://downloadcenter.intel.com/product/96554/Intel-HD-Graphics-615)
