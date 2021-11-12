import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_app/app/app_constants/color_const.dart';
import 'package:play_app/app/app_dimens.dart';
import 'package:play_app/data/bloc_provider/bloc_provider.dart';
import 'package:play_app/data/model/response/players_response.dart' as response;
import 'package:play_app/ui/blocs/player_screen_bloc.dart';
import 'package:play_app/ui/widget/player_list_widget.dart';

class PlayerScreenXl extends StatefulWidget {
  const PlayerScreenXl({Key? key}) : super(key: key);

  @override
  _PlayerScreenXlState createState() => _PlayerScreenXlState();
}

class _PlayerScreenXlState extends State<PlayerScreenXl> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.getPlayers();
  }

  final _bloc = PlayerScreenBloc();

  @override
  Widget build(BuildContext context) {
    var _dimens = AppDimensions(context: context);

    return BlocProvider(
      bloc: _bloc,
      child: Container(
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
                                color: Colors.black,
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
                SingleChildScrollView(
                  // scrollDirection: Axis.horizontal,
                  child: SizedBox(
                      height: _dimens.height * 0.6,
                      child: StreamBuilder<response.PlayersResponse>(
                          stream: _bloc.getPlayersStream,
                          builder: (context, players) {
                            if (players.hasData) {
                              if (players.data!.players!.isNotEmpty) {
                                return ListView.builder(
                                  itemCount: players.data!.players!.length,
                                  itemBuilder: (context, index) {
                                    return PlayerListWidget(
                                      dimens: _dimens,
                                      player: players.data!.players![index],
                                    );
                                  },
                                );
                              }
                            } else if (players.hasError) {
                              return Container(
                                height: _dimens.height * 0.70,
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Unable to fetch players',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                ),
                              );
                            }
                            return const Center(
                              child: SizedBox(
                                child: CupertinoActivityIndicator(),
                              ),
                            );
                          })),
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
                            children: const [],
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
      ),
    );
  }
}
