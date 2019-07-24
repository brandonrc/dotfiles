#!/bin/sh

# This works for the containers stuff... internet still flowing... need to stop that

iptables -A INPUT -i br+ -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i br+ -p tcp --dport 6901 -j ACCEPT
iptables -A INPUT -i br+ -p udp --dport 6901 -j ACCEPT
iptables -A INPUT -i br+ -j DROP
iptables -A OUTPUT -o br+ -m state --state ESTABLISHED,RELATED -j ACCEPT
# iptables -A OUTPUT -o br+ -p tcp --sport 6901 -j ACCEPT
# iptables -A OUTPUT -o br+ -p udp --sport 6901 -j ACCEPT
iptables -A OUTPUT -o br+ -j DROP
iptables -A FORWARD -i br+ -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -I FORWARD -i br+ -j DROP
iptables -I FORWARD -i br+ -p tcp --dport 6901 -j ACCEPT
iptables -I FORWARD -i br+ -p udp --dport 6901 -j ACCEPT

iptables -A OUTPUT -o veth+ -m state --state ESTABLISHED,RELATED -j ACCEPT
# iptables -A OUTPUT -o veth+ -p tcp --sport 6901 -j ACCEPT
# iptables -A OUTPUT -o veth+ -p udp --sport 6901 -j ACCEPT
iptables -I OUTPUT -o veth+ -j DROP

iptables -A OUTPUT -o docker+ -m state --state ESTABLISHED,RELATED -j ACCEPT
# iptables -A OUTPUT -o docker+ -p tcp --sport 6901 -j ACCEPT
# iptables -A OUTPUT -o docker+ -p udp --sport 6901 -j ACCEPT
iptables -I OUTPUT -o docker+ -j DROP

iptables -I OUTPUT -o br+ -j DROP
# iptables -I INPUT -i br+ -j DROP
# iptables -I INPUT -i br+ -p tcp --dport 6901 -j ACCEPT
# iptables -I OUTPUT -o br+ -p tcp --sport 6901 -j ACCEPT
# iptables -I INPUT -i br+ -p tcp --dport 5901 -j ACCEPT
# iptables -I OUTPUT -o br+ -p tcp --sport 5901 -j ACCEPT
# iptables -I INPUT -i br+ -p tcp --dport 6001 -j ACCEPT
# iptables -I OUTPUT -o br+ -p tcp --sport 6001 -j ACCEPT




