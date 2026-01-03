---
Hovedprosjekt:
  - "[[Art of Home]]"
Oppgavestatus: I arbeid
---


- [x] Put prod in maintenance mode
- [x] Make a fresh copy of prod to staging.
- [x] Make a local backup of prod+db.
- [ ] Implement our changes from local manually (doesn't take much time) on staging, confirm that everything works.
	- [x] Install Uncode
	- [ ] Copy/paste theme settings
	- [ ] Menus
- [ ] Make a db export of staging.
- [ ] rsync staging to prod
- [ ] Import staging db to prod, confirm that everything is OK.
- [ ] If anything looks off with product filtering or search, regenerate the lookup tables from WooCommerce → Status → Tools.
- [ ] Take prod out of maintenance mode.

## wp db export excluding WooCommerce
```bash
wp db export staging_export.sql --exclude_tables=wp_users,wp_usermeta,wp_comments,wp_commentmeta,wp_wc_orders,wp_wc_orders_meta,wp_wc_order_addresses,wp_wc_order_operational_data,wp_wc_order_coupon_lookup,wp_wc_order_product_lookup,wp_wc_order_stats,wp_wc_order_tax_lookup,wp_wc_customer_lookup,wp_wc_download_log,wp_woocommerce_order_items,wp_woocommerce_order_itemmeta,wp_woocommerce_sessions,wp_woocommerce_payment_tokens,wp_woocommerce_payment_tokenmeta,wp_woocommerce_downloadable_product_permissions,wp_wc_reserved_stock,wp_payex_transactions
```



## Kode for endring av kjøp-knappen (Daniel) 🙄
```php
/**
 * Tvinger "Select options" og "Add to cart" til å bli "KJØP"
 * ved å bruke det generelle gettext-filteret med høy prioritet.
 */
add_filter( 'gettext', 'custom_force_all_buttons_to_kjoep_gettext', 999, 3 );
function custom_force_all_buttons_to_kjoep_gettext( $translated_text, $text, $domain ) {

    // Liste over nøyaktige tekster vi vil endre til "KJØP"
    $strings_to_change_to_kjoep = array(
        'Select options',    // Den du ser for Ariana, Tweed
        'Add to cart',       // Standard for simple produkter
        'Read more',         // Kan forekomme for utsolgte eller eksterne produkter
        // Legg til andre nøyaktige engelske tekster her hvis du finner dem
    );

    // Sjekker om den originale teksten er i listen over tekster som skal endres
    if ( in_array( $text, $strings_to_change_to_kjoep, true ) ) {
        // Returnerer den nye teksten "KJØP"
        $translated_text = 'Kjøp';
    }

    return $translated_text;
}
```


