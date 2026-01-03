---
Hovedprosjekt:
  - "[[Art of Home]]"
Oppgavestatus: I arbeid
---


- [ ] Test exporting our local dev/test copy, which is several months old, with excluded WooCommerce tables to staging. (Staging has no important work to keep at this stage.)
- [ ] Verify that this works.
- [ ] Make a fresh copy of prod to staging.
- [ ] Implement our changes from local manually (doesn't take much time) on staging, confirm that everything works.
	- [ ] Install Uncode
	- [ ] Copy/paste theme settings
	- [ ] Menus
- [ ] Put prod and staging in maintenance mode (so the export from staging is in maintenance mode when importing to prod).
- [ ] Make db backup of prod.
- [ ] Make an export of staging, excluding the appropriate tables.
- [ ] Import to prod, confirm that everything is OK.
- [ ] If anything looks off with product filtering or search, regenerate the lookup tables from WooCommerce → Status → Tools.
- [ ] Take prod out of maintenance mode.

## wp db export excluding WooCommerce
```bash
wp db export --exclude_tables=$(wp db tables --all-tables-with-prefix --format=csv | tr ',' '\n' | grep -E '(wc_orders|wc_order_addresses|wc_order_operational_data|wc_orders_meta|woocommerce_order_items|woocommerce_order_itemmeta|woocommerce_sessions|woocommerce_payment_tokens|woocommerce_payment_tokenmeta|wc_customer_lookup|wc_download_log|users|usermeta)$' | tr '\n' ',' | sed 's/,$//')
```
