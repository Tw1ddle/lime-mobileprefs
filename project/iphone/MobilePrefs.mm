#include <MobilePrefs.h>

#include <string>

#import <CoreFoundation/CoreFoundation.h>
#import <UIKit/UIKit.h>

namespace mobileprefs
{

const char* getUserPreference(const char* inId)
{
	static std::string currentPref = ""; // Note this makes the function non-reentrant
	
	NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
	#ifndef OBJC_ARC
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	#endif
	NSString* strId = [[NSString alloc] initWithUTF8String:inId];
	NSString* pref = [userDefaults stringForKey:strId];
	currentPref = (pref ? [pref UTF8String] : "");

	#ifndef OBJC_ARC
	[strId release];
	[pool drain];
	#endif

	return currentPref.c_str();
}

void setUserPreference(const char* inId, const char* inPreference)
{
	NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
	
	#ifndef OBJC_ARC
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	#endif

	NSString* strId = [[NSString alloc] initWithUTF8String:inId];
	NSString* strPref = [[NSString alloc] initWithUTF8String:inPreference];
	[userDefaults setObject:strPref forKey:strId];

	#ifndef OBJC_ARC
	[strId release];
	[strPref release];
	[pool drain];
	#endif
}

void clearUserPreference(const char* inId)
{
	NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];

	#ifndef OBJC_ARC
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	#endif

	NSString* strId = [[NSString alloc] initWithUTF8String:inId];
	[userDefaults setObject:@"" forKey:strId];

	#ifndef OBJC_ARC
	[strId release];
	[pool drain];
	#endif
}

}