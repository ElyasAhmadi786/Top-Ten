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
<<<<<<< HEAD
=======
    } else {
      throw 'Could not launch $url';
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
    }
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final theme = Theme.of(context);

=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                scientist.imageAsset,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
<<<<<<< HEAD
                    color: theme.colorScheme.background,
                    child: Icon(
                      Icons.person,
                      size: 100,
                      color: theme.colorScheme.secondary,
=======
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.grey,
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
                    ),
                  );
                },
              ),
              title: Consumer<LanguageProvider>(
                builder: (context, languageProvider, child) {
                  return Text(
                    languageProvider.isPersian ? scientist.name : scientist.nameEn,
<<<<<<< HEAD
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 8,
                          color: Colors.black.withOpacity(0.8),
=======
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 4,
                          color: Colors.black,
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
                        ),
                      ],
                    ),
                  );
                },
              ),
              centerTitle: true,
            ),
<<<<<<< HEAD
            backgroundColor: theme.colorScheme.primary,
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
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
<<<<<<< HEAD
                        Icons.calendar_today,
=======
                        Icons.cake_outlined,
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
                      ),

                      const SizedBox(height: 20),

                      // Achievements
                      _buildSection(
                        context,
                        languageProvider.translate('achievements'),
                        scientist.achievements,
<<<<<<< HEAD
                        Icons.emoji_events,
=======
                        Icons.emoji_events_outlined,
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
                      ),

                      const SizedBox(height: 20),

                      // Death Info
                      if (scientist.deathInfo.isNotEmpty)
                        _buildSection(
                          context,
                          languageProvider.translate('deathInfo'),
                          scientist.deathInfo,
<<<<<<< HEAD
                          Icons.restaurant_menu,
=======
                          Icons.restaurant_menu_outlined,
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
                        ),

                      if (scientist.deathInfo.isNotEmpty) const SizedBox(height: 20),

                      // Website Button
                      if (scientist.website.isNotEmpty)
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () => _launchWebsite(scientist.website),
<<<<<<< HEAD
                            icon: Icon(
                              Icons.language,
                              color: theme.colorScheme.onPrimary,
                            ),
                            label: Text(
                              languageProvider.translate('moreInfo'),
                              style: TextStyle(color: theme.colorScheme.onPrimary),
                            ),
=======
                            icon: const Icon(Icons.language),
                            label: Text(languageProvider.translate('moreInfo')),
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
<<<<<<< HEAD
                              backgroundColor: theme.colorScheme.primary,
=======
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              foregroundColor: Theme.of(context).colorScheme.onPrimary,
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
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
<<<<<<< HEAD
    final theme = Theme.of(context);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
=======
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
<<<<<<< HEAD
                Icon(
                  icon,
                  color: theme.colorScheme.primary,
                ),
=======
                Icon(icon, color: Theme.of(context).colorScheme.primary),
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
                const SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
<<<<<<< HEAD
                    color: theme.colorScheme.primary,
=======
                    color: Theme.of(context).colorScheme.primary,
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(
<<<<<<< HEAD
              color: theme.dividerColor,
=======
              color: Theme.of(context).dividerColor.withOpacity(0.3),
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
              height: 1,
            ),
            const SizedBox(height: 12),
            Text(
              content,
<<<<<<< HEAD
              style: theme.textTheme.bodyLarge!.copyWith(
=======
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
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