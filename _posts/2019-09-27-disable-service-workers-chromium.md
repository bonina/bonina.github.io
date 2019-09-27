---
layout: post
title: How to disable Service Workers on Chromium based browsers through uBlock
categories: [Tech]
---

Just the thought that some website can install a service worker upon visit makes little sense. Privacy and unnecessary arbitrary resource consumption are at risk with this liberal approach.
Browsers such as Firefox include a disable toggle that simply turns off any service worker globally. Chromium based browsers do not, unfortunately.
Through the extension uBlock we can use content security policy fetch directives to filter and block service workers.
Just add the following line on uBlock’s “My filters”:
<p class="message">||$csp=worker-src 'none'</p>
If you need to exclude some particular website from that filtering(ex: you need background notifications for that domain), you can specify it using this format:
<p class="message">||$csp=worker-src 'none',domain=~whitelistthisdomain.com</p>
Completely close and reopen your browser. Now, we can successfully discard them. You can see which service workers are currently on your session by typing:
<p class="message">chrome://serviceworker-internals/</p>
You can remove one by one trough the “Unregister” button. That’s it.
