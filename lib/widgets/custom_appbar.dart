import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.onCallBack,
    this.leadingVisible = false,
    this.actions,
    this.centerTitle,
    this.backgroundColor,
    this.titleSpacing,
  });

  final String title;
  final VoidCallback? onCallBack;
  final bool leadingVisible;
  final List<Widget>? actions;
  final bool? centerTitle;
  final Color? backgroundColor;
  final double? titleSpacing;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: leadingVisible
          ? null
          : Padding(
              padding: EdgeInsets.all(6),
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 15,
                  child: Icon(
                    Icons.arrow_back,
                    size: 24,
                  ),
                ),
              ),
            ),
      backgroundColor: backgroundColor ?? Colors.white,
      titleSpacing: titleSpacing ?? (leadingVisible == true ? 20 : 10),
      centerTitle: centerTitle,
      title: Text(title,
          style: TextStyle(
            color: Colors.black87,
          )),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
