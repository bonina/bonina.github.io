---
layout: post
title: Update Surface graphics drivers
categories: [Software]
published: false
---

The release timeline of the Windows' update catalog is lacking to say the least. For example, the Surface Go was released back in August 2018 but its Intel's graphics drivers are still stagnated in release from the 15th of that exact release month. In the meantime, Intel has released countless updates for that iGPU (HD 615) to the rate of aproximatly once every 2/3 months, fixing bugs and aplying new features and improvements/optimizations, even a completely new Graphics Command Center build from the ground up. Since the Intel graphics drivers used in the Surface line are not customized and are exactly like the plain general ones directly from Intel, Microsoft has no excuse to at least update them every few months for those few PCI IDs in their update catalog. Its stagering that the majority of clients with those devices are still facing the same initial lack of improvements in those regards simply because Microsoft is ignoring these relevant updates from Intel. Worse is that since Windows 10, in the Home version(which represent the lasgest pool of users in the domestic market), any driver update on the users side in forcefully overwriten shortly after. So, in this case not only they are not updating their update catalog in a minimally acceptable fashion, but they they inviablilize any user attempts to update those drivers.

Embeded in the depts of the Microsoft's knowledge bases, there is a troubleshooter package(link below) that at least makes possible to hide specific driver updates considering an unnistalled initial state, disabling the overwrite altogether. The downside is that in case Microsoft updates that hidden driver in their catalog, it will revert and forcefully overwrite the one already in the system. The only fix to this is to repeat the process of running the troubleshooter package and hide that new driver right after unnistalling it. Only then you should update to the newer graphics driver avaliable in the Intel Download Center(link below).

Microsoft's "show or hide updates" troubleshooter package:
https://support.microsoft.com/en-us/help/3183922/how-to-temporarily-prevent-a-windows-update-from-reinstalling-in-windo
(click on: 'Download Download the "Show or hide updates" troubleshooter package now.')

Intel Download Center(graphics driver updates for HD 615):
https://downloadcenter.intel.com/product/96554/Intel-HD-Graphics-615
