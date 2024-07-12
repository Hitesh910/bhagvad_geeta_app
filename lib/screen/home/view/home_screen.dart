import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().getJson();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Bhagvad_geeta"),
      ),
      body: ListView.builder(
        itemCount: providerW!.chapterList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${providerR!.chapterList[index].name}"),
            leading: Text("${providerR!.chapterList[index].chapter_number}"),
          );
        },
      ),
    );
  }
}
