import 'package:flutter/material.dart';

import '../../core/app_export.dart';

enum Style { bgFill_1, bgOutline, bgFill }

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar(
      {Key? key,
      this.height,
      this.styleType,
      this.leadingWidth,
      this.leading,
      this.title,
      this.centerTitle,
      this.actions})
      : super(
          key: key,
        );

  final double? height;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 105.v,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        SizeUtils.width,
        height ?? 95.v,
      );
  _getStyle() {
    switch (styleType) {
      case Style.bgFill_1:
        return Stack(
          children: [
            Container(
              height: 92.v,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.h),
                  bottomRight: Radius.circular(15.h),
                ),
              ),
            ),
            Container(
              height: 45.v,
              width: 317.h,
              margin: EdgeInsets.fromLTRB(30.h, 35.v, 22.h, 19.v),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: appTheme.gray300,
                    width: 1.h,
                  ),
                ),
              ),
            )
          ],
        );
      case Style.bgOutline:
        return Container(
          height: 42.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            border: Border(
              bottom: BorderSide(
                color: theme.colorScheme.onPrimaryContainer,
                width: 1.h,
              ),
            ),
          ),
        );
      case Style.bgFill:
        return Stack(
          children: [
            Container(
              height: 105.v,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(
                  20.h,
                ),
              ),
            ),
            Container(
              height: 42.v,
              width: 296.h,
              margin: EdgeInsets.fromLTRB(27.h, 23.v, 37.h, 40.v),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: theme.colorScheme.onPrimaryContainer,
                    width: 1.h,
                  ),
                ),
              ),
            )
          ],
        );
      default:
        return null;
    }
  }
}
