import 'package:flutter/material.dart';
import 'package:play_app/data/bloc_provider/bloc.dart';
import 'package:play_app/ui/widget/create_team_card.dart';
import 'package:play_app/ui/widget/team_card.dart';

class HomePageBloc extends Bloc {

  List<Widget> widgets = [const TeamCard(), const TeamCard(), const CreateTeamCard(),];

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

}