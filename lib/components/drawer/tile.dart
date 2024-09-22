import 'package:flutter/material.dart';

/// *
/// MyDrawerTile
///
/// Dado que o widget vai ser reutilizado várias vezes como "TILE"/"Button"  no MyDrawer.
/// -----------------------------------
/// Propriedades:
///
/// - Titulo
/// - Icon
/// - Function/CallBack
///

class MyDrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  const MyDrawerTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            color: Theme.of(context)
                .colorScheme
                .inversePrimary), //inversePrimary => Contraste para Texto
      ),
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
      ),
      onTap: onTap,
      onLongPress: () {
        print("onLongPress");
      },
    );
  }
}
