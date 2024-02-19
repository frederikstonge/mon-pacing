import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final String title;
  final String subTitle;

  const SettingsTile({
    super.key,
    required this.title,
    required this.subTitle,
    this.leading,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        isThreeLine: false,
        leading: leading,
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          subTitle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: trailing,
      ),
    );
  }
}
