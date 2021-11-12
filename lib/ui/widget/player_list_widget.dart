
import 'package:flutter/material.dart';
import 'package:play_app/app/app_constants/color_const.dart';
import 'package:play_app/app/app_dimens.dart';
import 'package:play_app/data/model/response/players_response.dart' as response;

class PlayerListWidget extends StatelessWidget {
  const PlayerListWidget({
    Key? key,
    required AppDimensions dimens,
    required response.Player player
  }) : _dimens = dimens, _player = player, super(key: key);

  final AppDimensions _dimens;
  final response.Player _player;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        width: _dimens.width * 0.6,
        // color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // circle avatar
            CircleAvatar(),

            // fav icon
            Padding(
              padding: EdgeInsets.all(_dimens.width * 0.6 * 0.01),
              child: Image.asset('assets/icons/star-icon.png'),
            ),


            // pos-name
            Container(
              color: AppColors.black,
              width: _dimens.width * 0.6 * 0.15,
            ),

            SizedBox(width: _dimens.width * 0.6 * 0.1,),

            // Q-R-99.9%-0000
            Container(
              color: AppColors.green,
              width: _dimens.width * 0.6 * 0.35,
            ),

            SizedBox(width: _dimens.width * 0.6 * 0.15,),

            // amount
            Container(
              color: AppColors.blue,
              width: _dimens.width * 0.6 * 0.18,
            ),

            SizedBox(width: _dimens.width * 0.6 * 0.015,),

            // container
            Container(
              color: AppColors.blueGrey,
              width: _dimens.width * 0.6 * 0.06,
            ),
          ],
        ),
      ),
    );
  }
}
