import 'package:flutter/material.dart';
import 'package:play_app/app/app_constants/color_const.dart';
import 'package:play_app/app/app_dimens.dart';
import 'package:play_app/ui/blocs/home_page_bloc.dart';
import 'package:play_app/ui/widget/create_team_card.dart';
import 'package:play_app/ui/widget/team_card.dart';

class TabXlPage extends StatelessWidget {
  const TabXlPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _dimens = AppDimensions(context: context);
    HomePageBloc hmb = HomePageBloc();
    return Container(
      width: _dimens.width,
      height: _dimens.height,
      color: AppColors.greyBg,
      child: Center(
        child: SizedBox(
          width: _dimens.width * 0.75,
          height: _dimens.height * 0.72,
          child: Row(
            children: hmb.widgets,
          )
        ),
      ),
    );
  }
}

// Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: const [
//           // create team card
//           CreateTeamCard(),
      
//           SizedBox(
//             width: 30,
//           ),
//           // team card
//           TeamCard(),
//         ],
//       ),