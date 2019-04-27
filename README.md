# MobilePrefs

[![Travis Build Status](https://img.shields.io/travis/Tw1ddle/lime-mobileprefs.svg?style=flat-square)](https://travis-ci.org/Tw1ddle/lime-mobileprefs)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](https://github.com/Tw1ddle/lime-mobileprefs/blob/master/LICENSE)

Support for upgrading from a legacy OpenFL SharedObject implementation to a newer one for Haxe Android and iOS targets. Useful for salvaging old savedata when updating from very old to new OpenFL versions. See [this](https://community.openfl.org/t/need-help-loading-old-android-and-ios-saves/10400) for details.

If there is something you would like adding please open an issue. Pull requests welcomed too!

### Install

```bash
haxelib install lime-mobileprefs
```

### Usage

Include the haxelib through Project.xml:
```xml
<haxelib name="lime-mobileprefs" />
```

### Notes

 * Based on [lime-mobileprefs](https://github.com/justin-espedal/lime-mobileprefs) by Justin Espedal.
 * Use ```#if (android || ios)``` conditionals around your imports and calls to this library for cross platform projects - there is no stub/fallback implementation included in the haxelib.
 * Got an idea or suggestion? Open an issue on GitHub, or send Sam a message on [Twitter](https://twitter.com/Sam_Twidale).