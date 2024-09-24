import 'dart:ui';

import 'package:bhagvad_geeta_app/screen/verse/model/verse_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';

class VerseScreen extends StatefulWidget {
  const VerseScreen({super.key});

  @override
  State<VerseScreen> createState() => _VerseScreenState();
}

class _VerseScreenState extends State<VerseScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<HomeProvider>().getJson2();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Verse",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.orange.shade400,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/img.jpg"),
                    opacity: 0.9,
                    fit: BoxFit.fill)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                decoration: const BoxDecoration(color: Colors.black26),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: 300,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "${providerR!.chapterList[providerR!.selectedIndex].image}"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/new.png",
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${providerR!.chapterList[providerR!.selectedIndex].chapter_number} . ",
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${providerR!.chapterList[providerR!.selectedIndex].name}",
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/images/new.png",
                        ),
                      ],
                    ),
                  ),
                ),
                // Text("Verse Screen"),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "${providerR!.chapterList[providerR!.selectedIndex].chapter_summary}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: providerW!.filterList.length,
                  itemBuilder: (context, index) {
                    return providerW!.theme == "light"
                        ? Container(
                            height: 150,
                            width: MediaQuery.sizeOf(context).width,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Text(
                                  "${providerR!.filterList[index].verse}",
                                  style: const TextStyle(
                                      overflow: TextOverflow.fade,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment: Alignment(0.9,-0.8),
                                      child: IconButton(onPressed: () {
                                        providerW!.flutterTtsspeak();
                                      }, icon: Icon(Icons.surround_sound)),
                                    ),
                                    Align(
                                      alignment: const Alignment(0.9, -0.8),
                                      child: IconButton(
                                        icon: providerW!.filterList[index].isFav ==
                                                false
                                            ? const Icon(Icons.favorite)
                                            : const Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              ),
                                        onPressed: () {
                                          VerseModel vr =
                                              providerR!.filterList[index];
                                          if (vr.isFav!) {
                                            vr.isFav = false;
                                          } else {
                                            vr.isFav = true;
                                          }
                                          providerR!.filterList[index] = vr;
                                          providerR!.verseSave(
                                              providerR!.filterList[index].verse!);
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        : Container(
                            height: 150,
                            width: MediaQuery.sizeOf(context).width,
                            // color: Colors.white,
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Text(
                                //     "${providerR!.filterList[index].chapter_number}"),
                                Text(
                                  "${providerR!.filterList[index].verse}",
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Align(
                                  alignment: Alignment(0.9, -0.8),
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
