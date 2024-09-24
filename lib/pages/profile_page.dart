import 'package:flutter/material.dart';
import 'package:flutter_twitter/components/box/bio.dart';
import 'package:flutter_twitter/components/inputs/alert.dart';
import 'package:flutter_twitter/models/user.dart';
import 'package:flutter_twitter/services/auth/database/provider.dart';
import 'package:flutter_twitter/services/auth/service.dart';
import 'package:provider/provider.dart';

/// Profile Page
///
/// This is a profile page for a give uid (user)

class ProfilePage extends StatefulWidget {
  final String uid;

  const ProfilePage({super.key, required this.uid});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final databaseProvider =
      Provider.of<DatabaseProvider>(context, listen: false);

  // User info
  UserProfile? user;
  String currentUserId = AuthService().getCurrentUid();

  final bioTextController = TextEditingController();

  // Loading...
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Load user info
    loadUser();
  }

  Future<void> loadUser() async {
    user = await databaseProvider.userProfile(widget.uid);

    setState(() {
      _isLoading = false;
    });
  }

  void _showEditBioBox() {
    showDialog(
      context: context,
      builder: (context) => InputAlertBox(
        textController: bioTextController,
        hintText: "Edit Bio...",
        onPressedText: "Salvar",
        onPressed: saveBio,
      ),
    );
  }

  Future<void> saveBio() async {
    setState(() {
      _isLoading = true;
    });

    // Update Bio
    await databaseProvider.updateBio(bioTextController.text);

    // Reload User
    await loadUser();

    setState(() {
      _isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(_isLoading ? '' : user!.name),
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            // Username handle
            Center(
              child: Text(
                _isLoading ? '' : '@' + user!.username,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            // Profile picture
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.person,
                  size: 72,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            // Profile stats => number of posts / followers / following

            // follow / unfollow

            // Bio box
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bio",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: _showEditBioBox,
                  child: Icon(Icons.settings,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            BioBox(
              text: _isLoading ? '...' : user!.bio,
            ),
            // List of posts from user
          ],
        ),
      ),
    );
  }
}
