#!/bin/sh

# This works for the containers stuff... internet still flowing... need to stop that

iptables -D INPUT -i br+ -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -D INPUT -i br+ -p tcp --dport 6901 -j ACCEPT
iptables -D INPUT -i br+ -p udp --dport 6901 -j ACCEPT
iptables -D INPUT -i br+ -j DROP
iptables -D OUTPUT -o br+ -m state --state ESTABLISHED,RELATED -j ACCEPT
# iptables -D OUTPUT -o br+ -p tcp --sport 6901 -j ACCEPT
# iptables -D OUTPUT -o br+ -p udp --sport 6901 -j ACCEPT
iptables -D OUTPUT -o br+ -j DROP
iptables -D FORWARD -i br+ -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -D FORWARD -i br+ -j DROP
iptables -D FORWARD -i br+ -p tcp --dport 6901 -j ACCEPT
iptables -D FORWARD -i br+ -p udp --dport 6901 -j ACCEPT

iptables -D OUTPUT -o veth+ -m state --state ESTABLISHED,RELATED -j ACCEPT
# iptables -D OUTPUT -o veth+ -p tcp --sport 6901 -j ACCEPT
# iptables -D OUTPUT -o veth+ -p udp --sport 6901 -j ACCEPT
iptables -D OUTPUT -o veth+ -j DROP

iptables -D OUTPUT -o docker+ -m state --state ESTABLISHED,RELATED -j ACCEPT
# iptables -D OUTPUT -o docker+ -p tcp --sport 6901 -j ACCEPT
# iptables -D OUTPUT -o docker+ -p udp --sport 6901 -j ACCEPT
iptables -D OUTPUT -o docker+ -j DROP

iptables -D OUTPUT -o br+ -j DROP
# iptables -D INPUT -i br+ -j DROP
# iptables -D INPUT -i br+ -p tcp --dport 6901 -j ACCEPT
# iptables -D OUTPUT -o br+ -p tcp --sport 6901 -j ACCEPT
# iptables -D INPUT -i br+ -p tcp --dport 5901 -j ACCEPT
# iptables -D OUTPUT -o br+ -p tcp --sport 5901 -j ACCEPT
# iptables -D INPUT -i br+ -p tcp --dport 6001 -j ACCEPT
# iptables -D OUTPUT -o br+ -p tcp --sport 6001 -j ACCEPT




