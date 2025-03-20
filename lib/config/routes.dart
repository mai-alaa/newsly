import 'package:go_router/go_router.dart';
import 'package:newslt/presentations/pages/home_screen.dart';
import 'package:newslt/presentations/pages/sign_up_screen.dart';
import 'package:newslt/presentations/pages/successul_verified_page.dart';
import 'package:newslt/presentations/pages/user_interests_screen.dart';
import 'package:newslt/presentations/pages/varify_email_screen.dart';


class AppRouter{
  static const String interestScreen ='/interestScreen';
  static const String homeScreen ='/homePage';
  static const String verifyEmailScreen ='/verifyEmailScreen';
 static const String successVerifiedScreen ='/successVerifiedScreen';

 
  static const String signUpScreen ='/signUpScreen';

  static const String back ='/';
 

static final GoRouter router = GoRouter(
  initialLocation: signUpScreen,
  routes: <RouteBase>[
 
  // GoRoute(path: homeScreen,
  // builder: (context, state) => const HomeScreen(),
  // ),

   GoRoute(path: signUpScreen,
  builder: (context, state) =>  SignUpScreen(),
  ),
   GoRoute(path: interestScreen,
  builder: (context, state) =>  UserInterestsScreen(),
  ),
  GoRoute(path: verifyEmailScreen,
  builder: (context, state)=>VerifyEmailAddress()
  ),
   GoRoute(path: homeScreen,
  builder: (context, state)=>HomeScreen()
  ),
    GoRoute(path: successVerifiedScreen,
  builder: (context, state)=>SuccessfulVerifiedPage()
  )
 

  ],
);
}