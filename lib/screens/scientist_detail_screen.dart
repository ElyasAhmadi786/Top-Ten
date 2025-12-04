import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import '../app/language_provider.dart';
import '../models/scientist.dart';

class ScientistDetailScreen extends StatelessWidget {
  final Scientist scientist;

  const ScientistDetailScreen({super.key, required this.scientist});

  void _launchWebsite(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                scientist.imageAsset!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: theme.colorScheme.background,
                    child: Icon(
                      Icons.person,
                      size: 100,
                      color: theme.colorScheme.secondary,
                    ),
                  );
                },
              ),
              title: Consumer<LanguageProvider>(
                builder: (context, languageProvider, child) {
                  return Text(
                    languageProvider.isPersian ? scientist.name : scientist.nameEn,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 8,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ],
                    ),
                  );
                },
              ),
              centerTitle: true,
            ),
            backgroundColor: theme.colorScheme.primary,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Consumer<LanguageProvider>(
                builder: (context, languageProvider, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name Section
                      _buildSection(
                        context,
                        languageProvider.translate('name'),
                        languageProvider.isPersian ? scientist.name : scientist.nameEn,
                        Icons.person_outline,
                      ),

                      const SizedBox(height: 20),

                      // Birth Info
                      _buildSection(
                        context,
                        languageProvider.translate('birthInfo'),
                        scientist.birthInfo,
                        Icons.calendar_today,
                      ),

                      const SizedBox(height: 20),

                      // Achievements
                      _buildSection(
                        context,
                        languageProvider.translate('achievements'),
                        scientist.achievements,
                        Icons.emoji_events,
                      ),

                      const SizedBox(height: 20),

                      // Death Info
                      if (scientist.deathInfo.isNotEmpty)
                        _buildSection(
                          context,
                          languageProvider.translate('deathInfo'),
                          scientist.deathInfo,
                          Icons.restaurant_menu,
                        ),

                      if (scientist.deathInfo.isNotEmpty) const SizedBox(height: 20),

                      // Website Button
                      if (scientist.website.isNotEmpty)
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () => _launchWebsite(scientist.website),
                            icon: Icon(
                              Icons.language,
                              color: theme.colorScheme.onPrimary,
                            ),
                            label: Text(
                              languageProvider.translate('moreInfo'),
                              style: TextStyle(color: theme.colorScheme.onPrimary),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: theme.colorScheme.primary,
                            ),
                          ),
                        ),

                      const SizedBox(height: 40),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String content, IconData icon) {
    final theme = Theme.of(context);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(
              color: theme.dividerColor,
              height: 1,
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: theme.textTheme.bodyLarge!.copyWith(
                height: 1.6,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}