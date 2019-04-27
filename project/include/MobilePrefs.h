#ifndef MobilePrefs_H
#define MobilePrefs_H

namespace mobileprefs 
{	
    bool SetUserPreference(const char* inId, const char* inPreference);
    const char* GetUserPreference(const char* inId);
    bool ClearUserPreference(const char* inId);
}

#endif
