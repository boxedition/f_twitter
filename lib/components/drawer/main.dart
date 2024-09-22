import 'package:flutter/material.dart';
import 'package:flutter_twitter/components/drawer/tile.dart';
import 'package:flutter_twitter/pages/setttings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  //Build UI
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              //Logo
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Icon(
                  Icons.person,
                  size: 72,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Divider(
                color: Theme.of(context).colorScheme.secondary,
              ),

              //Home Link
              MyDrawerTile(
                title: "Home",
                icon: Icons.home,
                onTap: () {
                  // Pop Navigator
                  Navigator.pop(context);
                },
              ),
              MyDrawerTile(
                title: "Settings",
                icon: Icons.settings,
                onTap: () {
                  // Pop Navigator
                  Navigator.pop(context);

                  //Route to new Page
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ));
                },
              ),

              //Settings Link
              //Logout
              //...
            ],
          ),
        ),
      ),
    );
  }
}
