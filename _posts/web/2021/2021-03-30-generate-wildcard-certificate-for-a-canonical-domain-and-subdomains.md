---
layout: post
title: How to generate a wildcard certificate for a canonical domain and subdomains using Let’s Encrypt/Certbot
categories: [Web]
#date: 2021-03-30
---

Canonical domain certificates along with CNAME flattening are a great way to enable the possibility of removing the www. of your website address. You may also need to expand the certificate to subdomains, for example to include subsections in your website structure. To issue a wildcard certificate that also includes the canonical form, you need to specify those in separate arguments in the certbot command. The following commands are for Debian based linux distros (like Ubuntu).
 
To install certbot, if you don't have it already:
 
<p class="message">sudo apt-get install certbot</p>
 
Let’s issue the certificates, just change the example.domain to yours: 
 
<p class="message">sudo certbot certonly --manual --preferred-challenges=dns -d example.domain -d .*example.domain</p>

Follow the instructions on-screen and be sure that you add the \_acme-challenge.example.domain as a TXT record in your domain’s DNS. Wait a bit before hitting enter to allow your DNS to propagate. If you are too quick, it may fail the challenge. Just repeat the process, a new challenge will be issued.
 
The chain and key will be located in the paths below:
 
<p class="message">/etc/letsencrypt/live/example.domain/fullchain.pem<br>
/etc/letsencrypt/live/example.domain/privkey.pem</p>
