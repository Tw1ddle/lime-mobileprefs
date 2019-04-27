#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#include <hx/CFFI.h>
#include <hx/CFFIPrime.h>

#include "SamcodesMobilePrefs.h"

using namespace samcodesmobileprefs;

#ifdef IPHONE

void samcodesmobileprefs_set_user_preference(value inId, value inValue)
{
	setUserPreference(val_string(inId), val_string(inValue));
}
DEFINE_PRIME2v(samcodesmobileprefs_set_user_preference);

value samcodesmobileprefs_get_user_preference(value inId)
{
	return alloc_string(getUserPreference(val_string(inId)));
}
DEFINE_PRIME1(samcodesmobileprefs_get_user_preference);

void samcodesmobileprefs_clear_user_preference(value inId)
{
	clearUserPreference(val_string(inId));
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