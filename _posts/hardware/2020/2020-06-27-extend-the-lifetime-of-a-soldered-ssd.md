---
layout: post
title: Extend the lifetime of a soldered SSD
categories: [Hardware]
published: false
---

Hard locked, highly integrated devices with practically all components soldered on, go hand in hand with obsolescence. For example, the limited longevity of soldered SSDs is like having a virtual usage stamp on any device that uses them.
They are not the only short life consumables, but you may continue to use a laptop with a highly used battery that gives just a few minutes of autonomy, but you are in a pickle if your internal SSD is in a non-working state due to the exhaustion of the finite amount of writes that each NAND cell is capable of doing.
With inventive efforts by companies to make more with less, we are seeing an increase in the usage of QLC NAND cells, with the resilience dropping severely in the name of price and density. Also, with the tendency of new hardware releases dropping socketed SSDs, leaving the consumer with less options, inventive ways of avoiding writing amplification becomes a relevant topic, especially considering smaller storage sizes where the low number of available cells from the start, augmenting writing amplification issues.

Densely packed devices, like the Microsoft’s Surface Go/Pro lines, have the option of using an SDCard as expandable memory via an unobtrusive bay at the back.
Other highly integrated devices such as Apple’s iPad, have a simplified and limited subsystem from the start, meaning that depleting the life of the internal storage is quite rare. Also, the finite update timeline of such devices limits their usefulness and app support as time passes, thus usage and storage wear. So due to their more liberal nature and longevity, PCs and Macs will be more susceptible to this issue. Unfortunately, all MacBooks released from 2015 on dropped the SDCard slot leaving fewer expansion options on the table. This is also true for a few recent highly integrated laptop PCs. In those cases a small/tiny form factor USB pen drive may do the trick. 

<b>The options.</b>

Junctions and symbolic links are great solutions to transparently redirect whole directories from the internal to the expansion storage. Directories with high/frequent write workloads such as browser caches and temporary folders are great candidates for redirection. Moving download folders with large file sizes is also a viable idea, since releasing storage space in the internal SSD improves the chances of the memory controller scattering the writes across the maximum amount of free NAND cells possible, instead of rewriting in the same limited set.

If the contents already exists in the original path, move it to the destination path and only then create the junction/symbolic link. The original path needs to be deleted first so that a small link file with the same directory name as before can be created in its place, redirecting to the destination path with the moved contents.

To create a junction in Windows just write the following command an arguments in an elevated Command Prompt (Admin):

<p class="message">mklink /J "path of the original folder" "path of the new location to redirect to"</p>

Example:

<p class="message">mklink /J "C:\FolderWithStuff" "D:\FolderWithStuff"</p>

You can also opt for a directory symbolic link instead of a junction.

On Windows:

<p class="message">mklink /D "C:\FolderWithStuff" "D:\FolderWithStuff"</p>

On macOS:

<p class="message">sudo ln -s "/Users/Name/FolderWithStuff" "/NameOfDrive/FolderWithStuff"</p>

For directories such as the user folders (Desktop, Video, Images, Downloads, etc.) and any other configurable default path (Temp), you can bypass the usage of junctions or symbolic links and configure the new path directly, usually by accessing the folder properties or changing the environment variables.

More radical measures such as completely disabling the page/swap file will also have a considerable impact in avoiding premature depletion of the NAND cells, especially in systems with recurrent low values of available RAM. As a side note, that may starve the system, which may impact its functionality. Disabling the hibernation/hibernation file is another option, eliminating the process of saving the state of your volatile memory (RAM, cache), to the non-volatile memory (SSD) in suspend states. That will save countless GBs of written data if you use that feature daily/regularly.

Every considerable write task you spare going into your internal SSD will in the end add up and postpone the inveitable.
