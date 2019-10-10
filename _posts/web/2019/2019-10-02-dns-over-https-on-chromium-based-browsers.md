---
layout: post
title: DNS-over-HTTPS on Chromium based browsers
categories: [Web]
#date: 2019-10-02
---

DNS resolution over an encrypted HTTPS connection prevents tampering, eavesdropping and spoofing, greatly enhancing privacy and security between client and public DNS service. It complements DNSSEC to provide end-to-end authenticated DNS lookups.

We can discuss the many caveats of the current centralization of DNS in this approach, considering the absense of ISPs' engagement in the implementation of their own DNS-over-HTTPS(DoH) or DNS-over-TLS(DoT) solutions, but that's a matter for another time. Any DNS encryption efforts right now are much welcome, considering the current plain text situation of DNS worldwide.

In the absense of native system-wide support on both Windows and macOS, the implementation of this feature is largely dependent on the support of applications. Fortunately, browsers of the Chromium family(Google Chrome, new Microsoft Edge, Vivaldi, etc) are now capable of routing every DNS request to a DNS-over-HTTPS service of your choice, no 3rd party extension required.

Just add the DoH address in the \* below:

<p class="message">--enable-features="dns-over-https<DoHTrial" --force-fieldtrials="DoHTrial/Group1" --force-fieldtrial-params="DoHTrial.Group1:server/*/method/POST"</p>

Just keep in mind that you need to replace each period(.) with %2E, colon(:) with %3A and foward slash(/) with %2F in that address to comply with the command's semantic, i.e. using Google's public DoH address: 

<p class="message">--enable-features="dns-over-https<DoHTrial" --force-fieldtrials="DoHTrial/Group1" --force-fieldtrial-params="DoHTrial.Group1:server/https%3A%2F%2Fdns%2Egoogle%2Fdns-query/method/POST"</p>

or using Cloudflare's public DoH address:

<p class="message">--enable-features="dns-over-https<DoHTrial" --force-fieldtrials="DoHTrial/Group1" --force-fieldtrial-params="DoHTrial.Group1:server/https%3A%2F%2Fcloudflare-dns%2Ecom%2Fdns-query/method/POST"</p>

To finalize, just add those flags to the end of the target field in the browser's shortcut.
