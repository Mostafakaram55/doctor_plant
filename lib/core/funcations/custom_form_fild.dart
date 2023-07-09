
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../resources/color_Manager.dart';
Widget defaultFormFiled({
  required String? text,
  required TextEditingController? controller,
  required TextInputType? type,
  Icon? prefixIcon,
  IconButton? suffixIcon,
  dynamic submitted,
  bool obscure=false,
})=>TextFormField(
  onFieldSubmitted:submitted,
  validator:(value){
    if(value!.isEmpty){
      return 'An empty field of data';
    }
  },
  style: TextStyle(
    color: ColorManager.gray
  ),
  obscureText: obscure,
  controller:controller ,
  keyboardType: type,
  cursorColor:ColorManager.buttonColor,
  decoration: InputDecoration(
    prefixIcon:prefixIcon,
    suffixIcon: suffixIcon,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    hintText: text,
    hintStyle: TextStyle(
        color: ColorManager.lightGrayOver
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
            color: ColorManager.secondColor
        )
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
            color: ColorManager.primary
        )
    ),
    disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: ColorManager.primary
        ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorManager.error,
      ),
    ),
    fillColor: ColorManager.secondColor,
    filled: true,
    hoverColor: ColorManager.secondColor,
  ),

);