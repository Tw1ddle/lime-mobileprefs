#ifndef MOBILEPREFSEXT_H
#define MOBILEPREFSEXT_H

namespace mobileprefs
{
	bool setUserPreference(const char* inId, const char* inPreference);
	const char* getUserPreference(const char* inId);
	bool clearUserPreference(const char* inId);
}

#endif