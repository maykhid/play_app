import 'package:flutter/material.dart';
import 'package:play_app/app/app_constants/color_const.dart';
import 'package:play_app/data/local_storage/moor_db/tables.dart';
import 'package:play_app/data/model/response/players_response.dart'
    as playerResponse;
import 'package:play_app/ui/widget/popup_display.dart';

class TeamCard extends StatelessWidget {
  const TeamCard({
    Key? key,
    this.isXl = false,
    this.team,
  }) : super(key: key);

  final bool isXl;
  final Team? team;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Container(
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
              width: 35,
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
                  height: isXl ? 410 : 600,
                  width: isXl ? 300 : 400,
                  color: AppColors.greyBlackBg,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 100),

                      SizedBox(
                        height: isXl ? 150 : 250,
                        width: isXl ? 300 : 350,
                        child: Image.asset(
                          'assets/images/bg-art.png',
                          fit: BoxFit.fill,
                        ),
                      ),

                      const SizedBox(height: 100),

                      // playon img
                      Image.asset('assets/images/logo-text.png'),
                    ],
                  ),
                ),

                // player formation card
                Column(
                  children: [
                    // first row
                    Row(
                      children: [
                        PlayerFormationCard(
                          players: team!.players.players![0],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        PlayerFormationCard(
                          players: team!.players.players![1],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        PlayerFormationCard(
                          players: team!.players.players![2],
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // second row
                    Row(
                      children: [
                        PlayerFormationCard(
                          players: team!.players.players![3],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        PlayerFormationCard(players: team!.players.players![4]),
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    // third row
                    Row(
                      children: [
                        PlayerFormationCard(players: team!.players.players![5]),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerFormationCard extends StatelessWidget {
  const PlayerFormationCard({
    Key? key,
    required this.players,
  }) : super(key: key);
  final playerResponse.Player players;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
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
                        Text(
                          players.displayName!,
                          style: const TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // player pos
                        Container(
                          height: 20,
                          width: 100,
                          color: AppColors.greyBg,
                          child: Center(
                            child: Text(
                              players.positionAbbreviation!,
                              style: const TextStyle(
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
                                children: [
                                  Text(
                                    '\$${players.price!.toString()}M',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                  Text(
                                    '\$${players.weeklyPriceChange.toString()}M',
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
    );
  }
}
