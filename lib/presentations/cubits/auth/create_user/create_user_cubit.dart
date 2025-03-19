import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newslt/presentations/cubits/auth/create_user/create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserStates> {
	CreateUserCubit() : super(CreateUserInitialState());
	
  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  
  }) async {
    emit(CreateUserLoadingState());
    try {
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(user.user!.uid);  
     
      emit(CreateUserSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(CreateUserFailureState(e.message!));
  if (e.code == 'weak-password') {
    log('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    log('The account already exists for that email.');
  }
}
    
    catch (error) {
      emit(CreateUserFailureState(error.toString()));
    }
  }
 
 
}
