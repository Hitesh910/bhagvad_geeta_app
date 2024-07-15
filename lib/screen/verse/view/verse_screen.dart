import 'dart:ui';

import 'package:flutter/material.dart';
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
        title: Text("Verse"),
        backgroundColor: Colors.orange.shade300,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/img.jpg"),opacity: 0.9,
                    fit: BoxFit.fill)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                decoration: BoxDecoration(color: Colors.black26),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: 300,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "${providerR!.chapterList[providerR!.selectedIndex].image}"))),
                ),
                // Container(
                //   decoration: BoxDecoration(
                //       image: DecorationImage(
                //           image: AssetImage("assets/images/img2.png"))),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/new.png",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${providerR!.chapterList[providerR!.selectedIndex].chapter_number} . ",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${providerR!.chapterList[providerR!.selectedIndex].name}",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
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
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "${providerR!.chapterList[providerR!.selectedIndex].chapter_summary}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: providerW!.filterList.length,
                  itemBuilder: (context, index) {
                    return providerW!.theme == "light"
                        ? Container(
                            height: 150,
                            width: MediaQuery.sizeOf(context).width,
                            // color: Colors.white,
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(20)),
                            child: Stack(
                              alignment: Alignment.center,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Text(
                                //     "${providerR!.filterList[index].chapter_number}"),
                                Text(
                                  "${providerR!.filterList[index].verse}",
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 18,fontWeight: FontWeight.bold),
                                ),
                                Align(alignment: Alignment(0.9, -0.8),child: IconButton(icon: providerW!.isLike == false  ?Icon(Icons.favorite):Icon(Icons.favorite,color: Colors.red,),onPressed: () {
                                  providerR!.verseSave(providerR!.filterList[index].verse!);
                                },))
                              ],
                            ),
                          )
                        : Container(
                            height: 150,
                            width: MediaQuery.sizeOf(context).width,
                            // color: Colors.white,
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(20)),
                            child: Stack(
                              alignment: Alignment.center,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Text(
                                //     "${providerR!.filterList[index].chapter_number}"),
                                Text(
                                  "${providerR!.filterList[index].verse}",
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 18,fontWeight: FontWeight.w500),
                                ),
                                Align(alignment: Alignment(0.9, -0.8),child: Icon(Icons.favorite,color: Colors.grey,))
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
