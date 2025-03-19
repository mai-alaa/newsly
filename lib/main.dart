import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newslt/config/routes.dart';
import 'package:newslt/core/utils/bloc_observer.dart';
import 'package:newslt/core/utils/cache_helper.dart';
import 'package:newslt/core/utils/constants.dart';
import 'package:newslt/core/utils/screen_size.dart';
import 'package:newslt/presentations/cubits/auth/password_cases/password_cases_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:newslt/presentations/cubits/auth/create_user/create_user_cubit.dart';
import 'package:newslt/presentations/cubits/auth/varify_email/varify_email_cubit.dart';
import 'package:newslt/presentations/cubits/toggle_inerests/toggle_inerests_cubit.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
);
Bloc.observer = MyBlocObserver();
await CacheHelper.init();
  runApp(const NewslyApp());
}

class NewslyApp extends StatelessWidget {
  const NewslyApp({super.key});

  @override
  Widget build(BuildContext context) {
     ScreenSize.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PasswordCasesCubit(),
        ),
        BlocProvider(create: (context)=> CreateUserCubit()),
        BlocProvider(create: (context)=> ToggleInerestsCubit()),
         BlocProvider(create: (context)=> VerifyEmailCubit()),

      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: kBackgroundColor,
         
          textTheme:  GoogleFonts.ralewayTextTheme()
        ),
     
      ),
    );
  }
}

