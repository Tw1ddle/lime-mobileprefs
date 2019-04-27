# MobilePrefs

[![Travis Build Status](https://img.shields.io/travis/Tw1ddle/samcodes-mobileprefs.svg?style=flat-square)](https://travis-ci.org/Tw1ddle/samcodes-mobileprefs)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](https://github.com/Tw1ddle/samcodes-mobileprefs/blob/master/LICENSE)

Support for upgrading from legacy lime/OpenFL savedata/preferences implementations to a newer one, for Haxe Android and iOS targets.

Made for salvaging user's old savedata when updating an app using a legacy OpenFL version (~3.6) to a new version (~8.0). See [this forum thread](https://community.openfl.org/t/need-help-loading-old-android-and-ios-saves/10400) for details.

### Install

```bash
haxelib install samcodes-mobileprefs
```

### Usage

Include the haxelib through Project.xml:
```xml
<haxelib name="samcodes-mobileprefs" />
```



### Notes

 * Based on [lime-mobileprefs](https://github.com/justin-espedal/lime-mobileprefs) by Justin Espedal.
 * Use ```#if (android || ios)``` conditionals around your imports and calls to this library for cross platform projects - there is no stub/fallback implementation included in the haxelib.
 * Got an idea or suggestion? Open an issue on GitHub, or send Sam a message on [Twitter](https://twitter.com/Sam_Twidale).