---
layout: post
title: Setup Unbound - a validating, recursive, caching DNS resolver
categories: [Software]
#date: 2021-04-31
---

In the following guide we will install and configure our own instance of a validating, recursive, caching DNS resolver. We will opt for Unbound from NLnet Labs on a Debian based linux distro, but this same configuration can be used across kernels and other supported operating systems.
 
To proceed, open a terminal window and paste the following command:
 
<p class="message">sudo apt install unbound</p>
 
During the installation process some error messages may appear. This is normal since there is no configuration file present in the system and thus Unbound will not be able to start.
To proceed in generating the Unbound configuration file, create "example.conf" in the following directory:
 
<p class="message">/etc/unbound/unbound.conf.d/</p>
 
You can use <i>nano</i> or any other file editor to copy and save the content below:

<p class="message">server:<br>
<br>
verbosity: 0<br>
<br>
interface: 127.0.0.1<br>
port: 5678<br>
do-ip4: yes<br>
do-udp: yes<br>
do-tcp: yes<br>
do-ip6: no<br>
prefer-ip6: no<br>
<br>
root-hints: "/var/lib/unbound/root.hints"<br>
<br>
harden-glue: yes<br>
harden-large-queries: yes<br>
harden-dnssec-stripped: yes<br>
harden-algo-downgrade: yes<br>
harden-referral-path: no<br>
harden-short-bufsize: yes<br>
<br>
rrset-roundrobin: yes<br>
unwanted-reply-threshold: 10000000<br>
<br>
hide-identity: yes<br>
hide-version: yes<br>
identity: "Server"<br>
<br>
deny-any: yes<br>
do-daemonize: no<br>
minimal-responses: yes<br>
use-caps-for-id: no<br>
<br>
prefetch: yes<br>
prefetch-key: yes<br>
cache-min-ttl: 300<br>
cache-max-ttl: 28800<br>
serve-expired: no<br>
msg-cache-size: 50m<br>
rrset-cache-size: 100m<br>
edns-buffer-size: 1472<br>
so-rcvbuf: 4m<br>
so-sndbuf: 4m<br>
neg-cache-size: 4m<br>
<br>
so-reuseport: yes<br>
qname-minimisation: yes<br>
val-clean-additional: yes<br>
<br>
num-threads: 1<br>
msg-cache-slabs: 1<br>
rrset-cache-slabs: 1<br>
infra-cache-slabs: 1<br>
key-cache-slabs: 1<br>
<br>
log-queries: no<br>
log-replies: no<br>
log-servfail: no<br>
log-local-actions: no<br>
logfile: /dev/null<br>
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
 
To make sure your device(s) is(are) using your Unbound instance, make the TXT record query below.

On Unix:
<p class="message">dig +short TXT whoami.ipv4.akahelp.net</p>

On Windows:
<p class="message">nslookup -type=TXT whoami.ipv4.akahelp.net</p>

In the non-authoritative answer, the "ns" record is the unicast IP address of the requesting recursive resolver. You should get your IP if the Unbound instance is local, or your VPS IP if in the cloud. If not, your device is not using your Unbound resolver but some other DNS provider. Check your network/device for DNS leaks.
