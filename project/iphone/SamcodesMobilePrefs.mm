#include "MobilePrefs.h"

#import <CoreFoundation/CoreFoundation.h>
#import <UIKit/UIKit.h>

namespace samcodesmobileprefs
{

const char* getUserPreference(const char* key)
{
	static NSString* currentPref = ""; // Note this makes the function non-reentrant
	
	NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
	
	#ifndef OBJC_ARC
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	#endif
	
	NSString* strKey = [[NSString alloc] initWithUTF8String:key];
	currentPref = [userDefaults stringForKey:strKey];
	if(!currentPref) {
		currentPref = "";
	}

	#ifndef OBJC_ARC
	[strKey release];
	[pool drain];
	#endif

	return currentPref;
}

void setUserPreference(const char* key, const char* val)
{
	NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
	
	#ifndef OBJC_ARC
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	#endif

	NSString* strKey = [[NSString alloc] initWithUTF8String:key];
	NSString* strVal = [[NSString alloc] initWithUTF8String:val];
	[userDefaults setObject:strPref forKey:key];

	#ifndef OBJC_ARC
	[strKey release];
	[strVal release];
	[pool drain];
	#endif
}

void clearUserPreference(const char* key)
{
	NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];

	#ifndef OBJC_ARC
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	#endif

	NSString* strKey = [[NSString alloc] initWithUTF8String:key];
	[userDefaults setObject:@"" forKey:strKey];

	#ifndef OBJC_ARC
	[strKey release];
	[pool drain];
	#endif
}

}