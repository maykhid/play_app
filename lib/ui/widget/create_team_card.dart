import 'package:flutter/material.dart';
import 'package:play_app/app/app_constants/color_const.dart';
import 'package:play_app/ui/blocs/create_team_bloc.dart';

class CreateTeamCard extends StatefulWidget {
  const CreateTeamCard({
    Key? key,
    this.isXl = false,
  }) : super(key: key);

  final bool isXl;

  @override
  State<CreateTeamCard> createState() => _CreateTeamCardState();
}

class _CreateTeamCardState extends State<CreateTeamCard> {
  @override
  void initState() {
    super.initState();
  }

  final _bloc = CreateTeamBloc();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Container(
        height: widget.isXl ? 500 : 600,
        width: widget.isXl ? 300 : 400,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        // button
        child: Center(
          child: InkWell(
            onTap: () => _bloc.createTeam(),
            child: Container(
              width: 100,
              height: 35,
              decoration: const BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: const Center(
                  child: Text(
                'Create Team',
                style: TextStyle(color: AppColors.white),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
