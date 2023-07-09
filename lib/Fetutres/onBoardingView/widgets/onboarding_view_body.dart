
import 'package:doctor_plant/Fetutres/onBoardingView/data/onBoardingData.dart';
import 'package:doctor_plant/Fetutres/onBoardingView/widgets/CustomPageViewItem.dart';
import 'package:doctor_plant/core/resources/assetse_Manager.dart';
import 'package:doctor_plant/core/resources/color_Manager.dart';
import 'package:doctor_plant/core/resources/text_Manager.dart';
import 'package:doctor_plant/core/resources/values_Manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class OnBoardingViewBody extends StatefulWidget {
   const  OnBoardingViewBody({Key? key}) : super(key: key);
  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late final List<OnBoardingData> _list=_getSliderData();
  final PageController _pageController=PageController();

   List<OnBoardingData>_getSliderData()=>[
     OnBoardingData(TextManager.onBoardingTitle1, TextManager.onBoardingBody1),
     OnBoardingData(TextManager.onBoardingTitle2, TextManager.onBoardingBody2),
     OnBoardingData(TextManager.onBoardingTitle3, TextManager.onBoardingBody3),
     OnBoardingData(TextManager.onBoardingTitle4, TextManager.onBoardingBody4),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsData.onBoarding3),
            fit: BoxFit.cover,
          ),
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSize.s12),
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.transparent.withOpacity(.3)
                  ),
                  child: TextButton(
                    onPressed: (){}, child: Text(
                    'Skip',
                    style: TextStyle(
                        color:ColorManager.secondColor,
                        fontSize: AppSize.s30
                    ),
                  ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height:MediaQuery.of(context).size.height /2,
              width: MediaQuery.of(context).size.width /.1,
              child: PageView.builder(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index)=>CustomPageViewItem(
                  onBoardingData: _list[index],
                ),
                itemCount: _list.length,
              ),
            ),
            SmoothPageIndicator(
                controller: _pageController,
                count: _list.length,
                effect: const ExpandingDotsEffect(
                  radius: 8,
                  spacing: 10,
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: Colors.white
                )),
            const SizedBox(
              height: AppSize.s75,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:AppSize.s8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent.withOpacity(.3)
                    ),
                    child: TextButton(
                        onPressed: (){}, child:Row(
                          children: [
                            Text(
                            'Next',
                           style: TextStyle(
                            color:ColorManager.secondColor,
                            fontSize: AppSize.s30
                      ),
                    ),
                            Icon(
                                Icons.arrow_forward_ios,
                             size:AppSize.s24,
                             color: ColorManager.secondColor,
                           )
                          ],
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ) ,
      )
    );
  }
}
