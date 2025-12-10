



import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider<AuthServices>((ref){
  return AuthServices();
});
class AuthServices {
  bool isLoggedIn= false;
 Future<bool> login({ required String email, required String password
  
 }) async{
  await Future.delayed(const Duration(seconds: 2), (){
    isLoggedIn= true;
  });
  return isLoggedIn;
 }
}
