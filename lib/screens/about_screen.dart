import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import '../app/language_provider.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(languageProvider.translate('about')),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App Info Card
                _buildInfoCard(
                  context,
                  languageProvider.translate('aboutApp'),
                  languageProvider.isPersian
                      ? '''این اپلیکیشن شامل اطلاعات ۱۰ دانشمند برجسته جهان است که تأثیر بسزایی در پیشرفت علم داشته‌اند. ویژگی‌های برنامه:

• نمایش اطلاعات کامل دانشمندان
• امکان اضافه کردن دانشمند جدید
• امکان ویرایش و حذف دانشمندان موجود
• تغییر تم (روشن/تاریک)
• پشتیبانی از دو زبان فارسی و انگلیسی
• جستجوی پیشرفته در بین دانشمندان
• طراحی مدرن و کاربرپسند
• انتخاب عکس از گالری یا دوربین

این اپلیکیشن با Flutter توسعه داده شده است.'''
                      : '''This application contains information about 10 world's distinguished scientists who have made significant contributions to the advancement of science. Features:

• Display complete scientist information
• Add new scientists
• Edit and delete existing scientists
• Theme change (Light/Dark)
• Persian and English language support
• Advanced search functionality
• Modern and user-friendly design
• Select photo from gallery or camera

This application is developed with Flutter.''',
                  Icons.apps,
                ),

                const SizedBox(height: 20),

                // Developer Info Card
                _buildInfoCard(
                  context,
                  languageProvider.translate('aboutDeveloper'),
                  languageProvider.isPersian
                      ? '''نام: الیاس احمدی
کشور: افغانستان
دانشگاه: دانشگاه هرات
رشته: علوم کامپیوتر
سال تحصیلی: دوم

این اولین اپلیکیشن من با فریمورک Flutter است که به عنوان پروژه آموزشی توسعه داده شده است. امیدوارم برای کاربران مفید باشد و اطلاعات ارزشمندی درباره دانشمندان بزرگ جهان ارائه دهد.'''
                      : '''Name: Elyas Ahmadi
Country: Afghanistan
University: Herat University
Field: Computer Science
Year: Second Year

This is my first Flutter application developed as an educational project. I hope it will be useful for users and provide valuable information about the world's great scientists.''',
                  Icons.person,
                ),

                const SizedBox(height: 20),

                // Contact Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.connect_without_contact,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              languageProvider.isPersian
                                  ? 'ارتباط با توسعه‌دهنده'
                                  : 'Contact Developer',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildContactButton(
                              context,
                              Icons.telegram,
                              'Telegram',
                                  () => _launchUrl('https://t.me/'),
                              Colors.blue,
                            ),
                            _buildContactButton(
                              context,
                              Icons.facebook,
                              'Facebook',
                                  () => _launchUrl('https://facebook.com/'),
                              Colors.blue[800]!,
                            ),
                            _buildContactButton(
                              context,
                              Icons.email,
                              'Email',
                                  () => _launchUrl('mailto:example@email.com'),
                              Colors.red,
                            ),
                            _buildContactButton(
                              context,
                              Icons.web,
                              'Website',
                                  () => _launchUrl('https://google.com'),
                              Colors.green,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Version Info
                Center(
                  child: Text(
                    'Version 2.0.0',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 14,
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoCard(BuildContext context, String title, String content, IconData icon) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Divider(
              color: Theme.of(context).dividerColor.withOpacity(0.3),
              height: 1,
            ),

            const SizedBox(height: 16),

            Text(
              content,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.6,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactButton(BuildContext context, IconData icon, String label, VoidCallback onTap, Color color) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: color.withOpacity(0.3),
              width: 2,
            ),
          ),
          child: IconButton(
            icon: Icon(icon, color: color),
            onPressed: onTap,
            iconSize: 28,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
