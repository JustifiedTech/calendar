import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile(
      {Key? key,
      this.lead,
      this.subtitle,
      this.title,
      required this.onTap,
      this.tail})
      : super(key: key);

  final String? title, subtitle;
  final Widget? lead, tail;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: lead!,
      title: Text(
        title!,
        style: TextStyle(
            fontFamily: 'Muli', fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle!,
        style: TextStyle(fontSize: 12),
      ),
      trailing: tail!,
      onTap: onTap,
    );
  }
}
