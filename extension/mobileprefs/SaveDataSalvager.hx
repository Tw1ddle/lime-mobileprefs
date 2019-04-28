package extension.mobileprefs;

#if (android || ios)

import sys.io.File;
import haxe.io.Path;
import openfl.net.SharedObject;
import sys.FileSystem;

// At some point between OpenFL 3.6.1 and OpenFL 8, the implementation for SharedObject had breaking changes
// This means our old users of our apps will have savedata which will no longer appear to them, unless we salvage it
// See: https://community.openfl.org/t/need-help-loading-old-android-and-ios-saves/10400
@:access(openfl.net.SharedObject)
class SaveDataSalvager
{
	// Salvages old savedata that used to be stored in SharedPreferences on Android and defaultPrefs on iOS
	// Pass in the key containing the old encoded save name e.g. "save_one"
	public static function salvageSaveData(oldSaveDataName:String):SaveDataSalvagingResult {
		var newSaveDataSolPath:String = SharedObject.__getPath("", oldSaveDataName);
		if (FileSystem.exists(newSaveDataSolPath)) {
			trace("New savedata already exists, will skip old savedata salvaging");
			return SaveDataSalvagingResult.NEW_SAVEDATA_ALREADY_EXISTS;
		}
		
		var oldSaveData:String = MobilePrefs.getUserPreference(oldSaveDataName);
		if (oldSaveData == null || oldSaveData == "") {
			trace("Failed to read old save data, it probably doesn't exist, will skip trying to salvage it");
			return SaveDataSalvagingResult.OLD_SAVEDATA_DIDNT_EXIST;
		}
		
		trace("Will write old savedata: " + oldSaveData + " to new save file at " + newSaveDataSolPath);
		
		try {
			var newSolDirectory = Path.directory(newSaveDataSolPath);
			
			if (!FileSystem.exists(newSolDirectory)) {
				trace("Creating new folder to hold new savedata file");
				SharedObject.__mkdir(newSolDirectory);
			}
			
			var output = File.write(newSolDirectory + oldSaveDataName + ".sol", false);
			output.writeString(oldSaveData);
			output.close();
		} catch(e:Dynamic) {
			trace("Failed to create new save data or salvage old savedata with exception: " + e);
			return SaveDataSalvagingResult.EXCEPTION_WHILE_SALVAGING(e);
		}
		
		return SaveDataSalvagingResult.SUCCESS;
	}
}

#end