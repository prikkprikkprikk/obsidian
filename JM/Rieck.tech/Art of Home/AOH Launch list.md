---
Hovedprosjekt:
  - "[[Art of Home]]"
Oppgavestatus: I arbeid
---

- [ ]  
- [ ] Install Uncode
- [ ] Copy/paste theme settings




## wp db export excluding WooCommerce
```bash
wp db export --exclude_tables=$(wp db tables --all-tables-with-prefix --format=csv | tr ',' '\n' | grep -E '(wc_orders|wc_order_addresses|wc_order_operational_data|wc_orders_meta|woocommerce_order_items|woocommerce_order_itemmeta|woocommerce_sessions|woocommerce_payment_tokens|woocommerce_payment_tokenmeta|wc_customer_lookup|wc_download_log|users|usermeta)$' | tr '\n' ',' | sed 's/,$//')
```
