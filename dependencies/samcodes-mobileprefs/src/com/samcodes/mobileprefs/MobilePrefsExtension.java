package com.samcodes.mobileprefs;

import android.app.*;
import android.content.*;
import org.haxe.extension.Extension;
import org.haxe.lime.*;

public class MobilePrefsExtension extends Extension
{
	private static final String LEGACY_GLOBAL_PREF_FILE = "nmeAppPrefs";

	public static String getUserPreference(String inId) {
		SharedPreferences prefs = mainActivity.getSharedPreferences(LEGACY_GLOBAL_PREF_FILE, Context.MODE_PRIVATE);
		return prefs.getString(inId, "");
	}

	public static void setUserPreference(String inId, String inPreference) {
		SharedPreferences prefs = mainActivity.getSharedPreferences(LEGACY_GLOBAL_PREF_FILE, Context.MODE_PRIVATE);
		SharedPreferences.Editor prefEditor = prefs.edit();
		prefEditor.putString(inId, inPreference);
		prefEditor.commit();
	}

	public static void clearUserPreference(String inId) {
		SharedPreferences prefs = mainActivity.getSharedPreferences(LEGACY_GLOBAL_PREF_FILE, Context.MODE_PRIVATE);
		SharedPreferences.Editor prefEditor = prefs.edit();
		prefEditor.putString(inId, "");
		prefEditor.commit();
	}
}