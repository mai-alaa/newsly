import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newslt/presentations/cubits/auth/varify_email/varify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailStates> {
	VerifyEmailCubit() : super(VerifyEmailInitialState());
	
	 Future<void> verifyEmailAddress() async {
    emit(VerifyEmailLoadingState());
    try{
      	 User? user = FirebaseAuth.instance.currentUser;
    await user!.sendEmailVerification();
    emit(VerifyEmailSuccessState());

    }on FirebaseAuthException catch(e){
    	emit(VerifyEmailFailureState(e.message!));
    }
    catch(error){
    	emit(VerifyEmailFailureState(error.toString()));
    }
	

	}
   Future<void> checkEmailVerified() async {
    User? user = FirebaseAuth.instance.currentUser;
    await user!.reload(); 
    if (user.emailVerified) {
      emit(EmailVerifiedState()); 
    } else {
      emit(VerifyEmailInitialState()); 
    }
  }
}
