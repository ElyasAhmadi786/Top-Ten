import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('fa', 'IR');

  Locale get currentLocale => _currentLocale;
  bool get isPersian => _currentLocale.languageCode == 'fa';

  final Map<String, Map<String, String>> _translations = {
    'fa': {
      'appTitle': 'دانشمندان برجسته جهان',
      'developedBy': 'توسعه داده شده توسط EA',
      'scientists': 'دانشمندان',
      'addScientist': 'اضافه کردن دانشمند',
      'editScientist': 'ویرایش دانشمند',
      'delete': 'حذف',
      'edit': 'ویرایش',
      'save': 'ذخیره',
      'cancel': 'لغو',
      'search': 'جستجوی دانشمند...',
      'name': 'نام',
      'nameEn': 'نام انگلیسی',
      'birthInfo': 'تاریخ و محل تولد',
      'achievements': 'دستاوردها و افتخارات',
      'deathInfo': 'تاریخ و محل فوت',
      'website': 'وبسایت',
      'moreInfo': 'اطلاعات بیشتر',
      'about': 'درباره',
      'settings': 'تنظیمات',
      'changeTheme': 'تغییر تم',
      'changeLanguage': 'تغییر زبان',
      'share': 'اشتراک‌گذاری',
      'exit': 'خروج',
      'aboutApp': 'درباره برنامه',
      'aboutDeveloper': 'درباره توسعه‌دهنده',
      'noScientists': 'دانشمندی یافت نشد',
      'deleteConfirm': 'آیا از حذف این دانشمند مطمئن هستید؟',
      'yes': 'بله',
      'no': 'خیر',
      'selectPhoto': 'انتخاب عکس',
      'takePhoto': 'گرفتن عکس',
      'photoGallery': 'گالری عکس',
      'light': 'روشن',
      'dark': 'تاریک',
    },
    'en': {
      'appTitle': 'World Distinguished Scientists',
      'developedBy': 'Developed By EA',
      'scientists': 'Scientists',
      'addScientist': 'Add Scientist',
      'editScientist': 'Edit Scientist',
      'delete': 'Delete',
      'edit': 'Edit',
      'save': 'Save',
      'cancel': 'Cancel',
      'search': 'Search scientist...',
      'name': 'Name',
      'nameEn': 'English Name',
      'birthInfo': 'Birth Date and Place',
      'achievements': 'Achievements and Awards',
      'deathInfo': 'Death Date and Place',
      'website': 'Website',
      'moreInfo': 'More Information',
      'about': 'About',
      'settings': 'Settings',
      'changeTheme': 'Change Theme',
      'changeLanguage': 'Change Language',
      'share': 'Share',
      'exit': 'Exit',
      'aboutApp': 'About App',
      'aboutDeveloper': 'About Developer',
      'noScientists': 'No Scientists Found',
      'deleteConfirm': 'Are you sure you want to delete this scientist?',
      'yes': 'Yes',
      'no': 'No',
      'selectPhoto': 'Select Photo',
      'takePhoto': 'Take Photo',
      'photoGallery': 'Photo Gallery',
      'light': 'Light',
      'dark': 'Dark',
    },
  };

  String translate(String key) {
    return _translations[_currentLocale.languageCode]?[key] ?? key;
  }

  void changeLanguage(Locale locale) {
    _currentLocale = locale;
    notifyListeners();
  }

  void toggleLanguage() {
    _currentLocale = _currentLocale.languageCode == 'fa'
        ? const Locale('en', 'US')
        : const Locale('fa', 'IR');
    notifyListeners();
  }
}