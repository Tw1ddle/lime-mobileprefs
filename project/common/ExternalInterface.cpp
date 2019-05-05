#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#include <hx/CFFI.h>
#include <hx/CFFIPrime.h>

#include "SamcodesMobilePrefs.h"

using namespace samcodesmobileprefs;

#ifdef IPHONE

void samcodesmobileprefs_set_user_preference(HxString inId, HxString inValue)
{
	setUserPreference(inId.c_str(), inValue.c_str());
}
DEFINE_PRIME2v(samcodesmobileprefs_set_user_preference);

HxString samcodesmobileprefs_get_user_preference(HxString inId)
{
	return HxString(getUserPreference(inId.c_str()));
}
DEFINE_PRIME1(samcodesmobileprefs_get_user_preference);

void samcodesmobileprefs_clear_user_preference(HxString inId)
{
	clearUserPreference(inId.c_str());
}
DEFINE_PRIME1v(samcodesmobileprefs_clear_user_preference);

#endif

extern "C" void samcodesmobileprefs_main()
{
	val_int(0);
}
DEFINE_ENTRY_POINT(samcodesmobileprefs_main);

extern "C" int samcodesmobileprefs_register_prims()
{
	return 0;
}
