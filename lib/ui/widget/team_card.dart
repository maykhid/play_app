import 'package:flutter/material.dart';
import 'package:play_app/app/app_constants/color_const.dart';
import 'package:play_app/ui/widget/popup_display.dart';

class TeamCard extends StatelessWidget {
  const TeamCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 48,
            width: 30,
            decoration: const BoxDecoration(
              color: AppColors.greyBlackBg,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              //bg with img
              Container(
                height: 410,
                width: 300,
                color: AppColors.greyBlackBg,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 100),

                    SizedBox(
                      height: 150,
                      width: 300,
                      child: Image.asset('assets/images/bg-art.png'),
                    ),

                    const SizedBox(height: 100),

                    // playon img
                    Image.asset('assets/images/logo-text.png'),
                  ],
                ),
              ),

              // player formation card
              InkWell(
                onTap: () {
                  showDialog(context: context, builder: (BuildContext context) {
                    return const PopupMenu();
                  });
                },
                child: Stack(
                  alignment: const FractionalOffset(0.9, -0.2),
                  children: [
                    Container(
                      height: 105,
                      width: 80,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: SizedBox(
                              height: 60,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  // player name
                                  const Text(
                                    'PLAYER NAME',
                                    style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // player pos
                                  Container(
                                    height: 20,
                                    width: 100,
                                    color: AppColors.greyBg,
                                    child: const Center(
                                      child: Text(
                                        'DR',
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.greyBg,
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                      
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              '\$00.0M',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10),
                                            ),
                                            Text(
                                              '\$0.0M',
                                              style: TextStyle(
                                                  color: AppColors.green,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10),
                                            ),
                                          ],
                                        ),
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
              
                    // offsetted container
                    Container(
                      height: 45,
                      width: 45,
                      color: AppColors.greyBg,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
