---
layout: post
title: How to disable Service Workers on Chromium based browsers through uBlock
categories: [Tech]
---

The thought of some website installing a Service Worker upon visit, without user interaction, makes little sense. This liberal approach poses risks such as opening a new channel of entry for still undiscovered exploits while causing unnecessary arbitrary resource consumption. 
Firefox includes a disable toggle that simply turns off Service Workers globally. For Chromium based browsers we need to use external tools to archieve the same effect. Extensions like <a href="https://github.com/gorhill/uBlock">uBlock</a> can use Content Security Policy(CSP) fetch directives to filter and block Service Workers. 
Just add the following line on uBlock’s “My filters”:
<p class="message">||$csp=worker-src 'none'</p>
If you need to exclude some particular website from the filtering process(i.e. you need background notifications for that domain), you can whitelist it using the following format:
<p class="message">||$csp=worker-src 'none',domain=~whitelistthisdomain.com</p>
Completely close and reopen your browser. The next step is to discard any existing Service Workers previously installed on your session. You can see the current list of Service Workers by typing:
<p class="message">[chrome/edge/vivaldi/...]://serviceworker-internals/</p>
Just remove one by one trough the “Unregister” button. 
That’s it!

<b>Sidenote:</b> There is the possibility of some requests passing over the uBlock's flitering process during browser startup, resulting in the unattended installation of some Service Workers. To overcome this just toggle the "I am an advanced user" option on uBlock's Settings, click the adjacent spinning gears icon, locate the flag <i>suspendTabsUntilReady</i> and change the boolean to <i>yes</i>.