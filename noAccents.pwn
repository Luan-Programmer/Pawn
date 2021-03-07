new strAccents[144];

removeAccent(c) {
  static const ACCENTS[] = "ÀaÂÃÄÅàaâãäåÒÓÔÕÕÖØòóôõöøÈeÊËèeêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž";
  static const NON_ACCENTS[] = "AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz";

  for (new i = strlen(ACCENTS) - 1; i >= 0; i--) {
    if (c == ACCENTS[i]) {
      c = NON_ACCENTS[i];
      break;
    }
  }
  return c;
}

strRemoveAccent(const source[], dest[], len = sizeof(dest)) {
  for (new i = len - 1; i >= 0; i--) {
    dest[i] = removeAccent(source[i]);
  }
}

stock SendClientMessageToAllAndroid(color, text[]) {

	for(new x = 0, j = GetPlayerPoolSize(); x <= j; x++) {
		if(IsPlayerInAndroid(x) && IsPlayerConnected(x)) {
			strRemoveAccent(text, strAccents);
			SendClientMessageAndroid(x, color, strAccents);
		}
		else {
			SendClientMessageAndroid(x, color, text);
		}
	}
	return 1;
}

stock SendClientMessageAndroid(playerid, color, text[]) {

	if(IsPlayerInAndroid(playerid)) {
		strRemoveAccent(text, strAccents);
		SendClientMessage(playerid, color, text);
	}
	else {
		SendClientMessage(playerid, color, text);
	}
	return 1;
}
