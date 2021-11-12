import 'package:flutter/material.dart';
import 'package:play_app/app/app_constants/color_const.dart';
import 'package:play_app/app/app_dimens.dart';

class PlayerScreenXl extends StatefulWidget {
  const PlayerScreenXl({Key? key}) : super(key: key);

  @override
  _PlayerScreenXlState createState() => _PlayerScreenXlState();
}

class _PlayerScreenXlState extends State<PlayerScreenXl> {
  @override
  Widget build(BuildContext context) {
    var _dimens = AppDimensions(context: context);
    return Container(
      width: _dimens.width,
      height: _dimens.height,
      color: AppColors.greyBg,
      child: Center(
        child: Container(
          width: _dimens.width * 0.7,
          height: _dimens.height * 0.72,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // controls
              SizedBox(
                width: _dimens.width * 0.7,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // search
                      const Icon(
                        Icons.search,
                      ),

                      // filter op
                      SizedBox(
                        child: Row(
                          children: [
                            Container(
                              height: 20,
                              width: _dimens.width * 0.6 * 0.2,
                              color:  Colors.black,
                            ),
                          ],
                        ),
                      ),

                      // fav, filter, info
                      SizedBox(
                        width: _dimens.width * 0.6 * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/icons/star-icon.png'),
                            Image.asset('assets/icons/filter.png'),
                            Image.asset('assets/icons/info-icon.png'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // list
              SizedBox(
                height: _dimens.height * 0.6,
                child: ListView.builder(itemBuilder: (context, index) {
                  return PlayerListWidget(dimens: _dimens);
                }),
              ),

              SizedBox(
                // color: Colors.blue,
                width: _dimens.width * 0.7,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // hide list
                      SizedBox(
                        width: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/icons/arrow-head-down.png'),
                            // Icon(Icons.arrow_drop_down_sharp),
                            const Text(
                              'Hide list',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),

                      //
                      Container(
                        width: _dimens.width * 0.6 * 0.25,
                        height: 25,
                        color: Colors.black,
                        child: Row(
                          children: [
                            
                          ],
                        ),
                      ),

                      // back
                      SizedBox(
                        width: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/icons/undo-left-icon.png'),
                            Image.asset('assets/icons/undo-right-icon.png'), 
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlayerListWidget extends StatelessWidget {
  const PlayerListWidget({
    Key? key,
    required AppDimensions dimens,
  }) : _dimens = dimens, super(key: key);

  final AppDimensions _dimens;

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
