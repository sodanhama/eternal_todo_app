import 'package:eternal_app/features/auth/data/firebase_auth_repo.dart';
import 'package:eternal_app/features/auth/presentation/components/loading.dart';
import 'package:eternal_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:eternal_app/features/auth/presentation/cubits/auth_state.dart';
import 'package:eternal_app/features/home/data/firebase_post_repo.dart';
import 'package:eternal_app/features/home/presentation/cubits/post_cubit.dart';
import 'package:eternal_app/themes/dark_mode.dart';
import 'package:eternal_app/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:eternal_app/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/presentation/pages/auth_page.dart';
import 'features/home/presentation/pages/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final firebaseAuthRepo = FirebaseAuthRepo();
  
  final firebasePostRepo = FirebasePostRepo();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(authRepo: firebaseAuthRepo)..checkAuth(),
        ),

        BlocProvider<PostCubit>(
          create: (context) => PostCubit(postRepo: firebasePostRepo),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Eternal App',
        theme: lightMode,
        darkTheme: darkMode ,
        themeMode: ThemeMode.system,
        home: BlocConsumer<AuthCubit, AuthState>(
          builder: (context,state) {
            if (state is Unauthenticated) {
              return const AuthPage();
            }

            if (state is Authenticated) {
              return const HomePage();
            }
          else {
            return const LoadingScreen();
          }
          },

          listener: (context,state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
        ),
      ),
    );
  }
}