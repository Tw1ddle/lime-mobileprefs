#ifndef MOBILEPREFSEXT_H
#define MOBILEPREFSEXT_H

namespace mobileprefs
{
	void setUserPreference(const char* inId, const char* inPreference);
	const char* getUserPreference(const char* inId);
	void clearUserPreference(const char* inId);
}

#endif