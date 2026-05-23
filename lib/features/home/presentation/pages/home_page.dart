import 'package:eternal_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:Text("Home"),
            actions: [
              IconButton(
                onPressed: () {
                  final authCubit = context.read<AuthCubit>();
                  authCubit.logout();
                },
                icon: Icon(Icons.logout), 
              )
            ]
        )
    );
  }
}