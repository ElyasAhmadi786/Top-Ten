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
<<<<<<< HEAD
<<<<<<< HEAD
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
=======
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
<<<<<<< HEAD
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
      appBar: AppBar(
        title: Consumer<LanguageProvider>(
          builder: (context, languageProvider, child) {
            return Text(
              languageProvider.translate('appTitle'),
<<<<<<< HEAD
<<<<<<< HEAD
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onPrimary,
=======
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
<<<<<<< HEAD
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
              ),
            );
          },
        ),
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
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
<<<<<<< HEAD
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
          Consumer<LanguageProvider>(
            builder: (context, languageProvider, child) {
              return IconButton(
                icon: Icon(
                  languageProvider.isPersian
                      ? Icons.translate
                      : Icons.language,
<<<<<<< HEAD
<<<<<<< HEAD
                  color: theme.colorScheme.onPrimary,
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
                ),
                onPressed: () {
                  languageProvider.toggleLanguage();
                },
<<<<<<< HEAD
<<<<<<< HEAD
              );
            },
          ),

          // More options
          Consumer<LanguageProvider>(
            builder: (context, languageProvider, child) {
              return PopupMenuButton<String>(
                icon: Icon(Icons.more_vert, color: theme.colorScheme.onPrimary),
                color: theme.cardTheme.color,
=======
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
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
<<<<<<< HEAD
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
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
<<<<<<< HEAD
<<<<<<< HEAD
                        Icon(Icons.info_outline, color: theme.iconTheme.color),
                        const SizedBox(width: 12),
                        Text(
                          languageProvider.translate('about'),
                          style: TextStyle(color: theme.textTheme.bodyLarge!.color),
                        ),
=======
                        const Icon(Icons.info_outline, size: 20),
                        const SizedBox(width: 12),
                        Text(languageProvider.translate('about')),
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
                        const Icon(Icons.info_outline, size: 20),
                        const SizedBox(width: 12),
                        Text(languageProvider.translate('about')),
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'share',
                    child: Row(
                      children: [
<<<<<<< HEAD
<<<<<<< HEAD
                        Icon(Icons.share, color: theme.iconTheme.color),
                        const SizedBox(width: 12),
                        Text(
                          languageProvider.translate('share'),
                          style: TextStyle(color: theme.textTheme.bodyLarge!.color),
                        ),
=======
                        const Icon(Icons.share, size: 20),
                        const SizedBox(width: 12),
                        Text(languageProvider.translate('share')),
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
                        const Icon(Icons.share, size: 20),
                        const SizedBox(width: 12),
                        Text(languageProvider.translate('share')),
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'exit',
                    child: Row(
                      children: [
<<<<<<< HEAD
<<<<<<< HEAD
                        Icon(Icons.exit_to_app, color: theme.iconTheme.color),
                        const SizedBox(width: 12),
                        Text(
                          languageProvider.translate('exit'),
                          style: TextStyle(color: theme.textTheme.bodyLarge!.color),
                        ),
=======
                        const Icon(Icons.exit_to_app, size: 20),
                        const SizedBox(width: 12),
                        Text(languageProvider.translate('exit')),
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
                        const Icon(Icons.exit_to_app, size: 20),
                        const SizedBox(width: 12),
                        Text(languageProvider.translate('exit')),
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
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
<<<<<<< HEAD
<<<<<<< HEAD
                padding: const EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.cardTheme.color,
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
=======
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
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
<<<<<<< HEAD
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
                        controller: _searchController,
                        focusNode: _searchFocusNode,
                        decoration: InputDecoration(
                          hintText: languageProvider.translate('search'),
<<<<<<< HEAD
<<<<<<< HEAD
                          hintStyle: TextStyle(color: theme.hintColor),
                          prefixIcon: Icon(Icons.search, color: theme.iconTheme.color),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                            icon: Icon(Icons.clear, color: theme.iconTheme.color),
=======
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                            icon: const Icon(Icons.clear),
<<<<<<< HEAD
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
                            onPressed: _clearSearch,
                          )
                              : null,
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 20,
                          ),
                        ),
<<<<<<< HEAD
<<<<<<< HEAD
                        style: TextStyle(color: theme.textTheme.bodyLarge!.color),
                        onChanged: _onSearchChanged,
                      );
                    },
                  ),
=======
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
                        onChanged: _onSearchChanged,
                      ),
                    );
                  },
<<<<<<< HEAD
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
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
<<<<<<< HEAD
<<<<<<< HEAD
                            color: theme.colorScheme.secondary,
=======
                            color: Theme.of(context).colorScheme.secondary,
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
                            color: Theme.of(context).colorScheme.secondary,
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
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
<<<<<<< HEAD
<<<<<<< HEAD
                            color: theme.colorScheme.secondary.withOpacity(0.5),
=======
                            color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
                            color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
                          ),
                          const SizedBox(height: 16),
                          Text(
                            languageProvider.translate('noScientists'),
<<<<<<< HEAD
<<<<<<< HEAD
                            style: theme.textTheme.titleMedium!.copyWith(
                              color: theme.colorScheme.secondary,
=======
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
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
<<<<<<< HEAD
<<<<<<< HEAD
                                style: TextStyle(
                                  color: theme.colorScheme.primary,
                                ),
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                )
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
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
<<<<<<< HEAD
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
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
<<<<<<< HEAD
<<<<<<< HEAD
            icon: Icon(Icons.add, color: theme.colorScheme.onPrimary),
            label: Text(
              languageProvider.translate('addScientist'),
              style: TextStyle(color: theme.colorScheme.onPrimary),
            ),
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary,
=======
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
            icon: const Icon(Icons.add),
            label: Text(languageProvider.translate('addScientist')),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
<<<<<<< HEAD
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
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
<<<<<<< HEAD
<<<<<<< HEAD
    final theme = Theme.of(context);
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
<<<<<<< HEAD
<<<<<<< HEAD
        title: Text(
          languageProvider.translate('delete'),
          style: TextStyle(color: theme.textTheme.titleLarge!.color),
        ),
        content: Text(
          languageProvider.translate('deleteConfirm'),
          style: TextStyle(color: theme.textTheme.bodyLarge!.color),
        ),
        backgroundColor: theme.dialogTheme.backgroundColor,
=======
        title: Text(languageProvider.translate('delete')),
        content: Text(languageProvider.translate('deleteConfirm')),
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
        title: Text(languageProvider.translate('delete')),
        content: Text(languageProvider.translate('deleteConfirm')),
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              languageProvider.translate('no'),
<<<<<<< HEAD
<<<<<<< HEAD
              style: TextStyle(color: theme.colorScheme.secondary),
=======
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
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
<<<<<<< HEAD
<<<<<<< HEAD
                  backgroundColor: theme.colorScheme.error,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
=======
                  backgroundColor: Theme.of(context).colorScheme.error,
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
                  backgroundColor: Theme.of(context).colorScheme.error,
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
                ),
              );
            },
            style: ElevatedButton.styleFrom(
<<<<<<< HEAD
<<<<<<< HEAD
              backgroundColor: Colors.red,
=======
              backgroundColor: Theme.of(context).colorScheme.error,
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
              backgroundColor: Theme.of(context).colorScheme.error,
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
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
<<<<<<< HEAD
<<<<<<< HEAD
    final theme = Theme.of(context);
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
<<<<<<< HEAD
<<<<<<< HEAD
        title: Text(
          languageProvider.translate('exit'),
          style: TextStyle(color: theme.textTheme.titleLarge!.color),
        ),
=======
        title: Text(languageProvider.translate('exit')),
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
        title: Text(languageProvider.translate('exit')),
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
        content: Text(
          languageProvider.isPersian
              ? 'آیا می‌خواهید از برنامه خارج شوید؟'
              : 'Do you want to exit the app?',
<<<<<<< HEAD
<<<<<<< HEAD
          style: TextStyle(color: theme.textTheme.bodyLarge!.color),
        ),
        backgroundColor: theme.dialogTheme.backgroundColor,
=======
        ),
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
        ),
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
<<<<<<< HEAD
<<<<<<< HEAD
            child: Text(
              languageProvider.translate('no'),
              style: TextStyle(color: theme.colorScheme.secondary),
            ),
=======
            child: Text(languageProvider.translate('no')),
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
            child: Text(languageProvider.translate('no')),
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
<<<<<<< HEAD
<<<<<<< HEAD
=======
              // In production, use proper exit method
              // SystemNavigator.pop();
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
=======
              // In production, use proper exit method
              // SystemNavigator.pop();
>>>>>>> 728eedbecc37ce6069db43da2578513a865ef204
            },
            child: Text(languageProvider.translate('yes')),
          ),
        ],
      ),
    );
  }
}