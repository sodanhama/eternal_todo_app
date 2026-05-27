import 'package:eternal_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:eternal_app/features/settings/presentation/settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  void confirmAccountDeletion() {
    showDialog(context: context, builder: (context)=> AlertDialog(
      title: const Text("Delete Account?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            handleAccountDeletion();
          },
          child: const Text("Yes"),
        )
      ] 
    ));
  }

  void handleAccountDeletion() async {
    try {
      showDialog(context: context, 
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ));

      final authCubit = context.read<AuthCubit>();

      await authCubit.deleteAccount();

      if (mounted) {
        Navigator.pop(context);
        Navigator.pop(context);
      }
    }

    catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"),),
      body: Column(
        children: [
          MySettingsTile(
            title: "Delete Account",
            action: IconButton(
              onPressed: confirmAccountDeletion,
              icon: const Icon(Icons.delete_forever)
            )
          )
        ]
      )
    );
  }
}