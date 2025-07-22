import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo/Core/Utils/App_Styles.dart';
import 'package:solo/Features/Auth/presentation/view/widgets/SocialMediaSectiom.dart';
import 'package:solo/Features/Auth/presentation/view/widgets/register_Section.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 160.h),
            Center(
              child: Text('Join us to start', style: AppStyles.textstyle28),
            ),
            const SizedBox(height: 30),
            Socialmediasection(),
            const SizedBox(height: 20),
            RegisterSection(),
          ],
        ),
      ),
    );
    ;
  }
}
