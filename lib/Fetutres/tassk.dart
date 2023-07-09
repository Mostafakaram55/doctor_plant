
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TaskTow extends StatelessWidget {
  const TaskTow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics:const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              width: double.infinity,
              child: Text('Event'),
              color: Colors.green,
            ),
          ),
          SliverToBoxAdapter(
            child: customnewItem(),
          ),
        ],
      ),
    );
  }
  Widget customnewItem()=>ListView.separated(
    shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context,index){
        return Row(
          children: [
            Container(
              height: 110.w,
              width: 130.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  image:const  DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Luxor_Hotel.jpg/800px-Luxor_Hotel.jpg?20120929144414')
                  )
              ),
            ),
            SizedBox(
              width: 13.sp,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Temple Of Karnak',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Text(
                      '7465 Reviews',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp
                      ),
                    ),
                  ],
                ),
                Text(
                  'Historic site',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Ancient Ruins',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                  onTap: (){},
                  child: Container(
                    width: 80.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        color: Colors.amber[500]
                    ),
                    child: Center(
                      child: Text(
                        'Show Details',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      }
      , separatorBuilder: (context,index)=>SizedBox(height: 10.sp,),
      itemCount: 10
  );
}



