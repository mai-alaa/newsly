import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newslt/presentations/cubits/auth/varify_email/varify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailStates> {
  Timer? timer;
  
  VerifyEmailCubit() : super(VerifyEmailInitialState());
  
  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
  
  Future<void> verifyEmailAddress() async {
    emit(VerifyEmailLoadingState());
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        emit(VerifyEmailFailureState("No user is signed in"));
        return;
      }
      await user.sendEmailVerification();
      emit(VerifyEmailSuccessState());
      
      startPeriodicCheck();
    } on FirebaseAuthException catch(e) {
      emit(VerifyEmailFailureState(e.message ?? "Firebase Auth Error"));
    } catch(error) {
      emit(VerifyEmailFailureState(error.toString()));
    }
  }
  
  void startPeriodicCheck() {
   
    timer?.cancel();
    
   
    timer = Timer.periodic(Duration(seconds: 3), (_) {
      checkEmailVerified();
    });
  }
  
  Future<void> checkEmailVerified() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        emit(VerifyEmailFailureState("No user is signed in"));
        return;
      }
      
      await user.reload();
      
      user = FirebaseAuth.instance.currentUser;
      
      if (user != null && user.emailVerified) {
        timer?.cancel(); 
        emit(EmailVerifiedState());
      } else {
        if (state is VerifyEmailLoadingState || state is VerifyEmailFailureState) {
          emit(VerifyEmailInitialState());
        }
      }
    } catch (error) {
      emit(VerifyEmailFailureState(error.toString()));
    }
  }
}