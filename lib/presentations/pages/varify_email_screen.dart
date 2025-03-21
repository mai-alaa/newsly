

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newslt/config/routes.dart';
import 'package:newslt/core/extentions/int_extentions.dart';
import 'package:newslt/core/utils/app_styles.dart';
import 'package:newslt/core/utils/assets.dart';
import 'package:newslt/core/utils/constants.dart';
import 'package:newslt/core/utils/screen_size.dart';
import 'package:newslt/presentations/cubits/auth/varify_email/varify_email_cubit.dart';
import 'package:newslt/presentations/cubits/auth/varify_email/varify_email_state.dart';
import 'package:newslt/presentations/widgets/custom_button.dart';

class VerifyEmailAddress extends StatelessWidget {
  const VerifyEmailAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
             mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: ScreenSize.screenHeight*0.25,
                  child: Image.asset(Assets.emailAsset)),
                20.toHeight,
                Text('Verify Your Email Address',style: Styles.relwayBold26(context),),
                20.toHeight,
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                  text: 'Congratulations! Your Accounts Awaits, Verify Your Email to start using App'
                )),
                25.toHeight,
                BlocConsumer<VerifyEmailCubit,VerifyEmailStates>(
                  listener: (context, state) {
                    if (state is VerifyEmailSuccessState) {
     context.go(AppRouter.successVerifiedScreen);
                    }
                  
                  },
                  builder: (context, state) {
                    VerifyEmailCubit cubit = BlocProvider.of<VerifyEmailCubit>(context);
                    return CustomButton(onTap: (){
                      cubit.verifyEmailAddress();
                    }, text: 'Verify', buttonColor: kPrimaryColor, txtColor: kBackgroundColor,isLoading: state is VerifyEmailLoadingState,);
                  },
                   )
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}