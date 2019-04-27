package extension.mobileprefs;

#if (android || ios)

#if android
import lime.system.JNI;
#end

#if ios
import lime.system.CFFI;
#end

class MobilePrefs
{
	public static function getUserPreference(key:String):String
	{
		return get_user_preference(key);
	}

	public static function setUserPreference(key:String, value:String):Void
	{
		set_user_preference(key, value);
	}

	public static function clearUserPreference(key:String):Void
	{
		clear_user_preference(key);
	}

	#if android
	private static inline var packageName:String = "com/samcodes/mobileprefs/MobilePrefsExtension";
	private static inline function bindJNI(jniMethod:String, jniSignature:String) {
		return JNI.createStaticMethod(packageName, jniMethod, jniSignature);
	}
	private static var get_user_preference = bindJNI("getUserPreference", "(Ljava/lang/String;)Ljava/lang/String;");
	private static var set_user_preference = bindJNI("setUserPreference", "(Ljava/lang/String;Ljava/lang/String;)V");
	private static var clear_user_preference = bindJNI("clearUserPreference", "(Ljava/lang/String;)V");
	#end

	#if ios
	private static var get_user_preference = PrimeLoader.load("samcodesmobileprefs_get_user_preference", "ss");
	private static var set_user_preference = PrimeLoader.load("samcodesmobileprefs_set_user_preference", "ssv");
	private static var clear_user_preference = PrimeLoader.load("samcodesmobileprefs_clear_user_preference", "sv");
	#end
}

#end