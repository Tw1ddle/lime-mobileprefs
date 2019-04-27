#ifndef SAMCODESMOBILEPREFSEXT_H
#define SAMCODESMOBILEPREFSEXT_H

namespace samcodesmobileprefs
{
	void setUserPreference(const char* key, const char* val);
	const char* getUserPreference(const char* key);
	void clearUserPreference(const char* key);
}

#endif