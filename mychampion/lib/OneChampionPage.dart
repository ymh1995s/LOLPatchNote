import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    Color FontColor= Colors.black;
    if(BorNorM=="상향") FontColor = Colors.blue;
    else if(BorNorM =="하향") FontColor = Colors.red;
    else if(BorNorM =="조정") FontColor = Colors.orange;

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
                  colors: [Color(0xff4dabf7), Color(0xffda77f2), Color(0xfff783ac),
                  ],
                ),
                borderRadius: BorderRadius.circular(500),
              ),
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
                child: Container(child: 
                Text(BorNorM, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: FontColor))),
              ),
            ),
            Text(patchVer)
          ],
        ),
      ),
    );
  }
  
  
  Widget MakePatchContentContainer(int champNo, int index) {
    String UpdateDay="";
    if(patchVerDataArr[champNo][index] == "13.8") UpdateDay=PatchNoteLinkPlusDay.link[1];
    else if(patchVerDataArr[champNo][index] == "13.7") UpdateDay=PatchNoteLinkPlusDay.link[0];
    else if(patchVerDataArr[champNo][index] == "13.6") UpdateDay=PatchNoteLinkDay.link[0];
    else if(patchVerDataArr[champNo][index] == "13.5") UpdateDay=PatchNoteLinkDay.link[1];
    else if(patchVerDataArr[champNo][index] == "13.4") UpdateDay=PatchNoteLinkDay.link[2];
    else if(patchVerDataArr[champNo][index] == "13.3") UpdateDay=PatchNoteLinkDay.link[3];
    else if(patchVerDataArr[champNo][index] == "13.1B") UpdateDay=PatchNoteLinkDay.link[4];
    else if(patchVerDataArr[champNo][index] == "13.1") UpdateDay=PatchNoteLinkDay.link[5];
    else if(patchVerDataArr[champNo][index] == "12.23") UpdateDay=PatchNoteLinkDay.link[6];
    else if(patchVerDataArr[champNo][index] == "12.22") UpdateDay=PatchNoteLinkDay.link[7];
    else if(patchVerDataArr[champNo][index] == "12.21") UpdateDay=PatchNoteLinkDay.link[8];
    else if(patchVerDataArr[champNo][index] == "12.20") UpdateDay=PatchNoteLinkDay.link[9];
    else if(patchVerDataArr[champNo][index] == "12.19") UpdateDay=PatchNoteLinkDay.link[10];
    else if(patchVerDataArr[champNo][index] == "12.18") UpdateDay=PatchNoteLinkDay.link[11];
    else if(patchVerDataArr[champNo][index] == "12.17") UpdateDay=PatchNoteLinkDay.link[12];
    else if(patchVerDataArr[champNo][index] == "12.16") UpdateDay=PatchNoteLinkDay.link[13];
    else if(patchVerDataArr[champNo][index] == "12.15") UpdateDay=PatchNoteLinkDay.link[14];
    else if(patchVerDataArr[champNo][index] == "12.14") UpdateDay=PatchNoteLinkDay.link[15];
    else if(patchVerDataArr[champNo][index] == "12.13") UpdateDay=PatchNoteLinkDay.link[16];
    else if(patchVerDataArr[champNo][index] == "12.12") UpdateDay=PatchNoteLinkDay.link[17];
    else if(patchVerDataArr[champNo][index] == "12.11") UpdateDay=PatchNoteLinkDay.link[18];
    else if(patchVerDataArr[champNo][index] == "12.10") UpdateDay=PatchNoteLinkDay.link[19];
    else if(patchVerDataArr[champNo][index] == "12.9") UpdateDay=PatchNoteLinkDay.link[20];
    else if(patchVerDataArr[champNo][index] == "12.8") UpdateDay=PatchNoteLinkDay.link[21];
    else if(patchVerDataArr[champNo][index] == "12.7") UpdateDay=PatchNoteLinkDay.link[22];
    else if(patchVerDataArr[champNo][index] == "12.6") UpdateDay=PatchNoteLinkDay.link[23];
    else if(patchVerDataArr[champNo][index] == "12.5") UpdateDay=PatchNoteLinkDay.link[24];
    else if(patchVerDataArr[champNo][index] == "12.4") UpdateDay=PatchNoteLinkDay.link[25];
    else if(patchVerDataArr[champNo][index] == "12.3") UpdateDay=PatchNoteLinkDay.link[26];
    else if(patchVerDataArr[champNo][index] == "12.2") UpdateDay=PatchNoteLinkDay.link[27];
    else if(patchVerDataArr[champNo][index] == "12.1") UpdateDay=PatchNoteLinkDay.link[28];

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 240, 240),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4, left: 4),
              child: Row(
                children: [
                  Text(patchVerDataArr[champNo][index], style: TextStyle(fontSize: 18)),
                  Text("  " + UpdateDay)
                ],
              ),
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
      padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Detail_TitleArr[champNo][index][index_Detail], style: TextStyle(fontSize: 16)),
          for (int i = 0; i < Detail_ContentArr[champNo][index][index_Detail].length; i++) 
            Padding(
              padding: const EdgeInsets.only(left: 6, bottom: 4),
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
                              child: Text("최근 패치 기록(링크)", style: TextStyle(fontSize: 20)),
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
                            child: Text("역대 패치 기록(링크)", style: TextStyle(fontSize: 20),
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
