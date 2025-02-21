---
layout: post
title: Manually update Intel graphics drivers
categories: [Software]
published: true
---

The release timeline and availability of drivers in the Windows' update catalog is usually slow as snails, sometimes even lacking altogether. Remarkably Microsoft's own devices are not immune to this. For example, the Surface Go 1 was released back in August 2018 but only in December 2019 saw its first Intel's graphics drivers update automatically pushed by Windows Update. Updates with associated optimizations are especially crucial to devices that have a more limited CPU, specially the ones that greatly depend from its integrated GPUs to properly accelerate 4K video from popular sources (YouTube/Netflix/local video files) offloading resources.

In the meantime, Intel released countless public updates for that particular iGPU (HD 615) to the rate of approximately once every 2/3 months, fixing bugs, improving the package optimization for newly released software, and even new features such as a completely new Graphics Command Center built from the ground up.

It's staggering that for this particular case, the majority of clients with such devices are still facing the same initial lack of improvements/optimizations in the browser rendering acceleration, video enco/decoding and 3D graphics spaces simply because Microsoft is ignoring these relevant updates from Intel. To make matters worse, since Windows 10 the Home version (which represents the largest pool of users in the domestic market) tends to arbitrarily and forcefully overwrite manually updated drivers without an easy way to disable it. If you consider users with “S Mode” enabled, it’s even worse since they are completely stuck with what the Windows Update gives them. Only the Pro version has the proper setting to disable such enforced and overzealous overwrite "feature". All at the expense of the user's experience.

Albeit not perfect, there is a little hack. Blocking any changes to drivers associated with specific PCI/IDs. The examples below are for the Surface Go 1, but you can adapt them to other devices.

First, make sure that you disable your internet connection (disconnect WiFi/Ethernet). Then navigate to the path "C:\Windows\SoftwareDistribution\Download" and delete any of its contents. Allow the administrative popup when it appears. Proceed to install the most recent drivers available at Intel's website [Intel Download Center](https://downloadcenter.intel.com/). Reboot when asked.

Before enabling the internet access again, open Notepad, add and save the contents below. Give the .reg extension.

<p class="message">Windows Registry Editor Version 5.00<br>
<br>
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall]<br>
<br>
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions]<br>
"DenyDeviceIDs"=dword:00000001<br>
"DenyDeviceIDsRetroactive"=dword:00000000<br>
"DenyUnspecified"=dword:00000000<br>
<br>
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceIDs]<br>
"1"="PCI\\VEN_8086&DEV_591E&SUBSYS_1182152D"</p>

These entries will block ANY attempt to change the iGPU driver in this particular setup, even with drivers that Windows Update tries to forcefully update (usually older ones). To adapt to your specific hardware, change the PCI/IDs entries (**PCI\\VEN_8086&DEV_591E...**) for the ones attributed to your GPU (use the Device Manager - Display adapters - double click above your GPU - Details tab - Property dropdown and choose Hardware IDs - copy the entry without REV, usually the 2nd one).

When the time to manually update for a newer one comes, you just need to temporarily disable those entries. Make another .reg file with the contents below, and run it when you need to install the newer drivers. Also, repeat the steps above, specifically disabling the internet access and then clearing the contents of the folder "C:\Windows\SoftwareDistribution\Download".

<p class="message">Windows Registry Editor Version 5.00<br>
<br>
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceIDs]<br>
"1"=-</p>

To make sure everything remains updated, just reapply the first .reg file again.
