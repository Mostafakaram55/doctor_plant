
import 'package:doctor_plant/Fetutres/settingsView/presentation/presentation/view/chat_pot/body_chat.dart';
import 'package:doctor_plant/core/Network/chang_mode_cubit.dart';
import 'package:doctor_plant/core/resources/change_states.dart';
import 'package:doctor_plant/core/resources/color_Manager.dart';
import 'package:doctor_plant/core/resources/icons.dart';
import 'package:doctor_plant/core/resources/text_Manager.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/resources/chang_theme_bloc.dart';
import 'custom_item_settings.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        SafeArea(child: SizedBox(
          height: AppSize.s12.sp,
        )),
        Center(
            child: Text(
                TextManager.settings,
              style: GoogleFonts.montserrat(
                color: Theme.of(context).disabledColor,
                fontSize: AppSize.s20.sp,
                fontWeight: FontWeight.bold
              ),
            )
        ),
        Divider(
          height: AppSize.s30.sp,
          thickness: 1,
        ),
        BlocConsumer<ChangeAppMode,ChangeStates>(
          listener: (context,state){},
          builder: (context, state) {
            return Card(
              elevation: 0,
              color: Theme.of(context).primaryColor,
              child: CustomItemSetting(
                title: 'Dark Mode',
                iconData:Icons.dark_mode,
                widget: FlutterSwitch(
                  width: AppSize.s60.w,
                  height: AppSize.s30.h,
                  value: ChangeAppMode.get(context).isDark,
                  onToggle:(v){
                    ChangeAppMode.get(context).changeMode();
                  },
                  activeColor: ColorManager.buttonColor,
                )
              ),
            );
          },
        ),
        Card(
          elevation: 0,
          color: Theme.of(context).primaryColor,
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
            },
            child: CustomItemSetting(
              title: 'Chat Bot',
              iconData:IconBroken.Chat,
              widget: Icon(
              Icons.arrow_forward_ios,
                color: ColorManager.buttonColor,
                size: AppSize.s30.sp,            ),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            openLink('https://www.facebook.com/profile.php?id=100006963885860&mibextid=ZbWKwL');
          },
          child: Card(
            elevation: 0,
            color: Theme.of(context).primaryColor,
            child: CustomItemSetting(
              title: 'Contact Me',
              iconData:IconBroken.Message,
              widget: Icon(
                Icons.arrow_forward_ios,
                color: ColorManager.buttonColor,
                size: AppSize.s30.sp,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            // DropdownButton(
            //   value: true,
            //   onChanged: (value){
            //     print('ok');
            //   },
            //   items: const [
            //     DropdownMenuItem(child: Text('ar')),
            //     DropdownMenuItem(child: Text('En'))
            //   ],
            // );
          },
          child: Card(
            elevation: 0,
            color: Theme.of(context).primaryColor,
            child: CustomItemSetting(
              title: 'Language',
              iconData:Icons.language,
              widget: Icon(
                IconBroken.Arrow___Down,
                color: ColorManager.buttonColor,
                size: AppSize.s30.sp,
              ),
            ),
          ),
        ),
        Card(
          elevation: 0,
          color: Theme.of(context).primaryColor,
          child: CustomItemSetting(
            title: 'What is a plant doctor?',
            iconData:Icons.warning,
            widget: Icon(
              IconBroken.Arrow___Down,
              color: ColorManager.buttonColor,
              size: AppSize.s30.sp,
            ),
          ),
        ),
        Card(
          elevation: 0,
          color: Theme.of(context).primaryColor,
          child: CustomItemSetting(
            title: 'Types of plant diseases',
            iconData:Icons.warning,
            widget: Icon(
              IconBroken.Arrow___Down,
              color: ColorManager.buttonColor,
              size: AppSize.s30.sp,
            ),
          ),
        ),
        Card(
          elevation: 0,
          color: Theme.of(context).primaryColor,
          child: InkWell(
            onTap: (){
              openLink('https://www.youtube.com/watch?v=UM7mOoJRci4');
            },
            child: CustomItemSetting(
              title: 'Plant treatment of diseases',
              iconData:Icons.warning,
              widget: Icon(
                IconBroken.Arrow___Down,
                color: ColorManager.buttonColor,
                size: AppSize.s30.sp,
              ),
            ),
          ),
        ),

        //الكود غلط هنا انا عارف بس هتعدل

        SizedBox(
          width: AppSize.s100.w,
          height:  AppSize.s100.h,
          child: Lottie.network(
            'https://assets1.lottiefiles.com/packages/lf20_7fyi8frc.json',
          ),
        ),
      ],
    );
  }
  Future<void>openLink(String link)async{
    var urlink=link;
    if(await canLaunch((urlink))){
      await launch (urlink);
    }
    else{
      await launch (urlink);
    }
  }
}
