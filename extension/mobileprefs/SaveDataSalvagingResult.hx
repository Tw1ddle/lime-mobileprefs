package extension.mobileprefs;

#if (android || ios)

enum SaveDataSalvagingResult
{
	NONE; // Default value e.g. if no salvaging attempt has been made
	NEW_SAVEDATA_ALREADY_EXISTS; // New savedata already exists, so there's no point in salvaging savedata
	OLD_SAVEDATA_DIDNT_EXIST; // Old savedata didn't exist, so it's the first time the user launched the game
	EXCEPTION_WHILE_SALVAGING(e:Dynamic); // Failed to salvage the savedata, something went wrong
	SUCCESS; // Successfully salvaged the savedata
}

#end