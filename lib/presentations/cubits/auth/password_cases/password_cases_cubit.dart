import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newslt/presentations/cubits/auth/password_cases/password_cases_state.dart';


class PasswordCasesCubit extends Cubit<PasswordCasesStates> {
	PasswordCasesCubit() : super(PasswordCasesInitialState());
	bool isPasswordValid =true;
  bool isVisible =true;
  IconData suffix = Icons.visibility_off_outlined;
  bool showPassswordValidator= false;
   void showValidator(){
    showPassswordValidator=!showPassswordValidator;
    emit(ShowPasswordValidatorState());
   }


  void passwordVisibility(){
    isVisible = !isVisible;
 suffix = isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(PasswordVisibilityState());
  }

void setPasswordValidationStatus(bool isValid) {
 isPasswordValid = isValid;
 
 emit(PasswordValidationState());
 }
	
}
