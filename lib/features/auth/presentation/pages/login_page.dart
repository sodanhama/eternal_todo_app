import 'package:eternal_app/features/auth/presentation/components/my_button.dart';
import 'package:eternal_app/features/auth/presentation/components/my_textfield.dart';
import 'package:eternal_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  final void Function()? togglePages;

  const LoginPage({super.key, required this.togglePages});

  @override 
  State<LoginPage> createState() => _LoginPageState();


}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late final authCubit = context.read<AuthCubit>();


  void login() {
    final String email = emailController.text;
    final String password = passwordController.text;


    if (email.isNotEmpty && password.isNotEmpty) {
      authCubit.login(email, password);
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter both email and password"))
      );
    }
  }

  void openForgotPassword() {
    showDialog(
      context:context,
      builder: (context) => AlertDialog(
      title: const Text("Forgot Password?"),
      content: MyTextField(
        controller: emailController, 
        hintText: "Email", 
        obscureText: false,),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), 
          child: const Text("Cancel"),),
        TextButton(
          onPressed: () async {
            String message=await authCubit.forgotPassword(emailController.text);
            if (message == "Password reset email sent.") {
              Navigator.pop(context);
              emailController.clear();
            }

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(message)));
            
            }, child: const Text("Reset"),),


      ]

    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_open,size:72,color:Theme.of(context).colorScheme.primary),
              const SizedBox(height: 16),
              Text("Eternal App", style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.inversePrimary)),
              const SizedBox(height:25),
              MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ),
              const SizedBox(height: 8),
              MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: openForgotPassword,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold,),
                      
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              MyButton(
                onTap: login,
                text:"LOGIN",
              ),
              
            const SizedBox(height: 25),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Don't have an account?", style: TextStyle(color: Theme.of(context).colorScheme.primary)),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: widget.togglePages,
                child: Text(
                  "Register now",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
                ),
              )
            ],)
            ],
          ),
        )
      )
    );
  }
}