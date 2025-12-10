
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:login_post_api/auth_services.dart';
import 'package:login_post_api/home_screen.dart';



final AuthNotifierProvider= StateNotifierProvider<AuthNotifier, bool>((ref)=>AuthNotifier(ref.watch(authServiceProvider)));
class AuthNotifier extends StateNotifier<bool>{
  final AuthServices  _authServices;
  AuthNotifier(this._authServices): super(false);


login (
  {
    required String email,
    required String password,
    required BuildContext context
  }
) async{
  try{
     state = true;
     await _authServices.login(email: email, password: password).then((value){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomeScreen()));
     });
     state = false;
  }catch(e){
      state= false;
  }
}
}