---
Date Created: 2025-01-02T10:19
Hovudoppgåve:
  - "[[CP-16179 SiteComponents webapp- Create oppslagstavle tile]]"
Innboks: false
Status: Ferdig
---
  

Lage egen javascript, eller tilpasse EntityCommentUtil?

  

Javascript-fil:

sitecomponents/assets/js/shared/lib/entitycomment.js

Linje 92–107:

```JavaScript
/**
 * Rewrites all by-line dates for posts published within the last 30 days to the
 * form "X days ago", "X minutes ago", etc.
 *
 * @returns {undefined}
 */
EntityCommentUtil.prototype.initializeDates = function() {

  var that = this;

  this.element.find('footer.entitycomment-byline time').each(function (i, timeElement) {

    that.initializeDateElement(timeElement);

  });
};
```