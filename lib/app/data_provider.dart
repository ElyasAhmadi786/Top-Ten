import 'package:flutter/material.dart';
import '../models/scientist.dart';

class DataProvider extends ChangeNotifier {
  List<Scientist> _scientists = [];
  String _searchQuery = '';

  DataProvider() {
    _initializeData();
  }

  List<Scientist> get scientists {
    if (_searchQuery.isEmpty) {
      return _scientists;
    }
    final query = _searchQuery.toLowerCase();
    return _scientists.where((scientist) {
      return scientist.name.toLowerCase().contains(query) ||
          scientist.nameEn.toLowerCase().contains(query) ||
          scientist.birthInfo.toLowerCase().contains(query) ||
          scientist.achievements.toLowerCase().contains(query);
    }).toList();
  }

  String get searchQuery => _searchQuery;

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void addScientist(Scientist scientist) {
    _scientists.add(scientist);
    notifyListeners();
  }

  void updateScientist(int index, Scientist updatedScientist) {
    _scientists[index] = updatedScientist;
    notifyListeners();
  }

  void deleteScientist(int index) {
    _scientists.removeAt(index);
    notifyListeners();
  }

  void _initializeData() {
    _scientists = [
      Scientist(
        name: 'آلبرت اینشتین',
        nameEn: 'Albert Einstein',
        birthInfo: '۱۴ مارس ۱۸۷۹، اولم، پادشاهی وورتمبرگ، امپراتوری آلمان',
        achievements: '''فیزیکدان نظری آلمانی، توسعه‌دهنده نظریه نسبیت، یکی از دو ستون اصلی فیزیک مدرن. معروف‌ترین کار او رابطه همارزی جرم و انرژی (E=mc²) است. او جایزه نوبل فیزیک را در سال ۱۹۲۱ برای خدماتش به فیزیک نظری و به‌ویژه کشف قانون اثر فوتوالکتریک دریافت کرد.''',
        deathInfo: '۱۸ آوریل ۱۹۵۵، پرینستون، نیوجرسی، ایالات متحده',
        website: 'https://fa.wikipedia.org/wiki/%D8%A2%D9%84%D8%A8%D8%B1%D8%AA_%D8%A7%DB%8C%D9%86%D8%B4%D8%AA%DB%8C%D9%86',
        imageAsset: 'assets/Albert Einstein.jpeg',
      ),
      Scientist(
        name: 'آیزاک نیوتن',
        nameEn: 'Isaac Newton',
        birthInfo: '۲۵ دسامبر ۱۶۴۲، وولستورپ، لینکلن‌شر، انگلستان',
        achievements: '''فیزیکدان، ریاضی‌دان، ستاره‌شناس، فیلسوف و شیمیدان انگلیسی. او نویسنده کتاب اصول ریاضی فلسفه طبیعی (۱۶۸۷) است که پایه و اساس مکانیک کلاسیک را تشکیل داد. نیوتن قوانین حرکت و قانون گرانش جهانی را فرموله کرد.''',
        deathInfo: '۳۱ مارس ۱۷۲۷، لندن، انگلستان',
        website: 'https://fa.wikipedia.org/wiki/%D8%A2%DB%8C%D8%B2%D8%A7%DA%A9_%D9%86%DB%8C%D9%88%D8%AA%D9%86',
        imageAsset: 'assets/Isaac Newton.jpeg',
      ),
      Scientist(
        name: 'ماری کوری',
        nameEn: 'Marie Curie',
        birthInfo: '۷ نوامبر ۱۸۶۷، ورشو، لهستان',
        achievements: '''فیزیک‌دان و شیمیدان لهستانی-فرانسوی. او پیشگام در پژوهش‌های رادیو‌فعالیت، اولین زنی که برنده جایزه نوبل شد، تنها فردی که دو بار برنده جایزه نوبل در دو رشته مختلف شده است (فیزیک و شیمی). او اولین استاد زن در دانشگاه پاریس بود.''',
        deathInfo: '۴ ژوئیه ۱۹۳۴، پاسه، فرانسه',
        website: 'https://fa.wikipedia.org/wiki/%D9%85%D8%A7%D8%B1%DB%8C_%DA%A9%D9%88%D8%B1%DB%8C',
        imageAsset: 'assets/Marie Curie.jpeg',
      ),
      Scientist(
        name: 'چارلز داروین',
        nameEn: 'Charles Darwin',
        birthInfo: '۱۲ فوریه ۱۸۰۹، شروزبری، انگلستان',
        achievements: '''طبیعت‌دان انگلیسی که به خاطر نظریه تکامل و فرآیند انتخاب طبیعی شهرت دارد. او کتاب "منشأ انواع" را در سال ۱۸۵۹ منتشر کرد که نظریه او را معرفی کرد و شواهد تجربی برای تکامل ارائه داد.''',
        deathInfo: '۱۹ آوریل ۱۸۸۲، داون، کنت، انگلستان',
        website: 'https://fa.wikipedia.org/wiki/%DA%86%D8%A7%D8%B1%D9%84%D8%B2_%D8%AF%D8%A7%D8%B1%D9%88%DB%8C%D9%86',
        imageAsset: 'assets/Charles Darwin.jpeg',
      ),
      Scientist(
        name: 'گالیله گالیله‌ای',
        nameEn: 'Galileo Galilei',
        birthInfo: '۱۵ فوریه ۱۵۶۴، پیزا، دوک‌نشین فلورانس',
        achievements: '''ستاره‌شناس، فیزیک‌دان و مهندس ایتالیایی. گالیله را پدر علم مشاهده‌ای اخترشناسی، پدر فیزیک مدرن، پدر روش علمی و پدر علم مدرن می‌نامند. او تلسکوپ را بهبود بخشید و مشاهدات اخترشناسی متعددی انجام داد.''',
        deathInfo: '۸ ژانویه ۱۶۴۲، آرچتری، دوک‌نشین فلورانس',
        website: 'https://fa.wikipedia.org/wiki/%DA%AF%D8%A7%D9%84%DB%8C%D9%84%D9%87_%DA%AF%D8%A7%D9%84%DB%8C%D9%84%D9%87%E2%80%8C%D8%A7%DB%8C',
        imageAsset: 'assets/Galileo Galilei.jpeg',
      ),
      Scientist(
        name: 'نیکولا تسلا',
        nameEn: 'Nikola Tesla',
        birthInfo: '۱۰ ژوئیه ۱۸۵۶، اسمیلیان، امپراتوری اتریش',
        achievements: '''مخترع، مهندس برق و مهندس مکانیک صربستانی-آمریکایی. او به خاطر مشارکت‌هایش در طراحی سیستم مدرن تأمین الکتریسیته جریان متناوب (AC) شناخته شده است. تسلا بیش از ۳۰۰ اختراع ثبت شده دارد.''',
        deathInfo: '۷ ژانویه ۱۹۴۳، نیویورک، ایالات متحده',
        website: 'https://fa.wikipedia.org/wiki/%D9%86%DB%8C%DA%A9%D9%88%D9%84%D8%A7_%D8%AA%D8%B3%D9%84%D8%A7',
        imageAsset: 'assets/Nikola Tesla.jpg',
      ),
      Scientist(
        name: 'آلن تورینگ',
        nameEn: 'Alan Turing',
        birthInfo: '۲۳ ژوئن ۱۹۱۲، لندن، انگلستان',
        achievements: '''ریاضیدان، دانشمند کامپیوتر، منطق‌دان، رمزنگار و زیست‌شناس نظری انگلیسی. او به عنوان پدر علم کامپیوتر و هوش مصنوعی شناخته می‌شود. در جنگ جهانی دوم نقش کلیدی در شکستن کدهای انیگما آلمان داشت.''',
        deathInfo: '۷ ژوئن ۱۹۵۴، ویلمسلو، چشر، انگلستان',
        website: 'https://fa.wikipedia.org/wiki/%D8%A2%D9%84%D9%86_%D8%AA%D9%88%D8%B1%DB%8C%D9%86%DA%AF',
        imageAsset: 'assets/Alan Turing.jpg',
      ),
      Scientist(
        name: 'استیون هاوکینگ',
        nameEn: 'Stephen Hawking',
        birthInfo: '۸ ژانویه ۱۹۴۲، آکسفورد، انگلستان',
        achievements: '''فیزیکدان نظری، کیهان‌شناس و نویسنده انگلیسی. او مدیر تحقیقات مرکز کیهان‌شناسی نظری در دانشگاه کمبریج بود. کارهای علمی او شامل همکاری با راجر پنروز در قضایای تکینگی گرانشی و پیش‌بینی تابش هاوکینگ از سیاه‌چاله‌ها بود.''',
        deathInfo: '۱۴ مارس ۲۰۱۸، کمبریج، انگلستان',
        website: 'https://fa.wikipedia.org/wiki/%D8%A7%D8%B3%D8%AA%DB%8C%D9%88%D9%86_%D9%87%D8%A7%D9%88%DA%A9%DB%8C%D9%86%DA%AF',
        imageAsset: 'assets/Stephen Hawking.jpg',
      ),
      Scientist(
        name: 'توماس ادیسون',
        nameEn: 'Thomas Edison',
        birthInfo: '۱۱ فوریه ۱۸۴۷، میلان، اوهایو، ایالات متحده',
        achievements: '''مخترع و تاجر آمریکایی. او دستگاه‌های متعددی را در زمینه‌هایی مانند تولید توان الکتریکی، ارتباط‌جمعی، ضبط صوت و تصویر متحرک توسعه داد. ادیسون ۱۰۹۳ اختراع را در ایالات متحده به ثبت رساند.''',
        deathInfo: '۱۸ اکتبر ۱۹۳۱، وست اورنج، نیوجرسی، ایالات متحده',
        website: 'https://fa.wikipedia.org/wiki/%D8%AA%D9%88%D9%85%D8%A7%D8%B3_%D8%A7%D8%AF%DB%8C%D8%B3%D9%88%D9%86',
        imageAsset: 'assets/Thomas Edison.jpg',
      ),
      Scientist(
        name: 'لویی پاستور',
        nameEn: 'Louis Pasteur',
        birthInfo: '۲۷ دسامبر ۱۸۲۲، دول، فرانسه',
        achievements: '''شیمیدان و میکروبیولوژیست فرانسوی. او به خورش کشف اصول واکسیناسیون، تخمیر میکروبی و پاستوریزه‌کردن شهرت دارد. او در زمینه پیشگیری از بیماری و کاهش مرگ و میر ناشی از تب پس از زایمان کمک‌های زیادی کرد.''',
        deathInfo: '۲۸ سپتامبر ۱۸۹۵، ویلنوو-ل-گتان، فرانسه',
        website: 'https://fa.wikipedia.org/wiki/%D9%84%D9%88%DB%8C%DB%8C_%D9%BE%D8%A7%D8%B3%D8%AA%D9%88%D8%B1',
        imageAsset: 'assets/Louis Pasteur.jpg',
      ),
    ];
  }
}