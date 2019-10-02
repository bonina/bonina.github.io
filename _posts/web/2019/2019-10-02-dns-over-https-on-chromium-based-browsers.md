---
layout: post
title: DNS-over-HTTPS(DoH) natively on Chromium based browsers
categories: [Web]
#date: 2019-10-02
---

Browsers of the Chromium family(Google Chrome, new Microsoft Edge, Vivaldi, etc) are now capacable of routing every DNS request to a DNS-over-HTPPS service of your choice, no 3rd party extension required.

Just add the DoH address of the service of your choice in the \* below:

<p class="message">--enable-features="dns-over-https<DoHTrial" --force-fieldtrials="DoHTrial/Group1" --force-fieldtrial-params="DoHTrial.Group1:server/*/method/POST"</p>

Just keep in mind that you need to substitute each : with %3A and / with %2F.
I.e. using the Google's public DoH address: 

<p class="message">--enable-features="dns-over-https<DoHTrial" --force-fieldtrials="DoHTrial/Group1" --force-fieldtrial-params="DoHTrial.Group1:server/https%3A%2F%2Fdns.google%2Fdns-query/method/POST"</p>

or using Cloudflare's public DoH address:

<p class="message">--enable-features="dns-over-https<DoHTrial" --force-fieldtrials="DoHTrial/Group1" --force-fieldtrial-params="DoHTrial.Group1:server/https%3A%2F%2Fcloudflare-dns%2Ecom%2Fdns-query/method/POST"</p>

To finalize, just add those flags to the end of the target field in the browser's shortcut.
