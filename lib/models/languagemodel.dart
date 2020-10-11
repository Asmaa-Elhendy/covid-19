class Language {
  String languagecode;
  String name;
  String flag;

  Language(this.languagecode, this.name, this.flag);


 static List languagelist() {
    return [
      Language('en', 'English', '🇺🇸'),
      Language('ar', 'Arabic', '🇪🇬')
    ];
  }
}