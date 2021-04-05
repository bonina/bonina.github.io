---
layout: post
title: Unbound DNS resolver? Cut out the middleman!
categories: [Software]
#date: 2021-03-31
---

Why be exposed to privacy risks by using public DNS servers when you can have your own proper validating, recursive, caching DNS resolver? In the following guide we will install and configure our own instance of a popular DNS resolver. We will use Unbound from NLnet Labs on a Debian based linux distro, but you can use this same configuration file across kernels and other supported operating systems.
 
To install, open the terminal and paste the following command:
 
<p class="message">sudo apt install unbound</p>
 
Some error messages may appear. Since there is no configuration file present, Unbound will not be able to start.
To create the Unbound configuration file create "example.conf" in the following directory:
 
<p class="message">/etc/unbound/unbound.conf.d/</p>
 
You can use nano or any other file editor utility to copy and save the content below:

<p class="message">server:<br>
verbosity: 0<br>
<br>
interface: 127.0.0.1<br>
port: 5678<br>
do-ip4: yes<br>
do-udp: yes<br>
do-tcp: yes<br>
<br>
do-ip6: no<br>
<br>
prefer-ip6: no<br>
<br>
root-hints: "/var/lib/unbound/root.hints"<br>
<br>
harden-glue: yes<br>
<br>
harden-dnssec-stripped: yes<br>
<br>
harden-algo-downgrade: yes<br>
<br>
harden-referral-path: no<br>
<br>
unwanted-reply-threshold: 10000000<br>
<br>
hide-identity: yes<br>
<br>
hide-version: yes<br>
<br>
identity: "DNS"<br>
<br>
deny-any: yes<br>
<br>
minimal-responses: yes<br>
<br>
use-caps-for-id: no<br>
<br>
edns-buffer-size: 1472<br>
<br>
prefetch: yes<br>
<br>
prefetch-key: yes<br>
<br>
cache-min-ttl: 600<br>
cache-max-ttl: 21600<br>
<br>
msg-cache-size: 128m<br>
rrset-cache-size: 256m<br>
<br>
so-reuseport: yes<br>
<br>
qname-minimisation: yes<br>
<br>
num-threads: 1<br>
<br>
so-rcvbuf: 1m<br>
<br>
private-address: 192.168.0.0/16<br>
private-address: 169.254.0.0/16<br>
private-address: 172.16.0.0/12<br>
private-address: 10.0.0.0/8<br>
private-address: fd00::/8<br>
private-address: fe80::/10</p>

Next step will be to pull the root.hints file from the domain authority for the first time. Execute these two separate commands:
 
<p class="message">curl -so /var/lib/unbound/root.hints https://www.internic.net/domain/named.root</p>
 
<p class="message">sudo service unbound restart</p>
 
The Unbound resolver is now up and running, and will now listen on localhost 127.0.0.1 port 5678. You can change to another IP/port combination in the configuration file.
 
To make sure that the root.hints file is kept updated (changes rarely and infrequently so around 6 months is quite safe), we can create a cron job that will take care of that for us. Let's use a separate script for customization sake. Paste the content below in a text editor, like nano, and give it the .sh extension:
 
<p class="message">#!/bin/bash<br>
<br>
test $(date +%m) -eq 2 || test $(date +%m) -eq 7 || exit<br>
curl -so /var/lib/unbound/root.hints https://www.internic.net/domain/named.root<br>
service unbound restart</p>
 
You can save that file to your home folder, or any other path of your choosing.
Don’t forget to give the .sh file permissions to execute:
 
<p class="message">sudo chmod a+x /home/user/example.sh</p>
 
Finally, let's schedule a task using cron:
 
<p class="message">sudo crontab -e</p>
 
Add this line in the end of the prompt/file and save it:
 
<p class="message">0 4 1 * * sh /home/user/example.sh</p>
 
These steps will schedule an update of your root.hints at 4 AM every 1st of February and July, and restart the Unbound service to apply the changes.
 
Optional step: Paired with pi-hole or AdGuardHome, you can add an extra layer between you and the resolver, filtering nefarious domains.
