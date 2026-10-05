# 🛡️ Security Payloads Collection

![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)
[![Last Updated](https://img.shields.io/badge/last%20updated-2026-10-05-blue.svg)](https://github.com/DHO212/security-payloads)
[![Last Updated](https://img.shields.io/badge/last%20updated-2026-09-28-blue.svg)](https://github.com/DHO212/security-payloads)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)
![Payloads](https://img.shields.io/badge/Payloads-500+-red.svg)
![Categories](https://img.shields.io/badge/Categories-13-orange.svg)
![Maintenance](https://img.shields.io/badge/Maintained-yes-green.svg)

> Comprehensive security payloads, cheatsheets, and reference materials for authorized security testing, bug bounty programs, and penetration testing engagements.

## ⚠️ Disclaimer

This repository is provided **for authorized security testing and educational purposes only**. Always obtain proper authorization before testing. Unauthorized access to computer systems is illegal.

## 📋 Table of Contents

| # | Category | File | Description |
|---|----------|------|-------------|
| 1 | 🔍 XSS | [`xss-payloads.txt`](xss-payloads.txt) | 50+ Reflected, Stored, DOM-based, and Polyglot XSS payloads |
| 2 | 🗄️ SQLi | [`sqli-payloads.txt`](sqli-payloads.txt) | SQL Injection for MySQL, PostgreSQL, MSSQL, Oracle, SQLite |
| 3 | 📂 LFI | [`lfi-payloads.txt`](lfi-payloads.txt) | Local File Inclusion with bypass techniques |
| 4 | ☁️ SSRF | [`ssrf-payloads.txt`](ssrf-payloads.txt) | Cloud metadata, internal services, protocol smuggling |
| 5 | 💻 Command Injection | [`command-injection.txt`](command-injection.txt) | OS command injection payloads |
| 6 | 📦 XXE | [`xxe-payloads.txt`](xxe-payloads.txt) | XML External Entity injection payloads |
| 7 | 🧬 SSTI | [`ssti-payloads.txt`](ssti-payloads.txt) | Server-Side Template Injection (Jinja2, Twig, Freemarker, Velocity) |
| 8 | 🍃 NoSQL | [`nosql-payloads.txt`](nosql-payloads.txt) | NoSQL injection with MongoDB operators |
| 9 | 🔗 CSRF | [`csrf-poc.html`](csrf-poc.html) | CSRF Proof-of-Concept template |
| 10 | 🐚 Reverse Shells | [`reverse-shells.sh`](reverse-shells.sh) | Reverse shell one-liners (bash, python, php, perl, ruby, netcat, socat) |
| 11 | 🐧 Linux Privesc | [`linux-privilege-escalation.md`](linux-privilege-escalation.md) | GTFOBins quick reference |
| 12 | 🪟 Windows Privesc | [`windows-privilege-escalation.md`](windows-privilege-escalation.md) | Windows privilege escalation techniques |
| 13 | 🔧 Burp Extensions | [`burp-suite-extensions.md`](burp-suite-extensions.md) | Recommended Burp Suite extensions |

## 🎯 Usage Categories

### Bug Bounty Hunting
- `xss-payloads.txt` — Trigger stored/reflected XSS
- `ssrf-payloads.txt` — Pivot into internal networks
- `lfi-payloads.txt` — Read sensitive files
- `nosql-payloads.txt` — Bypass authentication

### Penetration Testing
- `sqli-payloads.txt` — Extract database contents
- `command-injection.txt` — Achieve RCE
- `ssti-payloads.txt` — Server-side code execution
- `reverse-shells.sh` — Establish persistence

### Red Team Operations
- `xxe-payloads.txt` — Exfiltrate data via XML
- `csrf-poc.html` — Demonstrate cross-site attacks
- `linux-privilege-escalation.md` — Post-exploitation privilege escalation
- `windows-privilege-escalation.md` — Windows post-exploitation

## 🔗 Quick Filter

```bash
# Search payloads by keyword
grep -i "reflected" xss-payloads.txt

# Count payloads per file
wc -l *.txt

# Search all files for a specific technique
grep -rl "cloud" *.txt *.md
```

## 📚 References

- [OWASP Testing Guide](https://owasp.org/www-project-web-security-testing-guide/)
- [PayloadsAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings)
- [HackTricks](https://book.hacktricks.xyz/)
- [GTFOBins](https://gtfobins.github.io/)
- [OWASP Cheat Sheet Series](https://cheatsheetseries.owasp.org/)

## 🤝 Contributing

Contributions welcome. Open a PR with new payloads, corrections, or categorized additions. Keep payloads organized by category with clear comments.

## 📄 License

MIT License — see [LICENSE](LICENSE) for details.

---
*For authorized security testing only.*

---


---

<!-- WEEKLY_STATS_START -->
## 📊 Weekly Stats

| Metric | Value |
|--------|-------|
| Total Payloads | **1238** |
| Last Updated | **2026-10-05** |
| Maintained By | [GitHub Actions](https://github.com/DHO212/security-payloads/actions) |
<!-- WEEKLY_STATS_END -->
