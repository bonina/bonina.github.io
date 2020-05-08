---
layout: post
title: Disable Windows fast boot hibernation approach
categories: [Software]
published: true
---

The hibernation in Windows is a usefull tool specially for the productive user. Those pesky low battery moments when you have little time to save your work, the hibernation cames to the rescue. Windows also uses a similar approach for fast boot, albeit with dubious usefulness.

The fast boot approach introduced back in Windows 8(also present in Windows 10) uses a hybrid approach during shutdown, hibernating the kernel for faster later load. While it improves the boot time, the priority shifts from the stability of a freshly loaded kernel to the pointless fact of a few seconds less on boot time. While it may fill the spec sheet and cause some impact on the consumer base, it adds unneeded complexity and storage overhead. If you prefer a full shutdown with a fresh loaded kernel, you can disable fast boot by copying the below text to the notepad:

<p class="message">Windows Registry Editor Version 5.00<br>
<br>
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power]<br>
"HiberbootEnabled"=dword:0</p>

and renaming the file to:

<p class="message">"sometingofyourchoosing".reg</p>

Just double click on it to add the change to the regedit and reboot to take it into effect.
