import 'package:flutter/material.dart';
import 'package:play_app/app/app_constants/color_const.dart';

class CreateTeamCard extends StatelessWidget {
  const CreateTeamCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 300,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      // button
      child: Center(
        child: Container(
          width: 100,
          height: 35,
          decoration: const BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: const Center(child: Text('Create Team', style: TextStyle(color: AppColors.white),)),
        ),
      ),
    );
  }
}