import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:newslt/config/routes.dart';
import 'package:newslt/core/extentions/int_extentions.dart';
import 'package:newslt/core/utils/app_styles.dart';
import 'package:newslt/core/utils/common_helper.dart';
import 'package:newslt/core/utils/constants.dart';
import 'package:newslt/presentations/cubits/auth/password_cases/password_cases_cubit.dart';
import 'package:newslt/presentations/cubits/auth/password_cases/password_cases_state.dart';
import 'package:newslt/presentations/cubits/auth/create_user/create_user_cubit.dart';
import 'package:newslt/presentations/cubits/auth/create_user/create_user_state.dart';
import 'package:newslt/presentations/widgets/custom_button.dart';
import 'package:newslt/presentations/widgets/custom_text_form_field.dart';
import 'package:newslt/presentations/widgets/headline_txt.dart';

// ignore: must_be_immutable
class SignUpScreen extends  StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
        TextEditingController phoneController = TextEditingController();
          final formKey = GlobalKey<FormState>();


   SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
  

 
    return  Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints)=> Container(
              padding: const EdgeInsets.only (right: 8,left: 8,top: 50),
            height: constraints.maxHeight,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    const  HeadlineText(text: 'Register Account'),
                  
                    
                         20.toHeight,
                    const   LabelFeiled(text: 'Your Name',),
                      10.toHeight,
                          CustomTextFormFeiled(text: 'Enter Your Name', controller: nameController,validator: (value) =>validate(value!, 'name')
                           
                            , prefix: Icons.person,inputFormatter: [
                               FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                            ],),
                     20.toHeight,
                  const   LabelFeiled(text: 'Email Address',),
                      10.toHeight,
                          CustomTextFormFeiled(text: 'Enter Your Email Address', controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: 
                          (value) {
                                   if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                           if (!isValidEmail(value)) {
                              return 'Please enter a valid email address';
                            }
                             return null;
                                             
                          },prefix: Icons.email,
                         
                          ),
                      
                         20.toHeight,
                         const LabelFeiled(text: 'Password'),
                  10.toHeight,
                          BlocBuilder<PasswordCasesCubit,PasswordCasesStates>(
                            builder: (context,state){
                              PasswordCasesCubit cubit =BlocProvider.of<PasswordCasesCubit>(context);
                              return CustomTextFormFeiled(text: 'Enter Your Password', onTap: (){
                                cubit.showValidator();
                              },controller: passwordController,validator: (value) =>
                       validate(value!, 'password')
                             ,prefix: Icons.lock,suffix: cubit.suffix,suffixOnPressed: () => cubit.passwordVisibility(),isPassword: cubit.isVisible,);
                            
                            
                            }
                         
                         
                          ),
                          10.toHeight,
                          
                          BlocBuilder<PasswordCasesCubit,PasswordCasesStates>(
                            builder: (context,state){
                            PasswordCasesCubit cubit =BlocProvider.of<PasswordCasesCubit>(context);
                  
                          return cubit.showPassswordValidator
                              ?  FlutterPwValidator(
                               defaultColor: const Color.fromARGB(255, 134, 133, 133),
                            
                                  failureColor: Colors.red.shade300,
                                    successColor: kPrimaryColor,
                            
                            
                            
                            
                              width: 400, height: 30, minLength: 8, controller: passwordController, onSuccess: (){
                                cubit.setPasswordValidationStatus(true);
                              },
                              onFail: (){
                               cubit.setPasswordValidationStatus(false);
                              },
                              
                              
                            ) : const SizedBox.shrink();
                             }
                          ),
                               
                         
                              
                               
                       
                       
                        30.toHeight,
                       BlocConsumer<CreateUserCubit,CreateUserStates>(
                          listener: (BuildContext context, Object? state) { 
                          if (state is CreateUserSuccessState ) {
                                showToast('Registration Successful', Colors.green);
                                context.go(AppRouter.interestScreen);
                          
                                }
                                    if (state is CreateUserFailureState) {
                                       showToast(state.message, Colors.red);                                 }
                                                        },
                         builder: (BuildContext context, state) { 
                          CreateUserCubit cubit =BlocProvider.of<CreateUserCubit>(context);
                           PasswordCasesCubit passwordCubit = BlocProvider.of<PasswordCasesCubit>(context);
                  
                        return CustomButton(
                          onTap: () async {
                                if (formKey.currentState!.validate()&&passwordCubit.isPasswordValid) {
                               cubit.signUp(email: emailController.text, password: passwordController.text, name: nameController.text);
                                } else if(passwordController.text.length<8){
                                  return ;
                  
                                }else
                                
                                 {
                                  showToast('Please fill all fields', Colors.red);
                                }
                              },
                          text:  'Sign Up',
                          buttonColor: kPrimaryColor,
                          txtColor: Colors.white,
                          isLoading:   state is CreateUserLoadingState,
                                             );
                          },
                       
                       ),
                    
                  
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

