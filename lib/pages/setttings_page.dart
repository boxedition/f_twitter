import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitter/components/settings/tile.dart';
import 'package:flutter_twitter/themes/theme_provider.dart';
import 'package:provider/provider.dart';

/// *
/// Settings Page
///
/// - Dark mode
/// - Utilizadores Bloquiados
/// - Configuraçao de Conta
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          //Dark mode Switch
          MySettingsTile(
            title: "Dark Mode",
            action: CupertinoSwitch(
              onChanged: (value) =>
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme(),
              value:
                  Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
            ),
          )
          //Utilizadores Bloquiados

          //Configuraçao da Conta
        ],
      ),
    );
  }
}
