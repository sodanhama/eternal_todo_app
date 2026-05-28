import 'package:eternal_app/components/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length:3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:Text("Home"),

            bottom: TabBar(
              controller: _tabController,
              dividerColor: Colors.transparent,
              labelColor: Theme.of(context).colorScheme.inversePrimary,
              unselectedLabelColor: Theme.of(context).colorScheme.primary,
              tabs: const [
                Tab(text: "Create"),
                Tab(text:"Publish"),
                Tab(text:"Earn")
              ]
            ),
            actions: [
              IconButton(onPressed: () {},
              icon: const Icon(Icons.add),
              )
            ]

        ),
        drawer: MyDrawer(),
    );
  }
}