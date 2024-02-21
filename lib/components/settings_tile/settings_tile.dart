import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Widget title;
  final Widget? subTitle;

  const SettingsTile({
    super.key,
    required this.title,
    this.subTitle,
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
        title: DefaultTextStyle.merge(
          child: title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: subTitle == null
            ? null
            : DefaultTextStyle.merge(
                child: subTitle!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
        trailing: trailing,
      ),
    );
  }
}
