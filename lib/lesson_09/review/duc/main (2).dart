import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DiscountScreen(),
      ),
    );
  }
}

class DiscountScreen extends StatelessWidget {
  const DiscountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.redAccent, Colors.orangeAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24.r),
                  bottomRight: Radius.circular(24.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40), // For status bar space
                  Text(
                    "Laaarge Discounts",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        "Free 2 drinks",
                        style: TextStyle(fontSize: 18.sp, color: Colors.white),
                      ),
                      Image.asset("assets/drink.png", height: 80.h)
                          .animate(onPlay: (controller) => controller.repeat())
                          .moveX(begin: -5, end: 5, duration: 500.ms)
                          .then()
                          .moveX(begin: 5, end: -5, duration: 500.ms),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "UP TO 20% OFF",
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.asset("assets/steak.png", height: 150.h)
                            .animate()
                            .scale(begin: Offset(0.2, 0.2), end: Offset(1, 1), duration: 800.ms),
                      ),
                    ],
                  ),
                  Text(
                    "NO UPPER LIMIT!",
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Terms & Condition",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        "• 20% off for family reservation\n"
                            "• Time slots from 10:00 to 15:00\n",
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                      Image.asset("assets/drink.png", height: 80.h),
                    ],
                  ).animate()
                      .moveX(begin: -300, end: 0, duration: 600.ms),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Image.asset("assets/drink.png", height: 80.h),
                      SizedBox(width: 8.w),
                      Text(
                        "• Applicable to all branches\n"
                            "• Valid until 31st October, 2021",
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                    ],
                  ).animate()
                      .moveX(begin: 300, end: 0, duration: 600.ms),
                  SizedBox(height: 20.h),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 32.w,
                          vertical: 12.h,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "GET IT NOW",
                        style: TextStyle(fontSize: 18.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}