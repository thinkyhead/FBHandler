__FBHandler__ is a Mac OS X protocol handler for Facebook links.

What are Facebook links?
------------------------

If you've imported your Facebook contacts into the Mac OS X Address Book application you may have noticed that these contacts sometimes have a special "Homepage" address that looks something like this:

> [fb://profile/1026195398](fb://profile/1026195398 "A Facebook link")

These links seem like they should take you to a Facebook profile, but when you click on them nothing happens. The problem is that Mac OS X doesn't know how to handle FB:// links so it ignores them.

FBHandler is a tiny application that makes these Facebook profile links clickable. and includes support for these other potential Facebook links:

> fb://wall/...
> fb://photos/...
> fb://friends/...
> fb://notes/...

Notes
-----

Interesting technologies used in this application include:

* NSStatusItem for a simplified menubar-based interface
* NSScriptCommand subclassing to process a clicked URL
* NSUserDefaults to save and restore launch behavior
 