import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mychampion/OneChampionPageForm/Garen.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../ChampionData/Data.dart';

class OneChampPage extends StatefulWidget {    
  const OneChampPage({Key? key, required this.ChampIndex}) : super(key: key);
  final int ChampIndex;

  @override
  State<OneChampPage> createState() => _OneChampPageState();
}

                                    
class _OneChampPageState extends State<OneChampPage> {
  //////////////////////////////////////함수 영역
  Widget MakeBorNorMCircle(
      BuildContext context, String BorNorM, String patchVer, String link) {
    return GestureDetector(
      onTap: () {
        launch(link, forceWebView: true);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xff4dabf7),
                    Color(0xffda77f2),
                    Color(0xfff783ac),
                  ],
                ),
                borderRadius: BorderRadius.circular(500),
              ),
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
                child: Container(child: Text(BorNorM, style: TextStyle(fontSize: 18))),
              ),
            ),
            Text(patchVer)
          ],
        ),
      ),
    );
  }
  
  
  Widget MakePatchContentContainer(int champNo, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4, left: 4),
              child: Text(patchVerDataArr[champNo][index], style: TextStyle(fontSize: 18)),
            ),
            for (int i = 0; i < Detail_TitleArr[champNo][index].length; i++)
              MakePatchContentContainer_Detail(champNo, index, i),
          ],
        ),
      ),
    );
  }

  Widget MakePatchContentContainer_Detail(int champNo, int index, int index_Detail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Detail_TitleArr[champNo][index][index_Detail], style: TextStyle(fontSize: 16)),
          for (int i = 0; i < Detail_ContentArr[champNo][index][index_Detail].length; i++) 
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Text("ㆍ" + Detail_ContentArr[champNo][index][index_Detail][i], style: TextStyle(fontSize: 14)),
            ),
        ],
      ),
    );
  }



  Widget MakeHyperLink(String BorNorM, String patchVer, String link) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: GestureDetector(
          onTap: () {
            launch(link, forceWebView: true);
          },
          child: Text(BorNorM + " " + patchVer,style: TextStyle(fontSize: 16, color: Colors.blue))),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<IsFavorite_SharedPreferencess>(
        builder: (context, Isfavorite_sharedpreferencess, child) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(CupertinoIcons.arrow_left, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          //BODY
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      //챔피언 메인 초상화
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        child: CircleAvatar(
                                          radius: 40.0,
                                          backgroundImage: ExactAssetImage(ChampionImgLink[widget.ChampIndex]),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Container(
                                        child: 
                                        patchVerDataArr[widget.ChampIndex].length != 0?
                                        Text("마지막 패치 : " + patchVerDataArr[widget.ChampIndex][0], style: TextStyle(fontSize: 24))
                                        : Text("최근 패치가 없습니다.", style: TextStyle(fontSize: 24))                                        
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50.0),
                                  child: IconButton(
                                    icon: IsFavorite[widget.ChampIndex]
                                        ? Icon(CupertinoIcons.star_fill, color: Colors.yellow)
                                        : Icon(CupertinoIcons.star, color: Colors.yellow),
                                    onPressed: () {
                                      if (IsFavorite[widget.ChampIndex])
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("즐찾 해제!"),
                                                duration:Duration(seconds: 1)));
                                      else
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("즐찾 설정!"),
                                                duration:Duration(seconds: 1)));
                                      setState(() {
                                        IsFavorite[widget.ChampIndex] = !IsFavorite[widget.ChampIndex];
                                        Isfavorite_sharedpreferencess.prefs.setBool(ChampionNameEn[widget.ChampIndex],IsFavorite[widget.ChampIndex]);
                                      });
                                    },
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ),
                      //구분자라인
                      Container(
                          height: 1.0,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey),
                      Container(
                        child: 
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text("최근 패치 기록", style: TextStyle(fontSize: 20)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  for (int i = 0; i < 3; i++)
                                    if (i < patchVerDataArr[widget.ChampIndex].length && patchVerDataArr[widget.ChampIndex].length!=Null)
                                      MakeBorNorMCircle(context, BorNorMDataArr[widget.ChampIndex][i], patchVerDataArr[widget.ChampIndex][i], patchNoteLinkArr[widget.ChampIndex][i]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // //구분자라인
                      Container(
                          height: 1.0,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey),
                      //패치 세부사항
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text("패치 세부사항", style: TextStyle(fontSize: 20)),
                            ),
                            for (int i = 0; i < patchVerDataArr[widget.ChampIndex].length; i++)
                              MakePatchContentContainer(widget.ChampIndex,i),
                          ],
                        ),
                      ),
                      //구분자라인
                      Container(
                          height: 1.0,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text("역대 패치 기록", style: TextStyle(fontSize: 20),
                            ),
                          ),
                          for (int i = 0; i < patchVerDataArr[widget.ChampIndex].length; i++)
                            MakeHyperLink(BorNorMDataArr[widget.ChampIndex][i], patchVerDataArr[widget.ChampIndex][i], patchNoteLinkArr[widget.ChampIndex][i]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
