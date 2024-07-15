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
    context.read<HomeProvider>().randomVerse();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Bhagvad_geeta"),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.favorite))),
                PopupMenuItem(
                    child: Row(
                  children: [
                    Icon(Icons.color_lens),
                    Switch(
                      value: true,
                      onChanged: (value) {},
                    )
                  ],
                ))
              ];
            },
          ),

                PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: Text("Light"),
                        onTap: () {
                          providerR!.setTheme('light');
                        },
                      ),
                      PopupMenuItem(
                        child: Text("Dark"),
                        onTap: () {
                          providerR!.setTheme("dark");
                        },
                      ),
                    ];
                  },
                )

        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120,
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.all(10),
              // color: Colors.red,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: providerW!.theme == "light"?Colors.white:Colors.black,image: DecorationImage(image: NetworkImage("https://cf-img-a-in.tosshub.com/lingo/gnt/images/video/202112/shri_krishna_gave_divine_knowledge_to_arjuna-sixteen_nine.jpg?size=1200:675"),fit: BoxFit.cover,opacity: 0.6)),
              child: Text("${providerR!.allVerseList[providerR!.i].verse}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(alignment: Alignment.bottomLeft,child: Text("अध्याय :",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
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
                    providerR!.selectedList(
                        providerR!.chapterList[index].chapter_number);
                    Navigator.pushNamed(context, 'verse');
                  },
                  child: Container(
                    height: 80,
                    width: MediaQuery.sizeOf(context).width,
                    alignment: Alignment.center,
                    // color: Colors.orange.shade300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange.shade400),
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(
                        "${providerR!.chapterList[index].name}",
                        style: TextStyle(fontSize: 20,color: Colors.black),
                      ),
                      subtitle:
                          Text("${providerR!.chapterList[index].verse} verse",style: TextStyle(color: Colors.black),),
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
