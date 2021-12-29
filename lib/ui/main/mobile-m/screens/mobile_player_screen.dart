import 'package:flutter/material.dart';
import 'package:play_app/app/app_constants/color_const.dart';
import 'package:play_app/app/app_dimens.dart';
import 'package:play_app/ui/widget/player_list_widget.dart';

class MobilePlayerPage extends StatefulWidget {
  const MobilePlayerPage({Key? key}) : super(key: key);

  @override
  _MobilePlayerPageState createState() => _MobilePlayerPageState();
}

class _MobilePlayerPageState extends State<MobilePlayerPage> {
  @override
  Widget build(BuildContext context) {
    var _dimens = AppDimensions(context: context);
    return SizedBox(
      height: _dimens.height,
      width: _dimens.width,
      child: Column(
        children: [
          Container(
            width: _dimens.width,
            height: 70,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: AppColors.greyBg,
                  width: 1.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: _dimens.width,
              // color: Colors.black,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListPlayerWidget(dimens: _dimens);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListPlayerWidget extends StatelessWidget {
  const ListPlayerWidget({
    Key? key,
    required AppDimensions dimens,
  })  : _dimens = dimens,
        super(key: key);

  final AppDimensions _dimens;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _dimens.width,
      height: 120,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.greyBg,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlign,
        children: [
          // circle avatar
          const CircleAvatar(
            radius: 25,
          ),

          // player details
          SizedBox(
            // color: Colors.red,
            height: 100,
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FirstItemOnColumn(),
                SizedBox(height: 30),
                SizedBox(
                  width: 125,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      QRwidget(letter: 'Q'),
                      const SizedBox(
                        width: 5,
                      ),
                      QRwidget(letter: 'R'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      '99.9%',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 25),
                    Text(
                      '0000',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // amount section
          Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.greyBg,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              width: 80,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  
                      Text(
                        '\$00.0M',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text('\$0.0M',
                          style: TextStyle(
                              color: AppColors.green,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                    
                  Container(
                    color: AppColors.greyBg,
                    width: 60,
                    height: 10,
                  ),
                ],
              ),
            ),

          // plus
          Container(
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.greyBg,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Image.asset('assets/icons/plus-icon.png'),
          ),
        ],
      ),
    );
  }
}

class FirstItemOnColumn extends StatelessWidget {
  const FirstItemOnColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 20,
      child: Row(
        children: [
          // fav icon
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset('assets/icons/star-icon.png'),
          ),

          // pos-name
          SizedBox(
            // color: AppColors.black,
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    'DR',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                Container(
                  width: 25,
                  height: 15,
                  color: AppColors.greyBg,
                ),
                SizedBox(
                  width: 70,
                  child: Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
