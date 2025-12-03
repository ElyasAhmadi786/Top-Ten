import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../app/language_provider.dart';
import '../app/data_provider.dart';
import '../app/theme_provider.dart';
import '../widgets/scientist_card.dart';
import 'add_edit_scientist_screen.dart';
import 'about_screen.dart';
import 'scientist_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      if (_searchController.text.isEmpty) {
        final dataProvider = Provider.of<DataProvider>(context, listen: false);
        dataProvider.setSearchQuery('');
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _searchController.clear();
    final dataProvider = Provider.of<DataProvider>(context, listen: false);
    dataProvider.setSearchQuery('');
    _searchFocusNode.unfocus();
  }

  void _onSearchChanged(String value) {
    final dataProvider = Provider.of<DataProvider>(context, listen: false);
    dataProvider.setSearchQuery(value);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Consumer<LanguageProvider>(
          builder: (context, languageProvider, child) {
            return Text(
              languageProvider.translate('appTitle'),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.themeMode == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
            tooltip: 'تغییر تم',
          ),
          Consumer<LanguageProvider>(
            builder: (context, languageProvider, child) {
              return IconButton(
                icon: Icon(
                  languageProvider.isPersian
                      ? Icons.translate
                      : Icons.language,
                ),
                onPressed: () {
                  languageProvider.toggleLanguage();
                },
                tooltip: languageProvider.translate('changeLanguage'),
              );
            },
          ),
          Consumer<LanguageProvider>(
            builder: (context, languageProvider, child) {
              return PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onSelected: (value) {
                  if (value == 'about') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutScreen(),
                      ),
                    );
                  } else if (value == 'share') {
                    _shareApp(context);
                  } else if (value == 'exit') {
                    _exitApp(context);
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'about',
                    child: Row(
                      children: [
                        const Icon(Icons.info_outline, size: 20),
                        const SizedBox(width: 12),
                        Text(languageProvider.translate('about')),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'share',
                    child: Row(
                      children: [
                        const Icon(Icons.share, size: 20),
                        const SizedBox(width: 12),
                        Text(languageProvider.translate('share')),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'exit',
                    child: Row(
                      children: [
                        const Icon(Icons.exit_to_app, size: 20),
                        const SizedBox(width: 12),
                        Text(languageProvider.translate('exit')),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: Consumer<DataProvider>(
        builder: (context, dataProvider, child) {
          return Column(
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Consumer<LanguageProvider>(
                  builder: (context, languageProvider, child) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardTheme.color,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _searchController,
                        focusNode: _searchFocusNode,
                        decoration: InputDecoration(
                          hintText: languageProvider.translate('search'),
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: _clearSearch,
                          )
                              : null,
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 20,
                          ),
                        ),
                        onChanged: _onSearchChanged,
                      ),
                    );
                  },
                ),
              ),

              // Results count
              if (dataProvider.searchQuery.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Consumer<LanguageProvider>(
                    builder: (context, languageProvider, child) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          languageProvider.isPersian
                              ? '${dataProvider.scientists.length} نتیجه یافت شد'
                              : '${dataProvider.scientists.length} results found',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 14,
                          ),
                        ),
                      );
                    },
                  ),
                ),

              const SizedBox(height: 8),

              // Scientists List
              Expanded(
                child: dataProvider.scientists.isEmpty
                    ? Consumer<LanguageProvider>(
                  builder: (context, languageProvider, child) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 80,
                            color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            languageProvider.translate('noScientists'),
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          if (dataProvider.searchQuery.isNotEmpty)
                            TextButton(
                              onPressed: _clearSearch,
                              child: Text(
                                languageProvider.isPersian
                                    ? 'پاک کردن جستجو'
                                    : 'Clear search',
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                )
                    : RefreshIndicator(
                  onRefresh: () async {
                    // Refresh logic if needed
                  },
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    itemCount: dataProvider.scientists.length,
                    separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final scientist = dataProvider.scientists[index];
                      return ScientistCard(
                        scientist: scientist,
                        index: index,
                        onDelete: () => _deleteScientist(context, index),
                        onEdit: () => _editScientist(context, index),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScientistDetailScreen(scientist: scientist),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return FloatingActionButton.extended(
            onPressed: () => _addScientist(context),
            icon: const Icon(Icons.add),
            label: Text(languageProvider.translate('addScientist')),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          );
        },
      ),
    );
  }

  void _addScientist(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddEditScientistScreen(),
      ),
    );
  }

  void _editScientist(BuildContext context, int index) {
    final dataProvider = Provider.of<DataProvider>(context, listen: false);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditScientistScreen(
          scientist: dataProvider.scientists[index],
          index: index,
        ),
      ),
    );
  }

  void _deleteScientist(BuildContext context, int index) {
    final languageProvider = Provider.of<LanguageProvider>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(languageProvider.translate('delete')),
        content: Text(languageProvider.translate('deleteConfirm')),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              languageProvider.translate('no'),
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final dataProvider = Provider.of<DataProvider>(context, listen: false);
              dataProvider.deleteScientist(index);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    languageProvider.isPersian
                        ? 'دانشمند با موفقیت حذف شد'
                        : 'Scientist deleted successfully',
                  ),
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(languageProvider.translate('yes')),
          ),
        ],
      ),
    );
  }

  void _shareApp(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context, listen: false);
    Share.share(
      languageProvider.isPersian
          ? 'برنامه دانشمندان برجسته جهان را امتحان کنید!'
          : 'Check out this amazing World Scientists app!',
    );
  }

  void _exitApp(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(languageProvider.translate('exit')),
        content: Text(
          languageProvider.isPersian
              ? 'آیا می‌خواهید از برنامه خارج شوید؟'
              : 'Do you want to exit the app?',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(languageProvider.translate('no')),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // In production, use proper exit method
              // SystemNavigator.pop();
            },
            child: Text(languageProvider.translate('yes')),
          ),
        ],
      ),
    );
  }
}