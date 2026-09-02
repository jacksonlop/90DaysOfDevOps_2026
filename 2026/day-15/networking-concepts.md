# Day 15 – Networking Concepts: DNS, IP, Subnets & Ports

## 🎯 Objective

Today, I learned the basic networking concepts used to connect systems and services. I focused on how DNS resolves domain names, how IP addresses identify devices, how CIDR and subnets organize networks, and how ports direct traffic to specific services.

# Task 1: DNS – How Names Become IPs

## 1. What happens when you type `google.com` in a browser?

When I type `google.com`, my system needs to find the IP address connected to that domain name. DNS looks up the domain and returns an IP address. My browser then uses that IP address to connect to Google's server and load the website.

## 2. DNS Record Types

- `A` → Maps a domain name to an IPv4 address.
- `AAAA` → Maps a domain name to an IPv6 address.
- `CNAME` → Creates an alias that points one domain name to another domain name.
- `MX` → Specifies the mail server used to receive emails for a domain.
- `NS` → Specifies the authoritative name servers for a domain.

## 3. Checking DNS Records

I used the following command:

\`\`\`bash
dig google.com
\`\`\`

The `dig` command is used to query DNS and get information about a domain.

From the output:

- A Record → `YOUR-A-RECORD`
- TTL → `YOUR-TTL`

### DNS Commands Used

**dig** – queries DNS servers and returns detailed record information
\`\`\`bash
dig google.com MX
\`\`\`

**nslookup** – simpler tool to look up a specific DNS record type
\`\`\`bash
nslookup -type=MX google.com
\`\`\`

