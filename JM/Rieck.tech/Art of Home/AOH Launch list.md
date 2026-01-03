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
wp db export staging_export.sql --exclude_tables=wp_users,wp_usermeta,wp_comments,wp_commentmeta,wp_wc_orders,wp_wc_orders_meta,wp_wc_order_addresses,wp_wc_order_operational_data,wp_wc_order_coupon_lookup,wp_wc_order_product_lookup,wp_wc_order_stats,wp_wc_order_tax_lookup,wp_wc_customer_lookup,wp_wc_download_log,wp_woocommerce_order_items,wp_woocommerce_order_itemmeta,wp_woocommerce_sessions,wp_woocommerce_payment_tokens,wp_woocommerce_payment_tokenmeta,wp_woocommerce_downloadable_product_permissions,wp_wc_reserved_stock,wp_payex_transactions
```



## Testing av eksport/import
#### Status staging før import
**Siste produkt:** 
William Morris At Home, Willow Bough, tapet med bladmønster I salviegrønn	124248	Publisert 02.01.26, kl. 19:46