import 'package:eternal_app/features/auth/presentation/components/my_button.dart';
import 'package:eternal_app/features/auth/presentation/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? togglePages;

  const RegisterPage({super.key, required this.togglePages});

  @override 
  State<RegisterPage> createState() => _RegisterPageState();


}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
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
              Text("Get started by creating an account", style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.inversePrimary)),
              const SizedBox(height:25),
              MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ),
              const SizedBox(height: 8),
              MyTextField(
                controller: usernameController,
                hintText: "Username",
                obscureText: false,
              ),
              const SizedBox(height: 8),
              MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 8),
              MyTextField(
                controller: confirmPasswordController,
                hintText: "Confirm Password",
                obscureText: true,
              ),

              const SizedBox(height: 25),
              MyButton(
                onTap: (){
                  
                },
                text:"SIGN UP",
              ),
              
            const SizedBox(height: 25),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Already have an account?", style: TextStyle(color: Theme.of(context).colorScheme.primary)),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: widget.togglePages,
                child: Text(
                  "Login now",
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