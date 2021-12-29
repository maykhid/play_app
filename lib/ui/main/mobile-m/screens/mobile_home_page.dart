import 'package:flutter/material.dart';
import 'package:play_app/app/app_constants/color_const.dart';
import 'package:play_app/app/app_dimens.dart';
import 'package:play_app/data/bloc_provider/bloc_provider.dart';
import 'package:play_app/data/local_storage/moor_db/tables.dart';
import 'package:play_app/ui/blocs/get_generated_team_bloc.dart';
import 'package:play_app/ui/widget/create_team_card.dart';
import 'package:play_app/ui/widget/team_card.dart';

class MobilePage extends StatefulWidget {
  const MobilePage({
    Key? key,
    this.isXl = true,
  }) : super(key: key);

  final bool isXl;

  @override
  State<MobilePage> createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  final _bloc = GeneratedTeamBloc();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _bloc.getTeam();
  }

  List<Widget> _constructList(
      BuildContext context, AsyncSnapshot<List<Team>> snapshot) {
    var listConstruct = <Widget>[
      CreateTeamCard(
        isXl: widget.isXl,
      ),
    ];
    for (int i = 0; i < snapshot.data!.length; i++) {
      if (listConstruct.length <= 3) {
        listConstruct.removeLast();
        listConstruct.add(
          TeamCard(
            team: snapshot.data![i],
            isXl: widget.isXl,
          ),
        );
        listConstruct.add(
          CreateTeamCard(
            isXl: widget.isXl,
          ),
        );
        if (listConstruct.length == 4) {
          listConstruct.removeLast();
        }
      }
    }
    return listConstruct;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _bloc,
      child: StreamBuilder<List<Team>>(
        stream: _bloc.getStoredTeamStream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Container(
              height: 700,
              color: AppColors.greyBg,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: _constructList(context, snapshot),
              ),
              // child: ListView.separated(
              //   shrinkWrap: true,
              //   scrollDirection: Axis.horizontal,
              //   itemCount: snapshot.data!.length,
              //   separatorBuilder: (context, index) {
              //     return const SizedBox(
              //       height: 0,
              //     );
              //   },
              //   itemBuilder: (context, index) {
              //     return CreateTeamCard(isXl: widget.isXl);
              //   },
              // ),
              // (
              //   shrinkWrap: true,
              //   scrollDirection: Axis.horizontal,
              //   children: [
              //     TeamCard(isXl: widget.isXl),
              //     CreateTeamCard(isXl: widget.isXl),
              //   ],
              // ),
            );
          }
          return SizedBox(
            height: 700,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: const [
               Center(child: CircularProgressIndicator(color: AppColors.green)),
              ],
            ),
          );
        },
      ),
    );
  }
}
