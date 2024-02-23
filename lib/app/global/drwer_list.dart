import 'package:cite3/app/core/values/colors.dart';
import 'package:flutter/material.dart';

import 'text_widget.dart';
 
class DrawerList extends StatefulWidget {
  const DrawerList({
    super.key,
    this.onTap,
    required this.icon,
    required this.title,
  });
  final void Function()? onTap;
  final IconData icon;
  final String title;
  @override
  State<DrawerList> createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,
      splashColor: blue,
      leading: Icon(
        widget.icon,
        size: 20.0,
      ),
      title: CustomText(
        title: widget.title,
        size: 14.0,
        color: blue,
      ),
      trailing: const Icon(Icons.navigate_next),
    );
  }
}
