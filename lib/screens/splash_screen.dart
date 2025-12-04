import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/language_provider.dart';
import '../app/theme_provider.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  final bool fromExit;

  const SplashScreen({super.key, this.fromExit = false});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();

    if (!widget.fromExit) {
      // حالت عادی: پس از 3 ثانیه به صفحه اصلی برو
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      });
    } else {
      // حالت Exit: پس از 3 ثانیه دوباره به صفحه اصلی برگرد
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [
              const Color(0xFF0F0F0F),
              const Color(0xFF1A1A1A),
              const Color(0xFF2D2D2D),
            ]
                : [
              const Color(0xFF6A11CB),
              const Color(0xFF2575FC),
            ],
          ),
        ),
        child: Center(
          child: ScaleTransition(
            scale: _animation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.9),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/Isaac Newton.jpeg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.science,
                          size: 60,
                          color: isDark ? Colors.amber : Colors.deepPurple,
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // App title
                Consumer<LanguageProvider>(
                  builder: (context, languageProvider, child) {
                    return Text(
                      languageProvider.translate('appTitle'),
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    );
                  },
                ),

                const SizedBox(height: 10),

                // Developer info
                Consumer<LanguageProvider>(
                  builder: (context, languageProvider, child) {
                    return Text(
                      languageProvider.translate('developedBy'),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    );
                  },
                ),

                const SizedBox(height: 40),

                // Loading or exit message
                if (!widget.fromExit) ...[
                  Container(
                    width: 100,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(seconds: 3),
                      builder: (context, value, child) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 100 * value,
                            height: 4,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white,
                                  const Color(0xFFE3F2FD),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  Consumer<LanguageProvider>(
                    builder: (context, languageProvider, child) {
                      return Text(
                        languageProvider.isPersian ? 'در حال بارگذاری...' : 'Loading...',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ] else ...[
                  // Exit message
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                    child: Consumer<LanguageProvider>(
                      builder: (context, languageProvider, child) {
                        return Column(
                          children: [
                            Icon(
                              Icons.exit_to_app,
                              size: 40,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              languageProvider.isPersian
                                  ? 'در حال خروج از برنامه...'
                                  : 'Exiting application...',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              languageProvider.isPersian
                                  ? 'در حال بازگشت به برنامه...'
                                  : 'Returning to application...',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}