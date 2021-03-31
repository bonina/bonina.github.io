---
layout: post
title: Unbound DNS resolver? Cutting the middle man!
categories: [Software]
#date: 2021-03-31
---

Why not cut the middle man and have your proper validating, recursive, caching DNS resolver? For that we will be considering Unbound from NLnet Labs. The following guide is for Debian based linux distros, but you can use the configuration file across kernels and other supported operating systems.
 
Open the terminal and call apt to install the unbound package:
 
sudo apt install unbound
 
Ignore any error message during install. There is no configuration file present, so unbound will not be able to start.
 
Lets create an example.conf file in the directory /etc/unbound/unbound.conf.d/. You can use nano or any other file editor utility to copy the content below:
 
<p class="message">server:
\# If no logfile is specified, syslog is used
\# logfile: "/var/log/unbound/unbound.log"
verbosity: 0

interface: 127.0.0.1
port: 5678
do-ip4: yes
do-udp: yes
do-tcp: yes

\# May be set to yes if you have IPv6 connectivity
do-ip6: no

\# You want to leave this to no unless you have *native* IPv6. With 6to4 and
\# Terredo tunnels your web browser should favor IPv4 for the same reasons
prefer-ip6: no

\# Use this only when you downloaded the list of primary root servers!
\# If you use the default dns-root-data package, unbound will find it automatically
#root-hints: "/var/lib/unbound/root.hints"

\# Trust glue only if it is within the server's authority
harden-glue: yes

\# Require DNSSEC data for trust-anchored zones, if such data is absent, the zone becomes BOGUS
harden-dnssec-stripped: yes

\# Harden against algorithm downgrade when multiple algorithms are advertised in the DS record.
harden-algo-downgrade: yes

\# Perform additional queries for infrastructure data to harden the referral path. Validates the replies if trust anchors are configured and the zones are                                                                                signed. This enforces DNSSEC validation on
\# nameserver NS sets and the nameserver addresses that are encountered on the referral path to the answer. Experimental option.
harden-referral-path: no

\# Add an unwanted reply threshold to clean the cache and avoid when possible a DNS Poisoning
unwanted-reply-threshold: 10000000

\# Refuse id.server and hostname.bind queries
hide-identity: yes

\# Refuse version.server and version.bind queries
hide-version: yes

\# Report this identity rather than the hostname of the server.
#identity: "DNS"

\# Deny ANY records
deny-any: yes

\# Do no insert authority/additional sections into response messages when those sections are not required. This reduces response size significantly, and ma                                                                               y avoid TCP fallback for some responses. This
\# may cause a slight speedup.
minimal-responses: yes

\# Don't use Capitalization randomization as it known to cause DNSSEC issues sometimes
use-caps-for-id: no

\# Reduce EDNS reassembly buffer size.
\# Suggested by the unbound man page to reduce fragmentation reassembly problems
edns-buffer-size: 1472

\# Perform prefetching of close to expired message cache entries
\# This only applies to domains that have been frequently queried
prefetch: yes

\# Fetch the DNSKEYs earlier in the validation process, when a DS record is encountered. This lowers the latency of requests at the expense of little more                                                                                CPU usage.
prefetch-key: yes

\# Cache TTL
cache-min-ttl: 600
cache-max-ttl: 21600

\# Cache size
msg-cache-size: 128m
rrset-cache-size: 256m

\# Faster UDP with multithreading (only on Linux).
so-reuseport: yes

\# Minimize
qname-minimisation: yes

\# One thread should be sufficient, can be increased on beefy machines. In reality for most users running on small networks or on a single machine, it should be unnecessary to seek performance enhancement by increasing num-threads above 1.
num-threads: 1

\# Ensure kernel buffer is large enough to not lose messages in traffic spikes
so-rcvbuf: 1m

\# Ensure privacy of local IP ranges
private-address: 192.168.0.0/16
private-address: 169.254.0.0/16
private-address: 172.16.0.0/12
private-address: 10.0.0.0/8
private-address: fd00::/8
private-address: fe80::/10</p>
 
The unbound resolver will be listening on localhost 127.0.0.1 port 5678. You can change it on the top of the configuration file.
 
Next step will be to pull the root.hints file from the domain authority for the first time. Execute these two commands:
 
<p class="message">curl -so /var/lib/unbound/root.hints https://www.internic.net/domain/named.root</p>
 
<p class="message">sudo service unbound restart</p>

The Ubnound resolver is now up and running.

To make sure the root.hints file is updated around every 6 months (infrequently updated, so that period is quite safe), we can create a cron job that will take care of that for us. First let's create a script with the instructions. Just paste the following content in a text editor, like nano, and give it the .sh extension:

<p class="message">#!/bin/bash

test $(date +%m) -eq 2 || test $(date +%m) -eq 7 || exit
curl -so /var/lib/unbound/root.hints https://www.internic.net/domain/named.root
service unbound restart</p>

You can place that file in your home folder, or other path of your choice.
Don’t forget to give permissions to execute:

<p class="message">sudo chmod a+x /home/user/example.sh</p>

Then, let's schedule a task using cron:

<p class="message">sudo crontab -e</p>
 
Add this line in the end of the prompt/file and save it:
 
<p class="message">0 4 1 * * sh /home/user/example.sh</p>
 
That will schedule the task of updating root.hints at 4 AM every 1st of February and July, and restart the unbound service.
 
Paired with pi-hole or AdGuardHome, it adds a dynamic layer between you and the resolver, filtering nefarious domains.
