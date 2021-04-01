---
layout: post
title: Unbound DNS resolver? Cut out the middleman!
categories: [Software]
#date: 2021-03-31
---

Why be exposed to privacy risks by using public DNS servers when you can have your own proper validating, recursive, caching DNS resolver? In the following guide we will install and configure our own instance of a popular DNS resolver. We will use Unbound from NLnet Labs on a Debian based linux distro, but you can use the configuration file across kernels and other supported operating systems.
 
To install, open the terminal and paste the following commmand:
 
<p class="message">sudo apt install unbound</p>
 
Some error messages may appear. Since there is no configuration file present, unbound will not be able to start.
To create an unbound configuration file create "nameofyourchoosing.conf" in the following directory:

<p class="message">/etc/unbound/unbound.conf.d/</p>

You can use nano or any other file editor utility to copy the content below:
 
<p class="message">server:<br>
# If no logfile is specified, syslog is used<br>
# logfile: "/var/log/unbound/unbound.log"<br>
verbosity: 0<br>
<br>
interface: 127.0.0.1<br>
port: 5678<br>
do-ip4: yes<br>
do-udp: yes<br>
do-tcp: yes<br>
<br>
# May be set to yes if you have IPv6 connectivity<br>
do-ip6: no<br>
<br>
# You want to leave this to no unless you have *native* IPv6. With 6to4 and<br>
# Terredo tunnels your web browser should favor IPv4 for the same reasons<br>
prefer-ip6: no<br>
<br>
# Use this only when you downloaded the list of primary root servers!<br>
# If you use the default dns-root-data package, unbound will find it automatically<br>
root-hints: "/var/lib/unbound/root.hints"<br>
<br>
# Trust glue only if it is within the server's authority<br>
harden-glue: yes<br>
<br>
# Require DNSSEC data for trust-anchored zones, if such data is absent, the zone becomes BOGUS<br>
harden-dnssec-stripped: yes<br>
<br>
# Harden against algorithm downgrade when multiple algorithms are advertised in the DS record.<br>
harden-algo-downgrade: yes<br>
<br>
# Perform additional queries for infrastructure data to harden the referral path. Validates the replies if trust anchors are configured and the zones are signed. This enforces DNSSEC validation on nameserver NS sets and the nameserver addresses that are encountered on the referral path to the answer. Experimental option.<br>
harden-referral-path: no<br>
<br>
# Add an unwanted reply threshold to clean the cache and avoid when possible a DNS Poisoning<br>
unwanted-reply-threshold: 10000000<br>
<br>
# Refuse id.server and hostname.bind queries<br>
hide-identity: yes<br>
<br>
# Refuse version.server and version.bind queries<br>
hide-version: yes<br>
<br>
# Report this identity rather than the hostname of the server.<br>
identity: "DNS"<br>
<br>
# Deny ANY records<br>
deny-any: yes<br>
<br>
# Do no insert authority/additional sections into response messages when those sections are not required. This reduces response size significantly, and may avoid TCP fallback for some responses. This may cause a slight speedup.<br>
minimal-responses: yes<br>
<br>
# Don't use Capitalization randomization as it known to cause DNSSEC issues sometimes<br>
use-caps-for-id: no<br>
<br>
# Reduce EDNS reassembly buffer size.<br>
# Suggested by the unbound man page to reduce fragmentation reassembly problems<br>
edns-buffer-size: 1472<br>
<br>
# Perform prefetching of close to expired message cache entries<br>
# This only applies to domains that have been frequently queried<br>
prefetch: yes<br>
<br>
# Fetch the DNSKEYs earlier in the validation process, when a DS record is encountered. This lowers the latency of requests at the expense of little more CPU usage.<br>
prefetch-key: yes<br>
<br>
# Cache TTL<br>
cache-min-ttl: 600<br>
cache-max-ttl: 21600<br>
<br>
# Cache size<br>
msg-cache-size: 128m<br>
rrset-cache-size: 256m<br>
<br>
# Faster UDP with multithreading (only on Linux).<br>
so-reuseport: yes<br>
<br>
# Minimize<br>
qname-minimisation: yes<br>
<br>
# One thread should be sufficient, can be increased on beefy machines. In reality for most users running on small networks or on a single machine, it should be unnecessary to seek performance enhancement by increasing num-threads above 1.<br>
num-threads: 1<br>
<br>
# Ensure kernel buffer is large enough to not lose messages in traffic spikes<br>
so-rcvbuf: 1m<br>
<br>
# Ensure privacy of local IP ranges<br>
private-address: 192.168.0.0/16<br>
private-address: 169.254.0.0/16<br>
private-address: 172.16.0.0/12<br>
private-address: 10.0.0.0/8<br>
private-address: fd00::/8<br>
private-address: fe80::/10</p>
 
Save it.
Next step will be to pull the root.hints file from the domain authority for the first time. Execute these two commands:

<p class="message">curl -so /var/lib/unbound/root.hints https://www.internic.net/domain/named.root</p>

<p class="message">sudo service unbound restart</p>

The unbound resolver is now up and running, and will now be able to listen on localhost 127.0.0.1 port 5678. You can change to other IP/port combination in the configuration file.

To make sure that the root.hints file is kept updated (changes rarely and infrequently so around 6 months is quite safe), we can create a cron job that will take care of that for us. Let's create a script with that automatizes that process. Just paste the content below in a text editor, like nano, and give it the .sh extension:

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
 
These steps will schedule the update of your root.hints at 4 AM every 1st of February and July, and restart the unbound service to apply the changes.

Optional step: Paired with pi-hole or AdGuardHome, you can add an extra layer between you and the resolver, filtering nefarious domains.
