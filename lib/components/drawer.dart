import 'package:eternal_app/components/drawer_tile.dart';
import 'package:eternal_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:eternal_app/features/profile/profile_page.dart';
import 'package:eternal_app/features/settings/presentation/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    authCubit.logout();
  }

  void confirmLogout(BuildContext context) {
    Navigator.pop(context);

    showDialog(context: context, builder: (context)=> AlertDialog(
      title: const Text("Logout?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            logout(context);
          },
          child: const Text("Yes"),
        )
      ] 
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
          children: [
            const DrawerHeader(
            child: Icon(Icons.favorite),
          ),
          MyDrawerTile(
            text: "Home",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          MyDrawerTile(
            text: "Profile",
            icon: Icons.person,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(),));
            }
          ),
          MyDrawerTile(
            text: "Settings",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage(),));
            }
          ),
          ]

          ),

          MyDrawerTile(
            text: "Logout",
            icon: Icons.logout,
            onTap: ()=> confirmLogout(context),
          ),
        ]
      ),)
    );
  }
}