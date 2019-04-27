#include "SamcodesMobilePrefs.h"

#import <Foundation/Foundation.h>
#import <Foundation/NSAutoreleasePool.h>
#import <Foundation/NSString.h>
#import <Foundation/NSUserDefaults.h>

namespace samcodesmobileprefs
{

const char* getUserPreference(const char* key)
{
	static const char* empty = "";
	static NSString* currentPref = @""; // Note this makes the function non-reentrant
	
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

	const char* s = [currentPref UTF8String];
	return s ? s : empty;
}

void setUserPreference(const char* key, const char* val)
{
	NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
	
	#ifndef OBJC_ARC
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	#endif

	NSString* strKey = [[NSString alloc] initWithUTF8String:key];
	NSString* strVal = [[NSString alloc] initWithUTF8String:val];
	[userDefaults setObject:strVal forKey:strKey];

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