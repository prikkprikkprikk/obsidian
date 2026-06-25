For å få språkstrenger inn i Javascript, brukes setWord().

Men denne må kjøres etter at cplib har lastet, og det gjør man med `ctRunWhenCplibLoaded`:

```HTML
<script nonce="{{ corepublish.systemConfig.ContentSecurityNonce }}">
    ctRunWhenCplibLoaded(() => {
        setWord('noticeboard.delete_notice_confirm', '{{ getWord('noticeboard.delete_notice_confirm') }}');
        setWord('noticeboard.delete_comment_confirm', '{{ getWord('noticeboard.delete_comment_confirm') }}');
    });
</script>
```