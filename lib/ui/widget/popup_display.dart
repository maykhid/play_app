import 'package:flutter/material.dart';
import 'package:play_app/app/app_constants/color_const.dart';

class PopupMenu extends StatefulWidget {
  const PopupMenu({Key? key}) : super(key: key);

  @override
  _PopupMenuState createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(height: 500, width: 200, color: AppColors.blue),
    );
  }
}
