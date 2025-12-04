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
import 'splash_screen.dart';

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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Consumer<LanguageProvider>(
          builder: (context, languageProvider, child) {
            return Text(
              languageProvider.translate('appTitle'),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onPrimary,
              ),
            );
          },
        ),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        actions: [
          // Theme toggle button
          IconButton(
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              color: theme.colorScheme.onPrimary,
            ),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),

          // Language toggle button
          Consumer<LanguageProvider>(
            builder: (context, languageProvider, child) {
              return IconButton(
                icon: Icon(
                  languageProvider.isPersian
                      ? Icons.translate
                      : Icons.language,
                  color: theme.colorScheme.onPrimary,
                ),
                onPressed: () {
                  languageProvider.toggleLanguage();
                },
              );
            },
          ),

          // More options
          Consumer<LanguageProvider>(
            builder: (context, languageProvider, child) {
              return PopupMenuButton<String>(
                icon: Icon(Icons.more_vert, color: theme.colorScheme.onPrimary),
                color: isDark ? Colors.grey[900] : Colors.white,
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
                        Icon(Icons.info_outline, color: isDark ? Colors.white : Colors.black87),
                        const SizedBox(width: 12),
                        Text(
                          languageProvider.translate('about'),
                          style: TextStyle(color: isDark ? Colors.white : Colors.black87),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'share',
                    child: Row(
                      children: [
                        Icon(Icons.share, color: isDark ? Colors.white : Colors.black87),
                        const SizedBox(width: 12),
                        Text(
                          languageProvider.translate('share'),
                          style: TextStyle(color: isDark ? Colors.white : Colors.black87),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'exit',
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app, color: isDark ? Colors.white : Colors.black87),
                        const SizedBox(width: 12),
                        Text(
                          languageProvider.translate('exit'),
                          style: TextStyle(color: isDark ? Colors.white : Colors.black87),
                        ),
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
                padding: const EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[900] : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Consumer<LanguageProvider>(
                    builder: (context, languageProvider, child) {
                      return TextField(
                        controller: _searchController,
                        focusNode: _searchFocusNode,
                        decoration: InputDecoration(
                          hintText: languageProvider.translate('search'),
                          hintStyle: TextStyle(color: isDark ? Colors.grey[400] : Colors.grey[600]),
                          prefixIcon: Icon(Icons.search, color: isDark ? Colors.white : Colors.black87),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                            icon: Icon(Icons.clear, color: isDark ? Colors.white : Colors.black87),
                            onPressed: _clearSearch,
                          )
                              : null,
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 20,
                          ),
                        ),
                        style: TextStyle(color: isDark ? Colors.white : Colors.black87),
                        onChanged: _onSearchChanged,
                      );
                    },
                  ),
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
                            color: theme.colorScheme.secondary,
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
                            color: theme.colorScheme.secondary.withOpacity(0.5),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            languageProvider.translate('noScientists'),
                            style: theme.textTheme.titleMedium!.copyWith(
                              color: theme.colorScheme.secondary,
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
                                style: TextStyle(
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                )
                    : ListView.separated(
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
            ],
          );
        },
      ),
      floatingActionButton: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return FloatingActionButton.extended(
            onPressed: () => _addScientist(context),
            icon: Icon(Icons.add, color: isDark ? Colors.black : Colors.white),
            label: Text(
              languageProvider.translate('addScientist'),
              style: TextStyle(color: isDark ? Colors.black : Colors.white),
            ),
            backgroundColor: isDark ? Colors.amber : Colors.deepPurple,
            foregroundColor: isDark ? Colors.black : Colors.white,
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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          languageProvider.translate('delete'),
          style: TextStyle(color: isDark ? Colors.white : Colors.black87),
        ),
        content: Text(
          languageProvider.translate('deleteConfirm'),
          style: TextStyle(color: isDark ? Colors.white70 : Colors.black87),
        ),
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              languageProvider.translate('no'),
              style: TextStyle(color: theme.colorScheme.secondary),
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
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          languageProvider.translate('exit'),
          style: TextStyle(color: isDark ? Colors.white : Colors.black87),
        ),
        content: Text(
          languageProvider.isPersian
              ? 'آیا می‌خواهید از برنامه خارج شوید و دوباره وارد شوید؟'
              : 'Do you want to restart the application?',
          style: TextStyle(color: isDark ? Colors.white70 : Colors.black87),
        ),
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              languageProvider.translate('no'),
              style: TextStyle(color: theme.colorScheme.secondary),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // بستن دیالوگ
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const SplashScreen(fromExit: true),
                ),
              );
            },
            child: Text(languageProvider.translate('yes')),
          ),
        ],
      ),
    );
  }
}