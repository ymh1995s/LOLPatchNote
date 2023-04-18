import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ChampionData/Data.dart';
import 'OneChampionPage.dart';

late List<int> IsFavoriteNo;

class ChampionsPage extends StatefulWidget {
  const ChampionsPage({Key? key}) : super(key: key);

  @override
  State<ChampionsPage> createState() => _ChampionsPageState();
}

class _ChampionsPageState extends State<ChampionsPage> {
  void MoveOneChamp(BuildContext context, int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => OneChampPage(ChampIndex: index))).then((value){setState(() {});});    
  }

  void InitChampImg() 
  {
    for (int i = 0; i < 163; i++) ChampionImgLink[i] = "assets/" + ChampionName[i] + ".webp";
  }
  
  Widget MakeOneLineCircleAvatar(BuildContext context, int startIndex, int endIndex)
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = startIndex; i < endIndex; i++) MakeCircleAvatar(context, i, 25),
        ],
      ),
    );
  }


  Widget MakeCircleAvatar(BuildContext context, int index, double circleSize)
  {
    return GestureDetector(
      onTap: () {
        MoveOneChamp(context, index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: circleSize,
              backgroundImage: ExactAssetImage(ChampionImgLink[index]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(ChampionName[index],style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }

  Widget MakeCircleAvatar_Favorite(BuildContext context, int index, double circleSize, bool isfavorite)
  {
    if(isfavorite) return MakeCircleAvatar(context,index,circleSize);
    else return Container();
  }

  @override
  Widget build(BuildContext context) {    
  InitChampImg();
    return Consumer<IsFavorite_SharedPreferencess>(builder: (context, Isfavorite_sharedpreferencess, child) {
      IsFavorite = Isfavorite_sharedpreferencess.IsFavoriteInClass;
      return SafeArea(
          child: Scaffold(
            // appBar: AppBar(
            //   //앱바 부분은 나중에 아이템 / 룬 넣을거임 ver1.2.0
            //   // leading: IconButton(
            //   //   icon: Icon(CupertinoIcons.camera, color: Colors.black),
            //   //   onPressed: (ChampIndex: index) {},
            //   // ),
            //   // actions: [
            //   //   IconButton(
            //   //     icon: Icon(CupertinoIcons.paperplane, color: Colors.black),
            //   //     onPressed: (ChampIndex: index) {},
            //   //   )
            //   // ],
            //   // centerTitle: true,
            //   backgroundColor: Colors.white,
            // ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 즐찾 챔피언
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(                
                    mainAxisAlignment: MainAxisAlignment.center,                
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("즐겨찾기", style: TextStyle(fontSize: 20)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                              for (int i = 0; i < ChampionNameEn.length; i++) MakeCircleAvatar_Favorite(context,i,30,IsFavorite[i]),
                              ],
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
                //구분자라인
                Container(
                    height: 1.0,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey),
                // 모든 챔피언
                Expanded( //남은 화면 꽉채우게 expanded
                  child: Container(                
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                        //6*27 + 1 = 163개 챔피언, 밀리오 추가
                        for (int i = 0; i < 162; i += 6) MakeOneLineCircleAvatar(context, i, i + 6),
                        MakeOneLineCircleAvatar(context, 162, 163), //마지막줄이다 맨이야(헤카림)
                      ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
