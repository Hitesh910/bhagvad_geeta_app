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
    // context.read<HomeProvider>().getJson();
    // context.read<HomeProvider>().getJson2();
    context.read<HomeProvider>().randomVerse();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bhagvad_geeta"),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () {
                    Navigator.pushNamed(context, "favorite");
                  },
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite),
                      ),
                      const Text("Favourite")
                    ],
                  ),
                ),
                PopupMenuItem(
                    child: Row(
                  children: [
                    const Icon(
                      Icons.color_lens,
                      size: 35,
                    ),
                    const Text("Theme"),
                    const Spacer(),
                    Switch(
                      value: providerW!.isLike,
                      onChanged: (value) {
                        if (value == false) {
                          providerW!.setTheme("light");
                        } else {
                          providerW!.setTheme("dark");
                        }
                        print(value);
                        providerW!.verseSave2();
                        Navigator.pop(context);
                      },
                    )
                  ],
                )),
                PopupMenuItem(
                    child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        showDialog(
                          builder: (context) {
                            return SimpleDialog(
                              children: [
                                Container(
                                  color: Colors.blue,
                                  child: const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("Hello"),
                                      SizedBox(
                                        width: 46,
                                        child: Divider(),
                                      ),
                                      Text("Hii")
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                          context: context,
                        );
                      },
                      icon: const Icon(Icons.language),
                    ),
                    const Text("Languages")
                  ],
                ))
              ];
            },
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: const Text("Light"),
                  onTap: () {
                    providerR!.setTheme('light');
                  },
                ),
                PopupMenuItem(
                  child: const Text("Dark"),
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
              padding: const EdgeInsets.all(10),
              // color: Colors.red,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:
                      providerW!.theme == "light" ? Colors.white : Colors.black,
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://cf-img-a-in.tosshub.com/lingo/gnt/images/video/202112/shri_krishna_gave_divine_knowledge_to_arjuna-sixteen_nine.jpg?size=1200:675"),
                      fit: BoxFit.cover,
                      opacity: 0.6)),
              child: Text(
                "${providerR!.allVerseList[providerR!.i].verse}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "अध्याय :",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
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
                    // providerR!.changeIndex(index);
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
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(
                        "${providerR!.chapterList[index].name}",
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      subtitle: Text(
                        "${providerR!.chapterList[index].verse} verse",
                        style: const TextStyle(color: Colors.black),
                      ),
                      leading: Text(
                          "${providerR!.chapterList[index].chapter_number}.",
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black)),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                      ),
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
