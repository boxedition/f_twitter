import "package:flutter/material.dart";

/***
 * MySettingsTile
 * 
 * Dado que o widget vai ser reutilizado várias vezes como "TILE"/"Button" na SettingsPage.
 * -----------------------------------
 * Propriedades:
 * 
 * - Titulo
 * - Action
 * 
 */

class MySettingsTile extends StatelessWidget {
  final String title;
  final Widget action;

  const MySettingsTile({
    super.key,
    required this.title,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          //Rounded Corners
          borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.only(left: 25, right: 25, top: 10),
      //Padding Inside
      padding: EdgeInsets.all(25),
      //Row
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          action,
        ],
      ),
    );
  }
}
