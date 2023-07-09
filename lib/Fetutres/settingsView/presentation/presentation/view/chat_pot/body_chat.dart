import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:doctor_plant/Fetutres/settingsView/presentation/presentation/view/chat_pot/messages.dart';
import 'package:doctor_plant/core/resources/assetse_Manager.dart';
import 'package:doctor_plant/core/resources/color_Manager.dart';
import 'package:doctor_plant/core/resources/icons.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  late DialogFlowtter Dialogflowtter;
  final TextEditingController _controller=TextEditingController();
  List<Map<String,dynamic>> messages=[];
  @override
  void initState(){
    DialogFlowtter.fromFile().then((instance) =>Dialogflowtter=instance);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          SizedBox(
            height: AppSize.s20.h,
          ),
          Padding(
            padding:  EdgeInsets.all(AppSize.s16.sp),
            child: Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(
                  IconBroken.Arrow___Left,
                  size:AppSize.s30.sp,
                  color: ColorManager.buttonColor,
                )),
                Text(
                  'Chat Bot',
                  style: GoogleFonts.montserrat(
                    color: Theme.of(context).disabledColor,
                    fontSize: AppSize.s20.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const Spacer(),
               Image(
                 width: AppSize.s60.w,
                   height:AppSize.s60.h,
                   image:const AssetImage(
                       AssetsData.chatBot,
                   ),

               )
              ],
            ),
          ),
           Divider(
            color: Colors.grey,
            height: 1.h,
            thickness: .5,
          ),
          Expanded(child:MessagesScreen(messages:messages)),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: AppSize.s10.sp,vertical:AppSize.s10.sp ),
            child: Row(
              children: [
                 Expanded(
                   child: TextFormField(
                     cursorColor: ColorManager.buttonColor,
                     decoration:  InputDecoration(
                       hintText: 'Type a message...',
                       hintStyle: TextStyle(
                         color: ColorManager.lightGrayOver,
                         fontSize: AppSize.s16.sp
                       ),
                       filled: true,
                       fillColor: Theme.of(context).backgroundColor,
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(AppSize.s20.sp),
                         borderSide: BorderSide(
                           color: ColorManager.secondColor
                         ),
                       ),
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(AppSize.s20.sp),
                         borderSide: BorderSide(
                             color: ColorManager.secondColor
                         ),
                       ),
                       focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(AppSize.s20.sp),
                         borderSide: BorderSide(
                             color: ColorManager.secondColor
                         ),
                       ),
                     ),
                     controller: _controller,
                     style:  TextStyle(
                         color: Theme.of(context).disabledColor,
                       fontSize: AppSize.s18.sp,
                     ),
                   ),
                 ),
                SizedBox(width: AppSize.s6.w,),
                Container(
                  width: AppSize.s53.w,
                  height: AppSize.s53.h,
                 decoration: BoxDecoration(
                   borderRadius:BorderRadius.circular(AppSize.s20.sp),
                   color: ColorManager.buttonColor,
                 ),
                  child: IconButton(onPressed: (){
                    sendMessages(_controller.text);
                    _controller.clear();
                  }, icon:  Icon(
                      IconBroken.Send,
                    color: ColorManager.primary,
                    size: AppSize.s30.sp,
                  )),
                )
              ],
            ),
          ),
        ],
      ) ,
    );
  }

  sendMessages(String text)async
  {
    if(text.isEmpty){
      print('****************');
      print('Message is empty');
      print('****************');
    }
    else{
      setState(() {
        addMessage(Message(
            text: DialogText(text: [text])),true);
      });
      DetectIntentResponse response=await Dialogflowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if(response.message==null)return;
      else{
        setState(() {
          addMessage(response.message!);
        });
      }
    }
  }
  addMessage(Message message, [bool isUserMessage=false]){
    messages.add({
      'message':message,
      'isUserMessage':isUserMessage,
    });
  }
}