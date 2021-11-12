import 'package:flutter/material.dart';
import 'package:play_app/app/app_constants/color_const.dart';

class PopupMenu extends StatefulWidget {
  const PopupMenu({Key? key}) : super(key: key);

  @override
  _PopupMenuState createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dialog(
        backgroundColor: AppColors.blue,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
        child: Container(
          height: 400,
          width: 20,
          padding: const EdgeInsets.all(8.0),
          
          decoration: const BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // close // logo
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // close
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.close,
                        size: 18.0,
                        color: AppColors.white,
                      ),
                    ),
                  ),
        
                  // SizedBox(width: 60),
        
                  // logo
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/logo-text.png',
                        height: 40, width: 40, fit: BoxFit.fitWidth),
                  ),
                ],
              ),
        
              // image
              Container(height: 80, width: 60, color: AppColors.greyBg),
        
              const SizedBox(height: 8),
        
              // Name
              const Text(
                'Name',
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
        
              const SizedBox(height: 8),
        
              // surname
              const Text(
                'Surname',
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
        
              const SizedBox(height:8),
        
              // driver
              Container(
                width: 30.0,
                child: const Center(
                  child: Text(
                    'DRIVER',
                    style: TextStyle(fontSize: 8),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: AppColors.white,
                ),
              ),
        
              const SizedBox(height: 8),
        
              // money
              const Text(
                '\$0.00M',
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
        
              const SizedBox(height: 15),
        
              // add fav
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // fave icon
                  Icon(Icons.star_border, size: 12, color: AppColors.white,),
                  SizedBox(width: 5,),
                  // fav text
                  Text(
                    'Add Favourite',
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
        
              const SizedBox(height: 15),
        
              // player stats...
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  //
                  Text('Player Status', style: TextStyle(color: AppColors.white, fontSize: 10,),),
        
                  SizedBox(height: 12),
                  //
                  Text('Injured', style: TextStyle(color: AppColors.white, fontSize: 10,),),
                ],
              ),
        
              const SizedBox(height: 12),
        
              //streaks
              Row(
                children: const [
                  Text('Streaks', style: TextStyle(color: AppColors.white, fontSize: 10,),),
                ],
              ),
        
              const SizedBox(height: 12),
        
              // season
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Season', style: TextStyle(color: AppColors.white, fontSize: 10,),),
                  Text('- \$0.00M', style: TextStyle(color: AppColors.green, fontSize: 10,),)
                ],
              ),
        
              const SizedBox(height: 12),
        
              // Gamework
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Gameweek', style: TextStyle(color: AppColors.white, fontSize: 10,),),
                  Text('- \$0.00M', style: TextStyle(color: AppColors.green, fontSize: 10,),),
                ],
              ),
        
              const SizedBox(height: 12),
        
              // sentiment
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Setiment', style: TextStyle(color: AppColors.white, fontSize: 10,),),
                  Text('- \$0.00M'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
