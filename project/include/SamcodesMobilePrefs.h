#ifndef SAMCODESMOBILEPREFSEXT_H
#define SAMCODESMOBILEPREFSEXT_H

namespace samcodesmobileprefs
{
	void setUserPreference(const char* inId, const char* inPreference);
	const char* getUserPreference(const char* inId);
	void clearUserPreference(const char* inId);
}

#endif