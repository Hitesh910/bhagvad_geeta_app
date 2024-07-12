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
    context.read<HomeProvider>().getJson2();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Bhagvad_geeta"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.all(10),
              // color: Colors.red,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.red),
            ),
          ),
          Expanded(
            child: ListView.builder(
              // shrinkWrap: false,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: providerW!.chapterList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    providerR!.changeIndex(index);
                    providerR!.selectedList(providerR!.chapterList[index].chapter_number);
                    Navigator.pushNamed(context, 'verse');
                  },
                  child: Container(
                    height: 80,
                    width: MediaQuery.sizeOf(context).width,
                    alignment: Alignment.center,
                    // color: Colors.orange.shade300,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.orange.shade300),
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(
                        "${providerR!.chapterList[index].name}",
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle:
                          Text("${providerR!.chapterList[index].verse} verse"),
                      leading: Text(
                          "${providerR!.chapterList[index].chapter_number}."),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
