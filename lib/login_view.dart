import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_post_api/auth_notifier.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                fillColor: Colors.grey,
                filled: true,
                isDense: true,
                hintText: 'Email',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white
                  ),
                 
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white
                  )
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: passwordController,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                fillColor: Colors.grey,
                filled: true,
                isDense: true,
                hintText: 'password',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white
                  ),
                 
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white
                  )
                ),
              ),
            ),
            SizedBox(height: 30,),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) { 
                bool isLoading = ref.watch(AuthNotifierProvider);
                return isLoading
                ? const CircularProgressIndicator()
               : ElevatedButton(onPressed: (){
                ref.read(AuthNotifierProvider.notifier).login(
                  email: emailController.text,
                  password: passwordController.text,
                  context: context
                );
              }, child: Text('Login'));
   } )
          ],
        ),),
    );
  }
}