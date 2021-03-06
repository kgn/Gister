__Gister__ is a Cocoa app for viewing gists. It is still in it's infancy and cannot yet edit gists. But it does allow you to save gists and copy then to the clipboard! so that's something :)

![Icon 100](https://github.com/kgn/Gister/raw/master/ScreenShots/Main.png)

Current Features
--------
* Automatic git username detection.
* Preference to change the username.
* Browse all your gists, or switch the user to view someone else.
* Save a gist.
* Copy a gist.
* Open gist on github in web browser.
* Refresh.

Current Limitations
--------
* Only the first file in a gist is displayed.
* Gists cannot be updated from __Gister__.
* Gists cannot be deleted.
* No syntax highlighting.
* No error checking.

Frameworks
--------
__Gister__ is build on some great frameworks and also builds its own for interacting with gists in objective-c. The GistManager framework can be used in any other project!

* [JSON](http://stig.github.com/json-framework/)
* [BWToolKit](http://www.brandonwalkin.com/bwtoolkit/); Make sure to install the Interface Builder plugin, this can be found in the Frameworks directory.

These frameworks are included with __Gister__ so you don't have to hunt them down.

__Gister__ was created by David Keegan - [kgn](http://www.kgn.com)