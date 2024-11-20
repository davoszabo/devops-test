#!/bin/bash

# Flush existing iptables rules for the VM (not Docker-related)
iptables -F INPUT
iptables -F FORWARD
iptables -F OUTPUT

# Set default policies
iptables -P INPUT DROP
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

# Allow loopback traffic
iptables -A INPUT -i lo -j ACCEPT

# Allow established and related connections
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Allow traffic on port 23 (modified SSH)
iptables -A INPUT -p tcp --dport 23 -j ACCEPT

# Allow traffic on port 80 (HTTP)
iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# Allow traffic on port 443 (HTTPS)
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Allow traffic on port 8080 (Jenkins)
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT

# Allow traffic on port 81 (Docker registry UI)
iptables -A INPUT -p tcp --dport 81 -j ACCEPT

# Drop all other traffic explicitly
iptables -A INPUT -j DROP

# Save the rules to ensure persistence
iptables-save > /etc/iptables/rules.v4

