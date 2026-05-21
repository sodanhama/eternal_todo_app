import 'package:eternal_app/features/auth/presentation/components/my_button.dart';
import 'package:eternal_app/features/auth/presentation/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override 
  State<LoginPage> createState() => _LoginPageState();


}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
                  Text(
                    "Forgot Password?",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold,),
                    
                  ),
                ],
              ),
              const SizedBox(height: 25),
              MyButton(
                onTap: (){
                  
                },
                text:"Login",
              ),
              
            const SizedBox(height: 25),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Don't have an account?", style: TextStyle(color: Theme.of(context).colorScheme.primary)),
              const SizedBox(width: 8),
              Text("Register now", style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary))
            ],)
            ],
          ),
        )
      )
    );
  }
}