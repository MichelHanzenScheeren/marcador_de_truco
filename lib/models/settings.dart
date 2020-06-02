class Settings {
  int settingsID;
  bool isDarkTheme;

  Settings(this.settingsID, this.isDarkTheme);

  Settings.fromMap(Map map) {
    settingsID = map["settingsID"];
    isDarkTheme = map["isDarkTheme"] == 0 ? false : true;
  }

  Map toMap() {
    return {
      "settingsID": settingsID,
      "isDarkTheme": isDarkTheme == false ? 0 : 1,
    };
  }
}
