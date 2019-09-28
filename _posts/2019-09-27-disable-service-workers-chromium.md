---
layout: post
title: How to disable Service Workers on Chromium based browsers through uBlock
categories: [Tech]
---

The thought of some website installing a Service Worker upon visit makes little sense. This liberal approach poses some risks such as other ports of entry for unknown exploits and unnecessary arbitrary resource consumption. 
Firefox includes a disable toggle that simply turns off Service Workers globally. Chromium based browsers do not. 
Fortunately through the extension <a href="https://github.com/gorhill/uBlock">uBlock</a> we can use Content Security Policy(CSP) fetch directives to filter and block Service Worker. 
Just add the following line on uBlock’s <i>“My filters”</i>:
<p class="message">||$csp=worker-src 'none'</p>
If you need to exclude/whitelist some particular website from that filtering process(i.e. you need background notifications for that domain), you can specify it using the following format:
<p class="message">||$csp=worker-src 'none',domain=~whitelistthisdomain.com</p>
Completely close and reopen your browser. Now, we can successfully discard any existing Service Workers currently on your session. You can see this list by typing:
<p class="message">[chrome/edge/vivaldi/...]://serviceworker-internals/</p>
Just remove one by one trough the “Unregister” button. 
That’s it!

<b>Sidenote:</b> There is the possibility of some requests passing over the uBlock's flitering process during browser startup, resulting in the unnatended installation of some Service Workers. To overcome this just toggle the "I am an advanced user" option on uBlock's Settings, click the adjacent spining gears icon, locate the flag <i>suspendTabsUntilReady</i> and change the boolean to <i>yes</i>.
