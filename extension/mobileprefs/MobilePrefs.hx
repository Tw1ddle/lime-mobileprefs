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
	public static function getUserPreference(name:String):String
	{
		return get_user_preference(name);
	}

	public static function setUserPreference(name:String, value:String):Void
	{
		set_user_preference(name, value);
	}

	public static function clearUserPreference(name:String):Void
	{
		clear_user_preference(name);
	}

	#if android
	private static inline var packageName:String = "com/mobileprefs/MobilePrefs";
	private static inline function bindJNI(jniMethod:String, jniSignature:String) {
		return JNI.createStaticMethod(packageName, jniMethod, jniSignature);
	}
	private static var get_user_preference = bindJNI("mobileprefs", "getUserPreference", "(Ljava/lang/String;)Ljava/lang/String;");
	private static var set_user_preference = bindJNI("mobileprefs", "setUserPreference", "(Ljava/lang/String;Ljava/lang/String;)V");
	private static var clear_user_preference = bindJNI("mobileprefs", "clearUserPreference", "(Ljava/lang/String;)V");
	#end

	#if ios
	private static var get_user_preference = PrimeLoader.load("mobileprefs_get_user_preference", "ss");
	private static var set_user_preference = PrimeLoader.load("mobileprefs_set_user_preference", "ssv");
	private static var clear_user_preference = PrimeLoader.load("mobileprefs_clear_user_preference", "sv");
	#end
}

#end