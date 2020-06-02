class Settings {
  int settingsID;
  bool isDarkTheme;

  Settings(this.settingsID, this.isDarkTheme);

  Settings.fromMap(Map map) {
    settingsID = map["settingsID"];
    isDarkTheme = map["isDarkTheme"] == 0 ? false : true;
  }

  Map toMap() {
    Map<String, dynamic> settings = {
      "settingsID": settingsID,
      "isDarkTheme": isDarkTheme == false ? 0 : 1,
    };
    return settings;
  }
}
