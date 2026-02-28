#After search in shodan I fond some information:
# Shodan Reconnaissance Report: holbertonschool.com

## 1. Overview

This report presents the findings of a passive reconnaissance assessment conducted on the `holbertonschool.com` domain using **Shodan**, the search engine for Internet-connected devices. The goal is to identify IP ranges, open ports, services, and technologies associated with the domain and its subdomains.

---

## 2. IP Ranges

The `holbertonschool.com` domain resolves to multiple IP addresses hosted on **Amazon Web Services (AWS)**, specifically within the `eu-west-3` (Paris, France) region.

| IP Address       | Hostname                                          | Hosting Provider              | Region               |
|------------------|---------------------------------------------------|-------------------------------|-----------------------|
| 35.180.27.154    | ec2-35-180-27-154.eu-west-3.compute.amazonaws.com | Amazon Data Services France   | eu-west-3 (Paris)    |
| 52.47.143.83     | ec2-52-47-143-83.eu-west-3.compute.amazonaws.com  | Amazon Data Services France   | eu-west-3 (Paris)    |

### Shodan Scan Summary

| Metric         | Value |
|----------------|-------|
| Total Results  | 4     |
| Top Ports      | 80 (2 results), 443 (2 results) |

---

## 3. Open Ports and Services

| IP Address       | Port | Service | Server              | Tags               |
|------------------|------|---------|---------------------|---------------------|
| 35.180.27.154    | 80   | HTTP    | nginx/1.18.0 (Ubuntu) | cloud, eol-product |
| 35.180.27.154    | 443  | HTTPS   | nginx/1.18.0 (Ubuntu) | cloud, eol-product |
| 52.47.143.83     | 80   | HTTP    | nginx/1.21.6        | cloud, eol-product |
| 52.47.143.83     | 443  | HTTPS   | nginx               | cloud              |

### HTTP Response Analysis

All HTTP requests on port 80 return **301 Moved Permanently**, redirecting to HTTPS:

- `35.180.27.154:80` → Redirects to `http://holbertonschool.com`
- `52.47.143.83:80` → Redirects to `https://yriry2.holbertonschool.com/`

---

## 4. Subdomains Discovered

| Subdomain                        | IP Address     | Description                      |
|----------------------------------|----------------|----------------------------------|
| holbertonschool.com              | 35.180.27.154  | Main website                     |
| yriry2.holbertonschool.com       | 52.47.143.83   | Holberton School Level2 Forum    |

---

## 5. Technologies and Frameworks

### 5.1 Web Server

| Technology                   | Version          | Details                     |
|------------------------------|------------------|-----------------------------|
| Nginx                        | 1.18.0 (Ubuntu)  | On 35.180.27.154            |
| Nginx                        | 1.21.6           | On 52.47.143.83             |

### 5.2 SSL/TLS Certificate (yriry2.holbertonschool.com)

| Field                | Value                          |
|----------------------|--------------------------------|
| Issuer Organization  | Let's Encrypt                  |
| Issuer Common Name   | E7                             |
| Common Name          | yriry2.holbertonschool.com     |
| SSL Versions         | TLSv1.2, TLSv1.3              |

### 5.3 Security Headers (yriry2.holbertonschool.com)

| Header                       | Value            |
|------------------------------|------------------|
| X-Frame-Options              | SAMEORIGIN       |
| X-XSS-Protection             | 0                |
| X-Content-Type-Options       | nosniff          |
| X-Download-Options           | noopen           |

### 5.4 Infrastructure

| Technology                   | Category              |
|------------------------------|-----------------------|
| Amazon Web Services (AWS)    | Cloud Hosting         |
| Nginx                        | Web Server / Reverse Proxy |
| Let's Encrypt                | SSL Certificate Authority |
| Ubuntu                       | Operating System      |

### 5.5 Shodan Tags

| Tag            | Description                                      |
|----------------|--------------------------------------------------|
| cloud          | Service is hosted in the cloud                   |
| eol-product    | End-of-life product detected (outdated software) |

---

## 6. Key Findings

1. **Only 2 unique IPs** were discovered, both hosted on AWS in Paris, France (eu-west-3).
2. **Ports 80 and 443** are the only open ports — good port management practice.
3. **Port 80 redirects to HTTPS** (301) — proper security configuration.
4. **Nginx versions vary** — 1.18.0 and 1.21.6 detected across different servers.
5. **eol-product tag** — Shodan flagged end-of-life software, suggesting outdated Nginx versions.
6. **Let's Encrypt** is used for SSL certificates with TLSv1.2 and TLSv1.3 support.
7. **yriry2.holbertonschool.com** hosts the "Holberton School Level2 Forum".

---

## 7. Recommendations

- **Update Nginx** — Both versions (1.18.0 and 1.21.6) are flagged as eol-product. Upgrade to the latest stable version.
- **Enable X-XSS-Protection** — Currently set to `0` on yriry2 subdomain; consider enabling it.
- **Monitor subdomains** — Ensure all subdomains enforce HTTPS and have valid SSL certificates.
- **Regular Shodan monitoring** — Periodically scan for newly exposed services or ports.

---

## 8. Tools Used

- **Shodan** (shodan.io) — `hostname:holbertonschool.com`
- **Shodan CLI** — `shodan domain holbertonschool.com`
- **InternetDB API** — `curl https://internetdb.shodan.io/<IP>`

---

*Report generated as part of passive reconnaissance exercise for educational purposes.*
*Holberton School — Cyber Security Program*
