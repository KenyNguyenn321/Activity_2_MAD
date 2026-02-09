import 'package:flutter/material.dart';

void main() {
  runApp(const RunMyApp());
}

// Root widget that controls app-level theme state
class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  // Tracks the current theme mode
  ThemeMode _themeMode = ThemeMode.system;

  // Updates the theme using setState
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Keny Nguyen - Theme Demo',

      // Light theme configuration
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey[200],
      ),

      // Dark theme configuration
      darkTheme: ThemeData.dark(),

      // Applies the selected theme mode
      themeMode: _themeMode,

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Keny Nguyen - Theme Demo'),
        ),

        // Main page content
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Information card
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      children: [
                        // App icon
                        Icon(
                          Icons.phone_android,
                          size: 44,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(height: 12),

                        // Main title text
                        Text(
                          'Mobile App Development\nTesting',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 8),

                        // Subtitle text
                        Text(
                          'Demonstrating theme switching\nwith smooth animations',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // Theme settings card
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        // Section header
                        Text(
                          'Theme Settings',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 14),

                        // Animated container for smooth transitions
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 18,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.black.withOpacity(0.15)
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Column(
                            children: [
                              // Theme toggle row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.wb_sunny,
                                    size: 30,
                                    color: _themeMode == ThemeMode.dark
                                        ? Colors.grey
                                        : Colors.amber,
                                  ),
                                  const SizedBox(width: 14),

                                  // Switch to toggle theme mode
                                  Switch(
                                    value: _themeMode == ThemeMode.dark,
                                    onChanged: (isDark) {
                                      changeTheme(isDark
                                          ? ThemeMode.dark
                                          : ThemeMode.light);
                                    },
                                  ),
                                  const SizedBox(width: 14),

                                  Icon(
                                    Icons.nightlight_round,
                                    size: 30,
                                    color: _themeMode == ThemeMode.dark
                                        ? Colors.amber
                                        : Colors.grey,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),

                              // Current theme label
                              Text(
                                _themeMode == ThemeMode.dark
                                    ? 'Dark Mode'
                                    : 'Light Mode',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
