//about page of the app

import 'package:flutter/material.dart';
import 'package:second_app/distinguished scientists_info.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text('About the app'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          color: Colors.purple[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [
                Text(
                  ''' About the App  ''',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  '''  در این اپلیکشن نام 10 دانشمند برجسته جهان همراه با خلاصه‌ای از سوابق و دستاوردهایشان آمده است:

آلبرت اینشتین

زمینه: فیزیک نظری
دستاوردها: نظریه نسبیت خاص و نسبیت عام، معادله معروف E=mc².
افتخارات: جایزه نوبل فیزیک در سال 1921 به خاطر کشف اثر فوتوالکتریک.
آیزاک نیوتن

زمینه: ریاضیات و فیزیک
دستاوردها: قوانین حرکت و جاذبه عمومی، بنیان‌گذاری حساب دیفرانسیل و انتگرال.
افتخارات: نقش اساسی در پیشرفت علم مکانیک کلاسیک.
چارلز داروین

زمینه: زیست‌شناسی
دستاوردها: نظریه تکامل از طریق انتخاب طبیعی.
افتخارات: کتاب مشهور «منشأ انواع» که زیست‌شناسی مدرن را تغییر داد.
نیکولا تسلا

زمینه: مهندسی برق و فیزیک
دستاوردها: توسعه سیستم‌های جریان متناوب (AC)، موتورهای الکتریکی، و فناوری‌های رادیو.
افتخارات: نقش حیاتی در پیشرفت صنعت برق.
ماری کوری

زمینه: شیمی و فیزیک
دستاوردها: کشف رادیوم و پولونیوم، مطالعات روی رادیواکتیویته.
افتخارات: دو جایزه نوبل در فیزیک (1903) و شیمی (1911).
لویی پاستور

زمینه: میکروبیولوژی و شیمی
دستاوردها: توسعه پاستوریزاسیون، نظریه میکروبی بیماری‌ها، و واکسن‌های هاری و سیاه زخم.
افتخارات: تأثیر فراوان بر علم پزشکی و بهداشت عمومی.
گالیلئو گالیله

زمینه: نجوم، فیزیک
دستاوردها: بهبود تلسکوپ، حمایت از نظریه خورشیدمرکزی کوپرنیک.
افتخارات: پدر علم مدرن به دلیل تأثیرش بر روش علمی.
توماس ادیسون

زمینه: اختراع و مهندسی
دستاوردها: اختراع لامپ برق، گرامافون، و دوربین فیلم‌برداری.
افتخارات: بیش از 1000 اختراع ثبت‌شده که زندگی مدرن را تغییر داد.
استیون هاوکینگ

زمینه: کیهان‌شناسی و فیزیک نظری
دستاوردها: کارهای برجسته در زمینه سیاه‌چاله‌ها و نظریه نسبیت، کتاب «تاریخچه مختصر زمان».
افتخارات: تبدیل علم به موضوعی قابل فهم برای عموم.
آلن تورینگ

زمینه: ریاضیات و علوم کامپیوتر
دستاوردها: پایه‌گذاری نظریه کامپیوتر، شکستن کد انیگما در جنگ جهانی دوم.
افتخارات: پدر علوم کامپیوتر و هوش مصنوعی.
این دانشمندان با کارهای خود نه تنها علوم مختلف را پیش برده‌اند بلکه تأثیر بزرگی بر زندگی انسان‌ها داشته‌اند ''',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/انییشتتین.jpeg"))),
                  child: AspectRatio(
                    aspectRatio: 25 / 24,
                    child: Container(),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  '''About the programmer of the this app  ''',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '''Hey I am Elyas Ahmadi from Afghanistan and i am a student in Herat University i am studing Computer Sceince Faculty and this is my secound year.
     And this is my first app from flutter framework as an information  apliction about the 10 distinguished scientists. of The World and i hope this will be helpful for users and i thankful to all mu friends those who helped me  in this project.
                    
                 ''',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  ''' Meet Me On ''',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            launchURL(' ');
                          });
                          //FlutterShareMe().shareToTelegram(msg: "https//t.me/MHN_298");
                        },
                        icon: Icon(Icons.telegram_outlined),
                        color: Colors.blue,
                        splashColor: Colors.pink[200],
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            launchURL(" ");
                          });

                          // FlutterShareMe().shareToFacebook(msg:"https//www.facebook.com/profile.php?id=100088150762663" );
                        },
                        icon: Icon(Icons.facebook_outlined),
                        color: Colors.deepPurple,
                        splashColor: Colors.pink[200],
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.alternate_email),
                        color: Colors.redAccent,
                        splashColor: Colors.pink[200],
                      ),
                    ),
                  ],
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
