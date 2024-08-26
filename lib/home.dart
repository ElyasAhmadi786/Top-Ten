//Home page
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'About.dart';
import 'distinguished scientists.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Ds> sports = [
    Ds(
        'Alan Turing',
        '''Most popular person in the world.''',
        '''
    1.  تاریخ و محل تولد: 23 ژوئن 1912 در لندن، انگلستان
زندگی و دستاوردها: تورینگ در یک خانواده مرفه به دنیا آمد و در دانشگاه‌های کمبریج و پرینستون تحصیل کرد. او یکی از پیشگامان علوم کامپیوتر و هوش مصنوعی بود. در دوران جنگ جهانی دوم، تورینگ با توسعه ماشین تورینگ و شکستن کد انیگما نقشی حیاتی در پیروزی متفقین داشت. پس از جنگ، او به کار روی هوش مصنوعی پرداخت.
''',
        "assets/Alan Turing.jpg",
        'https://www.google.com/search?q=Alan+Turing&sca_esv=d5bbf09f5aa4d38f&sxsrf=ADLYWIIICUtMaA1M7ViYlaVLet3O-AknHQ%3A1724524917163&ei=dSnKZqiwCayJxc8PgdiucQ&ved=0ahUKEwjovt_4o46IAxWsRPEDHQGsKw4Q4dUDCA8&uact=5&oq=Alan+Turing&gs_lp=Egxnd3Mtd2l6LXNlcnAiC0FsYW4gVHVyaW5nMgoQIxiABBgnGIoFMggQLhiABBjLATIIEC4YgAQYywEyCBAAGIAEGMsBMggQABiABBjLATIIEC4YgAQYywEyCBAuGIAEGMsBMggQABiABBjLATIIEAAYgAQYywEyCBAAGIAEGMsBMhcQLhiABBjLARiXBRjcBBjeBBjgBNgBA0iiJlDMB1iZI3ABeAGQAQCYAewCoAHYCqoBBTItNC4xuAEDyAEA-AEC-AEBmAIFoAKiCcICChAAGLADGNYEGEfCAg0QABiABBiwAxhDGIoFwgIOEAAYsAMY5AIY1gTYAQHCAhMQLhiABBiwAxhDGMgDGIoF2AECwgIGEAAYFhgewgIIEAAYgAQYogSYAwCIBgGQBhO6BgYIARABGAm6BgYIAhABGAi6BgYIAxABGBSSBwcxLjAuMy4xoAfrIQ&sclient=gws-wiz-serp'),
    Ds(
        'Albert Einstein',
        'Most popular person in the world.',
        '''
    2.تاریخ و محل تولد: 14 مارس 1879 در اولم، پادشاهی وورتمبرگ، امپراتوری آلمان
زندگی و دستاوردها: اینشتین در یک خانواده یهودی در آلمان به دنیا آمد. او دوران کودکی نسبتاً آرامی داشت و از همان ابتدا به ریاضیات علاقه‌مند شد. در سال 1905، او چهار مقاله بنیادین را منتشر کرد که مسیر فیزیک مدرن را تغییر داد. این مقالات شامل نظریه نسبیت خاص و معادله معروف E=mc² بود. بعدها نظریه نسبیت عام را توسعه داد که نشان داد گرانش ناشی از انحنای فضا-زمان است. اینشتین در سال 1921 جایزه نوبل فیزیک را به خاطر کشف اثر فوتوالکتریک دریافت کرد. او در سال 1933 به دلیل قدرت‌گیری نازی‌ها به آمریکا مهاجرت کرد و در دانشگاه پرینستون به تدریس پرداخت.
مرگ: 18 آوریل 1955 در پرینستون، نیوجرسی، آمریکا.
    ''',
        "assets/Albert Einstein.jpeg",
        'https://www.google.com/search?q=Albert+Einstein&sca_esv=d5bbf09f5aa4d38f&sxsrf=ADLYWIKooKIomHxv_PpZX0lJsA94Q5SejA%3A1724522962140&ei=0iHKZuGbCO6K7NYP16X6uA8&ved=0ahUKEwjhzMLUnI6IAxVuBdsEHdeSHvcQ4dUDCA8&uact=5&oq=Albert+Einstein&gs_lp=Egxnd3Mtd2l6LXNlcnAiD0FsYmVydCBFaW5zdGVpbjIEECMYJzIIEC4YgAQYywEyCBAAGIAEGMsBMggQABiABBjLATIIEAAYgAQYywEyCBAAGIAEGMsBMggQLhiABBjLATIIEAAYgAQYywEyCBAuGIAEGMsBMggQABiABBjLAUjEE1DICljICnAAeACQAQCYAegDoAGFBqoBBzItMS4wLjG4AQPIAQD4AQGYAgKgAq0GwgIGEAAYFhgewgIXEC4YgAQYywEYlwUY3AQY3gQY4ATYAQGYAwC6BgYIARABGBSSBwUzLTEuMaAH6yA&sclient=gws-wiz-serp'),
    Ds(
        'Charles Darwin',
        'Most popular person in the world.',
        '''
    3. تاریخ و محل تولد: 12 فوریه 1809 در شروزبری، انگلستان
زندگی و دستاوردها: داروین در یک خانواده علمی و مرفه به دنیا آمد. او در دانشگاه‌های ادینبرو و کمبریج تحصیل کرد و سپس در سال 1831 به سفر علمی معروف خود با کشتی بیگل پرداخت. نتایج این سفر او را به نظریه تکامل از طریق انتخاب طبیعی رساند که در کتاب «منشأ انواع» (1859) منتشر شد. این نظریه تحولی در زیست‌شناسی ایجاد کرد و به تدریج به عنوان اساس علم زیست‌شناسی مدرن پذیرفته شد.
مرگ: 19 آوریل 1882 در داون، کنت، انگلستان.
''',
        "assets/Charles Darwin.jpeg",
        'https://www.google.com/search?q=charles+Darwin&sca_esv=d5bbf09f5aa4d38f&sxsrf=ADLYWIKBsdm5CCW_G35-vl91Y7bQUjF9yQ%3A1724523528881&ei=CCTKZsq1NaiNxc8Px7KnuQc&ved=0ahUKEwjK2eHino6IAxWoRvEDHUfZKXcQ4dUDCA8&uact=5&oq=charles+Darwin&gs_lp=Egxnd3Mtd2l6LXNlcnAiDmNoYXJsZXMgRGFyd2luMgQQABhHMgQQABhHSOAdUKsMWKsMcAF4ApABAJgBAKABAKoBALgBA8gBAPgBAZgCAqACEsICChAAGLADGNYEGEfCAg0QABiABBiwAxhDGIoFwgIOEAAYsAMY5AIY1gTYAQHCAhMQLhiABBiwAxhDGMgDGIoF2AECmAMA4gMFEgExIECIBgGQBgK6BgYIARABGAm6BgYIAhABGAiSBwEyoAcA&sclient=gws-wiz-serp'),
    Ds(
        'Galileo Galilei',
        'Most popular person in the world.',
        '''
    4.تاریخ و محل تولد: 15 فوریه 1564 در پیزا، دوک‌نشین فلورانس (ایتالیای کنونی)
زندگی و دستاوردها: گالیله در یک خانواده اشرافی متولد شد و در ابتدا به تحصیل در رشته پزشکی پرداخت، اما به زودی به ریاضیات و فیزیک علاقه‌مند شد. او تلسکوپ را بهبود بخشید و با مشاهده سیارات و ستارگان، نظریه خورشیدمرکزی کوپرنیک را تأیید کرد. این نظریه او را با کلیسای کاتولیک به تعارض انداخت و در نهایت محاکمه شد و تا پایان عمر در حصر خانگی بود. گالیله را به عنوان "پدر علم مدرن" می‌شناسند.
مرگ: 8 ژانویه 1642 در آرچتری، دوک‌نشین فلورانس (ایتالیای کنونی).
''',
        "assets/Galileo Galilei.jpeg",
        'https://www.google.com/search?q=Galileo+Galilei&sca_esv=d5bbf09f5aa4d38f&sxsrf=ADLYWIKtyLAFrk5RPoDeDANn8sZE7xUvog%3A1724523537799&ei=ESTKZt-5MPeUxc8Plbu2mAY&ved=0ahUKEwifhoLnno6IAxV3SvEDHZWdDWMQ4dUDCA8&uact=5&oq=Galileo+Galilei&gs_lp=Egxnd3Mtd2l6LXNlcnAiD0dhbGlsZW8gR2FsaWxlaTIIEC4YgAQYywEyCBAAGIAEGMsBMggQABiABBjLATIIEAAYgAQYywEyCBAAGIAEGMsBMggQABiABBjLATIIEAAYgAQYywEyCBAuGIAEGMsBMggQABiABBjLATIIEAAYgAQYywEyFxAuGIAEGMsBGJcFGNwEGN4EGN8E2AECSJ8WUPUMWPUMcAF4AZABAJgBpAKgAaQCqgEDMi0xuAEDyAEA-AEB-AECmAICoALWAqgCEcICBxAjGCcY6gLCAhAQABgDGLQCGOoCGI8B2AEBmAMOugYGCAEQARgKugYGCAIQARgUkgcFMS4zLTGgB4gP&sclient=gws-wiz-serp'),
    Ds(
        'Isaac Newton',
        'Most popular person in the world.',
        '''
    5.تاریخ و محل تولد: 25 دسامبر 1642 (4 ژانویه 1643 در تقویم میلادی) در وولستورپ، لینکلن‌شر، انگلستان
زندگی و دستاوردها: نیوتن در یک خانواده کشاورز به دنیا آمد و دوران کودکی دشواری را تجربه کرد. او به دانشگاه کمبریج رفت و در آنجا به مطالعه ریاضیات و فلسفه طبیعی پرداخت. در سال 1687، کتاب معروف خود "اصول ریاضی فلسفه طبیعی" را منتشر کرد که شامل قوانین حرکت و قانون جاذبه عمومی بود. او همچنین حساب دیفرانسیل و انتگرال را بنیان‌گذاری کرد. نیوتن سال‌های پایانی زندگی خود را به عنوان رئیس دارالضرب سلطنتی و عضو پارلمان انگلستان گذراند.
مرگ: 31 مارس 1727 در لندن، انگلستان.
''',
        "assets/Isaac Newton.jpeg",
        'https://www.google.com/search?q=Isaac+Newton&oq=Isaac+Newton&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIHCAEQLhiABDIHCAIQABiABDIHCAMQABiABDIHCAQQABiABDIHCAUQABiABDIHCAYQLhiABDIHCAcQABiABDIHCAgQABiABDIHCAkQABiABNIBCDMyNDJqMGo5qAIAsAIB&sourceid=chrome&ie=UTF-8'),
    Ds(
        'Louis Pasteur',
        'Most popular person in the world.',
        '''
    6. تاریخ و محل تولد: 27 دسامبر 1822 در دول، فرانسه
زندگی و دستاوردها: پاستور در یک خانواده طبقه کارگر به دنیا آمد و در رشته شیمی تحصیل کرد. او به تحقیقات گسترده‌ای در زمینه میکروب‌شناسی پرداخت و نظریه میکروبی بیماری‌ها را توسعه داد. او روش پاستوریزاسیون برای جلوگیری از فاسد شدن مواد غذایی را ابداع کرد و واکسن‌هایی برای بیماری‌های هاری و سیاه زخم تولید کرد. این دستاوردها تأثیر عمیقی بر علم پزشکی و بهداشت عمومی داشت.
مرگ: 28 سپتامبر 1895 در ویلنوو-ل-گتان، فرانسه. 
''',
        "assets/Louis Pasteur.jpg",
        'https://www.google.com/search?q=Louis+Pasteur&sca_esv=d5bbf09f5aa4d38f&sxsrf=ADLYWIKMneH9c8T4WjTmuCFxvbHsL1wh-Q%3A1724523840090&ei=QCXKZoGbBeeCxc8Pkva1qQI&ved=0ahUKEwiBu5T3n46IAxVnQfEDHRJ7LSUQ4dUDCA8&uact=5&oq=Louis+Pasteur&gs_lp=Egxnd3Mtd2l6LXNlcnAiDUxvdWlzIFBhc3RldXIyCBAuGIAEGMsBMg4QLhiABBjHARjLARivATIIEAAYgAQYywEyCBAAGIAEGMsBMggQABiABBjLATIIEAAYgAQYywEyCBAAGIAEGMsBMggQABiABBjLATIIEAAYgAQYywEyCBAAGIAEGMsBMhcQLhiABBjLARiXBRjcBBjeBBjfBNgBAkjDDVDiCVjiCXABeACQAQCYAf4BoAH-AaoBAzItMbgBA8gBAPgBAfgBApgCAqACsAKoAhLCAgcQIxgnGOoCwgIWEC4YgAQYQxi0AhjIAxiKBRjqAtgBAZgDEboGBggBEAEYCLoGBggCEAEYFJIHBTEuMC4xoAeDEA&sclient=gws-wiz-serp'),
    Ds(
        'Marie Curie',
        'Most popular person in the world.',
        '''
   7.  تاریخ و محل تولد: 7 نوامبر 1867 در ورشو، لهستان
زندگی و دستاوردها: ماری کوری در لهستان تحت اشغال روسیه به دنیا آمد و از همان دوران کودکی به علوم علاقه‌مند شد. او به پاریس رفت و در دانشگاه سوربن تحصیل کرد. ماری کوری به همراه همسرش پیر کوری، روی رادیواکتیویته تحقیق کرد و موفق به کشف عناصر رادیوم و پولونیوم شد. او اولین زن بود که جایزه نوبل را دریافت کرد (فیزیک 1903 و شیمی 1911). او در دوران جنگ جهانی اول، از تکنولوژی رادیوگرافی برای کمک به سربازان استفاده کرد.
مرگ: 4 ژوئیه 1934 در پاسه، فرانسه.
''',
        "assets/Marie Curie.jpeg",
        'https://www.google.com/search?q=Marie+Curie&sca_esv=d5bbf09f5aa4d38f&sxsrf=ADLYWIJxfKE02e-YRn0Q2ulXKIeTTK58eQ%3A1724524279442&ei=9ybKZtHXGtqK7NYPnabSoAI&ved=0ahUKEwiRr9TIoY6IAxVaBdsEHR2TFCQQ4dUDCA8&uact=5&oq=Marie+Curie&gs_lp=Egxnd3Mtd2l6LXNlcnAiC01hcmllIEN1cmllMggQLhiABBjLATIIEAAYgAQYywEyCBAAGIAEGMsBMggQABiABBjLATIIEAAYgAQYywEyCBAAGIAEGMsBMggQABiABBjLATIIEAAYgAQYywEyCBAAGIAEGMsBMggQABiABBjLATIXEC4YgAQYywEYlwUY3AQY3gQY3wTYAQJIuRBQrQpYrQpwAXgBkAEAmAGvAqABrwKqAQMzLTG4AQPIAQD4AQH4AQKYAgKgAuYCqAIPwgIHECMYJxjqAsICFhAuGIAEGEMYtAIYyAMYigUY6gLYAQGYAw-6BgYIARABGAi6BgYIAhABGBSSBwUxLjMtMaAH4ww&sclient=gws-wiz-serp'),
    Ds(
        'Nikola Tesla',
        ' Most popular person in the world.',
        '''
    8. تاریخ و محل تولد: 10 ژوئیه 1856 در اسمیلیان، امپراتوری اتریش (کرواسی کنونی)
زندگی و دستاوردها: تسلا در یک خانواده صرب ارتدوکس به دنیا آمد و از کودکی علاقه زیادی به الکتریسیته و ماشین‌آلات داشت. او در دهه 1880 به آمریکا مهاجرت کرد و با توماس ادیسون همکاری کرد، اما به زودی مسیر خود را جدا کرد و به توسعه سیستم جریان متناوب (AC) پرداخت. تسلا اختراعات فراوانی در زمینه برق، موتورهای الکتریکی و فناوری رادیو داشت. او علی‌رغم دستاوردهایش، بخش بزرگی از زندگی خود را در فقر گذراند.
مرگ: 7 ژانویه 1943 در نیویورک، آمریکا.
''',
        "assets/Nikola Tesla.jpg",
        'https://www.google.com/search?q=Nikola+Tesla&sca_esv=d5bbf09f5aa4d38f&sxsrf=ADLYWIL4sY26cKeIR6zSSAJHg3HoakGn1A%3A1724524358922&ei=RifKZu3xN7yP7NYPnuat2AE&ved=0ahUKEwjtrMfuoY6IAxW8B9sEHR5zCxsQ4dUDCA8&uact=5&oq=Nikola+Tesla&gs_lp=Egxnd3Mtd2l6LXNlcnAiDE5pa29sYSBUZXNsYTIIEC4YgAQYywEyCBAAGIAEGMsBMggQABiABBjLATIIEAAYgAQYywEyCBAAGIAEGMsBMggQABiABBjLATIIEAAYgAQYywEyCBAAGIAEGMsBMggQABiABBjLATIOEC4YgAQYxwEYywEYrwEyFxAuGIAEGMsBGJcFGNwEGN4EGN8E2AECSK8vUPUOWOcrcAF4AJABAJgB2QKgAYMLqgEFMi0zLjK4AQPIAQD4AQH4AQKYAgWgAoMJqAIQwgIHECMYJxjqAsICFhAuGIAEGEMYtAIYyAMYigUY6gLYAQHCAgYQABgWGB7CAggQABiABBiiBJgDD7oGBggBEAEYCLoGBggCEAEYFJIHBzEuMC4zLjGgB6ok&sclient=gws-wiz-serp'),
    Ds(
        'Stephen Hawking',
        'Most popular person in the world.',
        '''
    9. تاریخ و محل تولد: 8 ژانویه 1942 در آکسفورد، انگلستان
زندگی و دستاوردها: هاوکینگ در یک خانواده علمی به دنیا آمد و در دانشگاه‌های آکسفورد و کمبریج تحصیل کرد. او در سن 21 سالگی به بیماری ALS مبتلا شد و بیشتر عمر خود را در حالی گذراند که به تدریج توانایی‌های جسمی خود را از دست داد. با وجود این، او تحقیقات مهمی در زمینه سیاه‌چاله‌ها، کیهان‌شناسی و نظریه نسبیت ارائه داد. کتاب معروفش «تاریخچه مختصر زمان» به محبوبیت زیادی دست یافت و او را به یکی از مشهورترین دانشمندان زمان خود تبدیل کرد.
مرگ: 14 مارس 2018 در کمبریج، انگلستان. 
''',
        "assets/Stephen Hawking.jpg",
        'https://www.google.com/search?q=stephen+Hawking&sca_esv=d5bbf09f5aa4d38f&sxsrf=ADLYWIIYQo9Fp-8eXmrpMrhx3hHujOFcQA%3A1724524749267&ei=zSjKZrj-D8CTxc8Ph4KNuAk&ved=0ahUKEwj4mNioo46IAxXASfEDHQdBA5cQ4dUDCA8&uact=5&oq=stephen+Hawking&gs_lp=Egxnd3Mtd2l6LXNlcnAiD3N0ZXBoZW4gSGF3a2luZzIKEC4YgAQYQxiKBTIIEAAYgAQYywEyCBAAGIAEGMsBMggQABiABBjLATIIEAAYgAQYywEyCBAAGIAEGMsBMggQABiABBjLATIIEAAYgAQYywEyCBAAGIAEGMsBMggQABiABBjLATIZEC4YgAQYQxiKBRiXBRjcBBjeBBjfBNgBAUiOL1B8WOYdcAB4AJABAJgBsgSgAbwVqgELMC4xLjMuMi4xLjG4AQPIAQD4AQGYAgegAucTwgIIEC4YgAQYywGYAwCIBgG6BgYIARABGBSSBwcyLTQuMS4yoAfTfw&sclient=gws-wiz-serp'),
    Ds(
        'Thomas Edison',
        'Most popular person in the world.',
        '''
    10. تاریخ و محل تولد: 11 فوریه 1847 در میلان، اوهایو، آمریکا
زندگی و دستاوردها: ادیسون در یک خانواده فقیر به دنیا آمد و تحصیلات رسمی زیادی نداشت. او از نوجوانی به عنوان تلگرافچی کار کرد و در این مدت علاقه‌اش به اختراع توسعه یافت. او بیش از 1000 اختراع ثبت کرد که مهم‌ترین آن‌ها شامل لامپ برق، گرامافون و دوربین فیلم‌برداری بود. او نقش اساسی در توسعه صنعت برق و ارتباطات داشت و از موفق‌ترین کارآفرینان زمان خود بود.
مرگ: 18 اکتبر 1931 در وست اورنج، نیوجرسی، آمریکا. 
''',
        "assets/Thomas Edison.jpg",
        'https://www.google.com/search?q=Thomas+Edison&sca_esv=d5bbf09f5aa4d38f&sxsrf=ADLYWIIuGgbMHCnbM5SMxoya0b7FcqM80A%3A1724524759999&ei=1yjKZqXOPKqExc8PkZvtoQU&ved=0ahUKEwjlleeto46IAxUqQvEDHZFNO1QQ4dUDCA8&uact=5&oq=Thomas+Edison&gs_lp=Egxnd3Mtd2l6LXNlcnAiDVRob21hcyBFZGlzb24yCBAAGIAEGMsBMggQABiABBjLATIIEAAYgAQYywEyCBAAGIAEGMsBMgYQABgWGB4yBhAAGBYYHjIGEAAYFhgeMgYQABgWGB4yBhAAGBYYHjIGEAAYFhgeSMEUUABYlxJwAHgAkAEAmAG7AqAB1AeqAQUyLTMuMbgBA8gBAPgBAvgBAZgCAqACtATCAggQABgWGAoYHsICCBAAGIAEGKIEmAMAkgcFMi0xLjGgB-sQ&sclient=gws-wiz-serp'),
  ];

  void onTapped(int index) {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              "assets/top10.jpg",
              width: 200,
              height: 90,
            ),
            Text("Persons"),
          ],
        ),
        backgroundColor: Colors.purple[200],
        actions: [
          PopupMenuButton(
              color: Colors.purple[200],
              shadowColor: Colors.blue,
              onSelected: (String value) {
                setState(() {
                  if (value == 'About') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const About(),
                        ));
                  } else if (value == '1') {
                    Navigator.pop(context);
                  } else if (value == "2") {
                    Share.share("com.example.second_app");
                  } else
                    () {};
                });
              },
              itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      value: '2',
                      child: ListTile(
                        leading: Icon(Icons.share),
                        title: Text('Share'),
                      ),
                    ),
                    PopupMenuItem(
                      value: '1',
                      child: ListTile(
                        leading: Icon(Icons.exit_to_app),
                        title: Text('Exit'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'About',
                      child: ListTile(
                        leading: Icon(Icons.info),
                        title: Text('About'),
                      ),
                    ),
                  ])
        ],
      ),
      body: Stack(children: [
        Positioned.fill(
            child: Image.asset(
          "assets/Isaac Newton.jpeg",
          fit: BoxFit.cover,
        )),
        ListView.builder(
          itemCount: sports.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              elevation: 10,
              color: Colors.white12,
              child: ListTile(
                tileColor: Colors.transparent,
                splashColor: Colors.purple[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                hoverColor: Colors.purple[200],
                title: Text(
                  sports[index].name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                subtitle: Text(
                  sports[index].details,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.justify,
                ),
                leading: Image.asset(
                  sports[index].image,
                  width: 60,
                  height: 60,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailPage(ds: sports[index])));
                },
              ),
            );
          },
        ),
      ]),
    );
  }
}
