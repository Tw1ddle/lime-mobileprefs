#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#include <hx/CFFI.h>
#include <hx/CFFIPrime.h>

#include "MobilePrefs.h"

using namespace mobileprefs;

#ifdef IPHONE

void mobileprefs_set_user_preference(value inId, value inValue)
{
	setUserPreference(val_string(inId), val_string(inValue));
}
DEFINE_PRIME2v(mobileprefs_set_user_preference);

value mobileprefs_get_user_preference(value inId)
{
	return alloc_string(getUserPreference(val_string(inId)));
}
DEFINE_PRIME1(mobileprefs_get_user_preference);

void mobileprefs_clear_user_preference(value inId)
{
	clearUserPreference(val_string(inId));
}
DEFINE_PRIME1v(mobileprefs_clear_user_preference);

#endif

extern "C" void mobileprefs_main()
{
	val_int(0);
}
DEFINE_ENTRY_POINT(mobileprefs_main);

extern "C" int mobileprefs_register_prims()
{
	return 0;
}