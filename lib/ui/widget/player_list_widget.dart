import 'package:flutter/material.dart';
import 'package:play_app/app/app_constants/color_const.dart';
import 'package:play_app/app/app_dimens.dart';
import 'package:play_app/data/model/response/players_response.dart' as response;

class PlayerListWidget extends StatelessWidget {
  const PlayerListWidget(
      {Key? key,
      required AppDimensions dimens,
      required response.Player player})
      : _dimens = dimens,
        _player = player,
        super(key: key);

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
            CircleAvatar(
              child: Image.network(_player.profileImage!.url.toString(), fit: BoxFit.contain),
            ),

            // fav icon
            Padding(
              padding: EdgeInsets.all(_dimens.width * 0.6 * 0.01),
              child: Image.asset('assets/icons/star-icon.png'),
            ),

            // pos-name
            SizedBox(
              // color: AppColors.black,
              width: 130,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      _player.positionAbbreviation.toString(),
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 10,
                    color: AppColors.greyBg,
                  ),
                  SizedBox(
                    width: 80,
                    child: Text(
                      _player.displayName.toString(),
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              width: _dimens.width * 0.6 * 0.1,
            ),

            // Q-R-99.9%-0000
            SizedBox(
              width: 230,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  QRwidget(letter: 'Q'),
                  QRwidget(letter: 'R'),
                  Text(
                    '99.9%',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '0000',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              width: _dimens.width * 0.6 * 0.15,
            ),

            // amount
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.greyBg,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              width: 120,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$00.0M',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      Text('\$00.0M',
                          style: TextStyle(
                              color: AppColors.green,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Container(
                    color: AppColors.greyBg,
                    width: 100,
                    height: 10,
                  ),
                ],
              ),
            ),

            SizedBox(
              width: _dimens.width * 0.6 * 0.015,
            ),

            // container
            Container(
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.greyBg,),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Image.asset('assets/icons/plus-icon.png'),
            ),
          ],
        ),
      ),
    );
  }
}

class QRwidget extends StatelessWidget {
  final String letter;
  QRwidget({required this.letter});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35,
      // height: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(letter),
          Container(
            width: 20,
            height: 10,
            color: AppColors.greyBg,
          ),
        ],
      ),
    );
  }
}
