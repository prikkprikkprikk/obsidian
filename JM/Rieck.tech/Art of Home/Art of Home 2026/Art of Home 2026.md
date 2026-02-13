---
Prosjektstatus: Research
Underprosjekter:
---
# Plan for AoH som Roots.io-prosjekt
## Roots.io-prosjekt
- [ ] Opprette Roots-prosjekt
- [ ] Opprette/erstatte git repo på Github


## Satispress


## Site-specific plugin
Lage composer.json-fil
Sette opp github som repo

## Backup
cron
… til Proton?




## Media-lagring
AWS S2?

## S3-Compatible Storage for Norwegian WooCommerce Site

## Context

- WooCommerce store on Servebolt hosting with thousands of products and multiple high-res images per product
- Storage is expensive on Servebolt (performance-optimized SSD/NVMe)
- Two goals: backups and offloading media files to reduce Servebolt storage costs

## Backups

- Servebolt includes free backups (every 4 hours, kept for 30 days, stored separately from Bolt storage) — sufficient for our needs
- No need for additional backup solution right now

## Media Offloading from WordPress

- Well-established pattern: plugin intercepts uploads, copies to S3 bucket, rewrites URLs, optionally deletes local copy
- **WP Offload Media** (Delicious Brains) is the go-to plugin — Pro version needed for bulk migrating existing media
- **Offload Media – Cloud Storage** (Acowebs) is an alternative with WooCommerce support and Cloudflare R2 compatibility
- Check with Servebolt support first — some managed hosts have restrictions on these plugins

## S3-Compatible Storage Providers (Shortlist)

### Top candidates

- **Hetzner Object Storage** (German) — Very cheap, good reputation, Helsinki data center for decent Nordic latency, widely documented by community
- **Exoscale** (Swiss/EFTA) — Strong data sovereignty, no hidden egress fees, European-focused

### Other Nordic/European options

- **Safespring** (Swedish) — Nordic data centers, built for GDPR compliance, popular with Nordic public sector
- **GleSYS** (Swedish) — €0.06/GiB/month, free transfers, simple pricing

### Ruled out / deprioritized

- **Cloudflare R2** — Great pricing (zero egress fees), but US company subject to CLOUD Act. Tension with GDPR.
- **Jottacloud** (Norwegian) — No S3-compatible API, not a drop-in replacement
- **MinIO** — Self-hosted option, only relevant if we run our own infrastructure

## Data Sovereignty Note

- US-based providers (Cloudflare, AWS, Backblaze) are subject to US CLOUD Act — can be compelled to hand over data even if stored in EU
- For a Norwegian store with customer/order data, EU/EFTA jurisdiction is preferable
- Hetzner (German/EU) and Exoscale (Swiss/EFTA) both avoid this issue

## Next Steps

- [ ] Contact Servebolt support about media offload plugin compatibility
- [ ] Look into Hetzner Object Storage pricing and setup with WP Offload Media
- [ ] Evaluate Exoscale as alternative (Swiss jurisdiction, Proton connection)