import 'package:flutter/material.dart';

class CcSettingsMenuTile extends StatelessWidget {
  const CcSettingsMenuTile({
    super.key,
    required this.icon,
    required this.title,
    // required this.subtitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title;
  // final String subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: Colors.blue.shade700),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      // subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
