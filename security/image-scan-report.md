# Image Scan Report
# 🛡️ Image Scan Report

## 🔍 Summary

- **Image Scanned:** `your-dockerhub-username/my-app:latest`
- **Scan Tool:** Trivy
- **Date:** July 22, 2025

---

## 🚨 Detected Vulnerabilities

| Severity | Count |
|----------|-------|
| CRITICAL | 2     |
| HIGH     | 4     |
| MEDIUM   | 10    |
| LOW      | 15    |

---

## 📋 Sample Critical Vulnerabilities

1. **CVE-2023-27561** – Buffer overflow in `libxyz.so`
2. **CVE-2024-12012** – Privilege escalation vulnerability in Alpine base image

---

## ✅ Recommendations

- Use a minimal base image (e.g., `distroless`, `alpine`)
- Rebuild image with patched dependencies
- Integrate scanning in CI pipeline
- Use signed images (e.g., Cosign + Sigstore)

---

## 📎 Tools for Continuous Scanning

- [Trivy](https://github.com/aquasecurity/trivy)
- [Anchore Grype](https://github.com/anchore/grype)
- [Docker Scout](https://docs.docker.com/scout/)
