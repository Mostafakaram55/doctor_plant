
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/resources/color_Manager.dart';
import '../../../../core/resources/values_Manager.dart';

class CountWidget extends StatelessWidget {
  const CountWidget({Key? key, required this.count, required this.icon,required this.function,required this.mainAxisAlignment}) : super(key: key);
  final String count;
  final IconData icon;
  final VoidCallback function;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: InkWell(
        onTap: function,
        child: Row(
          mainAxisAlignment:mainAxisAlignment ,
          children: [
            Icon(
              icon,
              color: Theme.of(context).disabledColor,
            ),
            const SizedBox(
              width: AppSize.s8,
            ),
            Text(
              count,
              style:GoogleFonts.montserrat(
                  color:ColorManager.descriptionColor,
                  fontSize: AppSize.s13.sp,
                  fontWeight: FontWeight.w500
              ),
            )
          ],
        ),
      ),
    );
  }
}
