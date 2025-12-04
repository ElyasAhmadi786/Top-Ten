import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import '../app/language_provider.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Consumer<LanguageProvider>(
          builder: (context, languageProvider, child) {
            return Text(languageProvider.translate('aboutApp'));
          },
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: isDark
              ? LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF0F0F0F),
              const Color(0xFF1A1A1A),
              const Color(0xFF2D2D2D),
            ],
          )
              : LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFE3F2FD).withOpacity(0.8),
              const Color(0xFFF3E5F5).withOpacity(0.8),
              const Color(0xFFE8F5E8).withOpacity(0.8),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // App Logo
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: isDark
                        ? [Colors.amber, Colors.orange]
                        : [Colors.deepPurple, Colors.blue],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: isDark ? Colors.amber.withOpacity(0.3) : Colors.deepPurple.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.science,
                  size: 60,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 30),

              // App Title
              Consumer<LanguageProvider>(
                builder: (context, languageProvider, child) {
                  return Text(
                    languageProvider.translate('appTitle'),
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.amber : Colors.deepPurple,
                    ),
                    textAlign: TextAlign.center,
                  );
                },
              ),

              const SizedBox(height: 10),

              // Version
              Text(
                'v2.0.0',
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? Colors.amber.shade300 : Colors.deepPurple.shade300,
                  fontStyle: FontStyle.italic,
                ),
              ),

              const SizedBox(height: 40),

              // About App Card
              _buildInfoCard(
                context,
                Icons.info_outline,
                'aboutApp',
                'این اپلیکیشن شامل اطلاعات ۱۰ دانشمند برجسته جهان است که تأثیر بسزایی در پیشرفت علم داشته‌اند.\n\n'
                    'This application contains information about 10 distinguished scientists who have had significant impact on scientific progress.',
                [
                  'نمایش اطلاعات کامل دانشمندان • Complete scientist information',
                  'جستجوی پیشرفته در بین دانشمندان • Advanced search among scientists',
                  'امکان مشاهده جزئیات هر دانشمند • View details of each scientist',
                  'لینک به وبسایت‌های مرتبط • Links to related websites',
                  'طراحی زیبا و کاربرپسند • Beautiful and user-friendly design',
                ],
              ),

              const SizedBox(height: 20),

              // Developers Card
              _buildDeveloperCard(context),

              const SizedBox(height: 20),

              // Contact Card
              _buildContactCard(context),

              const SizedBox(height: 30),

              // Footer
              Consumer<LanguageProvider>(
                builder: (context, languageProvider, child) {
                  return Column(
                    children: [
                      Text(
                        languageProvider.isPersian
                            ? 'با تشکر از استفاده شما از این برنامه'
                            : 'Thank you for using this application',
                        style: TextStyle(
                          fontSize: 16,
                          color: isDark ? Colors.white70 : Colors.deepPurple.shade700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '© 2024 Distinguished Scientists App',
                        style: TextStyle(
                          fontSize: 14,
                          color: isDark ? Colors.white60 : Colors.grey[600],
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, IconData icon, String titleKey, String description, List<String> features) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: isDark
                  ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF1E1E1E),
                  const Color(0xFF2D2D2D),
                ],
              )
                  : LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  const Color(0xFFF5F5F5),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      color: isDark ? Colors.amber : Colors.deepPurple,
                      size: 28,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      languageProvider.translate(titleKey),
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.amber : Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.6,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                ...features.map((feature) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 20,
                        color: isDark ? Colors.green.shade400 : Colors.green,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          feature,
                          style: TextStyle(
                            fontSize: 14,
                            color: isDark ? Colors.white70 : Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDeveloperCard(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: isDark
                  ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF1E1E1E),
                  const Color(0xFF2D2D2D),
                ],
              )
                  : LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  const Color(0xFFF5F5F5),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: isDark ? Colors.amber : Colors.deepPurple,
                      size: 28,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      languageProvider.translate('aboutDeveloper'),
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.amber : Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildInfoRow(
                  context,
                  languageProvider.isPersian ? 'نام:' : 'Name:',
                  'Elias Ahmadi',
                  Icons.badge,
                ),
                const SizedBox(height: 12),
                _buildInfoRow(
                  context,
                  languageProvider.isPersian ? 'کشور:' : 'Country:',
                  'افغانستان • Afghanistan',
                  Icons.location_on,
                ),
                const SizedBox(height: 12),
                _buildInfoRow(
                  context,
                  languageProvider.isPersian ? 'دانشگاه:' : 'University:',
                  'دانشگاه هرات • Herat University',
                  Icons.school,
                ),
                const SizedBox(height: 12),
                _buildInfoRow(
                  context,
                  languageProvider.isPersian ? 'رشته:' : 'Field:',
                  'علوم کامپیوتر • Computer Science',
                  Icons.computer,
                ),
                const SizedBox(height: 12),
                _buildInfoRow(
                  context,
                  languageProvider.isPersian ? 'سال تحصیلی:' : 'Academic Year:',
                  languageProvider.isPersian ? 'دوم' : 'Second Year',
                  Icons.calendar_today,
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.black.withOpacity(0.3) : Colors.deepPurple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isDark ? Colors.amber.withOpacity(0.3) : Colors.deepPurple.withOpacity(0.3),
                    ),
                  ),
                  child: Text(
                    languageProvider.isPersian
                        ? 'این اولین اپلیکیشن من با فریمورک Flutter است که به عنوان پروژه آموزشی توسعه داده شده است. امیدوارم برای کاربران مفید باشد و اطلاعات ارزشمندی درباره دانشمندان بزرگ جهان ارائه دهد.'
                        : 'This is my first application with the Flutter framework, developed as an educational project. I hope it will be useful for users and provide valuable information about the world\'s great scientists.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.6,
                      color: isDark ? Colors.white70 : Colors.deepPurple.shade700,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value, IconData icon) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: isDark ? Colors.amber : Colors.deepPurple,
        ),
        const SizedBox(width: 12),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: isDark ? Colors.amber : Colors.deepPurple,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 15,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactCard(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: isDark
                  ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF1E1E1E),
                  const Color(0xFF2D2D2D),
                ],
              )
                  : LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  const Color(0xFFF5F5F5),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.contact_mail,
                      color: isDark ? Colors.amber : Colors.deepPurple,
                      size: 28,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      languageProvider.isPersian ? 'ارتباط با من' : 'Contact Me',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.amber : Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  languageProvider.isPersian
                      ? 'می‌توانید از طریق پلتفرم‌های زیر با من در ارتباط باشید:'
                      : 'You can contact me through the following platforms:',
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark ? Colors.white70 : Colors.deepPurple.shade700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildContactButton(
                      context,
                      Icons.telegram,
                      'Telegram',
                      Colors.blue,
                          () => _launchURL('https://t.me/yourusername'),
                    ),
                    _buildContactButton(
                      context,
                      Icons.email,
                      'Email',
                      Colors.red,
                          () => _launchURL('mailto:elyasahmadi033@gmail.com'),
                    ),
                    _buildContactButton(
                      context,
                      Icons.facebook,
                      'Facebook',
                      Colors.blue[800]!,
                          () => _launchURL('https://facebook.com/yourusername'),
                    ),
                    _buildContactButton(
                      context,
                      Icons.code,
                      'GitHub',
                      isDark ? Colors.white : Colors.black,
                          () => _launchURL('https://github.com/ElyasAhmadi786'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.black.withOpacity(0.3) : Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    languageProvider.isPersian
                        ? 'برای پیشنهادات، انتقادات یا گزارش مشکلات لطفاً با من در ارتباط باشید.'
                        : 'For suggestions, feedback, or bug reports, please feel free to contact me.',
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark ? Colors.white70 : Colors.blue.shade700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildContactButton(BuildContext context, IconData icon, String label, Color color, VoidCallback onTap) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.1),
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: IconButton(
            icon: Icon(icon, color: color),
            onPressed: onTap,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).brightness == Brightness.dark ? Colors.white70 : Colors.black87,
          ),
        ),
      ],
    );
  }
}