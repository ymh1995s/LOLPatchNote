//스트럭트로 하는게 나은가? 챔피언 이름, bool?
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
//167개 마지막 스몰러
const int CHAMPION_COUNT = 167;

//영어이름으로 통일하기
List<String> ChampionName =
["가렌","갈리오","갱플랭크","그라가스","그레이브즈","그웬",
"나르","나미","나서스","나피리","노틸러스","녹턴","누누와윌럼프",
"니달리","니코","닐라","다리우스","다이애나","드레이븐",
"라이즈","라칸","람머스","럭스","럼블","레나타글라스크",
"레넥톤","레오나","렉사이","렐","랭가","루시안",
"룰루","르블랑","리신","리븐","리산드라","릴리아",
"마스터이","마오카이","말자하","말파이트","모데카이저","모르가나",
"문도박사","미스포츈","밀리오","바드","바루스","바이",
"베이가", "베인", "벡스", "벨베스", "벨코즈", "볼리베어",
"브라움","브라이어",
"브랜드","블라디미르","블리츠크랭크","비에고","빅토르",
"뽀삐","사미라","사이온","사일러스","샤코","세나",
"세라핀","세주아니","세트","소나","소라카","쉔",
"쉬바나","스몰더", "스웨인","스카너","시비르","신짜오","신드라",
"신지드","쓰레쉬","아리","아무무","아우렐리온솔","아이번",
"아지르","아칼리","아크샨","아트록스","아펠리오스","알리스타",
"애니","애니비아","애쉬","야스오","에코","엘리스",
"오공","오른","오리아나","올라프","요네","요릭",
"우디르","우르곳","워윅","유미","이렐리아","이블린",
"이즈리얼", "일라오이", "자르반", "자야", "자이라", "자크",
"잔나","잭스","제드","제라스","제리","제이스",
"조이","직스","진","질리언","징크스","초가스",
"카르마","카밀","카사딘","카서스","카시오페아","카이사",
"카직스","카타리나", "칼리스타", "케넨", "케이틀린", "케인",
"케일","코그모","코르키","퀸","크산테","클레드",
"키아나","킨드레드","타릭","탈론","탈리야","탐켄치",
"트런들","트리스타나","트린다미어","트위스티드페이트","트위치","티모",
"파이크","판테온","피들스틱","피오라","피즈","하이머딩거",
"헤카림","흐웨이"];

List<String> ChampionNameEn =
["Garen","Galio","Gangplank","Gragas","Graves","Gwen",
"Gnar","Nami","Nasus","naffiri","Nautilus","Nocturne","Nunu",
"Nidalee","Neeko","Nilah","Darius","Diana","Draven",
"Ryze","Rakan","Rammus","Lux","Rumble","Renata",
"Renekton","Leona","RekSai","Rell","Rengar","Lucian",
"Lulu","Leblanc","LeeSin","Riven","Lissandra","Lillia",
"MasterYi","Maokai","Malzahar","Malphite","Mordekaiser","Morgana",
"DrMundo","MissFortune","Milio","Bard","Varus","Vi",
"Veigar", "Vayne", "Vex", "Belveth", "Velkoz", "Volibear",
"Braum", "briar",
"Brand","Vladimir","Blitzcrank","Viego","Viktor",
"Poppy","Samira","Sion","Sylas","Shaco","Senna",
"Seraphine","Sejuani","Sett","Sona","Soraka","Shen",
"Shyvana","Smolder", "Swain","Skarner","Sivir","XinZhao","Syndra",
"Singed","Thresh","Ahri","Amumu","AurelionSol","Ivern",
"Azir","Akali","Akshan","Aatrox","Aphelios","Alistar",
"Annie","Anivia","Ashe","Yasuo","Ekko","Elise",
"MonkeyKing","Ornn","Orianna","Olaf","Yone","Yorick",
"Udyr","Urgot","Warwick","Yuumi","Irelia","Evelynn",
"Ezreal", "Illaoi", "JarvanIV", "Xayah", "Zyra", "Zac",
"Janna","Jax","Zed","Xerath","Zeri","Jayce",
"Zoe","Ziggs","Jhin","Zilean","Jinx","Chogath",
"Karma","Camille","Kassadin","Karthus","Cassiopeia","Kaisa",
"Khazix","Katarina", "Kalista", "Kennen", "Caitlyn", "Kayn",
"Kayle","KogMaw","Corki","Quinn","KSante","Kled",
"Qiyana","Kindred","Taric","Talon","Taliyah","TahmKench",
"Trundle","Tristana","Tryndamere","TwistedFate","Twitch","Teemo",
"Pyke","Pantheon","Fiddlesticks","Fiora","Fizz","Heimerdinger",
"Hecarim","Hwei"];

var ChampionImgLink = List<String>.filled(CHAMPION_COUNT,"");

//즐찾 여부 (어플 실행 단에서)
List<bool> IsFavorite =[
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false, //60
  
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false, //120
  
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false, //162
  false,false,false,false,false              //167
];

class PatchNoteLink{
  //얘는 추가하면 뒤에 애들 밀려서 개판되네;;
  static List<String> link = [
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-6-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-5-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-4-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-3-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-1b-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-1-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-23-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-22-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-21-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-20-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-19-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-18-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-17-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-16-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-15-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-14-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-13-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-12-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-11-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-10-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-9-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-8-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-7-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-6-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-5-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-4-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-3-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-2-notes/",
  "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-1-notes/"];
}

class PatchNoteLinkDay{
  static List<String> link = [    
    "2023-3-22",
    "2023-3-8",
    "2023-2-23",
    "2023-2-9",
    "2023-1-27",
    "2023-1-11",
    "2022-12-7", //23
    "2022-11-16",
    "2022-11-2",
    "2022-10-19",
    "2022-10-5",
    "2022-9-21",
    "2022-9-8",
    "2022-8-24",
    "2022-8-10",
    "2022-7-27",
    "2022-7-13",
    "2022-6-23",
    "2022-6-8",
    "2022-5-25", //10
    "2022-5-11",
    "2022-4-27",
    "2022-4-13",
    "2022-3-30",
    "2022-3-2",
    "2022-2-16",
    "2022-2-2",
    "2022-1-20",
    "2022-1-5", //1
  ];
}

class PatchNoteLinkPlus{
  //13.7 이후의 버전
  static List<String> link = [
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-7-notes/", //0
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-8-notes/",
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-9-notes/",
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-10-notes/",
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-11-notes/",
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-12-notes/", //5
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-13-notes/",
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-14-notes/",
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-15-notes/",
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-16-notes/",
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-17-notes/",//10
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-18-notes/",
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-19-notes/",
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-20-notes/",
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-21-notes/",
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-22-notes/", //15
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-23-notes/",
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-24-notes/",
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-14-1-notes/",
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-14-2-notes/",
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-14-3-notes/", //20
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-14-4-notes/", //21
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-14-5-notes/", //22
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-14-6-notes/", //23
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-14-7-notes/", //24
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-14-8-notes/", //25
    ];
}

class PatchNoteLinkPlusDay{
  //13.7 이후의 버전
  static List<String> link = [
    "2023-4-5",
    "2023-4-19",
    "2023-5-3",
    "2023-5-18",
    "2023-5-31",
    "2023-6-14",
    "2023-6-26",
    "2023-7-18",
    "2023-8-1",
    "2023-8-16",
    "2023-8-30",
    "2023-9-13",
    "2023-9-27",
    "2023-10-10",
    "2023-10-24",
    "2023-11-7",
    "2023-11-20",
    "2023-12-6",
    "2024-1-10",
    "2024-1-24",
    "2024-2-7",
    "2024-2-21",
    "2024-3-6",
    "2024-3-20",
    "2024-4-3",
    "2024-4-17",];
}

var patchVerDataArr = [
  PatchContent_Garen.patchVer,
  PatchContent_Galio.patchVer,
  PatchContent_Gangplank.patchVer,
  PatchContent_Gragas.patchVer,
  PatchContent_Graves.patchVer,
  PatchContent_Gwen.patchVer,
  PatchContent_Gnar.patchVer,
  PatchContent_Nami.patchVer,
  PatchContent_Nasus.patchVer,
  PatchContent_Naffiri.patchVer,
  PatchContent_Nautilus.patchVer,
  PatchContent_Nocturne.patchVer,
  PatchContent_Nunu.patchVer,
  PatchContent_Nidalee.patchVer,
  PatchContent_Neeko.patchVer,
  PatchContent_Nilah.patchVer,
  PatchContent_Darius.patchVer,
  PatchContent_Diana.patchVer,
  PatchContent_Draven.patchVer,
  PatchContent_Ryze.patchVer,
  PatchContent_Rakan.patchVer,
  PatchContent_Rammus.patchVer,
  PatchContent_Lux.patchVer,
  PatchContent_Rumble.patchVer,
  PatchContent_Renata.patchVer,
  PatchContent_Renekton.patchVer,
  PatchContent_Leona.patchVer,
  PatchContent_RekSai.patchVer,
  PatchContent_Rell.patchVer,
  PatchContent_Rengar.patchVer,
  PatchContent_Lucian.patchVer,
  PatchContent_Lulu.patchVer,
  PatchContent_Leblanc.patchVer,
  PatchContent_LeeSin.patchVer,
  PatchContent_Riven.patchVer,
  PatchContent_Lissandra.patchVer,
  PatchContent_Lillia.patchVer,
  PatchContent_MasterYi.patchVer,
  PatchContent_Maokai.patchVer,
  PatchContent_Malzahar.patchVer,
  PatchContent_Malphite.patchVer,
  PatchContent_Mordekaiser.patchVer,
  PatchContent_Morgana.patchVer,
  PatchContent_DrMundo.patchVer,
  PatchContent_MissFortune.patchVer,
  PatchContent_Milio.patchVer,
  PatchContent_Bard.patchVer,
  PatchContent_Varus.patchVer,
  PatchContent_Vi.patchVer,
  PatchContent_Veigar.patchVer,
  PatchContent_Vayne.patchVer,
  PatchContent_Vex.patchVer,
  PatchContent_Belveth.patchVer,
  PatchContent_Velkoz.patchVer,
  PatchContent_Volibear.patchVer,
  PatchContent_Braum.patchVer,
  PatchContent_Briar.patchVer,
  PatchContent_Brand.patchVer,
  PatchContent_Vladimir.patchVer,
  PatchContent_Blitzcrank.patchVer,
  PatchContent_Viego.patchVer,
  PatchContent_Viktor.patchVer,
  PatchContent_Poppy.patchVer,
  PatchContent_Samira.patchVer,
  PatchContent_Sion.patchVer,
  PatchContent_Sylas.patchVer,
  PatchContent_Shaco.patchVer,
  PatchContent_Senna.patchVer,
  PatchContent_Seraphine.patchVer,
  PatchContent_Sejuani.patchVer,
  PatchContent_Sett.patchVer,
  PatchContent_Sona.patchVer,
  PatchContent_Soraka.patchVer,
  PatchContent_Shen.patchVer,
  PatchContent_Shyvana.patchVer,
  PatchContent_Smolder.patchVer,
  PatchContent_Swain.patchVer,
  PatchContent_Skarner.patchVer,
  PatchContent_Sivir.patchVer,
  PatchContent_XinZhao.patchVer,
  PatchContent_Syndra.patchVer,
  PatchContent_Singed.patchVer,
  PatchContent_Thresh.patchVer,
  PatchContent_Ahri.patchVer,
  PatchContent_Amumu.patchVer,
  PatchContent_AurelionSol.patchVer,
  PatchContent_Ivern.patchVer,
  PatchContent_Azir.patchVer,
  PatchContent_Akali.patchVer,
  PatchContent_Akshan.patchVer,
  PatchContent_Aatrox.patchVer,
  PatchContent_Aphelios.patchVer,
  PatchContent_Alistar.patchVer,
  PatchContent_Annie.patchVer,
  PatchContent_Anivia.patchVer,
  PatchContent_Ashe.patchVer,
  PatchContent_Yasuo.patchVer,
  PatchContent_Ekko.patchVer,
  PatchContent_Elise.patchVer,
  PatchContent_MonkeyKing.patchVer,
  PatchContent_Ornn.patchVer,
  PatchContent_Orianna.patchVer,
  PatchContent_Olaf.patchVer,
  PatchContent_Yone.patchVer,
  PatchContent_Yorick.patchVer,
  PatchContent_Udyr.patchVer,
  PatchContent_Urgot.patchVer,
  PatchContent_Warwick.patchVer,
  PatchContent_Yuumi.patchVer,
  PatchContent_Irelia.patchVer,
  PatchContent_Evelynn.patchVer,
  PatchContent_Ezreal.patchVer,
  PatchContent_Illaoi.patchVer,
  PatchContent_JarvanIV.patchVer,
  PatchContent_Xayah.patchVer,
  PatchContent_Zyra.patchVer,
  PatchContent_Zac.patchVer,
  PatchContent_Janna.patchVer,
  PatchContent_Jax.patchVer,
  PatchContent_Zed.patchVer,
  PatchContent_Xerath.patchVer,
  PatchContent_Zeri.patchVer,
  PatchContent_Jayce.patchVer,
  PatchContent_Zoe.patchVer,
  PatchContent_Ziggs.patchVer,
  PatchContent_Jhin.patchVer,
  PatchContent_Zilean.patchVer,
  PatchContent_Jinx.patchVer,
  PatchContent_Chogath.patchVer,
  PatchContent_Karma.patchVer,
  PatchContent_Camille.patchVer,
  PatchContent_Kassadin.patchVer,
  PatchContent_Karthus.patchVer,
  PatchContent_Cassiopeia.patchVer,
  PatchContent_Kaisa.patchVer,
  PatchContent_Khazix.patchVer,
  PatchContent_Katarina.patchVer,
  PatchContent_Kalista.patchVer,
  PatchContent_Kennen.patchVer,
  PatchContent_Caitlyn.patchVer,
  PatchContent_Kayn.patchVer,
  PatchContent_Kayle.patchVer,
  PatchContent_KogMaw.patchVer,
  PatchContent_Corki.patchVer,
  PatchContent_Quinn.patchVer,
  PatchContent_KSante.patchVer,
  PatchContent_Kled.patchVer,
  PatchContent_Qiyana.patchVer,
  PatchContent_Kindred.patchVer,
  PatchContent_Taric.patchVer,
  PatchContent_Talon.patchVer,
  PatchContent_Taliyah.patchVer,
  PatchContent_TahmKench.patchVer,
  PatchContent_Trundle.patchVer,
  PatchContent_Tristana.patchVer,
  PatchContent_Tryndamere.patchVer,
  PatchContent_TwistedFate.patchVer,
  PatchContent_Twitch.patchVer,
  PatchContent_Teemo.patchVer,
  PatchContent_Pyke.patchVer,
  PatchContent_Pantheon.patchVer,
  PatchContent_Fiddlesticks.patchVer,
  PatchContent_Fiora.patchVer,
  PatchContent_Fizz.patchVer,
  PatchContent_Heimerdinger.patchVer,
  PatchContent_Hecarim.patchVer,
  PatchContent_Hwei.patchVer
];

var BorNorMDataArr = [
  PatchContent_Garen.BorNorM,
  PatchContent_Galio.BorNorM,
  PatchContent_Gangplank.BorNorM,
  PatchContent_Gragas.BorNorM,
  PatchContent_Graves.BorNorM,
  PatchContent_Gwen.BorNorM,
  PatchContent_Gnar.BorNorM,
  PatchContent_Nami.BorNorM,
  PatchContent_Nasus.BorNorM,
  PatchContent_Naffiri.BorNorM,
  PatchContent_Nautilus.BorNorM,
  PatchContent_Nocturne.BorNorM,
  PatchContent_Nunu.BorNorM,
  PatchContent_Nidalee.BorNorM,
  PatchContent_Neeko.BorNorM,
  PatchContent_Nilah.BorNorM,
  PatchContent_Darius.BorNorM,
  PatchContent_Diana.BorNorM,
  PatchContent_Draven.BorNorM,
  PatchContent_Ryze.BorNorM,
  PatchContent_Rakan.BorNorM,
  PatchContent_Rammus.BorNorM,
  PatchContent_Lux.BorNorM,
  PatchContent_Rumble.BorNorM,
  PatchContent_Renata.BorNorM,
  PatchContent_Renekton.BorNorM,
  PatchContent_Leona.BorNorM,
  PatchContent_RekSai.BorNorM,
  PatchContent_Rell.BorNorM,
  PatchContent_Rengar.BorNorM,
  PatchContent_Lucian.BorNorM,
  PatchContent_Lulu.BorNorM,
  PatchContent_Leblanc.BorNorM,
  PatchContent_LeeSin.BorNorM,
  PatchContent_Riven.BorNorM,
  PatchContent_Lissandra.BorNorM,
  PatchContent_Lillia.BorNorM,
  PatchContent_MasterYi.BorNorM,
  PatchContent_Maokai.BorNorM,
  PatchContent_Malzahar.BorNorM,
  PatchContent_Malphite.BorNorM,
  PatchContent_Mordekaiser.BorNorM,
  PatchContent_Morgana.BorNorM,
  PatchContent_DrMundo.BorNorM,
  PatchContent_MissFortune.BorNorM,
  PatchContent_Milio.BorNorM, //44
  PatchContent_Bard.BorNorM,
  PatchContent_Varus.BorNorM,
  PatchContent_Vi.BorNorM,
  PatchContent_Veigar.BorNorM,
  PatchContent_Vayne.BorNorM,
  PatchContent_Vex.BorNorM,
  PatchContent_Belveth.BorNorM,
  PatchContent_Velkoz.BorNorM,
  PatchContent_Volibear.BorNorM,
  PatchContent_Braum.BorNorM,
  PatchContent_Briar.BorNorM,
  PatchContent_Brand.BorNorM,
  PatchContent_Vladimir.BorNorM,
  PatchContent_Blitzcrank.BorNorM,
  PatchContent_Viego.BorNorM,
  PatchContent_Viktor.BorNorM,
  PatchContent_Poppy.BorNorM,
  PatchContent_Samira.BorNorM,
  PatchContent_Sion.BorNorM,
  PatchContent_Sylas.BorNorM,
  PatchContent_Shaco.BorNorM,
  PatchContent_Senna.BorNorM,
  PatchContent_Seraphine.BorNorM,
  PatchContent_Sejuani.BorNorM,
  PatchContent_Sett.BorNorM,
  PatchContent_Sona.BorNorM,
  PatchContent_Soraka.BorNorM,
  PatchContent_Shen.BorNorM,
  PatchContent_Shyvana.BorNorM,
  PatchContent_Smolder.BorNorM,
  PatchContent_Swain.BorNorM,
  PatchContent_Skarner.BorNorM,
  PatchContent_Sivir.BorNorM,
  PatchContent_XinZhao.BorNorM,
  PatchContent_Syndra.BorNorM,
  PatchContent_Singed.BorNorM,
  PatchContent_Thresh.BorNorM,
  PatchContent_Ahri.BorNorM,
  PatchContent_Amumu.BorNorM,
  PatchContent_AurelionSol.BorNorM,
  PatchContent_Ivern.BorNorM,
  PatchContent_Azir.BorNorM,
  PatchContent_Akali.BorNorM,
  PatchContent_Akshan.BorNorM,
  PatchContent_Aatrox.BorNorM,
  PatchContent_Aphelios.BorNorM,
  PatchContent_Alistar.BorNorM,
  PatchContent_Annie.BorNorM,
  PatchContent_Anivia.BorNorM,
  PatchContent_Ashe.BorNorM,
  PatchContent_Yasuo.BorNorM,
  PatchContent_Ekko.BorNorM,
  PatchContent_Elise.BorNorM,
  PatchContent_MonkeyKing.BorNorM,
  PatchContent_Ornn.BorNorM,
  PatchContent_Orianna.BorNorM,
  PatchContent_Olaf.BorNorM,
  PatchContent_Yone.BorNorM,
  PatchContent_Yorick.BorNorM,
  PatchContent_Udyr.BorNorM,
  PatchContent_Urgot.BorNorM,
  PatchContent_Warwick.BorNorM,
  PatchContent_Yuumi.BorNorM,
  PatchContent_Irelia.BorNorM,
  PatchContent_Evelynn.BorNorM,
  PatchContent_Ezreal.BorNorM,
  PatchContent_Illaoi.BorNorM,
  PatchContent_JarvanIV.BorNorM,
  PatchContent_Xayah.BorNorM,
  PatchContent_Zyra.BorNorM,
  PatchContent_Zac.BorNorM,
  PatchContent_Janna.BorNorM,
  PatchContent_Jax.BorNorM,
  PatchContent_Zed.BorNorM,
  PatchContent_Xerath.BorNorM,
  PatchContent_Zeri.BorNorM,
  PatchContent_Jayce.BorNorM,
  PatchContent_Zoe.BorNorM,
  PatchContent_Ziggs.BorNorM,
  PatchContent_Jhin.BorNorM,
  PatchContent_Zilean.BorNorM,
  PatchContent_Jinx.BorNorM,
  PatchContent_Chogath.BorNorM,
  PatchContent_Karma.BorNorM,
  PatchContent_Camille.BorNorM,
  PatchContent_Kassadin.BorNorM,
  PatchContent_Karthus.BorNorM,
  PatchContent_Cassiopeia.BorNorM,
  PatchContent_Kaisa.BorNorM,
  PatchContent_Khazix.BorNorM,
  PatchContent_Katarina.BorNorM,
  PatchContent_Kalista.BorNorM,
  PatchContent_Kennen.BorNorM,
  PatchContent_Caitlyn.BorNorM,
  PatchContent_Kayn.BorNorM,
  PatchContent_Kayle.BorNorM,
  PatchContent_KogMaw.BorNorM,
  PatchContent_Corki.BorNorM,
  PatchContent_Quinn.BorNorM,
  PatchContent_KSante.BorNorM,
  PatchContent_Kled.BorNorM,
  PatchContent_Qiyana.BorNorM,
  PatchContent_Kindred.BorNorM,
  PatchContent_Taric.BorNorM,
  PatchContent_Talon.BorNorM,
  PatchContent_Taliyah.BorNorM,
  PatchContent_TahmKench.BorNorM,
  PatchContent_Trundle.BorNorM,
  PatchContent_Tristana.BorNorM,
  PatchContent_Tryndamere.BorNorM,
  PatchContent_TwistedFate.BorNorM,
  PatchContent_Twitch.BorNorM,
  PatchContent_Teemo.BorNorM,
  PatchContent_Pyke.BorNorM,
  PatchContent_Pantheon.BorNorM,
  PatchContent_Fiddlesticks.BorNorM,
  PatchContent_Fiora.BorNorM,
  PatchContent_Fizz.BorNorM,
  PatchContent_Heimerdinger.BorNorM,
  PatchContent_Hecarim.BorNorM,
  PatchContent_Hwei.BorNorM
];

var patchNoteLinkArr = [
  PatchContent_Garen.patchNoteLink,
  PatchContent_Galio.patchNoteLink,
  PatchContent_Gangplank.patchNoteLink,
  PatchContent_Gragas.patchNoteLink,
  PatchContent_Graves.patchNoteLink,
  PatchContent_Gwen.patchNoteLink,
  PatchContent_Gnar.patchNoteLink,
  PatchContent_Nami.patchNoteLink,
  PatchContent_Nasus.patchNoteLink,  
  PatchContent_Naffiri.patchNoteLink,
  PatchContent_Nautilus.patchNoteLink,
  PatchContent_Nocturne.patchNoteLink,
  PatchContent_Nunu.patchNoteLink,
  PatchContent_Nidalee.patchNoteLink,
  PatchContent_Neeko.patchNoteLink,
  PatchContent_Nilah.patchNoteLink,
  PatchContent_Darius.patchNoteLink,
  PatchContent_Diana.patchNoteLink,
  PatchContent_Draven.patchNoteLink,
  PatchContent_Ryze.patchNoteLink,
  PatchContent_Rakan.patchNoteLink,
  PatchContent_Rammus.patchNoteLink,
  PatchContent_Lux.patchNoteLink,
  PatchContent_Rumble.patchNoteLink,
  PatchContent_Renata.patchNoteLink,
  PatchContent_Renekton.patchNoteLink,
  PatchContent_Leona.patchNoteLink,
  PatchContent_RekSai.patchNoteLink,
  PatchContent_Rell.patchNoteLink,
  PatchContent_Rengar.patchNoteLink,
  PatchContent_Lucian.patchNoteLink,
  PatchContent_Lulu.patchNoteLink,
  PatchContent_Leblanc.patchNoteLink,
  PatchContent_LeeSin.patchNoteLink,
  PatchContent_Riven.patchNoteLink,
  PatchContent_Lissandra.patchNoteLink,
  PatchContent_Lillia.patchNoteLink,
  PatchContent_MasterYi.patchNoteLink,
  PatchContent_Maokai.patchNoteLink,
  PatchContent_Malzahar.patchNoteLink,
  PatchContent_Malphite.patchNoteLink,
  PatchContent_Mordekaiser.patchNoteLink,
  PatchContent_Morgana.patchNoteLink,
  PatchContent_DrMundo.patchNoteLink,
  PatchContent_MissFortune.patchNoteLink,
  PatchContent_Milio.patchNoteLink,
  PatchContent_Bard.patchNoteLink,
  PatchContent_Varus.patchNoteLink,
  PatchContent_Vi.patchNoteLink,
  PatchContent_Veigar.patchNoteLink,
  PatchContent_Vayne.patchNoteLink,
  PatchContent_Vex.patchNoteLink,
  PatchContent_Belveth.patchNoteLink,
  PatchContent_Velkoz.patchNoteLink,
  PatchContent_Volibear.patchNoteLink,
  PatchContent_Braum.patchNoteLink,
  PatchContent_Briar.patchNoteLink,
  PatchContent_Brand.patchNoteLink,
  PatchContent_Vladimir.patchNoteLink,
  PatchContent_Blitzcrank.patchNoteLink,
  PatchContent_Viego.patchNoteLink,
  PatchContent_Viktor.patchNoteLink,
  PatchContent_Poppy.patchNoteLink,
  PatchContent_Samira.patchNoteLink,
  PatchContent_Sion.patchNoteLink,
  PatchContent_Sylas.patchNoteLink,
  PatchContent_Shaco.patchNoteLink,
  PatchContent_Senna.patchNoteLink,
  PatchContent_Seraphine.patchNoteLink,
  PatchContent_Sejuani.patchNoteLink,
  PatchContent_Sett.patchNoteLink,
  PatchContent_Sona.patchNoteLink,
  PatchContent_Soraka.patchNoteLink,
  PatchContent_Shen.patchNoteLink,
  PatchContent_Shyvana.patchNoteLink,
  PatchContent_Smolder.patchNoteLink,
  PatchContent_Swain.patchNoteLink,
  PatchContent_Skarner.patchNoteLink,
  PatchContent_Sivir.patchNoteLink,
  PatchContent_XinZhao.patchNoteLink,
  PatchContent_Syndra.patchNoteLink,
  PatchContent_Singed.patchNoteLink,
  PatchContent_Thresh.patchNoteLink,
  PatchContent_Ahri.patchNoteLink,
  PatchContent_Amumu.patchNoteLink,
  PatchContent_AurelionSol.patchNoteLink,
  PatchContent_Ivern.patchNoteLink,
  PatchContent_Azir.patchNoteLink,
  PatchContent_Akali.patchNoteLink,
  PatchContent_Akshan.patchNoteLink,
  PatchContent_Aatrox.patchNoteLink,
  PatchContent_Aphelios.patchNoteLink,
  PatchContent_Alistar.patchNoteLink,
  PatchContent_Annie.patchNoteLink,
  PatchContent_Anivia.patchNoteLink,
  PatchContent_Ashe.patchNoteLink,
  PatchContent_Yasuo.patchNoteLink,
  PatchContent_Ekko.patchNoteLink,
  PatchContent_Elise.patchNoteLink,
  PatchContent_MonkeyKing.patchNoteLink,
  PatchContent_Ornn.patchNoteLink,
  PatchContent_Orianna.patchNoteLink,
  PatchContent_Olaf.patchNoteLink,
  PatchContent_Yone.patchNoteLink,
  PatchContent_Yorick.patchNoteLink,
  PatchContent_Udyr.patchNoteLink,
  PatchContent_Urgot.patchNoteLink,
  PatchContent_Warwick.patchNoteLink,
  PatchContent_Yuumi.patchNoteLink,
  PatchContent_Irelia.patchNoteLink,
  PatchContent_Evelynn.patchNoteLink,
  PatchContent_Ezreal.patchNoteLink,
  PatchContent_Illaoi.patchNoteLink,
  PatchContent_JarvanIV.patchNoteLink,
  PatchContent_Xayah.patchNoteLink,
  PatchContent_Zyra.patchNoteLink,
  PatchContent_Zac.patchNoteLink,
  PatchContent_Janna.patchNoteLink,
  PatchContent_Jax.patchNoteLink,
  PatchContent_Zed.patchNoteLink,
  PatchContent_Xerath.patchNoteLink,
  PatchContent_Zeri.patchNoteLink,
  PatchContent_Jayce.patchNoteLink,
  PatchContent_Zoe.patchNoteLink,
  PatchContent_Ziggs.patchNoteLink,
  PatchContent_Jhin.patchNoteLink,
  PatchContent_Zilean.patchNoteLink,
  PatchContent_Jinx.patchNoteLink,
  PatchContent_Chogath.patchNoteLink,
  PatchContent_Karma.patchNoteLink,
  PatchContent_Camille.patchNoteLink,
  PatchContent_Kassadin.patchNoteLink,
  PatchContent_Karthus.patchNoteLink,
  PatchContent_Cassiopeia.patchNoteLink,
  PatchContent_Kaisa.patchNoteLink,
  PatchContent_Khazix.patchNoteLink,
  PatchContent_Katarina.patchNoteLink,
  PatchContent_Kalista.patchNoteLink,
  PatchContent_Kennen.patchNoteLink,
  PatchContent_Caitlyn.patchNoteLink,
  PatchContent_Kayn.patchNoteLink,
  PatchContent_Kayle.patchNoteLink,
  PatchContent_KogMaw.patchNoteLink,
  PatchContent_Corki.patchNoteLink,
  PatchContent_Quinn.patchNoteLink,
  PatchContent_KSante.patchNoteLink,
  PatchContent_Kled.patchNoteLink,
  PatchContent_Qiyana.patchNoteLink,
  PatchContent_Kindred.patchNoteLink,
  PatchContent_Taric.patchNoteLink,
  PatchContent_Talon.patchNoteLink,
  PatchContent_Taliyah.patchNoteLink,
  PatchContent_TahmKench.patchNoteLink,
  PatchContent_Trundle.patchNoteLink,
  PatchContent_Tristana.patchNoteLink,
  PatchContent_Tryndamere.patchNoteLink,
  PatchContent_TwistedFate.patchNoteLink,
  PatchContent_Twitch.patchNoteLink,
  PatchContent_Teemo.patchNoteLink,
  PatchContent_Pyke.patchNoteLink,
  PatchContent_Pantheon.patchNoteLink,
  PatchContent_Fiddlesticks.patchNoteLink,
  PatchContent_Fiora.patchNoteLink,
  PatchContent_Fizz.patchNoteLink,
  PatchContent_Heimerdinger.patchNoteLink,
  PatchContent_Hecarim.patchNoteLink,
  PatchContent_Hwei.patchNoteLink
];

var Detail_TitleArr = [
  PatchContent_Garen.Detail_Title,
  PatchContent_Galio.Detail_Title,
  PatchContent_Gangplank.Detail_Title,
  PatchContent_Gragas.Detail_Title,
  PatchContent_Graves.Detail_Title,
  PatchContent_Gwen.Detail_Title,
  PatchContent_Gnar.Detail_Title,
  PatchContent_Nami.Detail_Title,
  PatchContent_Nasus.Detail_Title,
  PatchContent_Naffiri.Detail_Title,
  PatchContent_Nautilus.Detail_Title,
  PatchContent_Nocturne.Detail_Title,
  PatchContent_Nunu.Detail_Title,
  PatchContent_Nidalee.Detail_Title,
  PatchContent_Neeko.Detail_Title,
  PatchContent_Nilah.Detail_Title,
  PatchContent_Darius.Detail_Title,
  PatchContent_Diana.Detail_Title,
  PatchContent_Draven.Detail_Title,
  PatchContent_Ryze.Detail_Title,
  PatchContent_Rakan.Detail_Title,
  PatchContent_Rammus.Detail_Title,
  PatchContent_Lux.Detail_Title,
  PatchContent_Rumble.Detail_Title,
  PatchContent_Renata.Detail_Title,
  PatchContent_Renekton.Detail_Title,
  PatchContent_Leona.Detail_Title,
  PatchContent_RekSai.Detail_Title,
  PatchContent_Rell.Detail_Title,
  PatchContent_Rengar.Detail_Title,
  PatchContent_Lucian.Detail_Title,
  PatchContent_Lulu.Detail_Title,
  PatchContent_Leblanc.Detail_Title,
  PatchContent_LeeSin.Detail_Title,
  PatchContent_Riven.Detail_Title,
  PatchContent_Lissandra.Detail_Title,
  PatchContent_Lillia.Detail_Title,
  PatchContent_MasterYi.Detail_Title,
  PatchContent_Maokai.Detail_Title,
  PatchContent_Malzahar.Detail_Title,
  PatchContent_Malphite.Detail_Title,
  PatchContent_Mordekaiser.Detail_Title,
  PatchContent_Morgana.Detail_Title,
  PatchContent_DrMundo.Detail_Title,
  PatchContent_MissFortune.Detail_Title,
  PatchContent_Milio.Detail_Title,
  PatchContent_Bard.Detail_Title,
  PatchContent_Varus.Detail_Title,
  PatchContent_Vi.Detail_Title,
  PatchContent_Veigar.Detail_Title,
  PatchContent_Vayne.Detail_Title,
  PatchContent_Vex.Detail_Title,
  PatchContent_Belveth.Detail_Title,
  PatchContent_Velkoz.Detail_Title,
  PatchContent_Volibear.Detail_Title,
  PatchContent_Braum.Detail_Title,
  PatchContent_Briar.Detail_Title,
  PatchContent_Brand.Detail_Title,
  PatchContent_Vladimir.Detail_Title,
  PatchContent_Blitzcrank.Detail_Title,
  PatchContent_Viego.Detail_Title,
  PatchContent_Viktor.Detail_Title,
  PatchContent_Poppy.Detail_Title,
  PatchContent_Samira.Detail_Title,
  PatchContent_Sion.Detail_Title,
  PatchContent_Sylas.Detail_Title,
  PatchContent_Shaco.Detail_Title,
  PatchContent_Senna.Detail_Title,
  PatchContent_Seraphine.Detail_Title,
  PatchContent_Sejuani.Detail_Title,
  PatchContent_Sett.Detail_Title,
  PatchContent_Sona.Detail_Title,
  PatchContent_Soraka.Detail_Title,
  PatchContent_Shen.Detail_Title,
  PatchContent_Shyvana.Detail_Title,
  PatchContent_Smolder.Detail_Title,
  PatchContent_Swain.Detail_Title,
  PatchContent_Skarner.Detail_Title,
  PatchContent_Sivir.Detail_Title,
  PatchContent_XinZhao.Detail_Title,
  PatchContent_Syndra.Detail_Title,
  PatchContent_Singed.Detail_Title,
  PatchContent_Thresh.Detail_Title,
  PatchContent_Ahri.Detail_Title,
  PatchContent_Amumu.Detail_Title,
  PatchContent_AurelionSol.Detail_Title,
  PatchContent_Ivern.Detail_Title,
  PatchContent_Azir.Detail_Title,
  PatchContent_Akali.Detail_Title,
  PatchContent_Akshan.Detail_Title,
  PatchContent_Aatrox.Detail_Title,
  PatchContent_Aphelios.Detail_Title,
  PatchContent_Alistar.Detail_Title,
  PatchContent_Annie.Detail_Title,
  PatchContent_Anivia.Detail_Title,
  PatchContent_Ashe.Detail_Title,
  PatchContent_Yasuo.Detail_Title,
  PatchContent_Ekko.Detail_Title,
  PatchContent_Elise.Detail_Title,
  PatchContent_MonkeyKing.Detail_Title,
  PatchContent_Ornn.Detail_Title,
  PatchContent_Orianna.Detail_Title,
  PatchContent_Olaf.Detail_Title,
  PatchContent_Yone.Detail_Title,
  PatchContent_Yorick.Detail_Title,
  PatchContent_Udyr.Detail_Title,
  PatchContent_Urgot.Detail_Title,
  PatchContent_Warwick.Detail_Title,
  PatchContent_Yuumi.Detail_Title,
  PatchContent_Irelia.Detail_Title,
  PatchContent_Evelynn.Detail_Title,
  PatchContent_Ezreal.Detail_Title,
  PatchContent_Illaoi.Detail_Title,
  PatchContent_JarvanIV.Detail_Title,
  PatchContent_Xayah.Detail_Title,
  PatchContent_Zyra.Detail_Title,
  PatchContent_Zac.Detail_Title,
  PatchContent_Janna.Detail_Title,
  PatchContent_Jax.Detail_Title,
  PatchContent_Zed.Detail_Title,
  PatchContent_Xerath.Detail_Title,
  PatchContent_Zeri.Detail_Title,
  PatchContent_Jayce.Detail_Title,
  PatchContent_Zoe.Detail_Title,
  PatchContent_Ziggs.Detail_Title,
  PatchContent_Jhin.Detail_Title,
  PatchContent_Zilean.Detail_Title,
  PatchContent_Jinx.Detail_Title,
  PatchContent_Chogath.Detail_Title,
  PatchContent_Karma.Detail_Title,
  PatchContent_Camille.Detail_Title,
  PatchContent_Kassadin.Detail_Title,
  PatchContent_Karthus.Detail_Title,
  PatchContent_Cassiopeia.Detail_Title,
  PatchContent_Kaisa.Detail_Title,
  PatchContent_Khazix.Detail_Title,
  PatchContent_Katarina.Detail_Title,
  PatchContent_Kalista.Detail_Title,
  PatchContent_Kennen.Detail_Title,
  PatchContent_Caitlyn.Detail_Title,
  PatchContent_Kayn.Detail_Title,
  PatchContent_Kayle.Detail_Title,
  PatchContent_KogMaw.Detail_Title,
  PatchContent_Corki.Detail_Title,
  PatchContent_Quinn.Detail_Title,
  PatchContent_KSante.Detail_Title,
  PatchContent_Kled.Detail_Title,
  PatchContent_Qiyana.Detail_Title,
  PatchContent_Kindred.Detail_Title,
  PatchContent_Taric.Detail_Title,
  PatchContent_Talon.Detail_Title,
  PatchContent_Taliyah.Detail_Title,
  PatchContent_TahmKench.Detail_Title,
  PatchContent_Trundle.Detail_Title,
  PatchContent_Tristana.Detail_Title,
  PatchContent_Tryndamere.Detail_Title,
  PatchContent_TwistedFate.Detail_Title,
  PatchContent_Twitch.Detail_Title,
  PatchContent_Teemo.Detail_Title,
  PatchContent_Pyke.Detail_Title,
  PatchContent_Pantheon.Detail_Title,
  PatchContent_Fiddlesticks.Detail_Title,
  PatchContent_Fiora.Detail_Title,
  PatchContent_Fizz.Detail_Title,
  PatchContent_Heimerdinger.Detail_Title,
  PatchContent_Hecarim.Detail_Title,
  PatchContent_Hwei.Detail_Title
];

var Detail_ContentArr = [
  PatchContent_Garen.Detail_Content,
  PatchContent_Galio.Detail_Content,
  PatchContent_Gangplank.Detail_Content,
  PatchContent_Gragas.Detail_Content,
  PatchContent_Graves.Detail_Content,
  PatchContent_Gwen.Detail_Content,
  PatchContent_Gnar.Detail_Content,
  PatchContent_Nami.Detail_Content,
  PatchContent_Nasus.Detail_Content,
  PatchContent_Naffiri.Detail_Content,
  PatchContent_Nautilus.Detail_Content,
  PatchContent_Nocturne.Detail_Content,
  PatchContent_Nunu.Detail_Content,
  PatchContent_Nidalee.Detail_Content,
  PatchContent_Neeko.Detail_Content,
  PatchContent_Nilah.Detail_Content,
  PatchContent_Darius.Detail_Content,
  PatchContent_Diana.Detail_Content,
  PatchContent_Draven.Detail_Content,
  PatchContent_Ryze.Detail_Content,
  PatchContent_Rakan.Detail_Content,
  PatchContent_Rammus.Detail_Content,
  PatchContent_Lux.Detail_Content,
  PatchContent_Rumble.Detail_Content,
  PatchContent_Renata.Detail_Content,
  PatchContent_Renekton.Detail_Content,
  PatchContent_Leona.Detail_Content,
  PatchContent_RekSai.Detail_Content,
  PatchContent_Rell.Detail_Content,
  PatchContent_Rengar.Detail_Content,
  PatchContent_Lucian.Detail_Content,
  PatchContent_Lulu.Detail_Content,
  PatchContent_Leblanc.Detail_Content,
  PatchContent_LeeSin.Detail_Content,
  PatchContent_Riven.Detail_Content,
  PatchContent_Lissandra.Detail_Content,
  PatchContent_Lillia.Detail_Content,
  PatchContent_MasterYi.Detail_Content,
  PatchContent_Maokai.Detail_Content,
  PatchContent_Malzahar.Detail_Content,
  PatchContent_Malphite.Detail_Content,
  PatchContent_Mordekaiser.Detail_Content,
  PatchContent_Morgana.Detail_Content,
  PatchContent_DrMundo.Detail_Content,
  PatchContent_MissFortune.Detail_Content,
  PatchContent_Milio.Detail_Content,
  PatchContent_Bard.Detail_Content,
  PatchContent_Varus.Detail_Content,
  PatchContent_Vi.Detail_Content,
  PatchContent_Veigar.Detail_Content,
  PatchContent_Vayne.Detail_Content,
  PatchContent_Vex.Detail_Content,
  PatchContent_Belveth.Detail_Content,
  PatchContent_Velkoz.Detail_Content,
  PatchContent_Volibear.Detail_Content,
  PatchContent_Braum.Detail_Content,
  PatchContent_Briar.Detail_Content,
  PatchContent_Brand.Detail_Content,
  PatchContent_Vladimir.Detail_Content,
  PatchContent_Blitzcrank.Detail_Content,
  PatchContent_Viego.Detail_Content,
  PatchContent_Viktor.Detail_Content,
  PatchContent_Poppy.Detail_Content,
  PatchContent_Samira.Detail_Content,
  PatchContent_Sion.Detail_Content,
  PatchContent_Sylas.Detail_Content,
  PatchContent_Shaco.Detail_Content,
  PatchContent_Senna.Detail_Content,
  PatchContent_Seraphine.Detail_Content,
  PatchContent_Sejuani.Detail_Content,
  PatchContent_Sett.Detail_Content,
  PatchContent_Sona.Detail_Content,
  PatchContent_Soraka.Detail_Content,
  PatchContent_Shen.Detail_Content,
  PatchContent_Shyvana.Detail_Content,
  PatchContent_Smolder.Detail_Content,
  PatchContent_Swain.Detail_Content,
  PatchContent_Skarner.Detail_Content,
  PatchContent_Sivir.Detail_Content,
  PatchContent_XinZhao.Detail_Content,
  PatchContent_Syndra.Detail_Content,
  PatchContent_Singed.Detail_Content,
  PatchContent_Thresh.Detail_Content,
  PatchContent_Ahri.Detail_Content,
  PatchContent_Amumu.Detail_Content,
  PatchContent_AurelionSol.Detail_Content,
  PatchContent_Ivern.Detail_Content,
  PatchContent_Azir.Detail_Content,
  PatchContent_Akali.Detail_Content,
  PatchContent_Akshan.Detail_Content,
  PatchContent_Aatrox.Detail_Content,
  PatchContent_Aphelios.Detail_Content,
  PatchContent_Alistar.Detail_Content,
  PatchContent_Annie.Detail_Content,
  PatchContent_Anivia.Detail_Content,
  PatchContent_Ashe.Detail_Content,
  PatchContent_Yasuo.Detail_Content,
  PatchContent_Ekko.Detail_Content,
  PatchContent_Elise.Detail_Content,
  PatchContent_MonkeyKing.Detail_Content,
  PatchContent_Ornn.Detail_Content,
  PatchContent_Orianna.Detail_Content,
  PatchContent_Olaf.Detail_Content,
  PatchContent_Yone.Detail_Content,
  PatchContent_Yorick.Detail_Content,
  PatchContent_Udyr.Detail_Content,
  PatchContent_Urgot.Detail_Content,
  PatchContent_Warwick.Detail_Content,
  PatchContent_Yuumi.Detail_Content,
  PatchContent_Irelia.Detail_Content,
  PatchContent_Evelynn.Detail_Content,
  PatchContent_Ezreal.Detail_Content,
  PatchContent_Illaoi.Detail_Content,
  PatchContent_JarvanIV.Detail_Content,
  PatchContent_Xayah.Detail_Content,
  PatchContent_Zyra.Detail_Content,
  PatchContent_Zac.Detail_Content,
  PatchContent_Janna.Detail_Content,
  PatchContent_Jax.Detail_Content,
  PatchContent_Zed.Detail_Content,
  PatchContent_Xerath.Detail_Content,
  PatchContent_Zeri.Detail_Content,
  PatchContent_Jayce.Detail_Content,
  PatchContent_Zoe.Detail_Content,
  PatchContent_Ziggs.Detail_Content,
  PatchContent_Jhin.Detail_Content,
  PatchContent_Zilean.Detail_Content,
  PatchContent_Jinx.Detail_Content,
  PatchContent_Chogath.Detail_Content,
  PatchContent_Karma.Detail_Content,
  PatchContent_Camille.Detail_Content,
  PatchContent_Kassadin.Detail_Content,
  PatchContent_Karthus.Detail_Content,
  PatchContent_Cassiopeia.Detail_Content,
  PatchContent_Kaisa.Detail_Content,
  PatchContent_Khazix.Detail_Content,
  PatchContent_Katarina.Detail_Content,
  PatchContent_Kalista.Detail_Content,
  PatchContent_Kennen.Detail_Content,
  PatchContent_Caitlyn.Detail_Content,
  PatchContent_Kayn.Detail_Content,
  PatchContent_Kayle.Detail_Content,
  PatchContent_KogMaw.Detail_Content,
  PatchContent_Corki.Detail_Content,
  PatchContent_Quinn.Detail_Content,
  PatchContent_KSante.Detail_Content,
  PatchContent_Kled.Detail_Content,
  PatchContent_Qiyana.Detail_Content,
  PatchContent_Kindred.Detail_Content,
  PatchContent_Taric.Detail_Content,
  PatchContent_Talon.Detail_Content,
  PatchContent_Taliyah.Detail_Content,
  PatchContent_TahmKench.Detail_Content,
  PatchContent_Trundle.Detail_Content,
  PatchContent_Tristana.Detail_Content,
  PatchContent_Tryndamere.Detail_Content,
  PatchContent_TwistedFate.Detail_Content,
  PatchContent_Twitch.Detail_Content,
  PatchContent_Teemo.Detail_Content,
  PatchContent_Pyke.Detail_Content,
  PatchContent_Pantheon.Detail_Content,
  PatchContent_Fiddlesticks.Detail_Content,
  PatchContent_Fiora.Detail_Content,
  PatchContent_Fizz.Detail_Content,
  PatchContent_Heimerdinger.Detail_Content,
  PatchContent_Hecarim.Detail_Content,
  PatchContent_Hwei.Detail_Content
];


//아트록스
class PatchContent_Aatrox{
  static List<String> BorNorM=["조정", "하향", "상향", "상향","상향", "하향","하향","조정", "하향","상향"];
  static List<String> patchVer=["13.17","13.15", "13.14", "13.9", "13.5","13.1","12.20","12.14","12.10","12.4"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[10], PatchNoteLinkPlus.link[8], PatchNoteLinkPlus.link[7], PatchNoteLinkPlus.link[2],PatchNoteLink.link[1], PatchNoteLink.link[5],
  PatchNoteLink.link[9],PatchNoteLink.link[15], PatchNoteLink.link[19],PatchNoteLink.link[25]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 사신 태세", "W - 지옥사슬"],
    ["Q - 다르킨의 검"],
    ["Q - 다르킨의 검"],
    ["기본 지속 효과 - 사신 태세", "R - 세계의 종결자"],
    ["W - 지옥사슬","R - 세계의 종결자"],
  ["기본 지속 효과 - 사신 태세","E - 파멸의 돌진","R - 세계의 종결자"],
  ["기본 지속 효과 - 사신 태세"],
  ["기본 능력치","E - 파멸의 돌진","R - 세계의 종결자"],
  ["E - 파멸의 돌진","R - 세계의 종결자"],
  ["Q - 다르킨의 검"]];
  static List<List<List<String>>> Detail_Content =[
  [["피해 유형: 물리 ⇒ 마법"],["피해 유형: 물리 ⇒ 마법"]],

  [["첫 사용 시 피해량: 10/25/40/55/70 (+공격력의 60/70/80/90/100%) ⇒ 10/25/40/55/70 (+공격력의 60/67.5/75/82.5/90%) (참고: Q - 다르킨의 검 두 번째 사용은 여전히 기본 피해량보다 25% 높은 피해를 입히며 세 번째 사용도 여전히 50% 더 높은 피해를 입힙니다.)"]],
    
  [["첫 사용 시 피해량: 10/30/50/70/90 (+공격력의 60/65/70/75/80%) ⇒ 10/25/40/55/70 (+공격력의 60/70/80/90/100%) (참고: 이는 공격력 0/100/100/100/100에서 상향입니다. Q - 다르킨의 검 두 번째 사용은 여전히 기본 피해량보다 25% 높은 피해를 입히며 세 번째 사용도 여전히 50% 더 높은 피해를 입힙니다.)", "미니언 대상 피해 계수: 55% ⇒ 55/60/65/70% (1/6/11/16레벨에서)"]],

  [["추가 물리 피해량: 대상 최대 체력의 4~10% (레벨에 따라) ⇒ 대상 최대 체력의 4~12% (레벨에 따라)"],
  ["추가 이동 속도: 50/65/80% ⇒ 60/80/100%"]],
    
  [["재사용 대기시간: 20/18.5/17/15.5/14초 ⇒ 20/18/16/14/12초", "둔화율: 25% (모든 스킬 레벨에서) ⇒ 25/27.5/30/32.5/35%"],
  ["추가 공격력: 공격력의 20/30/40% ⇒ 공격력의 20/32.5/45%"]],
  
  [["최대 체력 비례 추가 피해량: 5~12% (레벨에 따라) ⇒ 4~10% (레벨에 따라)"],
  ["R - 세계의 종결자 사용 중 기본 지속 효과 체력 회복 증가량: 25/30/35/40/45% ⇒ 20/24/28/32/36%"],
  ["추가 이동 속도: 60/80/100% ⇒ 50/65/80%"]],
  
  [["체력 회복량: 감소 후 피해량의 100% ⇒ 감소 후 피해량의 80%"]],
  
  [["체력 증가량 104 ⇒ 114"], 
  ["기본 지속 효과 체력 회복량 18/20/22/24/26% ⇒ 18/19.5/21/22.5/24%"],
  ["체력 회복 효과 증가량 25/40/55% ⇒ 25/35/45%"]],
  
  [["챔피언 대상 체력 회복량 입힌 피해의 20/22.5/25/27.5/30% ⇒ 18/20/22/24/26%", "강화된 E - 파멸의 돌진 (R - 세계의 종결자 사용 중) 챔피언 대상 체력 회복량 입힌 피해의 26/32/38/44/50% ⇒ 25/30/35/40/45%"],
  ["체력 회복량 증가 30/45/60% ⇒ 25/40/55%"]],
  
  [["검 끝 피해량 150% ⇒ 160%"]]];
}

//아리
class PatchContent_Ahri{
  static List<String> BorNorM=["상향", "상향", "상향","상향","하향","하향","하향","하향","조정"];
  static List<String> patchVer=["14.4", "14.2", "13.4","12.21","12.17","12.10","12.9","12.5","12.3"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[21], PatchNoteLinkPlus.link[18],PatchNoteLink.link[2],PatchNoteLink.link[8],PatchNoteLink.link[12], 
  PatchNoteLink.link[19], PatchNoteLink.link[20], PatchNoteLink.link[24],PatchNoteLink.link[26]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치","Q - 현혹의 구슬"],
    ["E - 매혹"],
    ["기본 능력치","R - 혼령 질주"],
  ["Q - 현혹의 구슬"],
  ["E - 매혹"],
  ["기본 지속 효과 - 정기 흡수"],
  ["E - 매혹","R - 혼령 질주"],
  ["W - 여우불","E - 매혹"],
  ["기본 능력치", "기본 지속 효과 - 정기 흡수", "Q - 현혹의 구슬", "W - 여우불", "E - 매혹", "R - 혼령 질주"]];
  static List<List<List<String>>> Detail_Content =[
    [["체력 증가량: 96 ⇒ 104"],
    ["대상 관통당 마법 피해량: 40/65/90/115/140 (+주문력의 45%) ⇒ 40/65/90/115/140 (+주문력의 50%)"]],

    [["재사용 대기시간: 14초 ⇒ 12초"]],
    
    [["기본 체력: 570 ⇒ 590", "기본 방어력: 18 ⇒ 21"],
  ["재사용 대기시간: 140/115/90초 ⇒ 130/105/80초"]],
  
  [["마나 소모량: 60/70/80/90/100⇒55/65/75/85/95", "구슬 적중 시 피해량: 40/65/90/115/140 (+주문력의 40%)⇒40/65/90/115/140 (+주문력의 45%)"]],
  
  [["매혹 지속시간 1.4/1.55/1.7/1.85/2초 ⇒ 1.2/1.4/1.6/1.8/2초"]],
  
  [["최대 중첩 시 체력 회복량 (미니언 및 몬스터 대상) 40~120 (레벨에 따라) (+주문력의 25%) ⇒ 35~95 (레벨에 따라) (주문력의 20%)", "챔피언 처치 시 체력 회복량 80~200 (레벨에 따라) (+주문력의 35%) ⇒ 75~165 (레벨에 따라) (+주문력의 30%)"]],
  
  [["재사용 대기시간 12초 ⇒ 14초"],
  ["재사용 대기시간 130/105/80초 ⇒ 140/115/90초"]],

  [["피해량 60/85/110/135/160 (+주문력의 30%) ⇒ 50/75/100/125/150 (+주문력의 30%)", "마나 소모량 25 ⇒ 30"],
  ["마나 소모량 50 ⇒ 60"]],
  
  [["체력 증가량 92 ⇒ 82", "체력 526-2090 (레벨에 따라) ⇒ 500-1894 (레벨에 따라)", "기본 체력 재생 5.5 ⇒ 2.5", "방어력 21-80.5 (레벨에 따라) ⇒ 18-77.5 (레벨에 따라)"],
  ["사냥감의 조각 아리가 미니언이나 몬스터를 처치하면 정기 조각을 획득합니다. 9개를 획득하면 조각을 전부 소모해 체력을 40~120 (+주문력의 25%) 회복합니다. 아리가 적 챔피언에게 피해를 입힌 후 3초 안에 해당 챔피언이 처치되면 정기를 삼켜 체력을 80~200 (+주문력의 35%) 회복합니다."],
  ["구슬 적중 시 피해량 40/65/90/115/140 (+주문력의 35%) ⇒ 40/65/90/115/140 (+주문력의 40%)", "마나 소모량 65/70/75/80/85 ⇒ 60/70/80/90/100"],
  ["피해량 40/65/90/115/140 (+주문력의 30%) ⇒ 60/85/110/135/160 (+주문력의 30%)", "마나 소모량 40 ⇒ 25", "여우불 지속시간 5초 ⇒ 2.5초", "추가 이동 속도 지속시간 1.5초 ⇒ 2초", "열 추적 탄도체의 대상 지정 및 미니언 처치 체계를 업데이트했습니다."],
  ["피해량 60/90/120/150/180 (+주문력의 40%) ⇒ 80/110/140/170/200 (+주문력의 60%)", "마나 소모량 70 ⇒ 50", "(삭제) 황홀함 이제 아리의 스킬이매혹된 적에게 추가 피해를 입히지 않습니다."],
  ["최초 사용 지속시간 10초 ⇒ 15초", "혼령 사냥 R - 혼령 질주가 활성화되어 있을 때 아리가 기본 지속 효과 - 정기 흡수로 생성한 적 챔피언의 정기를 삼키면 R - 혼령 질주의 지속시간이 최대 10초 늘어나며 R - 혼령 질주의 재사용 가능 횟수가 1회 증가합니다. (최대 3회 재사용 가능)"]]];
}

//아칼리
class PatchContent_Akali{
  static List<String> BorNorM=["상향", "상향", "상향","상향","상향"];
  static List<String> patchVer=["14.8", "13.16", "13.11", "12.18","12.15"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[25], PatchNoteLinkPlus.link[9],PatchNoteLinkPlus.link[4], PatchNoteLink.link[11],PatchNoteLink.link[14]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치"],
    ["Q - 오연투척검"],
    ["Q - 오연투척검"],
    ["E - 표창곡예"],
  ["W - 황혼의 장막"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 체력: 570 ⇒ 600"]],

    [["기력 소모량: 130/115/100/85/70 ⇒ 110/100/90/80/70", "피해량: 40/65/90/115/140 (+공격력의 65%) (+주문력의 60%) ⇒ 45/70/95/120/145 (+공격력의 65%) (+주문력의 60%)"]],

    [["마법 피해량: 30/55/80/105/130 (+공격력의 65%) (+주문력의 60%) ⇒ 40/65/90/115/140 (+공격력의 65%) (+주문력의 60%)"]],

    [["표창곡예가 이제 적중한 적에 대한 절대 시야를 제공합니다."]],

  [["기력 회복량 80 ⇒ 100"],
  ["최대 기력 증가량 80 ⇒ 100"]]];
}

//아크샨
class PatchContent_Akshan{
  static List<String> BorNorM=["하향", "조정", "상향","상향","하향","하향"];
  static List<String> patchVer=["13.20", "13.17", "13.10","12.20","12.10","12.3"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[13], PatchNoteLinkPlus.link[10], PatchNoteLinkPlus.link[3],PatchNoteLink.link[9], PatchNoteLink.link[19],PatchNoteLink.link[26]];
  static List<List<String>> Detail_Title =[
    ["Q - 복수의 부메랑", "E - 영웅의 비상"],
    ["기본 능력치"],
    ["기본 지속 효과 - 비열한 싸움","Q - 복수의 부메랑"],
    ["E - 영웅의 비상"],
  ["기본 지속 효과 - 비열한 싸움"],
  ["기본 지속 효과 - 비열한 싸움"]];
  static List<List<List<String>>> Detail_Content =[
    [["추가 이동 속도: 40% ⇒ 20/25/30/35/40%"],
    ["공격 1회당 피해량: 30/45/60/75/90 (+추가 공격력의 17.5%) (1 + 추가 공격 속도 100%당 0.3) ⇒ 25/40/55/70/85 (+추가 공격력의 17.5%) (1 + 추가 공격 속도 100%당 0.3)"]],

    [["체력 증가량: 104 ⇒ 107", "방어력 증가량: 4.2 ⇒ 4.7", "공격력 증가량: 3.5 ⇒ 3"]],
    
    [["3회 중첩 시 마법 피해량: 10~165 (레벨에 따라) ⇒ 10~165 (레벨에 따라) (+주문력의 60%)", "보호막 흡수량: 40~280 (+추가 공격력의 35%), 챔피언 레벨에 따라 선형적으로 증가 ⇒ 40~280 (+추가 공격력의 35%), 기본 능력치 증가에 따라 비선형적으로 증가. (참고: 실질적으로는 게임 초반과 중반에 보호막 흡수량이 약 10% 감소하게 됩니다.)"],
  ["적 챔피언 적중 시 추가 이동 속도: 40% ⇒ 40% (+주문력 100당 5%)"]],
    
    [["비상 지속시간: 3초 ⇒ 무제한"]],

  [["보호막 흡수량 40~300 (레벨에 따라) (+추가 공격력의 40%) ⇒ 40~280 (레벨에 따라) (+추가 공격력의 35%)"]],
  
  [["두 번째 공격 취소 시 추가 이동 속도 35-75 (레벨에 따라) ⇒ 20-75 (레벨에 따라)", "세 번째 중첩 추가 마법 피해량 20-175 (레벨에 따라) ⇒ 10-165 (레벨에 따라)"]]];
}

//알리스타
class PatchContent_Alistar{
  static List<String> BorNorM=["상향", "상향", "상향","상향","하향"];
  static List<String> patchVer=["13.7", "13.4","13.3","12.14","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[0],PatchNoteLink.link[2], PatchNoteLink.link[3],
  PatchNoteLink.link[15], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[["기본능력치"],
  ["기본 지속 효과 - 승리의 포효","Q - 분쇄","W - 박치기"],
  ["기본 지속 효과 - 승리의 포효", "Q - 분쇄","W - 박치기","E - 짓밟기"],
  ["Q - 분쇄"],
  ["기본 지속 효과 - 승리의 포효"]];
  static List<List<List<String>>> Detail_Content =[[["기본 방어력: 44 ⇒ 47","기본 체력: 670 ⇒ 685"]],
  
  [["아군 체력 회복량: 알리스타 최대 체력의 6% ⇒ 알리스타 최대 체력의 7% (참고: 이 수치는 지난 패치 이전의 아군 체력 회복량과 거의 동일합니다.)"],
  ["마법 피해량: 60/100/140/180/220 (+주문력의 70%) ⇒ 60/100/140/180/220 (+주문력의 80%)"],
  ["마법 피해량: 55/110/165/220/275 (+주문력의 90%) ⇒ 55/110/165/220/275 (+주문력의 100%)"]],
  
  [["자신 대상 체력 회복량: 23~142 (레벨에 따라) ⇒ 최대 체력의 5%", "아군 대상 체력 회복량: 46~284 (레벨에 따라) ⇒ 알리스타 최대 체력의 6%"],
  ["마나 소모량: 55/60/65/70/75 ⇒ 50/55/60/65/70", "마법 피해량: 60/100/140/180/220 (+주문력의 50%) ⇒ 60/100/140/180/220 (+주문력의 70%)"],
  ["마나 소모량: 65/70/75/80/85 ⇒ 50/55/60/65/70", "마법 피해량: 55/110/165/220/275 (+주문력의 70%) ⇒ 55/110/165/220/275 (+주문력의 90%)"],
  ["마나 소모량: 50/60/70/80/90 ⇒ 50/55/60/65/70", "총 마법 피해량: 80/110/140/170/200 (+주문력의 40%) ⇒ 80/110/140/170/200 (+주문력의 70%)"]],
  
  [["마나 소모량 65/70/75/80/85 ⇒ 55/60/65/70/75","재사용 대기시간 15/14/13/12/11초 ⇒ 14/13/12/11/10초"]],
  
  [["체력 회복량 25~161 ⇒ 23~142 (레벨에 따라) (참고: 아군에게는 여전히 두 배로 적용)"]]];
}

//아무무
class PatchContent_Amumu{
  static List<String> BorNorM=["하향","상향","하향", "하향","상향","상향","상향","상향","하향"];
  static List<String> patchVer=["13.11","13.9","13.4","13.3","12.23","12.22","12.12","12.4","12.3"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[4], PatchNoteLinkPlus.link[2],PatchNoteLink.link[2],
  PatchNoteLink.link[3],PatchNoteLink.link[6],PatchNoteLink.link[7],PatchNoteLink.link[17]
  ,PatchNoteLink.link[25],PatchNoteLink.link[26]];
  static List<List<String>> Detail_Title =[
    ["W - 절망"],
    ["W - 절망"],
    ["기본 능력치","W - 절망"],
  ["Q - 붕대 던지기","E - 짜증내기"],
  ["기본 능력치","Q - 붕대 던지기","W - 절망","E - 짜증내기"],
  ["E - 짜증내기"],
  ["Q - 붕대 던지기", "R - 슬픈 미라의 저주"],
  ["E - 짜증내기"],
  ["기본 능력치", "E - 짜증내기"]];
  static List<List<List<String>>> Detail_Content =[
[["틱당 기본 피해량 (0.5초): 10 ⇒ 7"]],

    [["초당 기본 마법 피해: 12/16/20/24/28 ⇒ 20 (모든 스킬 레벨에서)", "초당 체력 비례 마법 피해: 1/1.15/1.3/1.45/1.6% ⇒ 1/1.25/1.5/1.75/2%"]],
    
    [["체력 증가량: 100 ⇒ 94", "방어력 증가량: 4.2 ⇒ 4.0"],
  ["틱당 마법 피해량: 6/8/10/12/14 (+대상 최대 체력의 1/1.25/1.5/1.75/2% (+주문력 100당 0.25%)) ⇒ 6/8/10/12/14 (+대상 최대 체력의 1/1.15/1.3/1.45/1.6% (+주문력 100당 0.25%))"]],
  
  [["마나 소모량: 40/45/50/55/60 ⇒ 45/50/55/60/65"],
  ["피해량: 80/110/140/170/200 (+주문력의 50%) ⇒ 65/100/135/170/205 (+주문력의 50%)"]],
  
  [["체력 증가량: 89 ⇒ 100"],
  ["마나 소모량: 30/35/40/45/50 ⇒ 40/45/50/55/60"],
  ["초당 피해량: 12/16/20/24/28 (+대상 최대 체력의 1/1.15/1.3/1.45/1.6%) ⇒ 12/16/20/24/28 (+대상 최대 체력의 1/1.25/1.5/1.75/2%)"],
  ["기본 마법 피해량: 85/110/135/160/185 (+주문력의 50%) ⇒ 80/110/140/170/200 (+주문력의 50%)"]],
  
  [["기본 공격에 맞았을 때 재사용 대기시간 감소: 0.5초 ⇒ 0.75초", "마법 피해량: 75/100/125/150/175 (+주문력의 50%) ⇒ 85/110/135/160/185 (+주문력의 50%)"]],
  
  [["마나 소모량 70 ⇒ 30/35/40/45/50"],
  ["피해량 150/250/350 (+주문력의 80%) ⇒ 200/300/400 (+주문력의 80%)"]],
  
  [["물리 피해 감소량 2/4/6/8/10 (+추가 방어력의 3%) (+추가 마법 저항력의 3%) ⇒ 5/7/9/11/13 (+추가 방어력의 3%) (+추가 마법 저항력의 3%)"]],
  
  [["방어력 증가량 3.5 ⇒ 3", "방어력 30-89.5 (레벨에 따라) ⇒ 30-81 (레벨에 따라)"],
  ["기본 지속 효과 최대 피해 감소량 한 번의 공격으로 받는 물리 피해량 최대 100% 감소 ⇒ 한 번의 공격으로 받는 물리 피해량 최대 50% 감소"]]];
}

//애니비아
class PatchContent_Anivia{
  static List<String> BorNorM=["조정", "하향", "하향"];
  static List<String> patchVer=["13.13", "13.4","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[6], PatchNoteLink.link[2], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["Q - 붕괴"],
    ["기본 능력치"],
  ["Q - 냉기 폭발", "E - 동상"]];

  static List<List<List<String>>> Detail_Content =[
    [["마법 피해량: 80/115/150/185/220 (+주문력의 80%) ⇒ 70/105/140/175/210 (+주문력의 75%)"]],
    
    [["체력 증가량: 96 ⇒ 92","방어력 증가량: 5.2 ⇒ 4.9"]],
  
  [["재사용 대기시간 11/10/9/8/7초 ⇒ 12/11/10/9/8초"],
  ["마법 피해량 50/80/110/140/170 ⇒ 50/75/100/125/150"]]];
}

//애니
class PatchContent_Annie{
  static List<String> BorNorM=["조정", "하향", "하향","조정","하향", "상향","하향"];
  static List<String> patchVer=["13.15", "13.13","13.7","13.4","13.3","12.12","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[8], PatchNoteLinkPlus.link[6], PatchNoteLinkPlus.link[0], PatchNoteLink.link[2], PatchNoteLink.link[3], PatchNoteLink.link[17],
   PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["R - 소환: 티버"],
    ["Q - 붕괴"],
  ["E - 용암 방패"],
  ["기본 능력치","E - 용암 방패","R - 소환: 티버"],
  ["기본 능력치", "기본 지속 효과 - 방화광","E - 용암 방패", "R - 소환: 티버"],
  ["Q - 붕괴","R - 소환: 티버"],
  ["E - 용암 방패"]];
  static List<List<List<String>>> Detail_Content =[
    [["방어력 및 마법 저항력: 30/60/90 (+주문력의 5%) ⇒ 30~90 (6~18레벨에서)", "체력: 1,300/2,200/3,100 (+주문력의 75%) ⇒ 1,150~3,500 (+주문력의 50%) (6~18레벨에서, 비선형적으로 증가) (참고: 이는 약 5~10%의 내구력 감소입니다.)"]],

    [["마법 피해량: 80/115/150/185/220 (+주문력의 80%) ⇒ 70/105/140/175/210 (+주문력의 75%)"]],
    
    [["재사용 대기시간: 12/11/10/9/8초 ⇒ 12/11.5/11/10.5/10초", "보호막 흡수량: 60/100/140/180/220 (+주문력의 40%) ⇒ 60/95/130/165/200 (+주문력의 40%)"]],

  [["기본 체력: 594 ⇒ 560"],
  ["보호막 반사 마법 피해량: 30/45/60/75/90 (+주문력의 40%) ⇒ 25/35/45/55/65 (+주문력의 40%)"],
  ["재사용 대기시간: 120/100/80초 ⇒ 130/115/100초"]],
  
  [["방어력 증가량: 5.2 ⇒ 4.7"],
  ["태초의 불: 게임 시작 및 부활 시 애니의 기본 지속 효과 - 방화광이 전부 충전됩니다."],
  ["보호막 흡수량: 40/85/130/175/220 (+주문력의 35%) ⇒ 60/100/140/180/220 (+주문력의 40%)", "재사용 대기시간: 14/13/12/11/10초 ⇒ 12/11/10/9/8초", "반사 마법 피해량: 20/30/40/50/60 (+주문력의 20%) ⇒ 30/45/60/75/90 (+주문력의 40%)","E - 용암 방패 마나 소모량: 40 (모든 스킬 레벨에서) ⇒ 60/65/70/75/80", "(신규) 반사 마법 피해 조건: E - 용암 방패가 지속되는 동안, 기본 공격으로 보호막을 공격한 적은 마법 피해를 입습니다. ⇒ E - 용암 방패가 지속되는 동안, 기본 공격이나 스킬로 보호막을 공격한 적은 마법 피해를 입습니다.", "(신규) 반사 마법 피해 상세 정보: 이제 E - 용암 방패가 적을 상대로 각 대상에게 보호막당 한 번 피해를 입힙니다. (참고: E - 용암 방패 사용 시 티버가 얻는 보호막은 새 보호막으로 계산되며 각 대상에게 보호막당 한 번 피해를 입힙니다.)"],
  ["티버 체력: 1,300/2,200/3,100 ⇒ 1,300/2,200/3,100 (+주문력의 75%)", "티버 저항력: 방어력 및 마법 저항력 30/60/90 ⇒ 방어력 및 마법 저항력 30/60/90 (+주문력의 5%)", "티버 이동 속도: 350 (모든 스킬 레벨에서) ⇒ 350/375/400"]],

  [["피해량 80/115/150/185/220 (+주문력의 75%) ⇒ 80/115/150/185/220 (+주문력의 80%)"],
  ["티버 - 기본 체력 1,200/2,100/3,000 ⇒ 1,300/2,200/3,100", "티버 - 기본 방어력 및 마법 저항력 30/50/70 ⇒ 30/60/90"]],
  
  [["보호막 흡수량 40/90/140/190/240 (+주문력의 40%) ⇒ 40/85/130/175/220 (+주문력의 35%)"]]];
}

//아펠리오스
class PatchContent_Aphelios{
  static List<String> BorNorM=["하향", "하향", "하향","상향","상향","하향", "하향"];
  static List<String> patchVer=["14.1", "13.13", "13.11","13.4","12.11","12.10", "12.5"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[6], PatchNoteLinkPlus.link[4], PatchNoteLink.link[2],
  PatchNoteLink.link[18], PatchNoteLink.link[19]
  ,PatchNoteLink.link[24]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치"],
    ["절단검, 낫 모양 권총", "중력포, 대포", "반월검, 투척 무기"],
    ["기본 지속 효과 - 암살자와 예언자"],
    ["기본 지속 효과 - 암살자와 예언자 (무기의 달인)"],
  ["기본 지속 효과 - 암살자와 예언자"],
  ["절단검 기본 공격", "절단검 Q - 무기 스킬","절단검 R - 월광포화"],
  ["기본 능력치"]];
  static List<List<List<String>>> Detail_Content =[
    [["공격력 증가량: 3 ⇒ 2.3 (참고: 아펠리오스는 여전히 기본 지속 효과 - 암살자와 예언자를 통해 추가 공격력 4.5~27을 얻습니다.)"]],

    [["기본 공격 시 생명력 흡수: 2.5%~9% (레벨에 따라) ⇒ 2%~7.1% (레벨에 따라)", "스킬 사용 시 생명력 흡수: 8.33%~30% (레벨에 따라) ⇒ 5%~17.75% (레벨에 따라)"], 
    ["공격 시 둔화 지속시간: 3.5초 ⇒ 2.5초"],
    ["파수탑 기본 공격 속도: 0.8 ⇒ 0.64 (참고: 파수탑의 공격 속도는 아펠리오스의 추가 공격 속도에 비례합니다.)"]],
    
    [["추가 공격력: 5/10/15/20/25/30 ⇒ 4.5/9/13.5/18/22.5/27"]],
    
    [["추가 공격 속도: 7.5/15/22.5/30/37.5/45% ⇒ 9/18/27/36/45/54%"]],
  
  [["추가 공격 속도 6/12/18/24/30/36% ⇒ 7.5/15/22.5/30/37.5/45%","추가 물리 관통력 4.5/9/13.5/18/22.5/27 ⇒ 5.5/11/16.5/22/27.5/33"]],
  
  [["체력 회복량 입힌 피해의 3~10% ⇒ 2.5~9% (레벨에 따라)"],
  ["체력 회복량 입힌 피해의 9~30% ⇒ 8.3~30% (레벨에 따라)"],
  ["챔피언 적중 시 체력 회복량 275/400/525 ⇒ 250/350/450 (6/11/16레벨에서)"]],
  
  [["기본 방어력 28 ⇒ 26", "기본 체력 530 ⇒ 510"]]];
}

//애쉬
class PatchContent_Ashe {
  static List<String> BorNorM = ["상향", "상향", "조정","상향", "상향","상향","상향"];
  static List<String> patchVer = ["13.12","13.6", "13.5","13.1B","12.18","12.5","12.4"];
  static List<String> patchNoteLink = [PatchNoteLinkPlus.link[5], PatchNoteLink.link[0],PatchNoteLink.link[1],PatchNoteLink.link[4],
  PatchNoteLink.link[11], PatchNoteLink.link[24], PatchNoteLink.link[25]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 서리 화살", "W - 일제 사격", "R - 마법의 수정화살"],
    ["기본 지속 효과 - 서리 화살"],
  ["Q - 궁사의 집중","W - 일제 사격","R - 마법의 수정화살"],
  ["기본 능력치"],
  ["Q - 궁사의 집중"],
  ["W - 일제 사격", "R - 마법의 수정화살"],
  ["R - 마법의 수정화살"]];
  static List<List<List<String>>> Detail_Content =[
    [["추가 피해량: 115% (+치명타 확률의 (75%+35%)) ⇒ 120% (+치명타 확률의 (75%+35%))"], 
    ["물리 피해량: 10/25/40/55/70 (+공격력의 100%) ⇒ 20/35/50/65/80 (+공격력의 100%)"],
    ["피해량: 200/400/600 (+주문력의 100%) ⇒ 200/400/600 (+주문력의 120%)"]],    
    
    [["서리 효과가 부여된 적 대상 피해량: 110% (+치명타 확률의 75%) ⇒ 115% (+치명타 확률의 75%)"]],

  [["마나 소모량: 50 ⇒ 30", "강화 효과 지속시간: 4초 ⇒ 6초"],
  ["물리 피해량: 20/35/50/65/80 (+공격력의 100%) ⇒ 10/25/40/55/70 (+공격력의 100%)"],
  ["재사용 대기시간: 80/70/60초 ⇒ 100/80/60초"]],
  
  [["마나 증가량: 32 ⇒ 35", "마나 재생 증가량: 0.4 ⇒ 0.65"]],
  
  [["추가 공격 속도 20/25/30/35/40% ⇒ 25/32.5/40/47.5/55%"]],
  
  [["마나 소모량 70 (모든 스킬 레벨에서) ⇒ 75/70/65/60/55"],
  ["재사용 대기시간 100/80/60초 ⇒ 80/70/60초"]],
  
  [["탄도체 속도 1,600 ⇒ 1,500 (+매초 200씩 증가), 최대 2,100"]]];
}

//아우렐리온솔
class PatchContent_AurelionSol{
  static List<String> BorNorM=["하향", "상향", "하향", "하향", "하향", "하향", "하향", "조정"];
  static List<String> patchVer=["14.4", "14.3", "13.21", "13.11", "13.8","13.6","13.5", "13.3"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[21], PatchNoteLinkPlus.link[20], PatchNoteLinkPlus.link[14], PatchNoteLinkPlus.link[4], PatchNoteLinkPlus.link[1], PatchNoteLink.link[0], PatchNoteLink.link[1],PatchNoteLink.link[3]];
  static List<List<String>> Detail_Title =[
    ["Q - 빛의 숨결"],
    ["Q - 빛의 숨결", "W - 별의 비행", "E - 특이점"],
    ["Q - 빛의 숨결"],
    ["E - 특이점"],
    ["기본 능력치"],
  ["Q - 빛의 숨결","E - 특이점","R - 유성/천상 강림"],
  ["기본 능력치","Q - 빛의 숨결"],
  ["기본 지속 효과 - 우주의 창조자","Q - 빛의 숨결", "W - 별의 비행", "E - 특이점", "R - 유성/천상 강림"]];
  static List<List<List<String>>> Detail_Content =[
    [["추가 초당 마법 피해량: 60/70/80/90/100 (+주문력의 35%) (+대상 최대 체력의 (별가루 중첩의 3.1%)%) ⇒ 55/65/75/85/95 (+주문력의 30%) (+대상 최대 체력의 (별가루 중첩의 3.1%)%)"]],

    [["초당 마나 소모량: 45/50/55/60/65 ⇒ 30/35/40/45/50", "초당 마나 소모량: 45/50/55/60/65 ⇒ 30/35/40/45/50", "챔피언 대상 폭발 피해를 입힐 경우 별가루 중첩: 3 ⇒ "],
    ["마나 소모량: 80/85/90/95/100 ⇒ 50/55/60/65/70", "Q - 빛의 숨결 추가 피해량: 14/15.5/17/18.5/20% ⇒ 8/9/10/11/12%"],
    ["챔피언 처치 관여 시 별가루 중첩: 5 ⇒ 2", "에픽 몬스터 처치 관여 시 별가루 중첩: 5 ⇒ 2", "공성 미니언 처치 관여 시 별가루 중첩: 3 ⇒ 2", "대형 몬스터 처치 관여 시 별가루 중첩: 3 ⇒ 2"]],

  [["초당 마법 피해량: 15/25/35/45/55 (+30~80 (레벨에 따라)) (+주문력의 60%) ⇒ 45/60/75/90/105 (+주문력의 55%)", "폭발 마법 피해량: 40/50/60/70/80 (+20~30 (레벨에 따라)) (+주문력의 35%)+대상 최대 체력의 (별가루의 3.1%)% ⇒ 60/70/80/90/100 (+주문력의 35%)+대상 최대 체력의 (별가루의 3.1%)%"]],

  [["마나 소모량: 60/70/80/90/100 ⇒ 80/85/90/95/100", "틱당 마법 피해량 (0.25초): 2.5/3.75/5/6.25/7.5 (+주문력의 6.25%) ⇒ 2.5/3.75/5/6.25/7.5 (+주문력의 5%)"]],

    [["체력 증가량: 95 ⇒ 90", "방어력 증가량: 4.3 ⇒ 4"]],

    [["마법 피해량: 15/25/35/45/55 (+30~90 (레벨에 따라)) (+주문력의 60%) ⇒ 15/25/35/45/55 (+30~80 (레벨에 따라)) (+주문력의 60%)","폭발 피해 발동 시 피해량: 45/50/55/60/65 (+20~40 (레벨에 따라)) (+주문력의 35%) ⇒ 45/50/55/60/65 (+20~30 (레벨에 따라)) (+주문력의 35%)"],
  ["재사용 대기시간: 12/11.5/11/10.5/10초 ⇒ 12초 (모든 스킬 레벨에서)"],
  ["유성 기절 지속시간: 1.25초 ⇒ 1초","천상 강림 공중에 띄우기 지속시간: 1.25초 ⇒ 1초"]],

  [["체력 증가량: 100 ⇒ 95","방어력 증가량: 4.6 ⇒ 4.3"],
  ["폭발 피해 발동 시 피해량: 20~40 (레벨에 따라) (+40/50/60/70/80) (+주문력의 40%) (+대상 최대 체력의 (별가루 중첩의 0.031%)) ⇒ 20~40 (레벨에 따라) (+40/50/60/70/80) (+주문력의 35%) (+대상 최대 체력의 (별가루 중첩의 0.031%))"]],

  [["Q - 빛의 숨결: Q - 빛의 숨결이 폭발 시 최대 체력의 (별가루 중첩의 0.031%)%에 해당하는 마법 피해를 추가로 입힙니다.", "W - 별의 비행: 이동 거리가 별가루 중첩에 비례해 증가합니다.", "E - 특이점: 범위와 처형 기준값이 증가합니다.", "R - 유성/천상 강림: 범위가 증가합니다."],
  ["마나 소모량: 초당 마나 45/50/55/60/65", "재사용 대기시간: 3초", "전체 스킬 설명: 아우렐리온 솔이 최대 (3.25/3.25/3.25/3.25/9,999)초 동안 성운파를 뿜어내 처음 적중하는 적에게 초당(15/25/35/45/55 + 30~90 (레벨에 따라) + 주문력의 60%)의 마법 피해를 입히고 주변에 있는 적에게 50%의 피해를 입힙니다. 같은 적에게 1초 동안 성운파를 뿜을 때마다 (40/50/60/70/80 + 20~40 (레벨에 따라) + 주문력의 40%)의 마법 피해 + 최대 체력의 (별가루 중첩의 0.031%)%에 해당하는 마법 피해를 입히고 대상이 챔피언인 경우 별가루 1개를 흡수합니다. 이 스킬의 사거리는 750~920(레벨에 따라)입니다. 비례 피해량은 정글 몬스터를 상대로 최대 300의 마법 피해를 입힙니다."],
  ["마나 소모량: 80/85/90/95/100", "재사용 대기시간: 22/20.5/19/17.5/16초", "전체 스킬 설명: 아우렐리온 솔이 한 방향으로 날아갑니다. 비행 중에는 Q - 빛의 숨결 재사용 대기시간과 최대 정신 집중 시간이 없으며 기본 피해량이 14/15.5/17/18.5/20% 증가합니다. 챔피언에게 피해를 입힌 후 3초 안에 처치에 관여하면 이 스킬의 재사용 대기시간을 90%만큼 돌려받습니다. 비행 중 Q - 빛의 숨결을 사용하면 비행 속도가 50% 감소합니다. 비행 속도는 335 + 이동 속도의 100%입니다."],
  ["마나 소모량: 60/70/80/90/100", "재사용 대기시간: 12/11.5/11/10.5/10초", "전체 스킬 설명: 아우렐리온 솔이 적에게 (10/15/20/25/30 + 주문력의 25%)의 마법 피해를 입히며 5초 동안 적을 천천히 중심으로 끌어당기는 블랙홀을 소환합니다. 블랙홀의 중심에 있는 적 중 최대 체력이 (5 + 별가루 중첩의 2.6%)% 미만인 적은 즉사합니다. 블랙홀 안에 있는 적이 죽거나 적 챔피언이 안에 있을 때 블랙홀이 매초 별가루를 흡수합니다. 이 스킬의 사거리는 750~920(레벨에 따라)입니다. 안에 있는 미니언 및 정글 몬스터는 이동 속도가 0이 됩니다. (이 스킬은 챔피언에게서 매초 별가루를 1개 흡수합니다. 블랙홀 안에서 사망하는 유닛에게서 흡수하는 별가루는 에픽 몬스터의 경우 별가루 5개, 챔피언의 경우 별가루 5개, 대형 몬스터 및 공성 미니언의 경우 별가루 3개, 미니언 및 작은 몬스터의 경우 별가루 1개입니다.)"],
  ["마나 소모량: 100", "재사용 대기시간: 120/110/100초", "유성: 아우렐리온 솔이 하늘에서 별을 뽑아 땅으로 떨어뜨려 (150/250/350 + 주문력의 65%)의 마법 피해를 입히고, 적을 1.25초 동안 기절시키며, 적중한 챔피언 하나당 별가루 5개를 흡수합니다.", "천상 강림: 별가루를 75개 모으면 다음 유성을 천상 강림으로 바꿉니다. 아우렐리온 솔이 우주에서 별자리 하나만큼의 분노를 내려 넓은 범위에 있는 적에게 (187.5/312.5/437.5 + 주문력의 81.25%)의 마법 피해를 입히고, 적중한 적을 1.25초 동안 공중으로 띄웁니다. 또한, 거대한 충격파를 퍼뜨려 챔피언과 에픽 몬스터에게 (150/250/350 + 주문력의 65%)의 마법 피해를 입히고 적중한 모든 적을 1초 동안 50% 둔화시킵니다."]]];
}

//아지르
class PatchContent_Azir{
  static List<String> BorNorM=["하향", "하향", "상향", "조정", "하향", "상향", "상향","조정", "하향","하향","하향","상향"];
  static List<String> patchVer=["14.8", "14.3", "13.24", "13.23", "13.19", "13.11","13.7", "13.5","13.4","12.17","12.10","12.6"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[25], PatchNoteLinkPlus.link[20],PatchNoteLinkPlus.link[17],PatchNoteLinkPlus.link[16],PatchNoteLinkPlus.link[12], PatchNoteLinkPlus.link[4], PatchNoteLinkPlus.link[0], PatchNoteLink.link[1],PatchNoteLink.link[2],
  PatchNoteLink.link[12],PatchNoteLink.link[19], PatchNoteLink.link[23]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "W - 일어나라!"],
    ["기본 능력치"],
    ["W - 일어나라!"],
    ["W - 일어나라!"],
    ["Q - 사막의 맹습"],
    ["Q - 사막의 맹습", "W - 일어나라!"],
    ["기본 능력치", "기본 지속 효과 - 슈리마의 유산", "Q - 사막의 맹습", "W - 일어나라!", "기타"],
  ["기본 능력치","기본 지속 효과 - 슈리마의 유산","Q - 사막의 맹습", "W - 일어나라!","E - 신기루"],
  ["기본 능력치","W - 일어나라!","E - 신기루","R - 황제의 진영"],
  ["W - 일어나라!","E - 신기루"],
  ["E - 신기루"],
  ["기본 능력치"]];
  static List<List<List<String>>> Detail_Content =[
    [["5초당 체력 재생: 5 ⇒ 3.5"],
    ["마법 피해량: 0~77 (레벨에 따라) (+50/67/84/101/118) (+주문력의 55%) ⇒ 0~77 (레벨에 따라) (+50/65/80/95/110) (+주문력의 55%)"]],

    [["기본 체력 재생: 7 ⇒ 5"]],

    [["피해량: 2~77 (10~18레벨에서) (+50/65/80/95/110) (+주문력의 55%) ⇒ 2~77 (10~18레벨에서) (+50/67/84/101/118) (+주문력의 55%)"]],

    [["마법 피해량: 2~92 (10~18레벨에서) (+50/67/84/101/118) (+주문력의 60%) ⇒ 2~77 (10~18레벨에서) (+50/65/80/95/110) (+주문력의 55%)", "마법 피해량: 이제 첫 번째 대상(가장 먼저 클릭한 대상)을 W - 일어나라!로 공격하면 적중 시 효과의 피해가 50%(아레나는 100%)의 수치로 발동합니다. 여기에는 구인수의 격노검의 환영 타격, 루난의 허리케인, 크라켄 학살자 등 기본 공격 시 적용되는 효과를 포함합니다."]],

    [["재사용 대기시간: 12/10.5/9/7.5/6초 ⇒ 14/12/10/8/6초"]],

    [["재사용 대기시간: 14/12/10/8/6초 ⇒ 12/10.5/9/7.5/6초"],
    ["소환 사거리: 500 ⇒ 525", "마법 피해량: 0~92 (레벨에 따라) (+50/67/84/101/118) (+주문력의 55%) ⇒ 0~92 (레벨에 따라) (+50/67/84/101/118) (+주문력의 60%)"]],
    
    [["기본 방어력: 19 ⇒ 22", "공격 속도 증가량: 5% ⇒ 6%"],
  ["지속시간: 30초 ⇒ 45초","스킬 사용 사거리: 500 ⇒ 700" ],
  ["마나 소모량: 65/70/75/80/85 ⇒ 70/80/90/100/110", "모래 병사 찌르기 사거리: 370 ⇒ 325"],
  ["마법 피해량: 0~110 (레벨에 따라) (+50/60/70/80/90) (+주문력의 55%) ⇒ 0~92 (레벨에 따라) (+50/67/84/101/118) (+주문력의 55%) (참고: W - 일어나라!를 먼저 올린다고 가정했을 때, 11레벨까지 +0~10이 증가한 후 유지되는 타격 1회당 피해량 상향입니다.)", "마나 소모량: 40 (모든 스킬 레벨에서) ⇒ 40/35/30/25/20"],
  ["(신규) 스킬 레벨 업 순서 추천: 이제 게임이 W - 일어나라!를 먼저 올리는 것을 추천합니다."]],

  [["기본 체력: 622 ⇒ 550", "방어력 증가량: 4.2 ⇒ 5", "기본 마나: 380 ⇒ 320", "마나 증가량: 36 ⇒ 40", "공격력 증가량: 2.8 ⇒ 3.5", "기본 공격 속도: 0.625 (참고: 전과 동일)", "공격 속도 계수: 0.625 ⇒ 0.694", "공격 속도 증가량: 3% ⇒ 5%"],
  ["지속시간: 60초 ⇒ 30초", "피해량: 150 (+분당 4) (+주문력의 15%) 물리 피해 ⇒ 230~410 (레벨에 따라) (+주문력의 40%) 마법 피해", "(삭제) 챔피언에게 입히는 추가 피해량: 37.5%의 추가 피해 ⇒ 0%의 추가 피해", "(신규) 마법 같은 효과: 이제 태양 원판이 공격할 때 아지르가 보유한 스킬 효과가 단일 대상 스킬로 적용됩니다.","태양 원판 체력: 2,550 ⇒ 3,000", "태양 원판 방어력: 60 (분당 +1) ⇒ 30~90 (레벨에 따라)", "태양 원판 마법 저항력: 100 (+분당 1) ⇒ 30~90 (레벨에 따라)" , "태양 원판 페널티: 아지르가 죽거나 너무 멀리 떨어져 있으면 방어력 100 감소 ⇒ 아지르가 죽거나 너무 멀리 떨어져 있으면 방어력 및 마법 저항력 100 감소" , "재사용 대기시간: 180초 ⇒ 90초 (참고: 재사용 대기시간은 태양 원판이 붕괴된 후 시작됩니다.)", "버그 수정: 이제 아지르를 대상으로 지정할 수 없을 때 아지르의 태양 원판이 방어력 및 마법 저항력을 잃지 않습니다."],  
  ["마법 피해량: 70/90/110/130/150 (+주문력의 30%) ⇒ 60/80/100/120/140 (+주문력의 35%) (참고: 이는 주문력 200 이상에서 상향입니다.)", "마나 소모량: 55 ⇒ 65/70/75/80/85"],
  ["병사들이여, 천천히 진격하라!: 15/25/35/45/55% 기본 지속 효과 공격 속도 ⇒ 50/60/70/80/90 추가 마법 피해", "총 마법 피해량: 50~150 (레벨에 따라) (+주문력의 55%) ⇒ 50~200 (W - 일어나라! 스킬 레벨 및 챔피언 레벨에 따라) (+주문력의 55%)", "(삭제) 세 명이 오지 않으리라: 아지르가 모래 병사를 3명 소환했을 때 제공되는 추가 공격 속도가 삭제되었습니다."],
  ["마법 피해량: 60/100/140/180/220 (+주문력의 55%) ⇒ 60/100/140/180/220 (+주문력의 40%)"]],

  [["기본 마나: 480 ⇒ 380", "마나 증가량: 21 ⇒ 36"],
  ["모래 병사 충전 시간: 9/8.25/7.5/6.75/6초 ⇒ 10/9/8/7/6초"],
  ["마법 피해량: 60/90/120/150/180 (+주문력의 40%) ⇒ 60/100/140/180/220 (+주문력의 55%)"],
  ["마법 피해량: 175/325/475 (+주문력의 60%) ⇒ 200/400/600 (+주문력의 75%)"]],
  
  [["모래 병사 피해량 50~150 (레벨에 따라) (+주문력의 60%) ⇒ 50~150 (레벨에 따라) (+주문력의 55%)","재사용 대기시간 8/7.5/7/6.5/6초 ⇒ 9/8.25/7.5/6.75/6초"],
  ["재사용 대기시간 19/18/17/16/15초 ⇒ 22/20.5/19/17.5/16초"]],
  
  [["보호막 흡수량 80/120/160/200/240 (+주문력의 70%) ⇒ 70/110/150/190/230 (+주문력의 60%)"]],
  
  [["체력 증가량 92 ⇒ 105", "18레벨 체력 2,116 ⇒ 2,337"]]];
}

//바드
class PatchContent_Bard{
  static List<String> BorNorM=["하향", "조정", "하향","상향"];
  static List<String> patchVer=["14.4", "13.18", "12.10","12.8"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[21], PatchNoteLinkPlus.link[11], PatchNoteLink.link[19],PatchNoteLink.link[21]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "기본 지속 효과 - 방랑자의 부름", "Q - 우주의 결속"],
    ["기본 지속 효과 - 방랑자의 부름", "W - 수호자의 성소"],
    ["W - 수호자의 성소"],
  ["기본 지속 효과 - 방랑자의 부름", "W - 수호자의 성소"]];
  static List<List<List<String>>> Detail_Content =[
    [["방어력 증가량: 5.2 ⇒ 5", "1레벨 공격 속도: 0.625 ⇒ 0.658", "공격 속도 계수: 0.625 ⇒ 0.658"],
    ["피해량: 35 (+고대의 종 5개당 14) (+주문력의 30%)의 추가 마법 피해량 ⇒ 35 (+고대의 종 5개당 10) (+주문력의 40%)의 추가 마법 피해량"],
    ["피해량: 80/125/170/215/260 (+주문력의 65%) ⇒ 80/120/160/200/240 (+주문력의 80%)"]],

    [["고대의 종 이동 속도 최대 중첩: 5 ⇒ 10", "고대의 종 이동 속도 중첩 지속시간: 7초 ⇒ 20초"],
    ["(신규) 성소 중첩: 이제 수호자의 성소가 최대 2회 성소를 충전할 수 있습니다.", "재사용 대기시간/중첩 충전 시간: 14초 ⇒ 18초", "성소 체력 최대 회복 시간: 10초 ⇒ 5초", "성소 추가 이동 속도: 30% 증가 후 1.5초에 걸쳐 감소 ⇒ 20/22.5/25/27.5/30% (+주문력의 0.05%) 증가 후 1.5초에 걸쳐 감소"]],
    
    [["최소 체력 회복량 30/60/90/120/150 (+주문력의 30%) ⇒ 25/50/75/100/125 (+주문력의 30%)", "최대 체력 회복량 60/105/150/195/240 (+주문력의 60%) ⇒ 50/80/110/140/170/200 (+주문력의 60%)"]],

  [["기본 공격 시 추가 마법 피해량 30 (+종 5개당 12) (+주문력의 30%) ⇒ 35 (+종 5개당 14) (+주문력의 30%)"],
  ["최대 회복량 55/95/135/175/215 (+주문력의 60%) ⇒ 60/105/150/195/240 (+주문력의 60%)"]]];
}

//벨베스 12.11패치 등장
class PatchContent_Belveth{
  static List<String> BorNorM=["하향", "상향", "하향", "조정","하향","하향"];
  static List<String> patchVer=["14.5","13.21", "13.20", "13.9","12.21","12.12"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[22], PatchNoteLinkPlus.link[14], PatchNoteLinkPlus.link[13], PatchNoteLinkPlus.link[2],PatchNoteLink.link[8],PatchNoteLink.link[17]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 연보랏빛 죽음", "E - 여제의 소용돌이"],
    ["E - 여제의 소용돌이"],
    ["기본 지속 효과 - 연보랏빛 죽음", "E - 여제의 소용돌이", "R - 끝없는 연회"],
    ["기본 능력치","Q - 공허 쇄도"],
    ["E - 여제의 소용돌이", "R - 끝없는 연회"],
  ["기본 능력치", "기본 지속 효과 - 연보랏빛 죽음", "E - 여제의 소용돌이", "R - 끝없는 연회"]];
  static List<List<List<String>>> Detail_Content =[
    [["버그 수정: 각 에픽 공허 몬스터로부터 3개의 중첩을 획득하던 버그를 수정했습니다. 이제 벨베스는 공허 유충 처치 시 기본 지속 효과 - 연보랏빛 죽음 중첩을 정상적으로 2개(공허 유충 3마리 전부 처치 시 총 6개) 획득하며, 협곡의 전령 처치 시에도 2개 획득합니다."],
    ["받는 피해량 감소: 42/49/56/63/70% ⇒ 35/40/45/50/55%"]],

    [["재사용 대기시간: 24/22.5/21/19.5/18초 ⇒ 20/19/18/17/16초"]],

    [["스킬 사용 후 추가 공격 속도: 25~50% (레벨에 따라 선형적으로 증가) ⇒ 20~40% (능력치 성장 계수에 따라 증가)"],
    ["(신규) 치명적인 찌르기: 이제 E - 여제의 소용돌이 스킬에 치명타가 발동합니다.", "받는 피해량 감소: 70% ⇒ 42/49/56/63/70%", "최소 물리 피해량: 8/10/12/14/16 (+공격력의 6%) ⇒ 6/7/8/9/10 (+공격력의 8%)", "최소 적중 시 피해량: 6% ⇒ 8%"],
    ["공허 빨판 상어 체력: 미니언 최대 체력의 40/50/60% ⇒ 미니언 최대 체력의 20/45/70%", "비전투 시 본모습 이동 속도: 25/50/75 ⇒ 10/45/80"]],

    [["공격력 증가량: 1.7 ⇒ 1.5"],
    ['몬스터 대상 피해량: 120% ⇒ 140%']],
    
    [["재사용 대기시간: 22/20.5/19/17.5/16⇒24/22.5/21/19.5/18"],
  ["공허 빨판 상어 체력: 미니언 최대 체력의 50/60/70%⇒미니언 최대 체력의 40/50/60%"]],
  
  [["공격력 증가량 2 ⇒ 1.7", "체력 증가량 105 ⇒ 99","기본 공격 사거리 125 ⇒ 175", "체력 재생 8.5 ⇒ 6", "체력 재생 증가량 0.85 ⇒ 0.6", "18레벨 체력 재생 22.95 ⇒ 16.2"],
  ["연보라 중첩당 추가 공격 속도 0.25~1.25% (레벨에 따라) ⇒ 0.28~1% (1~13레벨에서)", "(신규) 연보랏빛 미니언 이제 벨베스가 대형 미니언을 처치할 때마다 연보라 중첩을 1개 획득합니다."],
  ["공격당 최소 피해량 8/11/14/17/20 (+공격력의 6%) ⇒ 8/10/12/14/16 (+공격력의 6%)", "생명력 흡수 20/22/24/26/28% ⇒ 20% (모든 스킬 레벨에서)","재사용 대기시간 22/20/18/16/14초 ⇒ 22/20.5/19/17.5/16초"],
  ["추가 체력 100/150/200 (+추가 공격력의 165%) (+주문력의 90%) ⇒ 100/150/200 (+추가 공격력의 120%) (+주문력의 90%)","대상의 잃은 체력 비례 폭발 피해량 25/30/35% ⇒ 25% (모든 스킬 레벨에서)", "추가 기본 공격 사거리 50/75/100 ⇒ 50 (모든 스킬 레벨에서)", "공허 빨판 상어 체력 미니언 최대 체력의 70% ⇒ 50/60/70%"]]];
}

//블리츠크랭크
class PatchContent_Blitzcrank{
  static List<String> BorNorM=["하향", "조정", "하향","조정","상향","상향","하향"];
  static List<String> patchVer=["14.2", "13.17", "12.21","12.20","12.19","12.12","12.4"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[10], PatchNoteLink.link[8],PatchNoteLink.link[9], PatchNoteLink.link[10],
  PatchNoteLink.link[17] ,PatchNoteLink.link[25]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "E - 강철 주먹"],
    ["기본 능력치", "기본 지속 효과 - 마나 보호막", "W - 폭주","E - 강철 주먹", "R - 정전기장"],
    ["기본 능력치", "W - 폭주"],
  ["기본 능력치", "기본 지속 효과 - 마나 보호막","W - 폭주", "E - 강철 주먹"],
  ["기본 능력치","W - 폭주","E - 강철 주먹","R - 정전기장"],
  ["Q - 로켓 손","R - 정전기장"],
  ["기본 능력치"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 방어력: 40 ⇒ 37"],
    ["피해량: 총공격력의 200% (+주문력의 25%) ⇒ 총공격력의 180% (+주문력의 25%)"]],

    [["기본 체력: 633 ⇒ 650", "마법 저항력: 28 ⇒ 32", "기본 공격 속도: 0.65 ⇒ 0.625", "공격 속도 계수: 0.7 ⇒ 0.625"],
    ["보호막 흡수량: 최대 마나의 15~45% (레벨에 따라) ⇒ 최대 마나의 30%"],
    ["마나 소모량: 85 ⇒ 75", "추가 공격 속도: 30/43/56/69/82% ⇒ 30/40/50/60/70%"],
    ["추가 물리 피해량: 공격력의 75% (+주문력의 25%) ⇒ 공격력의 100% (+주문력의 25%)", "마나 소모량: 40 ⇒ 25", "(삭제) 챔피언이 아닌 대상에게 입히는 추가 피해량: E - 강철 주먹이 더 이상 챔피언이 아닌 대상에게 공격력의 150%(+주문력의 125%)에 해당하는 물리 피해를 추가로 입히지 않습니다."],
    ["기본 지속 효과 피해량: 50/100/150 (+주문력의 50%) ⇒ 50/100/150 (+주문력의 50%) (+최대 마나의 2%)"]],
    
    [["기본 체력: 653⇒633", "기본 마법 저항력: 32⇒28"],
  ["추가 공격 속도: 40/53/66/79/92%⇒30/43/56/69/82%"]],
  
  [["기본 공격력: 62 ⇒ 60", "기본 공격 속도: 0.65 ⇒ 0.625"],
  ["보호막 흡수량: 최대 마나의 30% ⇒ 최대 마나의 15~45% (레벨에 따라)"],
  ["몬스터 대상 피해량: 60~180 (레벨에 따라) ⇒ 60~220 (레벨에 따라) (참고: 피해량은 더 이상 레벨에 따라 선형적으로 증가하지 않으며, 60/80/100/120/140/160/165/170/175/180/185/190/195/200/205/210/215/220으로 증가합니다.)"],
  ["챔피언 대상 강화된 기본 공격 피해량: 총 공격력의 200% (+주문력의 25%) ⇒ 총 공격력의 175% (+주문력의 25%)",  "챔피언이 아닌 대상에게 입히는 피해량: 이전과 동일", "(신규) 투 더 문: 이제 블리츠크랭크가 몬스터의 남은 체력을 초과하는 피해를 입혀 처치한 경우 일정 확률로 몬스터를 달나라로 날려보냅니다."]],
  
  [["기본 공격 속도: 0.625 ⇒ 0.65", "공격 속도 계수: 0.625 ⇒ 0.7"],
  ["마나 소모량: 75 ⇒ 85","추가 공격 속도: 30/38/46/54/62% ⇒ 40/53/66/79/92%", "(신규) 마법 주먹: W - 폭주가 활성화된 동안 기본 공격이 대상 최대 체력의 1%에 해당하는 추가 마법 피해를 입힙니다. 챔피언이 아닌 대상에게는 피해량이 60~180 (레벨에 따라) 증가합니다."],
  ["마나 소모량: 25 ⇒ 40", "공중에 띄우기 지속시간: 0.9초 ⇒ 1초", "강화된 기본 공격 피해량: 총 공격력의 200% ⇒ 총 공격력의 200% (+주문력의 25%)", "(신규) 그 누구도 안전하지 않습니다: 블리츠크랭크의 E - 강철 주먹으로 강화된 기본 공격이 챔피언이 아닌 대상에게 총 공격력의 150%(+주문력의 125%)에 해당하는 추가 피해를 입힙니다."],
  ["기본 지속 효과 최대 중첩 수: 3 ⇒ 무제한", "적중 시 중첩당 마법 피해량: 50/100/150 (+주문력의 30%) ⇒ 50/100/150 (+주문력의 30/40/50%)"]],
  
  [["피해량 90/140/190/240/290 (+주문력의 120%) ⇒ 105/155/205/255/305 (+주문력의 120%)"],
  ["폭발 피해량 250/375/500 (+주문력의 100%) ⇒ 275/400/525 (+주문력의 100%)"]],
  
  [["기본 체력 재생 8.5 ⇒ 7.5"]]];
}

//브랜드
class PatchContent_Brand{
  static List<String> BorNorM=["하향", "하향", "하향", "조정", "조정", "상향", "하향","조정"];
  static List<String> patchVer=["14.5", "14.3", "14.2","13.22", "13.21", "13.16", "12.11","12.3"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[22],PatchNoteLinkPlus.link[20],PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[15],PatchNoteLinkPlus.link[14], PatchNoteLinkPlus.link[9],PatchNoteLink.link[18],PatchNoteLink.link[26]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 불길", "R - 파멸의 불덩이"],
    ["기본 지속 효과 - 불길", "Q - 불태우기"],
    ["기본 지속 효과 - 불길"],
    ["기본 지속 효과 - 불길", "E - 발화"],
    ["기본 능력치", "기본 지속 효과 - 불길", "E - 발화"], 
    ["기본 지속 효과 - 불길", "Q - 불태우기", "E - 발화"],
    ["기본 지속 효과 - 불길"],
  ["기본 지속 효과 - 불길", "R - 파멸의 불덩이"]];
  static List<List<List<String>>> Detail_Content =[
    [["몬스터 대상 피해량: 200% ⇒ 215%"],
    ["적중 1회당 피해량: 100/200/300 (+주문력의 25%) ⇒ 100/175/250 (+주문력의 25%)", "재사용 대기시간: 105/90/75초 ⇒ 110/100/90초"]],
    
    [["몬스터 대상 피해량 계수: 220% ⇒ 200%", "버그 수정: 기본 지속 효과 - 불길 중첩 1개가 입히는 피해가 더 이상 대상 최대 체력의 2%를 초과하지 않습니다."],
    ["피해량: 80/110/140/170/200 (+주문력의 65%) ⇒ 70/100/130/160/190 (+주문력의 65%)"]],
    
    [["몬스터 대상 피해량: 230% ⇒ 220%", "주문력 100당 각 중첩 최대 체력 비례 피해량: 2.5% ⇒ 2%"]],
    
    [["몬스터 대상 피해량 계수: 220% ⇒ 230%"],
    ["피해량: 65/90/115/140/165 (+주문력의 50%) ⇒ 60/90/120/150/180 (+주문력의 60%)"]],

    [["1레벨 공격 속도: 0.625 ⇒ 0.681", "공격 속도 증가량: 1.36% ⇒ 2%", "기본 방어력: 22 ⇒ 27", "방어력 증가량: 4.7 ⇒ 4.2", "기본 체력: 590 ⇒ 570", "체력 증가량: 102 ⇒ 105"],
    ["몬스터 대상 피해량 계수: 120% ⇒ 220%", "틱당 몬스터 대상 최대 피해량: 80 (참고: 전과 동일합니다.)"],
    ["마법 피해량: 70/95/120/145/170 (+주문력의 55%) ⇒ 65/90/115/140/165 (+주문력의 55%)"]],

    [["마나 회복량: 20~40 (레벨에 따라) ⇒ 30~50 (레벨에 따라)"],
    ["마법 피해량: 80/110/140/170/200 (+주문력의 55%) ⇒ 80/110/140/170/200 (+주문력의 65%)"],
    ["마법 피해량: 70/95/120/145/170 (+주문력의 45%) ⇒ 70/95/120/145/170 (+주문력의 55%)"]],
    
    [["기본 불태우기 피해량 4초에 걸쳐 대상 최대 체력의 3% ⇒ 4초에 걸쳐 대상 최대 체력의 2.5%", "폭발 불태우기 피해량 대상 최대 체력의 10~14% (1~17레벨에서) ⇒ 대상 최대 체력의 9~13% (1~17레벨에서)"]],

  [["불태워라 브랜드가 불타는 상태가 아닌 적을 스킬로 처치해도 마나 회복 효과가 발동합니다."],
  ["방화광 R - 파멸의 불덩이가 근처의 다른 적에게 모두 튕긴 후 최대 사거리에 도달하면 브랜드를 향해 튕깁니다. R - 파멸의 불덩이는 사거리와 상관없이 미니언이나 몬스터에게 튕기기 전에 적 챔피언에게 우선적으로 튕깁니다."]]];
}

//브라움
class PatchContent_Braum{
  static List<String> BorNorM=["상향","상향","상향"];
  static List<String> patchVer=["13.24", "13.3","12.9"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[17],PatchNoteLink.link[3],PatchNoteLink.link[20]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치","R - 빙하 균열"],
    ["기본 지속 효과 - 뇌진탕 펀치","Q - 동상","W - 내가 지킨다"],
  ["기본 지속 효과 - 뇌진탕 펀치","E - 불굴"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 마나 재생: 6 ⇒ 7"],
    ["최소 공중에 띄우기 지속시간: 0.3초 ⇒ 0.6초", "2차 대상 공중에 띄우기 지속시간: 0.3초 ⇒ 0.6초"]],
    
    [["대상 면역 지속시간: 8/6/4초 (1/7/13레벨에서) ⇒ 8/6/4초 (1/6/11레벨에서)"],
  ["재사용 대기시간: 10/9/8/7/6초 ⇒ 8/7.5/7/6.5/6초"],
  ["추가 방어력 및 마법 저항력: 10/14/18/22/26 ⇒ 20/25/30/35/40"]],
  
  [["기절 효과 대기시간 8/7/6초 ⇒ 8/6/4초"],
  ["피해 감소량 30/32.5/35/37/40% ⇒ 35/40/45/50/55%"]]];
}

//브라이어 13.18 합류
class PatchContent_Briar{
  static List<String> BorNorM=["하향", "하향","조정","하향", "하향", "하향", "하향","하향"];
  static List<String> patchVer=["14.8", "14.6", "14.2","13.24", "13.23", "13.22", "13.21", "13.19"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[25], PatchNoteLinkPlus.link[23],PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[17],PatchNoteLinkPlus.link[16],PatchNoteLinkPlus.link[15],PatchNoteLinkPlus.link[14], PatchNoteLinkPlus.link[12]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "Q - 짜릿한 돌격", "W - 핏빛 광분"],
    ["Q - 짜릿한 돌격", "W - 핏빛 광분", "W - 식욕 폭발", "R - 불가항력적 죽음"],
    ["기본 지속 효과 - 진홍빛 저주", "Q - 짜릿한 돌격", "W - 핏빛 광분/식욕 폭발"],
    ["기본 능력치", "Q - 짜릿한 돌격", "W - 핏빛 광분", "E - 오싹한 비명", "R - 불가항력적 죽음"],
    ["기본 능력치", "W - 식욕 폭발"],
    ["Q - 짜릿한 돌격", "R - 불가항력적 죽음"],
    ["기본 능력치", "기본 지속 효과 - 진홍빛 저주", "W - 식욕 폭발"],
    ["기본 능력치", "Q - 짜릿한 돌격","W - 핏빛 광분", "W - 식욕 폭발","E - 오싹한 비명","R - 불가항력적 죽음"]];
  static List<List<List<String>>> Detail_Content =[
    [["체력 증가량: 100 ⇒ 95"],
    ["사거리: 450 ⇒ 475"],
    ["추가 공격 속도: 54/68/82/96/110% ⇒ 55/65/75/85/95%"]],

    [["와드 감시대: 이제 Q - 짜릿한 돌격으로 와드에 도약할 수 있습니다."],
    ["추가 공격 속도: 55/70/85/100/115% ⇒ 54/68/82/96/110%"],
    ["입힌 피해량 비례 체력 회복량: 25/30/35/40/45% ⇒ 24/28/32/36/40%"],
    ["피해량: 150/300/450 (+추가 공격력의 50%) (+주문력의 120%) ⇒ 150/250/350 (+추가 공격력의 50%) (+주문력의 120%)"]],

    [["체력 회복량 증폭: 잃은 체력 1%당 0.5% ⇒ 잃은 체력 1%당 0.4% (+추가 체력 100당 0.025%)", "출혈 피해 주기: 1초 ⇒ 0.5초 (참고: 출혈 총피해량과 지속 시간은 전과 동일)"],
    ["피해량: 60/90/120/150/180 (+추가 공격력의 80%) 물리 피해량 ⇒ 60/90/120/150/180 (+추가 공격력의 80%) (+주문력의 60%) 마법 피해량", "방어 능력치 감소: 10/12.5/15/17.5/20% 방어력 감소 ⇒ 10/12.5/15/17.5/20% 방어력 및 마법 저항력 감소", "(신규) 체력 적중: 이제 Q - 짜릿한 돌격에 적중 시 효과와 생명력 흡수가 적용됩니다."],
    ["베어 먹기 체력 회복: 입힌 피해량의 36/42/48/54/60% ⇒ 입힌 피해량의 25/30/35/40/45% (+브라이어 최대 체력의 5%)", "(삭제) 덜 치명적인 치명타: W - 식욕 폭발이 더 이상 치명타로 5~65(+공격력의 5%)의 추가 피해를 입히지 않습니다. (참고: W - 핏빛 광분에는 여전히 기본 공격처럼 총공격력의 100%로 치명타가 적용될 수 있습니다.)"]],

    [["기본 방어력: 32 ⇒ 30", "공격 속도 계수: 0.644 ⇒ 0.669 (참고: 1레벨 공격 속도는 전과 동일합니다.)"],
    ["피해량: 60/95/130/165/200 (+추가 공격력의 80%) ⇒ 60/90/120/150/180 (+추가 공격력의 80%)"],
    ["추가 공격 속도: 60/75/90/105/120% ⇒ 55/70/85/100/115%"],
    ["받는 피해량 감소: 40% ⇒ 35%", "체력 회복량: 최대 체력의 10/11.5/13/14.5/16% ⇒ 최대 체력의 9/10/11/12/13%"],
    ["피해량: 150/300/450 (+추가 공격력의 75%) (+주문력의 110%) 물리 피해 ⇒ 150/300/450 (+추가 공격력의 50%) (+주문력의 120%) 마법 피해"]],

    [["기본 체력: 610 ⇒ 590"],
    ["추가 물리 피해량: 5/20/35/50/65 (+총공격력의 5%) (+대상 잃은 체력의 10%(+추가 공격력 100당 3.5%)) ⇒ 5/20/35/50/65 (+총공격력의 5%) (+대상 잃은 체력의 9%(+추가 공격력 100당 2.5%))"]],

    [["물리 피해량: 60/100/140/180/220 (+추가 공격력의 80%) ⇒ 60/95/130/165/200 (+추가 공격력의 80%)", "방어력 감소: 10/14/18/22/26% ⇒ 10/12.5/15/17.5/20%"],
    ["물리 피해량: 150/325/500 (+추가 공격력의 110%) (+주문력의 110%) ⇒ 150/300/450 (+추가 공격력의 75%) (+주문력의 110%)"]],

    [["공격 속도 증가량: 2.3% ⇒ 2.0%"],
    ["출혈 효과 적용 대상 사망 시 체력 회복량: 남은 출혈 피해의 100% ⇒ 남은 출혈 피해의 125%"],
    ["재사용 시 추가 물리 피해량: 5/20/35/50/65 (+공격력의 5%) (+대상이 잃은 체력의 10% (+추가 공격력 100당 4%)) ⇒ 5/20/35/50/65 (+공격력의 5%) (+대상 잃은 체력의 10% (+추가 공격력 100당 3.5%))"]],

    [["공격 속도 증가량: 2.5% ⇒ 2.3%"],
    ["(신규) 체계 업데이트: Q - 짜릿한 돌격이 칼날비와 같은 상호작용을 위해 기본 공격 초기화로 정확히 분류됩니다."],
    ["(신규) 분노를 드러내라: 광분 상태의 지속 시간을 보여주는 광분 바를 추가했습니다.", "툴팁 업데이트: 이제 W - 핏빛 광분을 사용해도 R - 불가항력적 죽음이 부여한 초광분 상태를 제거하거나 교체하지 않는다는 내용이 W - 핏빛 광분의 툴팁에 표시됩니다."],
    ["체력 회복량: 35/42.5/50/57.5/65% ⇒ 36/42/48/54/60%", "미니언 및 몬스터 대상 피해량 증가량: 20% ⇒ 10%", "미니언과 몬스터 대상 잃은 체력 비례 최대 피해량: 500 ⇒ 400", "버그 수정: 잃은 체력 비례 피해량이 치명타로 들어가던 버그를 수정했습니다.", "(신규) 체하겠어: 높은 스킬 가속 빌드로 인한 연속 스킬 사용을 방지하기 위해 W - 식욕 폭발을 사용한 후 짧은 최소한의 재사용 대기시간을 추가했습니다."],
    ["버그 수정: 가끔 밀려난 적이 플레이어가 생성한 지형에 적중해도 기절하지 않던 버그를 수정했습니다."],
    ["(신규) 적이다!: R - 불가항력적 죽음 신호를 보내면 아군에게 R - 불가항력적 죽음의 사거리 안에 있는 적이 제대로 표시됩니다.", "버그 수정: R - 불가항력적 죽음 스킬 사용 시간 중에 대상이 사망할 경우 브라이어가 선택한 대상이 아닌 다른 대상을 향해 공격하던 버그를 수정했습니다."]]];
}

//케이틀린
class PatchContent_Caitlyn{
  static List<String> BorNorM=["하향","상향", "상향", "하향","상향","상향","조정", "상향","하향"];
  static List<String> patchVer=["13.21", "13.16", "13.15", "13.5","13.1B","12.16","12.12","12.11","12.3"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[14], PatchNoteLinkPlus.link[9],PatchNoteLinkPlus.link[8], PatchNoteLink.link[1],PatchNoteLink.link[4],PatchNoteLink.link[13],
  PatchNoteLink.link[17],PatchNoteLink.link[18], PatchNoteLink.link[26]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 헤드샷", "R - 비장의 한 발"],
    ["기본 능력치"],
  ["기본 지속 효과 - 헤드샷","R - 비장의 한 발"],
  ["기본 능력치"],
  ["기본 능력치"],
  ["기본 지속 효과 - 헤드샷","R - 비장의 한 발"],
  ["기본 능력치", "기본 지속 효과 - 헤드샷", "W - 요들잡이 덫"],
  ["Q - 필트오버 피스메이커","E - 90구경 투망"],
  ["기본 능력치","Q - 필트오버 피스메이커"]];
  static List<List<List<String>>> Detail_Content =[
    [["추가 물리 피해량: 60/90/120% (+(치명타 확률의 81.25%) * (치명타 피해량의 100%) ⇒ 60/90/120% (+(치명타 확률의 85%) * (치명타 피해량의 100%)"],
    ["재사용 대기시간: 90/75/60초 ⇒ 90초 (모든 스킬 레벨에서)", "물리 피해량: 300/525/750 (+추가 공격력의 200%) ⇒ 300/500/700 (+추가 공격력의 170%)", "치명타 확률 비례 추가 피해량: 0~35% ⇒ 0~50%"]],

    [["헤드샷에 필요한 기본 공격 횟수: 7 ⇒ 6"]],


  [["치명타 확률 계수: 1.2 ⇒ 1.3 (참고: 치명타 확률 100%에서 기본 피해량이 27 늘어납니다.)"],
  ["치명타 확률 비례 피해량: 치명타 확률 10%당 2.5%의 추가 피해 ⇒ 치명타 확률 10%당 3.5%의 추가 피해"]],

  [["기본 방어력: 28 ⇒ 27", "기본 공격력: 62 ⇒ 60"]],

  [["마나 증가량: 35 ⇒ 40", "마나 재생 증가량: 0.55 ⇒ 0.7"]],
  
  [["공격력 계수 60/85/110% (레벨에 따라) ⇒ 60/90/120% (레벨에 따라)"],
  ["(신규) 완벽한 사격 피해량이 현재 치명타 확률에 비례하여 0~25% 증가합니다."]],
    
  [["공격력 증가량 3.4 ⇒ 3.8"],
  ["추가 물리 피해량 총 공격력의 50/75/100% ⇒ 총 공격력의 60/85/110% (1/7/13레벨에서)", "기본 지속 효과 - 헤드샷 치명타 확률 계수 100% ⇒ 120%"],
  ["헤드샷 피해량 증가 60/105/150/195/240 (+추가 공격력의 40/55/70/85/100%) ⇒ 40/85/130/175/220 (+추가 공격력의 40/50/60/70/80%)"]],
  
  [["물리 피해량 50/90/130/170/210 (+공격력의 130/145/160/175/190%) ⇒ 50/90/130/170/210 (+공격력의 125/145/ 165/185/205%)", "마나 소모량 50/60/70/80/90 ⇒ 55/60/65/70/75"],
  ["마법 피해량 70/110/150/190/230 (+주문력의 80%) ⇒ 80/130/180/230/280 (+주문력의 80%)", "재사용 대기시간 16/14.5/13/11.5/10초 ⇒ 16/14/12/10/8초"]],

  [["공격력 증가량 3.8 ⇒ 3.4", "공격력 62-126.6 (레벨에 따라) ⇒ 62-119.8 (레벨에 따라)"],
  ["두 번째 대상에게 입히는 피해량 60% ⇒ 50%"]]];
}

//카밀
class PatchContent_Camille{
  static List<String> BorNorM=["조정", "상향", "상향", "상향","하향"];
  static List<String> patchVer=["14.7", "14.2","13.15", "12.17","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[24],PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[8], PatchNoteLink.link[12], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["Q - 정확성 프로토콜","W - 전술적 휩쓸기", "E - 갈고리 발사"],
    ["기본 능력치", "기본 지속 효과 - 적응형 방어 체계", "Q - 정확성 프로토콜"],
  ["기본 능력치", "R - 마법공학 최후통첩"],
  ["기본 지속 효과 - 적응형 방어 체계","E - 갈고리 발사/갈고리 돌진"],
  ["기본 지속 효과 - 적응형 방어체계"]];
  static List<List<List<String>>> Detail_Content =[
    [["추가 이동 속도: 30/32.5/35/37.5/40% ⇒ 30/35/40/45/50%", "재사용 대기시간: 9/8.25/7.5/6.75/6초 ⇒ 9/8/7/6/5초"],
    ["원뿔 바깥쪽 기본 피해량: 최대 체력의 5/5.5/6/6.5/7% ⇒ 6/6.5/7/7.5/8%"],
    ["피해량: 80/110/140/170/200 (+추가 공격력의 90%) ⇒ 60/90/120/150/180 (+추가 공격력의 90%)"]],

    [["기본 체력: 646 ⇒ 670"],
    ["재사용 대기시간: 20/15/10초 (1/7/13레벨에서) ⇒ 18/14/10초 (1/7/13레벨에서)"],
    ["추가 이동 속도: 20/25/30/35/40% ⇒ 30/32.5/35/37.5/40%"]],

  [["공격력 증가량: 3.5 ⇒ 3.8"],
  ["기본 공격당 기본 추가 마법 피해량: 5/10/15 ⇒ 20/30/40"]],
    
  [["최대 체력 비례 보호막 흡수량 17% ⇒ 20%"],
  ["피해량 60/95/130/165/200 (+추가 공격력의 75%) ⇒ 80/110/140/170/200 (+추가 공격력의 90%)"]],
  
  [["보호막 흡수량 최대 체력의 20% ⇒ 17%"]]];
}

//카시오페아
class PatchContent_Cassiopeia{
  static List<String> BorNorM=["하향"];
  static List<String> patchVer=["12.10"];
  static List<String> patchNoteLink= [ PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[["E - 쌍독니"]];
  static List<List<List<String>>> Detail_Content =[[["중독된 적 대상 체력 회복량 주문력의 12/14/16/18/20% ⇒ 주문력의 10/11.5/13/14.5/16% (미니언 및 몬스터 대상으로 여전히 75% 감소)"]]];
}

//초가스
class PatchContent_Chogath{
  static List<String> BorNorM=["상향", "상향","상향","상향","하향"];
  static List<String> patchVer=["14.6", "13.4","12.23","12.22","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[23],PatchNoteLink.link[2],PatchNoteLink.link[6],PatchNoteLink.link[7], 
  PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["W - 흉포한 울부짖음", "E - 날카로운 가시"],
    ["기본 능력치","Q - 파열", "W - 흉포한 울부짖음"],
  ["기본 지속 효과 - 육식","W - 흉포한 울부짖음","R - 포식"],
  ["R - 포식"],
  ["기본 지속 효과 - 육식"]];
  static List<List<List<String>>> Detail_Content =[
    [["재사용 대기시간: 13/12/11/10/9초 ⇒ 11/10.5/10/9.5/9초"],
    ["가시당 피해량: 22/34/46/58/70 (+대상 최대 체력의 3% (+포식 중첩 하나당 0.5%)) ⇒ 22/37/52/67/82 (+대상 최대 체력의 3% (+포식 중첩 하나당 0.5%))"]],
    
    [["방어력 증가량: 4.7 ⇒ 5"],
  ["마나 소모량: 60 ⇒ 50", "마법 피해량: 80/135/190/245/300 (+주문력의 100%) ⇒ 80/140/200/260/320 (+주문력의 100%)"],
  ["마나 소모량: 70/80/90/100/110 ⇒ 70/75/80/85/90"]],
  
  [["적 유닛 처치시 마나 회복량: 3.5~7.75 (레벨에 따라) ⇒ 4.7~9.5 (레벨에 따라)"],
  ["기본 피해량: 75/125/175/225/275 ⇒ 80/135/190/245/300"],
  ["재사용 대기시간: 80초 ⇒ 80/70/60초"]],
  
  [["챔피언이 아닌 대상에게 입히는 피해량: 1,000 (+주문력의 50%)(+추가 체력의 10%) ⇒ 1,200 (+주문력의 50%)(+추가 체력의 10%)"]],
  
  [["체력 회복량 20~71 ⇒ 18~52 (레벨에 따라)"]]];
}

//코르키
class PatchContent_Corki{
  static List<String> BorNorM=["조정", "상향","상향","하향","하향"];
  static List<String> patchVer=["14.3","14.1", "12.21","12.13","12.3"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[20], PatchNoteLinkPlus.link[18],PatchNoteLink.link[8],PatchNoteLink.link[16],PatchNoteLink.link[26]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 특급 폭탄 배송", "W - 발키리", "R - 미사일 폭격"],
    ["기본 능력치", "R - 미사일 폭격"],
    ["기본 능력치"],
  ["E - 개틀링 건", "R - 미사일 폭격"],
  ["기본 지속 효과 - 마법공학 탄약"]];
  static List<List<List<String>>> Detail_Content =[
    [["폭탄 꾸러미 지속시간: 60초 ⇒ 45초"],
    ["재사용 대기시간: 20/19/18/17/16초 ⇒ 20/18/16/14/12초", "마나 소모량: 100 ⇒ 80", "초당 피해량: 60/90/120/150/180 (+주문력의 40%) ⇒ 60/90/120/150/180 (+주문력의 60%)"],
    ["(삭제) 이템 상호 작용 조정: 악의의 피해가 더 이상 월식의 기본 지속 효과 - 늘 떠오르는 달에 영향을 주지 않습니다."]],

    [["기본 공격력 : 59 ⇒ 61"],
    ["피해량: 80/115/150 (+공격력의 15/45/75%) (+주문력의 12%) ⇒ 80/115/150 (+공격력의 25/50/75%) (+주문력의 12%)"]],

    [["체력 증가량: 101⇒105", "공격력 증가량: 2.5⇒2.8"]],

  [["0.25초당 피해량 7.5/10.63/13.75/16.88/20 (+추가 공격력의 10%) ⇒ 7.5/10.63/13.75/16.88/20 (+추가 공격력의 15%)"],
  ["미사일 피해량 90/125/160 (+공격력의 15/45/75%) (+주문력의 20%) ⇒ 80/115/150 (+공격력의 15/45/75%) (+주문력의 12%)", "'큰 놈' 미사일 피해량 180/250/320 (+공격력의 30/90/150%) (+주문력의 40%) ⇒ 160/230/300 (+공격력의 30/90/150%) (+주문력의 24%)"]],

  [["첫 번째 폭탄 꾸러미 도착 시간 게임 시작 8분 후 ⇒ 게임 시작 10분 후", "폭탄 꾸러미 재생성 주기 4분 ⇒ 5분"]]];
}

//다리우스
class PatchContent_Darius{
  static List<String> BorNorM=["상향", "하향", "상향"];
  static List<String> patchVer=["14.2", "12.10","12.6"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[18], PatchNoteLink.link[19], PatchNoteLink.link[23]];
  static List<List<String>> Detail_Title =[
    ["Q - 학살", "E - 포획"],
    ["Q - 학살"],
  ["R - 녹서스의 단두대"]];
  static List<List<List<String>>> Detail_Content =[
    [["마나 소모량: 마나 30/35/40/45/50 ⇒ 마나 25/30/35/40/45", "잃은 체력 비례 대상별 체력 회복량: 대상별 13% (최대 39%) ⇒ 대상별 15% (최대 45%)"],
    ["기본 지속 효과 방어구 관통력: 15/20/25/30/35% ⇒ 20/25/30/35/40%"]],
    
    [["챔피언 및 대형 몬스터 대상 체력 회복량 도끼날로 맞힌 적 하나당 (최대 3배) 잃은 체력의 15% ⇒ 13%"]],
  
  [["최소 고정 피해량 100/200/300 (+추가 공격력의 75%) ⇒ 125/250/375 (+추가 공격력의 75%)"]]];
}

//다이애나
class PatchContent_Diana{
  static List<String> BorNorM=["상향", "상향","조정", "상향","상향"];
  static List<String> patchVer=["14.6", "13.14", "12.16","12.10","12.1"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[23],PatchNoteLinkPlus.link[7], PatchNoteLink.link[13], PatchNoteLink.link[19],PatchNoteLink.link[28]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "기본 지속 효과 - 서늘한 달빛 검"],
    ["W - 은빛 가호", "E - 월광 쇄도"],
    ["기본 지속 효과 - 서늘한 달빛 검","E - 월광 쇄도"],
  ["W - 은빛 가호", "E - 월광 쇄도"],
  ["기본 지속 효과 - 서늘한 달빛 검"]];
  static List<List<List<String>>> Detail_Content =[
    [["공격 속도 계수: 0.625 ⇒ 0.694", "공격 속도 증가량: 2.25% ⇒ 2%"],
    ["추가 공격 속도: 15~39.96% (3레벨마다 증가) ⇒ 15~35% (선형적으로 증가) (참고: 기타 게임 모드를 위해 18레벨 이후 성장치를 추가했습니다.)", "강화된 추가 공격 속도: 3초 동안 세 배로 증가 ⇒ 5초 동안 세 배로 증가 (참고: 이 툴팁에는 버그가 있으며 다음 패치에 변경 사항이 반영됩니다.)"]],

    [["보호막 흡수량: 40/55/70/85/100 (+주문력의 25%) (+추가 체력의 9%) ⇒ 45/60/75/90/105 (+주문력의 30%) (+추가 체력의 9%)", "구체당 마법 피해량: 18/30/42/54/66 (+주문력의 15%) ⇒ 18/30/42/54/66 (+주문력의 18%)"],
    ["마법 피해량: 50/70/90/110/130 (+주문력의 50%) ⇒ 50/70/90/110/130 (+주문력의 60%)"]],
    
    [["강화된 범위 공격 피해량 20~250 (레벨에 따라) (+주문력의 50%) ⇒ 20~220 (레벨에 따라) (+주문력의 50%)(참고: 레벨당 기본 피해량 변화: 6레벨: 55 ⇒ 45, 11레벨: 120 ⇒ 95, 16레벨: 210 ⇒ 170)"],
  ["마법 피해량 50/70/90/110/130 (+주문력의 45%) ⇒ 50/70/90/110/130 (+주문력의 50%)"]],
  
  [["보호막 흡수량 30/45/60/75/90 (+주문력의 30%) (+최대 체력의 10%) ⇒ 40/55/70/85/100 (+주문력의 25%) (+최대 체력의 9%)"],
  ["마법 피해량 40/60/80/100/120 (+주문력의 40%) ⇒ 50/70/90/110/130 (+주문력의 45%)"]],
  
  [["주문력 계수 40% ⇒ 50%", "몬스터 대상 피해량 250% ⇒ 300%"]]];
}

//드레이븐
class PatchContent_Draven{
  static List<String> BorNorM=["상향", "상향", "하향","상향", "상향"];
  static List<String> patchVer=["14.8", "13.23", "12.16","12.10", "12.4"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[25], PatchNoteLinkPlus.link[16],PatchNoteLink.link[13], PatchNoteLink.link[19],PatchNoteLink.link[24]];
  static List<List<String>> Detail_Title =[
    ["Q - 회전 도끼"],
    ["R - 죽음의 소용돌이"],
    ["Q - 회전 도끼"],
  ["기본 지속 효과 - 드레이븐의 리그","Q - 회전 도끼"],
  ["기본 능력치"]];
  static List<List<List<String>>> Detail_Content =[
    [["추가 물리 피해량: 40/45/50/55/60 (+추가 공격력의 75/85/95/105/115%) ⇒ 45/50/55/60/65 (+추가 공격력의 75/85/95/105/115%)"]],

    [["편의성 개선: R - 죽음의 소용돌이가 챔피언을 타격한 후 드레이븐이 사망해도 드레이븐에게 돌아옵니다."]],

    [["기본 피해량 45/50/55/60/65 ⇒ 40/45/50/55/60"]],
  
  [["챔피언 처치 시 추가 획득 골드 25골드 (+팬들의 환호 중첩당 2골드) ⇒ 40골드 (+팬들의 환호 중첩당 2.5골드)"],
  ["추가 피해량 40/45/50/55/60 (+추가 공격력의 70/80/90/100/110%) ⇒ 45/50/55/60/65 (+추가 공격력의 75/85/95/105/115%)"]],
  
  [["기본 공격력 60 ⇒ 62"]]];
}

//문도박사
class PatchContent_DrMundo{
  static List<String> BorNorM=["상향", "하향","조정","하향", "조정","하향","하향","하향"];
  static List<String> patchVer=["13.22", "13.21", "13.6","13.1","12.23","12.12","12.10","12.4"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[15],PatchNoteLinkPlus.link[14], PatchNoteLink.link[0],PatchNoteLink.link[5], PatchNoteLink.link[6],
  PatchNoteLink.link[17], PatchNoteLink.link[19],PatchNoteLink.link[25]];
  static List<List<String>> Detail_Title =[
    ["E - 둔기에 의한 외상"],
    ["E - 둔기에 의한 외상"],
    ["기본 능력치","W - 심장 전기 충격","E - 둔기에 의한 외상"],
  ["기본 능력치","E - 둔기에 의한 외상"],
  ["기본 능력치" ,"기본 지속 효과 - 가고 싶은 데로 간다","Q - 오염된 뼈톱", "W - 심장 전기 충격","E - 둔기에 의한 외상","R - 최대 투여량"],
  ["기본 지속 효과 - 가고 싶은 데로 간다","R - 최대 투여량"],
  ["R - 최대 투여량"],
  ["기본 능력치","R - 최대 투여량"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 지속 효과 추가 공격력: 2/2.25/2.5/2.75/3% ⇒ 2/2.35/2.7/3.05/3.4%"]],

    [["기본 지속 효과 추가 공격력: 최대 체력의 2/2.5/3/3.5/4% ⇒ 최대 체력의 2/2.25/2.5/2.75/3%", "잃은 체력 비례 추가 공격력: 0~60% ⇒ 0~40%"]],
    
    [["기본 체력 재생: 6.5 ⇒ 7","체력 재생 증가량: 0.55 ⇒ 0.5"],
  ["다시 사용 타이머: 1초 ⇒ 0.5초"],
  ["정글 몬스터 대상 피해량: 150% ⇒ 200%"]],
  
  [["기본 체력: 653 ⇒ 613","방어력 증가량: 4.2 ⇒ 3.7"],
  ["추가 공격력: 최대 체력의 2.5/3/3.5/4/4.5% ⇒ 최대 체력의 2/2.5/3/3.5/4%"]],
  
  [["기본 마법 저항력: 32 ⇒ 29","마법 저항력 증가량: 2.05 ⇒ 2.3","기본 공격 속도: 0.72 ⇒ 0.55","공격력 증가량: 3.5 ⇒ 2.5"],
  ["통 체력 소모량: 현재 체력의 7% ⇒ 현재 체력의 4%", "통 회복량: 최대 체력의 8% ⇒ 최대 체력의 4%", "5초당 최대 체력 비례 체력 재생: 0.8~1.6% (선형적으로 증가) ⇒ 0.4~2.3% (비선형적으로 증가, 11레벨에 같아짐)"],
  ["체력 소모량: 50 ⇒ 50/60/70/80/90"],
  ["체력 소모량: 현재 체력의 5% ⇒ 현재 체력의 8%", "피해를 입지 않았을 때 회복되는 회색 체력: 0% ⇒ 50%", "회색 체력으로 저장되는 피해: 25/30/35/40/45% ⇒ 첫 0.75초는 80~95% (레벨에 따라), 이후 25%", "지속시간: 4초 ⇒ 3초"],
  ["기본 지속 효과 추가 공격력: 15/20/15/30/35 (+잃은 체력에 따라 25/30/35/40/45) ⇒ 최대 체력의 2.5/3/3.5/4/4.5%", "체력 소모량: 10/20/30/40/50 ⇒ 10/25/40/55/70", "재사용 대기시간: 8/7.5/7/6.5/6초 ⇒ 9/8.25/7.5/6.75/6초", "몬스터 대상 추가 피해량: 200% ⇒ 150%"],
  ["재사용 대기시간: 110초 ⇒ 120초","잃은 체력만큼 증가하는 최대 체력: 8/11.5/15% ⇒ 15/20/25%", "(신규) 문도 엄청나게 회복한다: 스킬 레벨이 3이 되면 R - 최대 투여량의 체력 회복 효과가 근처 적 챔피언당 5%만큼 추가로 증가합니다.", "(삭제) 문도 화났다: R - 최대 투여량이 더 이상 추가 공격력을 부여하지 않습니다."]],
  
  [["체력 재생량 최대 체력의 1~2% (레벨에 따라) ⇒ 최대 체력의 0.8~1.6% (레벨에 따라)"],
  ["기본 체력 증가량 잃은 체력의 10/15/20% ⇒ 잃은 체력의 8/11.5/15%"]],
  
  [["기본 체력 증가량 잃은 체력의 15/20/25% ⇒ 10/15/20%"]],
  
  [["공격력 증가량 4.2 ⇒ 3.5", "공격력 61~132.4 (레벨에 따라) ⇒ 61~120.5 (레벨에 따라)"],
  ["재사용 대기시간 110/100/90초 ⇒ 110초 (모든 스킬 레벨에서)"]]];
}

//에코
class PatchContent_Ekko{
  static List<String> BorNorM=["상향", "상향","하향"];
  static List<String> patchVer=["13.16", "12.19","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[9],PatchNoteLink.link[10], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["Q - 시간의 톱니바퀴", "W - 평행 시간 교차"],
    ["기본 지속 효과 - Z 드라이브 공진","R - 시공간 붕괴"],
  ["W - 평행 시간 교차"]];
  static List<List<List<String>>> Detail_Content =[
    [["최초 마법 피해량: 60/75/90/105/120 (+주문력의 30%) ⇒ 70/85/100/115/130 (+주문력의 30%)", "둔화율: 32/39/46/53/60% ⇒ 40/45/50/55/60%"],
    ["보호막 흡수량: 70/90/110/130/150 (+주문력의 150%) ⇒ 100/120/140/160/180 (+주문력의 150%)"]],

    [["세 번째 타격 효과 발동 시 피해량: 30~140 (레벨에 따라) (+주문력의 80%) ⇒ 30~140 (레벨에 따라) (+주문력의 90%)"],
  ["마법 피해량: 150/300/450 (+주문력의 150%) ⇒ 200/350/500 (+주문력의 175%)"]],
  
  [["보호막 흡수량 80/100/120/140/160 (+주문력의 150%) ⇒ 70/90/110/130/150 (+주문력의 150%)"]]];
}

//엘리스
class PatchContent_Elise{
  static List<String> BorNorM=["상향", "하향","상향","상향","하향"];
  static List<String> patchVer=["13.17", "13.4","12.20","12.13","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[10], PatchNoteLink.link[2],PatchNoteLink.link[9],PatchNoteLink.link[16], 
  PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 거미 여왕", "E - 고치"],
    ["Q - 독이빨","R - 거미 형태"],
  ["Q - 신경독"],
  ["기본 능력치", "Q - 신경독 (인간 형태)"],
  ["기본 지속 효과 - 거미 여왕"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 공격 시 추가 마법 피해량: 10/20/30/40 (+주문력의 20%) ⇒ 12/22/32/42 (+주문력의 20%)", "기본 공격 적중 시 체력 회복: 4/6/8/10 (+주문력의 8%) ⇒ 6/8/10/12 (+주문력의 8%)"],
    ["기절 지속시간: 1.6/1.7/1.8/1.9/2초 ⇒ 1.6/1.8/2/2.2/2.4초"]],
    
    [["마법 피해량: 70/105/140/175/210 (+대상 잃은 체력의 8% (+주문력 100당 3%)) ⇒ 60/90/120/150/180 (+대상 잃은 체력의 8% (+주문력 100당 3%))"],
  ["새끼 거미 마법 피해량: 10/15/20/25 (1/6/11/16레벨에서) ⇒ 8/14/20/26 (1/6/11/16레벨에서)"]],
  
  [["스킬 사거리: 625 ⇒ 575", "사거리 탐지 방식: 엘리스의 가장자리에서 대상의 피격 판정 범위 중앙까지 ⇒ 엘리스의 중앙에서 대상의 피격 판정 범위 가장자리까지"]],
  
  [["기본 체력 625 ⇒ 650", "체력 증가량 107 ⇒ 109", "기본 방어력 27 ⇒ 30"],
  ["기본 피해량 40/70/100/130/160 ⇒ 40/75/110/145/180"]],
  
  [["거미 형태 기본 공격 시 체력 회복량 4/6/8/10 (+주문력의 10%) ⇒ 4/6/8/10 (+주문력의 8%)"]]];
}

//이블린
class PatchContent_Evelynn{
  static List<String> BorNorM=["하향", "상향","상향"];
  static List<String> patchVer=["14.5", "12.20","12.13"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[22],PatchNoteLink.link[9],PatchNoteLink.link[16]];
  static List<List<String>> Detail_Title =[
    ["Q - 증오의 가시"],
    ["Q - 증오의 가시","W - 황홀한 저주"],
  ["기본 지속 효과 - 악의 장막", "W - 황홀한 저주", "R - 최후의 포옹"]];
  static List<List<List<String>>> Detail_Content =[
    [["피해량: 25/30/35/40/45 (+주문력의 30%) ⇒ 25/30/35/40/45 (+주문력의 25%)"]],
    
    [["표식이 부여된 대상에게 입히는 추가 마법 피해량: 10/20/30/40/50 (+주문력의 25%) ⇒ 15/25/35/45/55 (+주문력의 25%)"],
  ["매혹 지속시간: 1/1.25/1.5/1.75/2초 ⇒ 1.25/1.5/1.75/2/2.25초"]],
  
  [["낮은 체력에서 체력 회복 초당 15~75 (레벨에 따라) ⇒ 초당 15~150 (레벨에 따라)"],
  ["적 마법 저항력 감소 25/27.5/30/32.5/35% ⇒ 35/37.5/40/42.5/45%"],
  ["(신규) 숨바꼭질 이제 R - 최후의 포옹을 사용한 후 기본 지속 효과 - 악의 장막 재사용 대기시간이 기존 4초에서 1.25초로 변경됩니다."]]];
}

//이즈리얼
class PatchContent_Ezreal{
  static List<String> BorNorM=["하향", "상향", "상향", "상향","상향","상향","상향"];
  static List<String> patchVer=["14.3", "14.2", "14.1", "13.8", "13.1B","12.17","12.8"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[20],PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[1],PatchNoteLink.link[4],PatchNoteLink.link[12],
  PatchNoteLink.link[21]];
  static List<List<String>> Detail_Title =[
    ["Q - 신비한 화살", "R - 정조준 일격"],
    ["Q - 신비한 화살", "W - 정수의 흐름", "R - 정조준 일격"],
    ["W - 정수의 흐름", "E - 비전 이동"],
    ["기본 능력치"],
    ["기본 능력치"],
  ["E - 비전 이동"],
  ["R - 정조준 일격"]];
  static List<List<List<String>>> Detail_Content =[
    [["피해량: 20/45/70/95/120 (+공격력의 135%) (+주문력의 15%) ⇒ 20/45/70/95/120 (+공격력의 130%) (+주문력의 15%)"]
    ,["피해량: 350/525/700 (+추가 공격력의 120%) (+주문력의 90%) ⇒ 325/500/675 (+추가 공격력의 100%) (+주문력의 90%)"]],

    [["피해량: 20/45/70/95/120 (+공격력의 130%) (+주문력의 15%) ⇒ 20/45/70/95/120 (+공격력의 135%) (+주문력의 15%)"],
    ["피해량: 80/135/190/245/300 (+추가 공격력의 60%) (+주문력의 70/75/80/85/90%) ⇒ 80/135/190/245/300 (+추가 공격력의 100%) (+주문력의 70/75/80/85/90%)"],
    ["피해량: 350/500/650 (+추가 공격력의 100%) (+주문력의 90%) ⇒ 350/525/700 (+추가 공격력의 120%) (+주문력의 90%)"]],

    [["재사용 대기시간: 12초 ⇒ 8초"],
    ["마나 소모량: 90 ⇒ 70"]],

    [["기본 공격력: 60 ⇒ 62"]],
    
    [["마나 재생 증가량: 0.65 ⇒ 1"]],
  
  [["재사용 대기시간 28/25/22/19/16초 ⇒ 26/23/20/17/14초"]],
  
  [["재사용 대기시간 120초 (모든 스킬 레벨에서) ⇒ 120/105/90초"]]];
}

//피들스틱
class PatchContent_Fiddlesticks{
  static List<String> BorNorM=["상향","하향","상향"];
  static List<String> patchVer=["12.13","12.10","12.8"];
  static List<String> patchNoteLink= [PatchNoteLink.link[16], PatchNoteLink.link[19],PatchNoteLink.link[21]];
  static List<List<String>> Detail_Title =[["Q - 공포","R - 까마귀 폭풍"],
  ["W - 풍작"],
  ["W - 풍작"]];
  static List<List<List<String>>> Detail_Content =[[["공포 지속시간 1/1.25/1.5/1.75/2초 ⇒ 1.25/1.5/1.75/2/2.25초"],
  ["피해량 625/1,125/1,625 (+주문력의 225%) ⇒ 750/1,250/1,750 (+주문력의 250%)"]],
  
  [["몬스터 대상 체력 회복량 입힌 피해의 50% ⇒ 45% (미니언 대상으로는 여전히 15%)", "챔피언 대상 체력 회복량 입힌 피해의 30/40/50/60/70% ⇒ 25/32.5/40/47.5/55%"]],
  
  [["챔피언 대상 회복 계수 30/35/40/45/50% ⇒ 30/40/50/60/70% (미니언 대상 회복량은 15%로 전과 동일)"]]];
}

//피오라
class PatchContent_Fiora{
  static List<String> BorNorM=["하향", "하향", "하향","하향","하향"];
  static List<String> patchVer=["14.7", "14.4", "13.1","12.12","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[24],PatchNoteLinkPlus.link[21], PatchNoteLink.link[5],PatchNoteLink.link[17], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치"],
    ["W - 응수"],
    ["기본 지속 효과 - 치명적인 검무","Q - 찌르기"],
  ["기본 지속 효과 - 치명적인 검무"],
  ["기본 지속 효과 - 치명적인 검무", "R - 대결투"]];
  static List<List<List<String>>> Detail_Content =[
    [["공격력: 68 ⇒ 66"]],

    [["공격 속도 둔화율: 2초 동안 50% ⇒ 2초 동안 25%"]],

    [["대상 최대 체력 비례 피해 공격력 계수: 공격력 100당 최대 체력의 4.5% 고정 피해 ⇒ 공격력 100당 최대 체력의 4% 고정 피해"],
  ["물리 피해량: 70/80/90/100/110 (+추가 공격력의 95/100/105/110/115%) ⇒ 70/80/90/100/110 (+추가 공격력의 90/95/100/105/110%)"]],

  [["추가 고정 피해량 대상 최대 체력의 3% (+추가 공격력 100당 5.5%) ⇒ 3% (+추가 공격력 100당 4.5%)"]],
  
  [["급소 공격 시 체력 회복량 40~115 ⇒ 35~100 (레벨에 따라)"],
  ["초당 체력 회복량 80/110/140 (+추가 공격력의 60%) ⇒ 75/110/125 (+추가 공격력의 60%)"]]];
}

//피즈
class PatchContent_Fizz{
  static List<String> BorNorM=["하향", "하향", "상향","상향","조정"];
  static List<String> patchVer=["14.2", "14.1", "13.5","12.19","12.11"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[18],PatchNoteLink.link[1],PatchNoteLink.link[10],PatchNoteLink.link[18]];
  static List<List<String>> Detail_Title =[
    ["Q - 성게 찌르기", "W - 심해석 삼지창"],
    ["Q - 성게 찌르기", "W - 심해석 삼지창"],
    ["W - 심해석 삼지창","E - 장난치기/재간둥이"],
  ["E - 장난치기/재간둥이"],
  ["기본 능력치"]];
  static List<List<List<String>>> Detail_Content =[
    [["마법 피해량: 10/25/40/55/70 (+주문력의 50%) ⇒ 10/25/40/55/70 (+주문력의 45%) (참고: 공격력의 100% 물리 피해와 적중 시 효과는 전과 동일)"],
    ["총지속 마법 피해량: 20/30/40/50/60 (+주문력의 40%) ⇒ 20/30/40/50/60 (+주문력의 30%)"]],

    [["피해량: 10/25/40/55/70 (+주문력의 55%) ⇒ 10/25/40/55/70 (+주문력의 50%)"],
    ["사용 시 피해량: 50/70/90/110/130 (+주문력의 50%) ⇒ 50/70/90/110/130 (+주문력의 40%)"]],
    
    [["마나 회복: 20/28/36/44/52 ⇒ 30/40/50/60/70 (참고: 마나 소모량의 100%를 되돌려 받게 됩니다.)"],
  ["마법 피해량: 70/120/170/220/270 (+주문력의 90%) ⇒ 80/130/180/230/280 (+주문력의 90%)", "마나 소모량: 90/95/100/105/110 ⇒ 75/80/85/90/95"]],

  [["마법 피해량: 70/120/170/220/270 (+주문력의 75%) ⇒ 70/120/170/220/270 (+주문력의 90%)"]],
  
  [["체력 증가량 112 ⇒ 106", "18레벨 체력 2,544 ⇒ 2,442", "마나 증가량 37 ⇒ 52", "18레벨 마나 946 ⇒ 1,201"]]];
}

//갈리오
class PatchContent_Galio{
  static List<String> BorNorM=["상향", "상향", "조정", "상향", "상향", "상향", "상향","상향","하향"];
  static List<String> patchVer=["14.8", "14.7", "14.6", "13.24", "13.20", "13.19", "13.6","12.13","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[25], PatchNoteLinkPlus.link[24],PatchNoteLinkPlus.link[23],PatchNoteLinkPlus.link[17],PatchNoteLinkPlus.link[13], PatchNoteLinkPlus.link[12], PatchNoteLink.link[0],PatchNoteLink.link[16], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "Q - 전장의 돌풍"],
    ["기본 지속 효과 - 석상의 강타", "W - 듀란드의 방패", "E - 정의의 주먹"],
    ["기본 지속 효과 - 석상의 강타", "Q - 전장의 돌풍", "W - 듀란드의 방패", "E - 정의의 주먹"],
    ["Q - 전장의 돌풍"],
    ["W - 듀란드의 방패"],
    ["R - 영웅출현"],
    ["W - 듀란드의 방패","E - 정의의 주먹"],
  ["Q - 전장의 돌풍"],
  ["W - 듀란드의 방패"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 이동 속도: 335 ⇒ 340"],
    ["재사용 대기시간: 12/10.75/9.5/8.25/7초 ⇒ 11/10/9/8/7초"]],

    [["마법 피해량: 15~115 (레벨에 따라) (+공격력의 100%) (+주문력의 40%) (+추가 마법 저항력의 60%) ⇒ 15~115 (레벨에 따라) (+공격력의 100%) (+주문력의 45%) (+추가 마법 저항력의 60%)"],
    ["받는 마법 피해 감소량 (물리 피해는 절반만 적용): 20/25/30/35/40 (+추가 마법 저항력 100당 4%) (+추가 체력 100당 1%) ⇒ 25/30/35/40/45% (+주문력 100당 4%) (+추가 마법 저항력 100당 8%) (+추가 체력 100당 1%)"],
    ["피해량: 75/115/155/195/235 (+주문력의 90%) ⇒ 90/130/170/210/250 (+주문력의 90%)"]],

    [["마법 피해량: 15~200 (레벨에 따라) (+공격력의 100%) (+주문력의 50%) (+추가 마법 저항력의 60%) ⇒ 15~115 (레벨에 따라) (+공격력의 100%) (+주문력의 40%) (+추가 마법 저항력의 60%)", "(신규) 갈리오의 스킬이 적 챔피언 또는 에픽 몬스터에게 적중하면 기본 지속 효과 - 석상의 강타 재사용 대기시간이 3초 감소합니다. 재사용 대기시간은 스킬 사용 한 번당 한 번만 감소합니다.", "(신규) 이제 기본 지속 효과 - 석상의 강타로 마법 아이템 효과가 발동됩니다.", "(신규) 이제 갈리오는 기본 지속 효과 - 석상의 강타를 사용할 수 있을 때 공격 속도가 40% 상승합니다.", "(삭제) 기본 지속 효과 - 석상의 강타는 더 이상 스킬 가속에 영향을 받지 않습니다."],
    ["마법 피해량: 70/105/140/175/210 (+주문력의 75%) ⇒ 70/105/140/175/210 (+주문력의 70%)", "재사용 대기시간: 12/11/10/9/8초 ⇒ 12/10.75/9.5/8.25/7초"],
    ["받는 마법 피해 감소량: 25/30/35/40/45% (+주문력 100당 5%) (+추가 마법 저항력 100당 12%) ⇒ 20/25/30/35/40% (+주문력 100당 4%) (+추가 마법 저항력 100당 8%) (+추가 체력 100당 1%)", "최소 마법 피해량: 20/35/50/65/80 (+주문력의 30%) ⇒ 20/30/40/50/60 (+주문력의 30%)"],
    ["마법 피해량: 90/130/170/210/250 (+주문력의 90%) ⇒ 75/115/155/195/235 (+주문력의 90%)", "챔피언이 아닌 대상 상대 피해 감소량: 50% ⇒ 20%"]],

    [["재사용 대기시간: 12/11.5/11/10.5/10초 ⇒ 12/11/10/9/8초"]],

    [["재사용 대기시간: 18/17.5/17/16.5/16초 ⇒ 18/17/16/15/14초", "비전투 시 보호막 생성 시간: 12초 ⇒ 12/11/8초 (1/6/11레벨)"]],

    [["재사용 대기시간: 200/180/160초 ⇒ 180/160/140초"]],

    [["받는 마법 피해 감소량: 20/25/30/35/40% (+추가 마법 저항력 100당 8%)(+주문력의 5%) ⇒ 25/30/35/40/45% (+추가 마법 저항력 100당 12%)(+주문력의 5%)", "받는 물리 피해 감소량: 10/12.5/15/17.5/20% (+추가 마법 저항력 100당 4%)(+주문력의 2.5%) ⇒ 12.5/15/17.5/20/22.5% (+추가 마법 저항력 100당 6%)(+주문력의 2.5%)"],
  ["재사용 대기시간: 12/11/10/9/8초 ⇒ 11/10/9/8/7초"]],

  [["소용돌이 0.5초당 피해량 대상 최대 체력의 2% (+주문력 100당 0.66%) ⇒ 대상 최대 체력의 2.5% (+주문력 100당 1%)", "소용돌이 총 피해량 (5초에 걸쳐) 대상 최대 체력의 8% (+주문력 100당 2.64%) ⇒ 대상 최대 체력의 10% (+주문력 100당 4%)"]],
  
  [["마법 피해 보호막 흡수량 최대 체력의 8/9.75/11.5/13.25/15% ⇒ 7.5/9/10.5/11/13.5%"]]];
}

//갱플랭크
class PatchContent_Gangplank{
  static List<String> BorNorM=["상향", "상향", "하향", "하향","조정","하향","상향","상향"];
  static List<String> patchVer=["13.19", "13.12", "13.5", "13.1B","12.14","12.10","12.7","12.1"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[12], PatchNoteLinkPlus.link[5], PatchNoteLink.link[1], PatchNoteLink.link[4],PatchNoteLink.link[15], PatchNoteLink.link[19],
  PatchNoteLink.link[22],PatchNoteLink.link[28]];
  static List<List<String>> Detail_Title =[
    ["R - 포탄 세례"],
    ["E - 화약통"],
    ["기본 지속 효과 - 불의 심판","E - 화약통"],
  ["기본 능력치","E - 화약통"],
  ["기본 능력치","기본 지속 효과 - 불의 심판","Q - 혀어어어업상", "E - 화약통"],
  ["W - 괴혈병"],
  ["기본 지속 효과 - 불의 심판", "W - 괴혈병 치료"],
  ["Q - 혀어어어업상"]];
  static List<List<List<String>>> Detail_Content =[
    [["재사용 대기시간: 180/160/140초 ⇒ 170/150/130초", "업그레이드 - 죽음의 여신 둔화율: 1초 동안 60% ⇒ 1초 동안 75%", "업그레이드 - 사기진작 이동 속도 증가: 2초 동안 30% ⇒ 2초 동안 40%"]],

    [["재충전 시간: 18초 (모든 스킬 레벨에서) ⇒ 18/17/16/15/14초"]],
    
    [["추가 고정 피해량: 55~310 (+추가 공격력의 100%) (+치명타 확률에 따라 0~200) ⇒ 50~250 (+추가 공격력의 100%) (+치명타 확률에 따라 0~200)"],
  ["(신규) 보이는 화약통: 이제 모든 플레이어가 갱플랭크의 마나 바 아래에서 E - 화약통 개수를 확인할 수 있습니다.", "화약통 충전 주기: 18/17/16/15/14초 ⇒ 18초 (모든 스킬 레벨에서)"]],

  [["공격력 증가량: 4 ⇒ 3.7"], 
  ["치명타 추가 피해량: 10% ⇒ 5%"]],

  [["기본 체력 640 ⇒ 600", "체력 증가량 104 ⇒ 114", "기본 방어력 35 ⇒ 31"],
  ["피해량 55~310 (레벨에 따라)(+추가 공격력의 100%) ⇒ 55~310 (레벨에 따라)(+추가 공격력의 100%)(+치명타 확률의 200%)"],
  ["기본 피해량 20/45/70/95/120 ⇒ 10/40/70/100/130"],
  ["둔화율 40/50/60/70/80% ⇒ 30/37.5/45/52.5/60% (+모든 스킬 레벨에서 치명타 확률 1%당 0.25%)", "추가 물리 피해량 80/105/130/155/180 ⇒ 75/105/135/165/195", "E - 화약통 치명타 발동 시 추가 피해량 25% ⇒ 10%"]],
  
  [["치료 체력 회복량 50/75/100/125/150 (+잃은 체력의 15%) ⇒ 45/70/95/120/145 (+잃은 체력의 13%)"]],
  
  [["불태우기 기본 피해량 55~225 (레벨에 따라) ⇒ 55~310 (레벨에 따라)"],
  ["마나 소모량 80/90/100/110/120 ⇒ 60/70/80/90/100"]],
  
  [["마나 소모량 60/55/50/45/40 ⇒ 55/50/45/40/35", "재사용 대기시간 5초 ⇒ 4.5초"]]];
}

//가렌
class PatchContent_Garen{
  static List<String> BorNorM=["상향", "상향","상향","하향"];
  static List<String> patchVer=["14.2", "13.8","12.19","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[1],PatchNoteLink.link[10], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ['W - 용기', "E - 심판"],
    ["기본 능력치"],
    ["E - 심판"],
  ["W - 용기"]];
  static List<List<List<String>>> Detail_Content =[
    [["피해량 30% 감소 지속시간: 2/2.75/3.5/4.25/5초 ⇒ 4초 (모든 스킬 레벨에서)"],
    ["회전당 피해량: 4/8/12/16/20 (+0~8.2(레벨에 따라)) (+공격력의 32/34/36/38/40%) ⇒ 4/8/12/16/20 (+0~8.2(레벨에 따라)) (+공격력의 36/37/38/39/40%)"]],

    [["기본 공격력: 66 ⇒ 69", "기본 방어력: 36 ⇒ 38"]],
    
    [["치명타 피해량: 58% (+추가 치명타 피해량 1%당 1%) ⇒ 75% (+추가 치명타 피해량 1%당 1%)"]],
  
  [["보호막 흡수량 70/95/120/145/170 (+추가 체력의 20%) ⇒ 65/85/105/125/145 (+추가 체력의 18%)"]]];
}

//나르
class PatchContent_Gnar{
  static List<String> BorNorM=["상향", "하향"];
  static List<String> patchVer=["13.17","12.14"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[10], PatchNoteLink.link[15]];
  static List<List<String>> Detail_Title =[
    ["Q - 돌덩이 던지기 (메가 나르)", "W - 쿵쾅 (메가 나르)"],
    ["기본 능력치"]];
  static List<List<List<String>>> Detail_Content =[
    [["물리 피해량: 25/70/115/160/205 (+공격력의 140%) ⇒ 45/90/135/180/225 (+공격력의 140%)"],
    ["물리 피해량: 25/55/85/115/145 (+공격력의 100%) ⇒45/75/105/135/165 (+공격력의 100%)"]],
    
    [["기본 체력 580 ⇒ 540", "체력 재생 증가량 1.75 ⇒ 1.25"]]];
}

//그라가스
class PatchContent_Gragas{
  static List<String> BorNorM=["하향", "상향", "상향", "조정", "하향", "상향","하향"];
  static List<String> patchVer=["14.6", "14.2", "13.24", "13.22", "13.12", "12.11","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[23],PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[17],PatchNoteLinkPlus.link[15], PatchNoteLinkPlus.link[5], PatchNoteLink.link[18], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "Q - 술통 굴리기"],
    ["기본 능력치", "R - 술통 폭발"],
    ["기본 지속 효과 - 서비스 시간"],
    ["E - 몸통 박치기", "R - 술통 폭발"],
    ["기본 지속 효과 - 서비스 시간", "Q - 술통 굴리기"],
    ["Q - 술통 굴리기","E - 몸통 박치기"],
  ["기본 지속 효과 - 서비스 시간"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 체력: 670 ⇒ 640"],
    ["마나 소모량: 80/75/70/65/60 ⇒ 80 (모든 스킬 레벨에서)"]],

    [["방어력 증가량: 4.8 ⇒ 5", "체력 증가량: 109 ⇒ 115"],
    ["재사용 대기시간: 120/100/80초 ⇒ 100/85/70초"]],

    [["재사용 대기시간: 12초 ⇒ 12/10/8/6초 (1/6/11/16레벨에서)"]],

    [["적중 시 돌려받는 재사용 대기시간: 3 ⇒ 남은 재사용 대기시간의 40%", "저희가 먼저 계산했습니다: 3 ⇒ 5.6/5.4/5.2/5/4.8, 스킬 가속 비례"],
    ["위치 도달 시간: 0.55초 ⇒ 0.5초"]],

    [["재사용 대기시간: 8초 ⇒ 12초"],
    ["마나 소모량: 80 ⇒ 80/75/70/65/60"]],
    
    [["피해량 80/120/160/200/240 (+주문력의 70%) ⇒ 80/120/160/200/240 (+주문력의 80%)", "재사용 대기시간 11/10/9/8/7초 ⇒ 10/9/8/7/6초"],
  ["재사용 대기시간 16/15/14/13/12초 ⇒ 14/13.5/13/12.5/12초"]],

  [["체력 회복량 최대 체력의 8% ⇒ 6.5%"]]];
}

//그레이브즈
class PatchContent_Graves{
  static List<String> BorNorM=["상향", "하향", "상향", "상향"];
  static List<String> patchVer=["14.8", "13.22", "13.7", "12.17"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[25], PatchNoteLinkPlus.link[15],PatchNoteLinkPlus.link[0], PatchNoteLink.link[12]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 새로운 운명"],
    ["E - 빨리 뽑기"],
    ["기본 지속 효과 - 새로운 운명","R - 무고한 희생자"],
  ["Q - 화약 역류","R - 무고한 희생자"]];
  static List<List<List<String>>> Detail_Content =[
    [["탄환당 치명타 계수: 40% ⇒ 45%", "공격 속도 증가량: 2.6% ⇒ 3.0%"]],

    [["중첩당 추가 방어력: 4/7/10/13/16 ⇒ 2/5/8/11/14"]],
    
    [["탄환당 치명타 추가 피해: 20% ⇒ 30%"],
  ["재사용 대기시간: 120/90/60초 ⇒ 100/80/60초"]],
  
  [["재사용 대기시간 12/11/10/9/8초 ⇒ 13/11.5/10/8.5/7초"],
  ["피해량 250/400/550 (+추가 공격력의 150%) ⇒ 275/425/575 (+추가 공격력의 150%)"]]];
}

//그웬
class PatchContent_Gwen{
  static List<String> BorNorM=["상향", "하향", "상향", "상향", "상향","하향","조정","하향","하향","상향","하향"];
  static List<String> patchVer=["14.2", "14.1","13.18", "13.15", "12.20","12.15","12.13","12.11","12.10","12.7","12.5"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[11],PatchNoteLinkPlus.link[8], PatchNoteLink.link[9],PatchNoteLink.link[14],PatchNoteLink.link[16],PatchNoteLink.link[18]
  , PatchNoteLink.link[19],PatchNoteLink.link[22],PatchNoteLink.link[24]];
  static List<List<String>> Detail_Title =[
    ['기본 지속 효과 - 가위 난도질'],
    ["기본 지속 효과 - 가위 난도질"],
    ["기본 능력치", "기본 지속 효과 - 가위 난도질"],
  ["기본 능력치","W - 신성한 안개"],
  ["Q - 싹둑싹둑!"],
  ["Q - 싹둑싹둑!"],
  ["기본 능력치", "기본 지속 효과 - 가위 난도질", "Q - 싹둑싹둑!", "W - 신성한 안개","E - 돌격가위", "R - 바느질"],
  ["W - 신성한 안개", "E - 돌격가위"],
  ["기본 지속 효과 - 가위 난도질"],
  ["E - 돌격가위", "R - 바느질"],
  ["기본 지속 효과 - 가위 난도질", "E - 돌격가위"]];
  static List<List<List<String>>> Detail_Content =[
    [["피해량: 대상 최대 체력의 1% (+주문력 100당 0.65%) ⇒ 대상 최대 체력의 1% (+주문력 100당 0.72%)"]],

    [["피해량: 대상 최대 체력의 1% (+주문력 100당 0.8%) ⇒ 대상 최대 체력의 1% (+주문력 100당 0.65%)"]],

    [["체력 증가량: 109 ⇒ 115"],
    ["몬스터 대상 마법 피해량: 6 (+주문력의 10%) ⇒ 10 (+주문력의 15%)"]],

  [["5초당 기본 체력 재생: 8.5 ⇒ 9"],
  ["추가 방어력 및 마법 저항력: 17/19/21/23/25 (+주문력의 7%) ⇒ 22/24/26/28/30 (+주문력의 7%)"]],

  [["가위질당 피해량: 10/14/18/22/26 (+주문력의 5%) ⇒ 10/15/20/25/30 (+주문력의 5%)", "마지막 가위질 피해량: 60/80/100/120/140 (+주문력의 35%) ⇒ 60/85/110/135/160 (+주문력의 35%)"]],
  
  [["중앙 지점 고정 피해 입힌 피해의 75% ⇒ 50%를 고정 피해로 변환"]],
  
  [["기본 체력 660 ⇒ 620","체력 재생 증가량 5초당 0.55 ⇒ 5초당 0.9"],
  ["몬스터 대상 최대 피해량 10 (+주문력의 15%) ⇒ 6 (+주문력의 10%)", "챔피언 대상 체력 회복량 입힌 피해의 60% ⇒ 입힌 피해의 50%"],
  ["가위질 횟수당 피해량 9/12/15/16/21 (+주문력의 5%) ⇒ 10/14/18/22/26 (+주문력의 5%)", "마지막 가위질 피해량 45/60/75/90/105 (+주문력의 25%) ⇒ 60/80/100/120/140 (+주문력의 35%)", "가위질 중앙 지점 100% 고정 피해 ⇒ 75% 고정 피해", "(신규) 튼튼한 미니언 이제 체력이 20% 이상인 미니언에게 75%의 피해를 입힙니다.", "(신규) 말랑한 미니언 체력이 20% 미만인 미니언에게는 1,000%의 추가 피해를 입힙니다."],
  ["추가 방어력 및 마법 저항력 12/14/16/18/20 (+주문력의 5%) ⇒ 17/19/21/23/25 (+주문력의 7%)", "지속시간 5초 ⇒ 4초"],
  ["적중 시 추가 마법 피해량 10 (+주문력의 15%) ⇒ 15 (+주문력의 20%)", "추가 사거리 50 ⇒ 75", "재사용 대기시간 13/12/11/10/9초 ⇒ 13/12.5/12/11.5/11초", "첫 기본 공격 적중 시 재사용 대기시간 반환율 50% ⇒ 25/35/45/55/65%"],
  ["재사용 대기시간 100/90/80초 ⇒ 120/100/80초","바늘당 피해량 30/55/80 (+주문력의 8%) ⇒ 35/65/95 (+주문력의 10%)", "새로운 방식 적에게 피해를 입히면 재사용 활성화 ⇒ 1초 후 재사용 활성화"]],
  
  [["안개 속 추가 방어력 및 마법 저항력 20 (+주문력의 5%) ⇒ 12/14/16/18/20 (+주문력의 5%)", "재사용 대기시간 22/20/18/16/14초 ⇒ 22/21/20/19/18초"],
  ["첫 기본 공격 적중 시 재사용 대기시간 반환 60% ⇒ 50%"]],
  
  [["챔피언 대상 체력 회복량 입힌 피해의 70% ⇒ 60%", "챔피언 대상 최대 체력 회복량 12~30 (레벨에 따라) (+주문력의 7%) ⇒ 10~25 (레벨에 따라) (+주문력의 6.5%)"]],
  
  [["첫 번째 기본 공격 시 재사용 대기시간 반환 50% ⇒ 60%"],
  ["재사용 대기시간 120/100/80초 ⇒ 100/90/80초"]],
  
  [["몬스터 대상 최대 피해량 10 (+주문력의 25%) ⇒ 10 (+주문력의 15%)"],
  ["추가 공격 사거리 100 ⇒ 50"]]];
}

//헤카림
class PatchContent_Hecarim{
  static List<String> BorNorM=["상향","조정", "하향", "하향", "하향","조정","상향","하향"];
  static List<String> patchVer=["13.21", "13.17", "13.14", "12.23","12.18","12.17","12.9","12.6"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[14], PatchNoteLinkPlus.link[10], PatchNoteLinkPlus.link[7], PatchNoteLink.link[6],PatchNoteLink.link[11],PatchNoteLink.link[12],PatchNoteLink.link[20],
  PatchNoteLink.link[23]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "W - 공포의 망령"],
    ["기본 능력치", "Q - 회오리 베기","W - 공포의 망령"],
    ["W - 공포의 망령"],
    ["Q - 회오리 베기"],
  ["기본 능력치","Q - 회오리 베기","W - 공포의 망령"],
  ["기본 능력치","Q - 회오리 베기","W - 공포의 망령", "E - 파멸의 돌격","R - 그림자의 맹습"],
  ["Q - 회오리 베기","W - 공포의 망령"],
  ["Q - 회오리 베기", "E - 파멸의 돌격"]];
  static List<List<List<String>>> Detail_Content =[
    [["공격력 증가량: 3.2 ⇒ 3.7"],
    ["지속시간: 4초 ⇒ 5초"]],

    [["기본 마나: 277 ⇒ 280", "마나 증가량: 60 ⇒ 40", "기본 마나 재생: 6.5 ⇒ 7", "마나 재생 증가량: 0.6 ⇒ 0.8"],
    ["마나 소모량: 30 (모든 스킬 레벨에서) ⇒ 28/26/24/22/20"],
    ["마나 소모량: 50/60/70/80/90 ⇒ 50/55/60/65/70", "모든 피해 흡혈: 입힌 피해량의 25% (+추가 공격력 100당 2%) ⇒ 입힌 피해량의 20% (참고: 피해는 여전히 감소 후 피해량으로 계산됩니다.)"]],

    [["추가 방어력 및 마법 저항력: 15/20/25/30/35 ⇒ 5/10/15/20/25"]],
    
    [["중첩당 추가 피해량: 4% (+추가 공격력 100당 5%) ⇒ 3% (+추가 공격력 100당 4%)"]],
  
  [["기본 체력 650 ⇒ 625"],
  ["물리 피해량 추가 공격력 계수 95% ⇒ 90%","중첩당 증가하는 피해량 4% (+추가 공격력 100당 6%) ⇒ 4% (+추가 공격력 100당 5%)"],
  ["감소된 피해량 비례 체력 회복량 30% (+추가 공격력 100당 2.5%) ⇒ 25% (+추가 공격력 100당 2%) (참고: 헤카림을 제외한 아군이 입힌 피해에는 절반의 수치가 적용됩니다.)"]],
  
  [["기본 방어력 35 ⇒ 32", "체력 증가량 104 ⇒ 99"],
  ["피해량 60/90/120/150/180 (+추가 공격력의 90%) ⇒ 60/85/110/135/160 (+추가 공격력의 95%)", "중첩당 피해량 2% (+추가 공격력 100당 3%) ⇒ 4% (+추가 공격력 100당 6%)", "중첩당 재사용 대기시간 감소 1초 ⇒ 0.75초", "최대 중첩 2 ⇒ 3", "중첩 해제 지속시간 종료 시 모든 중첩 해제 ⇒ 지속시간 종료 시 1초마다 1중첩씩 해제", "마나 소모량 28/31/34/37/40 ⇒ 30"],
  ["재사용 대기시간 14초 ⇒ 16/15.5/15/14.5/14초", "(신규) 무장한 기병대 공포의 망령이 활성화된 동안 헤카림이 15/20/25/30/35의 방어력 및 마법 저항력을 얻습니다."],
  ["최소 피해량 30/45/60/75/90 (+추가 공격력의 55%) ⇒ 30/45/60/75/90 (+추가 공격력의 50%)", "최대 피해량 60/90/120/150/180 (+추가 공격력의 110%) ⇒ 60/90/120/150/180 (+추가 공격력의 100%)", "최소 밀어내기 거리 250 ⇒ 150", "최대 밀어내기 거리 450 ⇒ 350", "재사용 대기시간 20/19/18/17/16초 ⇒ 18초 (모든 스킬 레벨에서)"],
  ["공포 지속시간 0.75~2초 (이동한 거리에 비례) ⇒ 0.75~1.5초 (이동한 거리에 비례)"]],
  
  [["물리 피해량 60/90/120/150/180 (+추가 공격력의 85%) ⇒ 60/90/120/150/180 (+추가 공격력의 90%)"],
  ["재사용 대기시간 18초 ⇒ 14초"]],
  
  [["기본 피해량 60/97/134/171/208 (+추가 공격력의 85%) ⇒ 60/90/120/150/180 (+추가 공격력의 85%)"],
  ["최소 피해량 30/50/70/90/110 (+추가 공격력의 55%) ⇒ 30/45/60/75/90 (+추가 공격력의 55%)", "최대 피해량 60/100/140/180/220 (+추가 공격력의 110%) ⇒ 60/90/120/150/180 (+추가 공격력의 110%)"]]];
}

//하이머딩거
class PatchContent_Heimerdinger{
  static List<String> BorNorM=["조정", "하향","상향"];
  static List<String> patchVer=["13.15", "13.1B","12.12"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[8],PatchNoteLink.link[4],PatchNoteLink.link[17]];
  static List<List<String>> Detail_Title =[
    ["R - H-28Q 최첨단 포탑"],
    ["Q - H-28G 진화형 포탑","W - 마법공학 초소형 로켓"],
  ["Q - H-28G 진화형 포탑","E - CH-2 전자폭풍 수류탄"]];
  static List<List<List<String>>> Detail_Content =[
  [["포탑 체력: 850~1,450 (레벨에 따라) (+주문력의 25~200% (레벨에 따라)) ⇒ 725~1,525 (레벨에 따라) (+주문력의 50%)", "포탑 방어력: 10~80 (레벨에 따라) ⇒ 30~90 (레벨에 따라)", "포탑 마법 저항력: 25~65 (레벨에 따라) ⇒ 30~90 (레벨에 따라)"]],

    [["포탑 체력: 175~700 (레벨에 따라) (+주문력의 5%~40% (레벨에 따라)) ⇒ 130~640 (레벨에 따라) (+주문력의 5%~45% (레벨에 따라))"],
  ["첫 번째 로켓의 마법 피해량: 50/75/100/125/150 (+주문력의 45%) ⇒ 40/65/90/115/140 (+주문력의 55%)"]],
  
  [["일반 포탑 - 체력 150~575 (+주문력의 5~40%) (레벨에 따라) ⇒ 175~700 (+주문력의 5~40%) (레벨에 따라)", "일반 포탑 - 마법 피해량 6/9/12/15/18 (+주문력의 35%) ⇒ 7/11/15/19/23 (+주문력의 35%)"],
  ["재사용 대기시간 12초 ⇒ 11초"]]];
}

//흐웨이 14.1 합류
class PatchContent_Hwei{
  static List<String> BorNorM=["상향", "상향", "상향"];
  static List<String> patchVer=["14.8", "14.2", "14.1"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[25], PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[18]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 몽상가의 서명"],
      ["E - 주제: 고통", "EQ - 암울한 형상"],
      ["기본 능력치", "QQ - 파멸의 화염", "EQ - 암울한 형상/EW - 심연의 응시/EE - 파괴의 아귀", "R - 절망의 소용돌이 "],
    ];
  static List<List<List<String>>> Detail_Content =[
    [["추가 마법 피해량: 35~180 (레벨에 따라) (+주문력의 30%) ⇒ 35~180 (레벨에 따라) (+주문력의 35%)"]],

    [["재사용 대기시간: 15/14/13/12/11초 ⇒ 12/11.5/11/10.5/10초"],
    ["도망 지속시간: 1초 (모든 스킬 레벨에서) ⇒ 1/1.125/1.25/1.375/1.5초"]],

    [["기본 방어력: 18 ⇒ 21", "체력 증가량: 104 ⇒ 109"],
    ["피해량: 60/90/120/150/180 (+주문력의 70%) (+대상 최대 체력의 4/5/6/7/8%) ⇒ 60/90/120/150/180 (+주문력의 75%) (+대상 최대 체력의 4/5/6/7/8%)"],
    ["피해량: 60/90/120/150/180 (+주문력의 60%) ⇒ 70/110/150/190/230 (+주문력의 60%)"],
    ["투사체 폭: 80 ⇒ 90"]],
  ];
}

//일라오이
class PatchContent_Illaoi{
  static List<String> BorNorM=["하향", "조정", "상향", "하향","조정","상향"];
  static List<String> patchVer=["14.4", "14.3", "14.2", "12.10","12.6","12.4"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[21], PatchNoteLinkPlus.link[20], PatchNoteLinkPlus.link[18], PatchNoteLink.link[19],PatchNoteLink.link[23],PatchNoteLink.link[25]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 고대신의 예언자"],
    ["기본 지속 효과 - 고대신의 예언자"],
    ["기본 능력치", "기본 지속 효과 - 고대신의 예언자"],
    ["기본 지속 효과 - 고대신의 예언자"],
  ["R - 믿음의 도약"],
  ["기본 능력치","W - 혹독한 가르침"]];
  static List<List<List<String>>> Detail_Content =[
    [["피해량: 9~162 (레벨에 따라) (+총공격력의 115%) ⇒ 9~162 (레벨에 따라) (+총공격력의 100%)"]],

    [["촉수 사거리: 800 ⇒ 925", "촉수 피해량: 10~180 (레벨에 따라) (+공격력의 120%) (+주문력의 40%) ⇒ 9~162 (레벨에 따라) (+공격력의 115%) (+주문력의 40%)"]],

    [["기본 마나: 300 ⇒ 350", "마나 증가량: 50 ⇒ 60", "체력 증가량: 109 ⇒ 115"],
    ["촉수 적중당 잃은 체력 회복량: 잃은 체력의 4.5% ⇒ 잃은 체력의 5%"]],
    
    [["체력 회복량 촉수가 적 챔피언에게 적중 시 잃은 체력의 5% ⇒ 4.5%"]],

  [["날 봐라 이제 R - 믿음의 도약을 사용하면 일라오이가 마우스 커서를 바라보며 더 유리한 위치에 촉수가 생성됩니다."]],

  [["공격 속도 0.571 ⇒ 0.625"],
  ["추가 물리 피해량 대상 최대 체력의 3/3.5/4/4.5/5% (+공격력 100당 2%) ⇒ 대상 최대 체력의 3/3.5/4/4.5/5% (+공격력 100당 4%)"]]];
}

//이렐리아
class PatchContent_Irelia{
  static List<String> BorNorM=["상향", "상향","상향","하향"];
  static List<String> patchVer=["13.18", "12.16","12.11","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[11],PatchNoteLink.link[13],PatchNoteLink.link[18], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["R - 선봉진격검"],
    ["기본 능력치"],
  ["Q - 칼날 쇄도","E - 쌍검협무"],
  ["Q - 칼날 쇄도"]];
  static List<List<List<String>>> Detail_Content =[
    [["재사용 대기시간: 140/120/100초 ⇒ 125/105/85초"]],
    
    [["기본 마법 저항력 28 ⇒ 30","방어력 증가량 4.2 ⇒ 4.7"]],
  
  [["체력 회복량 공격력의 7/8/9/10/11% ⇒ 공격력의 9/10/11/12/13%"],
  ["재사용 대기시간 18/16.5/15/13.5/12초 ⇒ 16/15/14/13/12초"]],
  
  [["체력 회복량 공격력의 8/10/12/14/16% ⇒ 공격력의 7/8/9/10/11%"]]];
}

//아이번
class PatchContent_Ivern{
  static List<String> BorNorM=["하향", "하향", "하향", "상향", "상향","상향","하향"];
  static List<String> patchVer=["13.24", "13.14", "13.13", "13.11","12.22","12.12","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[17],PatchNoteLinkPlus.link[8], PatchNoteLinkPlus.link[6], PatchNoteLinkPlus.link[4], PatchNoteLink.link[7],
  PatchNoteLink.link[17], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "E - 보호의 씨앗"],
  ["기본 능력치", "W - 수풀 가꾸기", "E - 보호의 씨앗", "R - 데이지!"],
    ["W - 수풀 가꾸기", "R - 데이지!"],
    ["Q - 덩굴뿌리", "W - 수풀 가꾸기", "E - 보호의 씨앗", "R - 데이지!"],
    ["기본 지속 효과"],
  ["기본 지속 효과 - 숲의 친구", "E - 보호의 씨앗", "R - 데이지!"],
  ["E - 보호의 씨앗"]];

  static List<List<List<String>>> Detail_Content =[
    [["기본 체력: 655 ⇒ 630"],
    ["둔화율: 50/55/60/65/70% ⇒ 45/50/55/60/65%"]],

  [["마법 저항력: 32 (+레벨당 2.05) ⇒ 30 (+레벨당 1.3) (참고: 이는 다른 원거리 챔피언 기준 일반적인 수치입니다.)"],
  ["아군 적중 시 피해량: 5/7.5/10/12.5/15 (+아이번 주문력의 10%) ⇒ 10/15/20/25/30 (+아이번 주문력의 10%)"],
  ["보호막 흡수량: 80/115/150/185/220 (+주문력의 75%) ⇒ 85/125/165/205/245 (+주문력의 50%) (참고: 이는 아이번의 주문력이 20/40/60/80/100이 되기 전까지는 상향입니다.)"],
  ["지속시간: 60초 ⇒ 45초", "방어력 및 마법 저항력: 20/50/100 (+주문력의 5%) ⇒ 30~90 (6~18레벨에서)", "체력: 1,300/2,600/3,900 (+주문력의 50%) ⇒ 1,000~4,400 (6~18레벨에서, 비선형적으로 증가) (+주문력의 50%) (참고: 이는 약 5%의 내구력 감소입니다.)", "데이지 공격력: 70/100/130 (+주문력의 30%) ⇒ 70/100/130 (+주문력의 15%) (참고: 마지막 충격파의 피해량은 전과 동일합니다.)"]],


    [["적중 시 추가 마법 피해: 30/37.5/45/52.5/60 (+주문력의 30%) ⇒ 20/27.5/35/42.5/50 (+주문력의 20%)"],
    ["데이지 기본 이동 속도: 440 ⇒ 430", "데이지, 후려쳐! 기본 피해량: 40/60/80 ⇒ 20/40/60"]],

    [["기쁨의 도약!: 이제 아이번이 Q - 덩굴뿌리를 재사용하여 대상 위치로 돌진할 수 있습니다. 아이번 및 아군은 공격 명령을 사용하여 대상에게서 공격 사거리만큼 떨어진 위치로 돌진할 수 있습니다.", "스킬 사거리: 1,100 ⇒ 1,150", "에픽 몬스터를 제외한 몬스터 변경사항: Q - 덩굴뿌리를 에픽 몬스터를 제외한 몬스터에게 사용하면 이제 재사용 대기시간이 50% 감소합니다."],
    ["죽음의 수풀 재조명: 수풀 밖으로 이동 후 3초간 지속되는 수풀 가꾸기의 기본 지속 효과 추가 마법 피해가 이제 아군 챔피언에게 적용됩니다.", "아군 적중 시 피해량: 5/7.5/10/12.5/15 (+아이번 주문력의 10%)", "수풀 생성 시 시야 지속시간: 3초 ⇒ 8초", "수풀 지속시간: 30초 ⇒ 최대 45초 또는 아군이 해당 수풀 안의 시야를 잃을 때까지", "여길 좀 봐!: W - 수풀 가꾸기로 강화된 기본 공격에 이제 적중 시 피해를 나타내는 특별한 시각 효과가 적용됩니다."],
    ["변경: 보호막 폭발 시 적에게 적중하지 않고 보호막 흡수량이 남아 있으면 보호막 지속시간이 초기화됩니다."],
    ["데이지 공격 사거리: 125 ⇒ 175", "데이지 체력 재생: 0 ⇒ 초당 2.5", "데이지 이동 속도: 420 ⇒ 440", "데이지 공격 속도: 0.7 ⇒ 0.75", "데이지 추가 공격 속도: 30/50/70 ⇒ 30/45/60", "데이지, 후려쳐! 피해량: 데이지 공격력의 100% (+주문력의 20%) ⇒ 40/60/80 (+데이지 공격력의 100%) (+주문력의 20%)"]],
    
    [["숲의 친구 체력 소모량: 131~70 (레벨에 따라) ⇒ 98~0 (레벨에 따라)", "숲의 친구 마나 소모량: 135~66 (레벨에 따라) ⇒ 90~0 (레벨에 따라)"]],
  
  [["기본 체력 소모량 23.5~6.5% (레벨에 따라) ⇒ 20~3% (레벨에 따라)", "기본 마나 소모량 34.5~9% (레벨에 따라) ⇒ 30~4.5% (레벨에 따라)"],
  ["보호막 흡수량 70/100/130/160/190 (+주문력의 75%) ⇒ 80/115/150/185/220 (+주문력의 75%)"],
  ["데이지 - 체력 1,250/2,500/3,750 (+주문력의 50%) ⇒ 1,300/2,600/3,900 (+주문력의 50%)", "데이지 - 방어력 및 마법 저항력 15/40/90 (+주문력의 5%) ⇒ 20/50/100 (+주문력의 5%)"]],
  
  [["보호막 흡수량 80/115/150/185/220 (+주문력의 80%) ⇒ 70/100/130/160/190 (+주문력의 75%)"]]];
}

//잔나
class PatchContent_Janna{
  static List<String> BorNorM=["상향", "조정", "상향","하향", "조정","하향","하향","하향","조정"];
  static List<String> patchVer=["13.23", "13.22", "13.8","12.23", "12.14","12.12","12.10","12.3","12.2"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[16],PatchNoteLinkPlus.link[15],PatchNoteLinkPlus.link[1],PatchNoteLink.link[6], PatchNoteLink.link[15],
  PatchNoteLink.link[17], 
  PatchNoteLink.link[19],  PatchNoteLink.link[26], PatchNoteLink.link[27]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 순풍", "W - 서풍", "R - 계절풍"],
    ["기본 능력치", "기본 지속 효과 - 순풍", "Q - 울부짖는 돌풍", "W - 서풍", "E - 폭풍의 눈"],
    ["W - 서풍","E - 폭풍의 눈"],
    ["기본 지속 효과","E - 폭풍의 눈"],
  ["E - 폭풍의 눈", "R - 계절풍"],
  ["W - 서풍", "E - 폭풍의 눈"],
  ["E - 폭풍의 눈", "R - 계절풍 초당"],
  ["기본 능력치", "W - 서풍", "E - 폭풍의 눈"],
  ["기본 능력치", "기본 지속 효과 - 순풍", "Q - 울부짖는 돌풍", "W - 서풍","E - 폭풍의 눈", "R - 계절풍"]];

  static List<List<List<String>>> Detail_Content =[
    [["추가 이동 속도 계수: 20/25/30/35% ⇒ 30%"],
    ["재사용 대기시간: 9/8.5/8/7.5/7초 ⇒ 8/7.5/7/6.5/6초", "대상 지정 방식: 사거리 650, 중심에서 중심으로 ⇒ 사거리 550, 끝에서 끝으로(참고: 이제 크기가 작은 대상의 경우에는 전과 동일하지만, 큰 대상에게는 W - 서풍을 더 쉽게 적중시킬 수 있을 것입니다.)"],
    ["재사용 대기시간: 150/135/120초 ⇒ 130/115/100초"]],

    [["공격 사거리: 500 ⇒ 550", "기본 마나: 350 ⇒ 360", "마나 증가량: 64 ⇒ 50", "체력 증가량: 84 ⇒ 90", "방어력 증가량: 5 ⇒ 4.5", "기본 공격력: 52 ⇒ 47", "공격력 증가량: 3 ⇒ 2.5", "공격 준비 시간: 22% ⇒ 20%"],
    ["(삭제) 잔나는 더 이상 아군 챔피언을 향할 때 추가 이동 속도를 얻지 않습니다.", "(신규) 잔나가 기본 공격 또는 W - 서풍 사용 시 추가 이동 속도의 20/25/30/35% (1/6/11/16레벨에서)에 해당하는 추가 마법 피해를 입힙니다."],
    ["마나 소모량: 60/70/80/90/100 ⇒ 90/95/100/105/110", "재사용 대기시간: 12 ⇒ 14", "최소 피해량: 60/85/110/135/160 (+주문력의 35%) ⇒ 55/90/125/160/195 (+주문력의 50%)", "최대 추가 피해량: 45/60/75/90/105 (+주문력의 30%) ⇒ 30/45/60/75/90 (+주문력의 30%)"],
    ["재사용 대기시간: 12 ⇒ 9/8.5/8/7.5/7", "마나: 50/60/70/80/90 ⇒ 50/55/60/65/70", "피해량: 80/110/140/170/200 (+주문력의 60%) ⇒ 55/90/125/160/195 (+주문력의 60%) (+순풍 추가 피해량)", "둔화 지속시간: 3초 ⇒ 2초", "(신규) 서풍의 기본 지속 효과 이동 속도가 더 이상 재사용 대기 중일 때 없어지지 않습니다."],
    ["재사용 대기시간: 15/13.5/12/10.5/9 ⇒ 16/15/14/13/12", "마나: 70/80/90/100/110 ⇒ 70/75/80/85/90", "보호막 흡수량: 75/100/125/150/175 (+주문력의 55%) ⇒ 80/115/150/185/220 (+주문력의 55%)", "보호막 지속시간: 5초 ⇒ 4초", "(삭제) 보호막이 더 이상 시간이 지나면서 감소하지 않습니다.", "(삭제) 이제 잔나가 군중 제어 효과를 걸 경우 체력 회복 및 보호막 효과가 증가하지 않습니다.", "(신규) 둔화 및 공중 띄울 경우 남은 재사용 대기시간의 20%가 감소합니다. 주문당 최대 한 번 효과가 적용됩니다."]],

    [["마법 피해량: 70/100/130/160/190 (+주문력의 50%) ⇒ 80/110/140/170/200 (+주문력의 60%)"],
    ["보호막 감소 시작 시간: 1.25초 ⇒ 2.5초"]],
    
    [["순풍 추가 이동 속도: 8% ⇒ 6%"],
  ["추가 공격력: 10/17.5/25/32.5/40 (+주문력의 10%) ⇒ 10/15/20/25/30 (+주문력의 10%)"]],
  
  [["보호막 흡수량 65/90/115/140/165 ⇒ 75/100/125/150/175", "추가 체력 회복 및 보호막 흡수량 20% ⇒ 15%"],
  ["초당 체력 회복량 90/145/200 (+주문력의 45%) ⇒ 100/150/200 (+주문력의 50%)"]],

  [["추가 이동 속도 6/7.5/9/10.5/12% (+주문력 100당 2%) ⇒ 6/7/8/9/10% (+주문력 100당 2%)", "둔화율 24/28/32/36/40% (+주문력 100당 6%) ⇒ 20/24/28/32/36% (+주문력 100당 6%)"],
  ["보호막 흡수량 75/100/125/150/175 (+주문력의 60%) ⇒ 65/90/115/140/165 (+주문력의 55%)"]],
  
  [["보호막 흡수량 80/110/140/179/200 (+주문력의 65%) ⇒ 75/100/125/150/175 (+주문력의 60%)"],
  ["체력 회복량 100/150/200 (+주문력의 50%) ⇒ 90/145/200 (+주문력의 45%)"]],
  
  [["기본 이동 속도 330 ⇒ 325"],
  ["기본 추가 이동 속도 8/9/10/11/12% ⇒ 6/7.5/9/10.5/12%"],
  ["강화된 회복 및 보호막 효과 지속시간 5초 ⇒ 4초 (최소 1명의 적을 둔화시키거나 공중으로 띄운 후)"]],
  
  [["이동 속도 315 ⇒ 330", "기본 공격력 46~71.5 ⇒ 52~103", "공격력 증가량 1.5 ⇒ 3", "기본 공격 사거리 550 ⇒ 500"],
  ["순풍 잔나가 아군 챔피언을 향할 때에만 추가 이동 속도가 8% 증가합니다. (아군 챔피언이 잔나를 향할 때의 이동 속도 증가 효과는 전과 동일)", "(삭제) 빠르고 매섭게 이제 잔나의 기본 공격 및 W - 서풍이 잔나의 추가 이동 속도에 비례한 추가 마법 피해를 입히지 않습니다."],
  ["마나 소모량 60/90/100/120/140 ⇒ 60/70/80/90/100", "최소 사거리 1,000 ⇒ 1,100", "최대 사거리 1,750 ⇒ 1,760", "돌풍 이동 속도 1.5초 ⇒ 1.25초"],
  ["사거리 550 (외곽 기준) ⇒ 650 (중심 기준)", "둔화 지속시간 2초 ⇒ 3초", "재사용 대기시간 8/7.5/7/6.5/6초 ⇒ 12초 (모든 스킬 레벨에서)", "기본 피해량 55/85/115/145/175 ⇒ 70/100/130/160/190", "추가 이동 속도 6/7/8/9/10% ⇒ 8/9/10/11/12%"],
  ["화창한 날씨 고유 - 잔나가 스킬로 최소 한 명의 적 챔피언을 둔화시키거나 공중에 띄우면 E - 폭풍의 눈 재사용 대기시간이 20% 감소합니다. ⇒ 5초 동안 잔나의 회복 및 보호막 효과가 +20% 증가합니다.", "보호막 흡수량 80/115/150/185/220 (+주문력의 70%) ⇒ 80/110/140/170/200 (+주문력의 65%)", "재사용 대기시간 16/15/14/13/12초 ⇒ 15/13.5/12/10.5/9초", "보호막 감소 시작 시간 0.75초 ⇒ 1.25초"],
  ["회복 주기 0.5초 ⇒ 0.25초 (총 회복량 전과 동일)"]]];
}

//자르반
class PatchContent_JarvanIV{
  static List<String> BorNorM=["상향", "상향", "하향", "하향","하향", "하향", "상향","상향","상향","하향"];
  static List<String> patchVer=["14.8", "14.5", "13.23", "13.18", "13.8","13.4","13.3","12.14","12.12","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[25], PatchNoteLinkPlus.link[22],PatchNoteLinkPlus.link[16],PatchNoteLinkPlus.link[11],PatchNoteLinkPlus.link[1],PatchNoteLink.link[2],PatchNoteLink.link[3],PatchNoteLink.link[15],PatchNoteLink.link[17]
  , PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 전장의 군가"],
    ["기본 능력치", "Q - 용의 일격"],
    ["Q - 용의 일격"],
    ["기본 지속 효과 - 전장의 군가"],
    ["기본 능력치","Q - 용의 일격"],
    ["W - 황금빛 방패"],
  ["기본 능렻기", "W - 황금빛 방패"],
  ["Q - 용의 일격","E - 데마시아의 깃발"],
  ["기본 능력치","기본 지속 효과 - 전장의 군가"],
  ["W - 황금빛 방패"]];
  static List<List<List<String>>> Detail_Content =[
    [["추가 물리 피해량: 대상 현재 체력의 6% ⇒ 대상 현재 체력의 7%"]],

    [["방어력 증가량: 4.8 ⇒ 5.2"],
    ["재사용 대기시간: 10/9.5/9/8.5/8초 ⇒ 10/9/8/7/6초"]],

    [["재사용 대기시간: 10/9/8/7/6초 ⇒ 10/9.5/9/8.5/8초"]],

    [["기본 공격 시 추가 물리 피해량: 대상 현재 체력의 8% ⇒ 대상 현재 체력의 6%"]],

    [["공격력 증가량: 3.4 ⇒ 3"],
    ["물리 피해량: 90/130/170/210/250 (+추가 공격력의 140%) ⇒ 80/120/160/200/240 (+추가 공격력의 140%)"]],

    [["재사용 대기시간: 8초 ⇒ 9초", "보호막 흡수량: 60/80/100/120/140 (+추가 공격력의 80%) ⇒ 60/80/100/120/140 (+추가 공격력의 70%)"]],
  
  [["기본 방어력: 34 ⇒ 36"],
  ["재사용 대기시간: 9초 ⇒ 8초", "보호막 흡수량: 60/80/100/120/140 ⇒ 60/80/100/120/140 (+추가 공격력의 80%)", "보호막 지속시간: 5초 ⇒ 4초"]],

  [["피해량 90/130/170/210/250 (+추가 공격력의 120%) ⇒ 90/130/170/210/250 (+추가 공격력의 140%)"],
  ["재사용 대기시간 12초 ⇒ 12/11.5/11/10.5/10초"]],
  
  [["마나 증가량 40 ⇒ 55", "18레벨 마나 980 ⇒ 1,235"],
  ["재사용 대기시간 6초 ⇒ 6/5/4/3초 (1/6/11/16레벨에서)"]],
  
  [["기본 보호막 흡수량 60/85/110/135/160 ⇒ 60/80/100/120/140", "추가 보호막 흡수량 적중한 적 챔피언 하나당 최대 체력의 1.5% ⇒ 1.3%"]]];
}

//잭스
class PatchContent_Jax{
  static List<String> BorNorM=["하향", "하향","하향","조정","상향"];
  static List<String> patchVer=["14.2","13.14", "13.4","13.1","12.6"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[7], PatchNoteLink.link[2],PatchNoteLink.link[5],PatchNoteLink.link[23]];
  static List<List<String>> Detail_Title =[
    ["E - 반격"],
    ["E - 반격", "R - 무기의 달인"],
    ["기본 능력치","E - 반격","R - 무기의 달인"],
  ["Q - 도약 공격","E - 반격","R - 달인의 저력","기타"],
  ["기본 능력치", "W - 무기 강화"]];
  static List<List<List<String>>> Detail_Content =[
    [["최소 피해량: 55/85/115/145/175 (+주문력의 70%) (+대상 최대 체력의 4%) ⇒ 40/70/100/130/160 (+주문력의 70%) (+대상 최대 체력의 3.5%) (참고: 여전히 최대 피해량은 최소 피해량의 두 배입니다.)"]],

    [["재사용 대기시간: 14/12.5/11/9.5/8초 ⇒ 15/13.5/12/10.5/9초"],
    ["마나 소모량: 50 ⇒ 100"]],
    
    [["기본 체력: 685 ⇒ 665", "체력 증가량: 99 ⇒ 100"],
  ["(신규) 공격은 최고의 방어!: 이제 기본 공격을 회피하면 E - 반격의 기본 피해량 대신 전체 피해량이 증가합니다.", "최소 마법 피해량: 55/85/115/145/175 (+주문력의 100%) (+대상 최대 체력의 4%) ⇒ 55/85/115/145/175 (+주문력의 70%) (+대상 최대 체력의 4%)", "최대 마법 피해량: 110/170/230/290/350 (+주문력의 100%) (+대상 최대 체력의 4%) ⇒ 110/170/230/290/350 (+주문력의 140%) (+대상 최대 체력의 8%)"],
  ["기본 지속 효과 적중 시 피해량: 80/120/160 (+주문력의 60%) ⇒ 60/110/160 (+주문력의 60%)", "챔피언에게 처음 적중 시 추가 방어력: 25/45/65 (+추가 공격력의 40%) ⇒ 15/40/65 (+추가 공격력의 40%)", "챔피언에게 처음 적중 시 추가 마법 저항력: 15/27/39 (+추가 공격력의 24%) ⇒ 9/24/39 (+추가 공격력의 24%)"]],
  
  [["물리 피해량: 65/105/145/185/225 (+추가 공격력의 100%)(+주문력의 60%) ⇒ 65/105/145/185/225 (+추가 공격력의 100%) (+주문력의 0%)"],
  ["최소 피해량: 55/80/105/130/155 (+추가 공격력의 50%) 물리 피해 ⇒ 55/85/115/145/175 (+대상 최대 체력의 4%) (+주문력의 100%) 마법 피해", "회피한 공격당 추가 피해량: 총 피해량의 20% ⇒ 기본 피해량의 20%"],
  ["재사용 대기시간: 80초 ⇒ 100/90/80초", "세 번째 공격 시 기본 지속 효과 추가 마법 피해량: 100/140/180 (+주문력의 70%) ⇒ 80/120/160 (+주문력의 60%)", "(신규) 나에게 진짜 애니메이션이 있다면 어땠겠어: 잭스의 R - 달인의 저력 기본 지속 효과의 애니메이션, 음향 효과 및 시각 효과를 업데이트했습니다.", "(신규) 신규 사용 효과: 잭스가 가로등을 휘둘러 주변 적에게 150/250/350 (+주문력의 100%)의 마법 피해를 입힙니다. 챔피언을 맞히면 방어력이 25/45/65 (+추가 공격력의 40%) 증가하며 맞힌 챔피언 하나당 방어력이 15/20/25% (+추가 공격력의 10%) 추가로 증가하고, 다음 8초 동안 이 값의 60%만큼 마법 저항력도 증가합니다. 이때 기본 지속 효과의 피해는 세 번째가 아닌 두 번째 공격마다 적용됩니다."],
  ["(신규) 나에게 진짜 아이콘이 있다면 어땠겠어: 잭스의 스킬 아이콘이 모두 업데이트됩니다.", "(신규) 나에게 진짜 낚싯대가 있다면 어땠겠어: 잭스의 숨겨진 기본 지속 효과인 낚시가 게임에 추가됩니다."]],
  
  [["기본 체력 593 ⇒ 615"],
  ["마법 피해량 40/75/110/145/180 (+주문력의 60%) ⇒ 50/85/120/155/190 (+주문력의 60%)"]]];
}

//제이스
class PatchContent_Jayce{
  static List<String> BorNorM=["상향","상향","상향","상향","하향"];
  static List<String> patchVer=["14.4", "13.1","12.20","12.16","12.7"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[21], PatchNoteLink.link[5],PatchNoteLink.link[9],PatchNoteLink.link[13],
  PatchNoteLink.link[22]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "W - 전류 역장", "E - 천둥 강타"],
    ["기본 능력치","Q (해머 형태) - 하늘로!","W (해머 형태) - 전류 역장"],
  ["W - 전류 역장","R - 변환: 머큐리 해머"],
  ["Q (해머 형태) - 하늘로!","E (해머 형태) - 천둥 강타"],
  ["기본 능력치"]];

  static List<List<List<String>>> Detail_Content =[
    [["공격력: 57 ⇒ 59"],
    ["마나 회복량: 10/12/14/16/18/20 ⇒ 15/17/19/21/23/25", "초당 마법 피해량: 35/50/65/80/95/110 ⇒ 40/55/70/85/100/115"],
    ["(신규) 과학에 기반해서: 이제 사용 즉시 적을 속박합니다. (참고: 리 신 R - 용의 분노 속박과 유사합니다.)"]],
    
    [["기본 공격력: 54 ⇒ 57"],
  ["기본 물리 피해량: 55/100/145/190/235/280 ⇒ 60/110/160/210/260/310"],
  ["초당 마법 피해량: 25/40/55/70/85/100 ⇒ 35/50/65/80/95/110"]],
  
  [["마나 회복량: 6/8/10/12/14/16 ⇒ 10/12/14/16/18/20"],
  ["추가 방어력 및 마법 저항력: 5/15/25/35 ⇒ 5/15/25/35 (+추가 공격력의 7.5%)"]],
  
  [["피해량 55/95/135/175/215/255 (+추가 공격력의 120%) ⇒ 55/100/145/190/235/280 (+추가 공격력의 120%)"],
  ["피해량 대상 최대 체력의 8/10.4/12.8/15.2/17.6/20% (+추가 공격력의 100%) ⇒ 대상 최대 체력의 8/10.8/13.6/16.4/19.2/22% (+추가 공격력의 100%)"]],
  
  [["체력 증가량 90 ⇒ 95", "기본 체력 560 ⇒ 520", "체력 560~2,090 (레벨에 따라) ⇒ 520~2,135 (레벨에 따라)", "기본 방어력 27 ⇒ 22", "방어력 증가량 3.5 ⇒ 3.8 (18레벨 방어력은 전과 동일)"]]];
}

//진
class PatchContent_Jhin{
  static List<String> BorNorM=["상향", "상향", "상향","상향"];
  static List<String> patchVer=["14.8", "13.19", "13.1B", "12.8"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[25], PatchNoteLinkPlus.link[12], PatchNoteLink.link[4], PatchNoteLink.link[21]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 속삭임", "Q - 춤추는 유탄"],
    ["R - 커튼 콜"],
    ["기본 능력치"],
  ["W - 살상연희","E - 강제 관람"]];
  static List<List<List<String>>> Detail_Content =[
    [["치명타 적중 시 추가 이동 속도: 10% (+추가 공격 속도의 0.4%) ⇒ 14% (+추가 공격 속도의 0.4%)"],
    ["최소 물리 피해량: 45/70/95/120/145 (+공격력의 35/42.5/50/57.5/65%) (+주문력의 60%) ⇒ 44/69/94/119/144 (+공격력의 44/51.5/59/66.5/74%) (+주문력의 60%)"]],

    [["최소 물리 피해량: 50/125/200 (+총 공격력의 25%) ⇒ 64/154/244 (+총 공격력의 25%)"]],
    
    [["W - 살상연희 마나 소모량: 50/60/70/80/90 ⇒ 50/55/60/65/70", "E - 강제 관람 마나 소모량: 30/35/40/45/50 ⇒ 30 (모든 스킬 레벨에서)"]],
  
  [["속박 지속시간 1/1.25/1.5/1.75/2초 ⇒ 1.25/1.5/1.75/2/2.25초", "꼭두각시 이제 몬스터 대상 피해량이 25% 감소하지 않습니다. (미니언 및 소환물 대상 피해량 전과 동일)"],
  ["함정 충전 속도 28/25/22/19/16초 ⇒ 24/21.5/19/16.5/14초", "(삭제) 진글 벨 이제 몬스터에게 처음으로 적중하는 연꽃 함정의 피해량이 35% 감소하지 않습니다. (미니언 및 소환물 대상 피해량은 전과 동일)"]]];
}

//징크스
class PatchContent_Jinx{
  static List<String> BorNorM=["하향", "상향", "하향","하향","상향","상향","상향","하향","하향"];
  static List<String> patchVer=["13.21", "13.20", "13.11", "13.9","13.5","13.1B","12.19","12.8","12.5"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[14], PatchNoteLinkPlus.link[13], PatchNoteLinkPlus.link[4], PatchNoteLinkPlus.link[2], PatchNoteLink.link[1],PatchNoteLink.link[4], PatchNoteLink.link[10],
  PatchNoteLink.link[21],PatchNoteLink.link[24]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 신난다!"],
    ["기본 능력치", "기본 지속 효과 - 신난다!", "R - 초강력 초토화 로켓!"],
    ["기본 능력치"],
    ["기본 능력치"],
    ["기본 능력치","W - 빠직!","R - 초강력 초토화 로켓!"],
  ["기본 능력치"],
  ["기본 능력치","R - 초강력 초토화 로켓!"],
  ["기본 능력치"],
  ["Q - 휘릭휘릭! 생선대가리"]];
  static List<List<List<String>>> Detail_Content =[
    [["신난다! 중첩: 모든 처치 관여, 에픽 몬스터 처치 및 구조물 파괴로 신난다! 중첩이 쌓이고 효과를 초기화합니다. ⇒ 에픽 몬스터 처치와 구조물 파괴는 신난다!의 첫 번째 중첩을 제공하고 효과를 초기화시킬 수 있지만 챔피언 처치 관여로만 중첩을 쌓을 수 있습니다.", "(신규) 중첩 제한: 신난다!가 최대 5회 중첩됩니다."]],

    [["체력 증가량: 100 ⇒ 105"],
    ["(신규) 쌓고 또 쌓고: 이제 처치 관여 시 기본 지속 효과 - 신난다!로 획득하는 추가 총공격 속도 25%가 중첩됩니다."],
    ["재사용 대기시간: 75/65/55초 ⇒ 70/60/50초", "최소 피해량: 30/45/60 (+추가 공격력의 15%) (+대상 잃은 체력의 25/30/35%) ⇒ 32.5/47.5/62.5 (+추가 공격력의 16.5%) (+대상 잃은 체력의 25/30/35%)", "최대 피해량: 300/450/600 (+추가 공격력의 150%) (+대상 잃은 체력의 25/30/35%) ⇒ 325/475/625 (+추가 공격력의 165%) (+대상 잃은 체력의 25/30/35%)"]],

[["공격 속도 증가량: 1.36 ⇒ 1"]],

    [["공격력 증가량: 3.4 ⇒ 3.15"]],

    [["공격 속도 증가량: 1% ⇒ 1.36%"],
  ["마나 소모량: 50/55/60/65/70 ⇒ 40/45/50/55/60","둔화율: 30/40/50/60/70% ⇒ 40/50/60/70/80%"],
  ["몬스터 대상 최대 피해량: 800 ⇒ 1,200"]],
  
  [["기본 마나: 245 ⇒ 260", "마나 증가량: 45 ⇒ 50", "W - 빠직! 마나 소모량: 50/60/70/80/90 ⇒ 50/55/60/65/70"]],
  
  [["기본 공격력: 57 ⇒ 59"],
  ["주 대상에게 입히는 기본 피해량: 250/400/550 ⇒ 300/450/600"]],
  
  [["기본 체력 610 ⇒ 560"]],
  
  [["마나 소모량 16/17/18/19/20 ⇒ 20 (모든 스킬 레벨에서)", "공격 사거리 100/125/150/175/200 ⇒ 80/110/140/170/200"]]];
}

//카이사
class PatchContent_Kaisa{
  static List<String> BorNorM=["상향", "상향", "하향", "하향", "상향", "상향","상향","상향","하향","조정"];
  static List<String> patchVer=["14.8", "14.4", "13.20", "13.15", "13.12", "13.1B", "12.19","12.16","12.10","12.8"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[25], PatchNoteLinkPlus.link[21], PatchNoteLinkPlus.link[13], PatchNoteLinkPlus.link[8], PatchNoteLinkPlus.link[5], PatchNoteLink.link[4], PatchNoteLink.link[10],PatchNoteLink.link[13], PatchNoteLink.link[19],
  PatchNoteLink.link[21]];
  static List<List<String>> Detail_Title =[
    ["Q - 이케시아 폭우"],
    ["R - 사냥본능"],
    ["기본 능력치"],
  ["기본 능력치", "Q - 이케시아 폭우", "W - 공허추적자"],
  ["기본 능력치"],
  ["기본 능력치"],
  ["기본 지속 효과 - 두 번째 피부"],
  ["기본 지속 효과 - 두 번째 피부","Q - 이케시아 폭우","R - 사냥본능"],
  ["R - 사냥본능"],
  ["기본 지속 효과 - 두 번째 피부","W - 공허추적자", "R - 사냥본능"]];
  static List<List<List<String>>> Detail_Content =[
    [["미사일당 피해량: 40/55/70/85/100 (+추가 공격력의 50%) (+주문력의 20%) ⇒ 40/55/70/85/100 (+추가 공격력의 55%) (+주문력의 20%)"]],

    [["스킬 사용 사거리: 1,500/2,250/3,000 ⇒ 2,000/2,500/3,000"]],

    [["방어력: 28 ⇒ 25"]],

  [["기본 체력: 670 ⇒ 640"],
  ["미사일당 피해량: 40/55/70/85/100 (+추가 공격력의 50%) (+주문력의 30%) ⇒ 40/55/70/85/100 (+추가 공격력의 50%) (+주문력의 20%)", "단일 대상 최대 피해량 (진화 전): 90/123.75/157.5/191.25/225 (+추가 공격력의 112.5%) (+주문력의 67.5%) ⇒ 90/123.75/157.5/191.25/225 (+추가 공격력의 112.5%) (+주문력의 45%)", "단일 대상 최대 피해량 (진화 후): 150/206.25/262.5/318.75/375 (+추가 공격력의 187.5%) (+주문력의 112.5%) ⇒ 150/206.25/262.5/318.75/375 (+추가 공격력의 187.5%) (+주문력의 75%)"],
  ["진화 후 재사용 대기시간 감소: 77% ⇒ 75% (참고: 이는 실질적으로 적중 시 재사용 대기시간 8.7% 증가입니다.)"]],

  [["공격력 증가량: 2 ⇒ 2.6"]],
    
  [["기본 마나: 344.88 ⇒ 345","마나 증가량: 38 ⇒ 40", "마나 재생 증가량: 0.45 ⇒ 0.7"]],
  
  [["5번째 중첩 발동 시 피해량: 대상이 잃은 체력의 15% (+주문력 100당 5%) ⇒ 대상이 잃은 체력의 15% (+주문력 100당 6%)"]],
  
  [["플라즈마 적중시 기본 피해량 4~16 (레벨에 따라) ⇒ 5~23 (레벨에 따라)", "부식성 흉터 플라즈마 중첩당 추가 피해량 1~8 (레벨에 따라) ⇒ 1~12 (레벨에 따라)"],
  ["미사일당 피해량 40/55/70/85/100 (+추가 공격력의 50%) (+주문력의 25%) ⇒ 40/55/70/85/100 (+추가 공격력의 50%) (+주문력의 30%)"],
  ["보호막 흡수량 70/90/110 (+공격력의 90/135/180%) (+주문력의 90%) ⇒ 70/90/110 (+공격력의 90/135/180%) (+주문력의 120%)"]],
  
  [["보호막 흡수량 75/100/125 (+공격력의 100/150/200%) (+주문력의 100%) ⇒ 70/90/110 (공격력의 90/135/180%) (+주문력의 90%)"]],
  
  [["플라즈마 최대 중첩 소모 시 추가 마법 피해량 대상이 잃은 체력의 15% (+주문력 100당 2.5%) ⇒ 대상이 잃은 체력의 15% (+주문력 100당 5%)"],
  ["마법 피해량 30/55/80/105/130 (+공격력의 130%) (+주문력의 70%) ⇒ 30/55/80/105/130 (+공격력의 130%) (+주문력의 45%)"],
  ["보호막 흡수량 75/100/125 (+공격력의 100/150/200%) (+주문력의 75%) ⇒ 75/100/125 (+공격력의 100/150/200%) (+주문력의 100%)"]]];
}

//칼리스타
class PatchContent_Kalista{
  static List<String> BorNorM=["하향", "상향", "상향","상향", "하향","하향","상향","상향"];
  static List<String> patchVer=["14.4", "13.11","13.10","13.7", "12.18","12.15","12.7","12.4"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[21], PatchNoteLinkPlus.link[4], PatchNoteLinkPlus.link[3],PatchNoteLinkPlus.link[0], PatchNoteLink.link[11],PatchNoteLink.link[14],
  PatchNoteLink.link[22],PatchNoteLink.link[25]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 전투 태세", "E - 뽑아 찢기"],
    ["기본 능력치", "기본 지속 효과 - 전투 태세", "Q - 꿰뚫는 창", "E - 뽑아 찢기"],
    ["E - 뽑아 찢기"],
    ["기본 능력치", "기본 지속 효과 - 영혼 결속"],
  ["기본 능력치"],
  ["기본 능력치"],
  ["기본 능력치"],
  ["기본 능력치"]];
  static List<List<List<String>>> Detail_Content =[
    [["버그 수정: 이제 칼리스타가 기본 속도의 장화 착용 시 정상적으로 도약 거리를 얻습니다."],
    ["물리 피해량: 20/30/40/50/60 (+공격력의 70%) (+주문력의 20%) ⇒ 10/20/30/40/50 (+공격력의 70%) (+주문력의 20%) (참고: 중첩당 피해량은 변경되지 않습니다.)"]],

    [["기본 체력: 574 ⇒ 600", "체력 재생: 3.75 ⇒ 4", "체력 재생 증가량: 0.55 ⇒ 0.75", "공격력: 66 ⇒ 61", "공격력 증가량: 3.75 ⇒ 3.25"],
    ["도망쳐도 소용 없다: 이제 대상이 시야에서 벗어나더라도 칼리스타의 기본 공격이 빗나가지 않습니다.", "적중 시 입히는 피해량: 총 공격력의 90% ⇒ 총 공격력의 100%"],
    ["물리 피해량: 20/85/150/215/280 (+공격력의 100%) ⇒ 20/85/150/215/280 (+공격력의 105%)"],
    ["재사용 대기시간: 14/12.5/11/9.5/8초 ⇒ 10/9.5/9/8.5/8초", "추가 창 중첩당 물리 피해량: 10/16/22/28/34 (+공격력의 23.2/27.55/31.9/36.25/40.6%) (+주문력의 20%) ⇒ 8/12/16/20/24 (+공격력의 25/30/35/40/45%) (+주문력의 20%)"]],
    
    [["둔화율: 10/18/26/34/42% ⇒ 10/18/26/34/42% (+주문력 100당 5%)", "물리 피해량: 20/30/40/50/60 (+공격력의 70%) ⇒ 20/30/40/50/60 (+공격력의 70%) (+주문력의 20%)", "중첩 추가 피해량: 10/16/22/28/34 (+공격력의 23.2/27.55/31.9/36.25/40.6%) ⇒ 10/16/22/28/34 (+공격력의 23.2/27.55/31.9/36.25/40.6%) (+주문력의 20%)"]],

    [["공격력 증가량: 3.5 ⇒ 3.75"],
  ["(신규) 계약 의식 지속시간: 12초 ⇒ 8초 (참고: 계약은 칼리스타가 칠흑의 창을 사용하면 발동됩니다.)", "전투도 함께, 정신 집중도 함께: 이제 계약자가 다시 살아나는 행동을 취할 때 칼리스타가 칠흑의 창에 강제로 정신을 집중합니다."]],

  [["기본 체력 604 ⇒ 574"]],
  
  [["기본 공격력 69 ⇒ 66"]],
  
  [["기본 마나 250 ⇒ 300", "이동 속도 325 ⇒ 330", "공격 속도 증가량 4% ⇒ 4.5%"]],
  
  [["방어력 21 ⇒ 24"]]];
}

//카르마
class PatchContent_Karma{
  static List<String> BorNorM=["상향", "하향", "하향", "상향", "상향", "하향"];
  static List<String> patchVer=["14.7", "14.6", "14.3", "14.2", "13.16", "12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[24],PatchNoteLinkPlus.link[23],PatchNoteLinkPlus.link[20],PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[9], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["W - 굳은 결의", "R - 만트라"],
    ["기본 능력치", "기본 지속 효과 - 열정 응집", "Q - 내면의 열정", "R - 만트라"],
    ["R - 만트라"],
    ["기본 능력치", "Q - 내면의 열정", "E - 고무"],
    ["Q - 내면의 열정","R - 만트라"],
    ["W - 굳은 결의","E - 고무"]];

  static List<List<List<String>>> Detail_Content =[
    [["속박 지속시간: 1.4/1.55/1.7/1.85/2초 ⇒ 1.6/1.7/1.8/1.9/2초"],
    ["R - 만트라 + E - 저항 광역 보호막 흡수량: 39~129 (E - 고무 및 R - 만트라 스킬 레벨에 따라) (+주문력의 31.5%) ⇒ 45/81/117/153 (R - 만트라 스킬 레벨에 따라) (+주문력의 40.5%) (참고: 이동 속도 및 단일 대상 보호막 흡수량은 전과 동일합니다.)"]],

    [["마나 증가량: 50 ⇒ 40", "마나 재생 증가량: 0.5 ⇒ 0.8"],
    ["돌려받는 재사용 대기시간: 5초 ⇒ 4초"],
    ["마나 소모량: 45 ⇒ 40/50/60/70/80"],
    ["재사용 대기시간: 40/37/34/31초 ⇒ 40/38/36/34초", "R - 만트라 + E - 저항 추가 보호막 흡수량: 25/75/125/175 (+주문력의 45%) ⇒ 50/90/130/170 (+주문력의 45%)"]],

    [["영혼의 불꽃 피해량: 35/140/245/350 (+주문력의 70%) ⇒ 40/130/220/310 (+주문력의 50%)"]],

    [["기본 체력: 604 ⇒ 630"],
    ["피해량: 70/120/170/220/270 (+주문력의 50%) ⇒ 70/120/170/220/270 (+주문력의 70%)"],
    ["보호막 흡수량: 80/120/160/200/240 (+주문력의 45%) ⇒ 80/125/170/215/260 (+주문력의 60%)"]],

    [["마법 피해량: 70/120/170/220/270 (+주문력의 40%) ⇒ 70/120/170/220/270 (+주문력의 50%)", "궁극기 강화 Q - 영혼의 불꽃: 35/140/245/350 (+주문력의 60%) ⇒ 35/140/245/350 (+주문력의 70%)"],
    ["재사용 대기시간: 40/38/36/34초 ⇒ 40/37/34/31초"]],
    
    [["(R - 만트라 강화) 체력 회복량 잃은 체력의 20% (+주문력 100당 1%) ⇒ 17% (+주문력 100당 1%)"],
  ["보호막 흡수량 90/135/180/225/270 (+주문력의 50%) ⇒ 80/120/160/200/240 (+주문력의 45%)","(R - 만트라 강화) 주 보호막 흡수량 25/80/135/190 (+주문력의 50%) ⇒ 25/70/120/170 (+주문력의 45%)"]]];
}

//카서스
class PatchContent_Karthus{
  static List<String> BorNorM=["상향", "하향", "상향","상향"];
  static List<String> patchVer=["14.2", "13.14", "12.13","12.7"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[7], PatchNoteLink.link[16],PatchNoteLink.link[22]];
  static List<List<String>> Detail_Title =[
    ["Q - 황폐화", "W - 고통의 벽"],
    ["Q - 황폐화", "E - 부패"],
    ["기본 능력치"],
  ["Q - 황폐화"]];
  static List<List<List<String>>> Detail_Content =[
    [["피해량: 43/61/79/97/115 (+주문력의 35%) ⇒ 45/65/85/105/125 (+주문력의 35%)"],
    ["마법 저항력 감소: 15% ⇒ 25%"]],

    [["마법 피해량: 45/62.5/80/97.5/115 (+주문력의 35%) ⇒ 43/61/79/97/115 (+주문력의 35%)", "몬스터 대상 피해량 계수: 95% ⇒ 100%"],
    ["적 처치 시 마나 회복: 15/25/35/45/55 ⇒ 10/20/30/40/50"]],
    
    [["기본 방어력 18 ⇒ 21", "체력 증가량 101 ⇒ 110"]],
  
  [["몬스터 대상 피해량 85% ⇒ 95%"]]];
}

//카사딘
class PatchContent_Kassadin{
  static List<String> BorNorM=["하향", "상향", "하향", "하향", "조정","상향","상향"];
  static List<String> patchVer=["13.22","13.18", "13.3", "13.1B","12.23","12.17","12.8"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[15],PatchNoteLinkPlus.link[11],PatchNoteLink.link[3],PatchNoteLink.link[4],PatchNoteLink.link[6],
  PatchNoteLink.link[12],PatchNoteLink.link[21]];
  static List<List<String>> Detail_Title =[
    ["E - 힘의 파동", "R - 균열 이동"],
    ["R - 균열 이동"],
    ["E - 힘의 파동","R - 균열 이동"],
  ["E - 힘의 파동"],
  ["Q - 무의 구체","E - 힘의 파동"],
  ["Q - 무의 구체"],
  ["Q - 무의 구체","E - 힘의 파동"]];
  static List<List<List<String>>> Detail_Content =[
    [["마법 피해량: 60/90/120/150/180 (+주문력의 85%) ⇒ 60/90/120/150/180 (+주문력의 80%)"],
    ["무중첩 마법 피해량: 70/90/110 (+주문력의 60%) (+최대 마나의 2%) ⇒ 70/90/110 (+주문력의 50%) (+최대 마나의 2%)"]],

    [["마법 피해량: 70/90/110 (+주문력의 40%) (+최대 마나의 2%) ⇒ 70/90/110 (+주문력의 60%) (+최대 마나의 2%)"]],
    
    [["기본 피해량: 80/105/130/155/180 (+주문력의 85%) ⇒ 60/90/120/150/180 (+주문력의 85%)", "근처 스킬 사용으로 인한 재사용 대기시간 감소: 1초 ⇒ 0.75초"],
  ["마법 피해량: 80/100/120 (+주문력의 40%) (+최대 마나의 2%) ⇒ 70/90/110 (+주문력의 40%) (+최대 마나의 2%)", "중첩당 추가 피해량: 40/50/60 (+주문력의 10%) (+최대 마나의 1%) ⇒ 35/45/55 (+주문력의 10%) (+최대 마나의 1%)"]],
  
  [["재사용 대기시간: 21/19/17/15/13초 ⇒ 21/20/19/18/17초"]],
  
  [["보호막 흡수량: 60/90/120/150/180 (+주문력의 40%) ⇒ 80/110/140/170/200 (+주문력의 30%)", "보호막 생성 속도: Q - 무의 구체 투사체가 카사딘의 손을 벗어났을 때 보호막 적용 ⇒ Q - 무의 구체 사용 시 보호막 적용"],
  ["재사용 대기시간: 5초 ⇒ 21/19/17/15/13초", "(삭제) 중첩이여 사라져라: 이제 일정 횟수의 중첩이 없어도 스킬을 사용할 수 있습니다.", "(신규) 기를 나눠 줘: 카사딘의 근처에서 아군과 적이 사용한 스킬당 E - 힘의 파동 재사용 대기시간이 1초 감소합니다."]],
  
  [["재사용 대기시간 11/10.5/10/9.5/9초 ⇒ 10/9.5/9/8.5/8초", "마나 소모량 70/75/80/85/90 ⇒ 60/65/70/75/80"]],
  
  [["마법 피해 보호막 40/70/100/130/160 (+주문력의 30%) ⇒ 60/90/120/150/180 (+주문력의 40%)"],
  ["마법 피해량 80/105/130/155/180 (+주문력의 80%) ⇒ 80/105/130/155/180 (+주문력의 85%)"]]];
}

//카타리나
class PatchContent_Katarina{
  static List<String> BorNorM=["상향", "조정","하향"];
  static List<String> patchVer=["13.7", "12.12","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[0], PatchNoteLink.link[17],PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[["기본 지속 효과 - 탐욕","R - 죽음의 연꽃"],
  ["기본 지속 효과 - 탐욕","Q - 단검 투척","E - 순보", "R - 죽음의 연꽃"],
  ["R - 죽음의 연꽃"]];
  static List<List<List<String>>> Detail_Content =[[["사악한 검무 단검 마법 피해: 68~240 (레벨에 따라) (+추가 공격력의 60%) (+주문력의 65/75/85/95% (1/6/11/16 레벨)) ⇒ 68~240 (레벨에 따라) (+추가 공격력의 60%) (+주문력의 70/80/90/100% (1/6/11/16 레벨))"],
  ["단검당 물리 피해: 추가 공격력의 18% (+추가 공격 속도 100%당 30%) ⇒ 추가 공격력의 16% (+추가 공격 속도 100%당 50%)"]],
  
  [["주문력 계수 55/66/77/88% ⇒ 65/75/85/95% (1/6/11/16레벨에서)","단검 회수 마법 피해 추가 공격력 계수 75% ⇒ 60%"],
  ["마법 피해량 75/105/135/165/195 (+주문력의 30%) ⇒ 80/110/140/170/200 (+주문력의 35%)"],
  ["피해량 15/30/45/60/75 (+공격력의 50%) (+주문력의 25%) ⇒ 20/35/50/65/80 (+공격력의 40%) (+주문력의 25%)"],
  ["단검 1개당 물리 피해량 추가 공격력의 16% (+공격 속도 1.0당 12.8%) ⇒ 추가 공격력의 18% (+추가 공격 속도 60%당 18%)", "단검 1개당 적중 시 효과 효율 25/30/35% ⇒ 30/35/40%"]],
  
  [["고통스러운 상처 60% ⇒ 50%"]]];
}

//케일
class PatchContent_Kayle{
  static List<String> BorNorM=["하향","조정","상향","하향"];
  static List<String> patchVer=["14.1", "13.9","13.3","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[2],PatchNoteLink.link[3], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 거룩한 승천"],
    ["E - 화염주문검","R - 신성한 심판"],
    ["기본 지속 효과 - 거룩한 승천","E - 화염주문검"],
  ["기본 능력치", "W - 천상의 축복", "E - 화염주문검"]];
  static List<List<List<String>>> Detail_Content =[
    [["열광 중첩 추가 효과: 추가 공격 속도 6% (+주문력 100당 1%) ⇒ 추가 공격 속도 6% (+주문력 100당 0.5%)"]],

    [["적중 시 주문력 계수: 주문력의 25% ⇒ 주문력의 20%", "기본 지속 효과 - 거룩한 승천 화염파 피해량: 15/20/25/30/35 (E - 화염주문검의 스킬 레벨에 비례) ⇒ 20~41 (챔피언 레벨 11~18에 비례)"],
    ["스킬 사용 시간: 1.5초 ⇒ 0.5초", "피해 범위: 525 ⇒ 675/675/775", "(삭제)승천 준비: 이제 케일이 궁극기를 자신에게 사용할 때 사거리가 감소하지 않습니다.", "무적 지속시간: 2/2.5/3초 ⇒ 2.5초", "피해 효과 발동 시간: 1.5초 ⇒ 2.5초", "마법 피해량: 200/350/500 (+추가 공격력의 100%)(+주문력의 80%) ⇒ 200/300/400 (+추가 공격력의 100%)(+주문력의 70%)"]],
    
    [["희열 상태 추가 이동 속도: 8% ⇒ 10%"],
  ["기본 지속 효과 적중 시 피해량: 15/20/25/30/35 (+추가 공격력의 10%) (+주문력의 20%) ⇒ 15/20/25/30/35 (+추가 공격력의 10%) (+주문력의 25%)"]],
  
  [["체력 증가량 99 ⇒ 92", "기본 마법 저항력 26 ⇒ 22"],
  ["체력 회복량 60/90/120/150/180 (+주문력의 30%) ⇒ 55/80/105/130/155 (+주문력의 25%)"],
  ["기본 공격 추가 마법 피해량 대상이 잃은 체력의 8/9/10/11/12% (+주문력 100당 2%) ⇒ 7/8/9/10/11% (+주문력 100당 1.5%)"]]];
}

//케인
class PatchContent_Kayn{
  static List<String> BorNorM=["상향", "조정", "상향", "하향", "하향", "하향","상향","상향","하향","조정", "하향","하향"];
  static List<String> patchVer=["14.7", "14.6", "14.5", "13.18", "13.7", "13.8","13.3","12.23","12.18","12.14","12.11","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[24],PatchNoteLinkPlus.link[23],PatchNoteLinkPlus.link[22],PatchNoteLinkPlus.link[11],PatchNoteLinkPlus.link[10], PatchNoteLinkPlus.link[1],PatchNoteLink.link[3],PatchNoteLink.link[6],
  PatchNoteLink.link[11],PatchNoteLink.link[15]
  , PatchNoteLink.link[18], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["Q - 살상돌격"],
    ["Q - 살상돌격", "R - 그림자의 지배"],
    ["기본 지속 효과 - 다르킨의 낫", "R - 그림자의 지배"],
    ["본 지속 효과 - 다르킨의 낫","R - 그림자의 지배"],
    ["W - 몰아치는 낫", "편의성 개선 변경사항"],
    ["E - 그림자의 길"],
    ["기본 지속 효과 - 다르킨의 낫","Q - 살상돌격"],
  ["기본 지속 효과 - 다르킨의 낫","E - 그림자의 길"],
  ["Q - 살상돌격"],
  ["기본 능력치","기본 지속 효과 - 다르킨의 낫"],
  ["Q - 살상돌격 (다르킨 학살자 형태)"],
  ["다르킨 학살자 기본 지속 효과 - 다르킨의 낫", "E - 그림자의 길","다르킨 학살자 R - 그림자의 지배"]];
  static List<List<List<String>>> Detail_Content =[
    [["피해량: 75/95/115/135/155 (+추가 공격력의 80%) ⇒ 75/95/115/135/155 (+추가 공격력의 85%)"]],

    [["다르킨 학살자 - 적중 1회당 피해량: 총공격력의 65% + 대상 최대 체력의 5(+추가 공격력의 3.5%)% ⇒ 총공격력의 65% + 대상 최대 체력의 6(+추가 공격력의 3.5%)%", "(신규) 이제 Q - 살상돌격의 애니메이션이 출력되는 동안 케인은 사용 아이템을 쓸 수 없습니다."],
    ["피해량: 150/250/350 (+추가 공격력의 175%) ⇒ 150/250/350 (+추가 공격력의 150%) (참고: 이 변경은 다르킨 학살자 형태의 궁극기 피해량에 영향을 끼치지 않습니다.)"]],

    [["다르킨 학살자 추가 효과 - 체력 회복량: 25% ⇒ 25% (+추가 체력 100당 0.5%)"],
    ["다르킨 학살자 형태 - 체력 회복량: 입힌 피해량의 65% ⇒ 입힌 피해량의 75%"]],

    [["다르킨 학살자 추가 효과: 라아스트 - 체력 회복량: 챔피언에게 입힌 물리 피해의 20~30% (레벨에 따라) ⇒ 챔피언에게 입힌 물리 피해의 25%"],
     ["다르킨 학살자 입히는 피해량: 대상 최대 체력의 15% (+추가 공격력 100당 13%) ⇒ 대상 최대 체력의 15% (+추가 공격력 100당 10%) (참고: 여전히 툴팁에 적힌 대로 피해량의 65%에 해당하는 체력을 회복합니다.)"]],

    [["물리 피해량: 90/135/180/225/270 (+추가 공격력의 130%) ⇒ 85/130/175/220/265 (+추가 공격력의 110%)"],
    ["새로운 나, 새로운 체력과 마나 바: 이제 케인이 그림자 암살자 또는 다르킨 학살자로 변신할 때 체력과 마나를 최대로 회복합니다. (참고: 이 기능은 무작위 총력전에서는 비활성화됩니다.)"]],

    [["그림자 암살자 - 추가 이동 속도: 80% ⇒ 70%", "그림자 암살자 - 재사용 대기시간: 8초 ⇒ 10초"]],
    
    [["그림자 암살자 추가 피해량: 전투 시작 후 3초 동안 챔피언에게 입힌 감소 후 피해량의 13~40%(레벨에 따라)가 마법 피해량으로 추가 ⇒ 전투 시작 후 3초 동안 챔피언에게 입힌 감소 후 피해량의 15~45%(레벨에 따라)가 마법 피해량으로 추가"],
  ["물리 피해량: 75/95/115/135/155 (+추가 공격력의 65%) ⇒ 75/95/115/135/155 (+추가 공격력의 80%) (참고: 다르킨 학살자는 별개의 Q - 살상돌격 수치가 적용되므로, 이 변경은 다르킨 학살자의 피해량에 영향을 주지 않습니다.)"]],
  
  [["그림자 암살자 추가 피해량: 8~30% (레벨에 따라) ⇒ 13~40% (레벨에 따라)"],
  ["지형 통과 시 체력 회복량: 90/100/110/120/130 (+추가 공격력의 35%) ⇒ 90/100/110/120/130 (+추가 공격력의 45%)"]],

  [["다르킨 학살자 형태 피해량 공격력의 65% (+대상 최대 체력의 5% (+추가 공격력 100당 5%)) ⇒ 공격력의 65% (+대상 최대 체력의 5% (+추가 공격력 100당 3.5%))"]],
  
  [["체력 증가량 99 ⇒ 109"],
  ["라아스트 기본 지속 효과 챔피언에게 입힌 피해의 25~35%(레벨에 따라)만큼 체력을 회복합니다. ⇒ 챔피언에게 입힌 피해의 20~30%(레벨에 따라)만큼 체력을 회복합니다."]],
  
  [["피해량 공격력의 65% (+대상 최대 체력의 5% (+추가 공격력 100당 5.5%)) ⇒ 공격력의 65% (+대상 최대 체력의 5% (+추가 공격력 100당 5%))"]],
  
  [["챔피언 대상 스킬 체력 회복량 입힌 물리 피해의 30~40% (레벨에 따라) ⇒ 25~35% (레벨에 따라)"],
  ["체력 회복량 100/115/130/145/160 (+추가 공격력의 40%) ⇒ 90/100/110/120/130 (+추가 공격력의 35%)"],
  ["체력 회복량 대상 최대 체력의 10.5% (+추가 공격력 100당 9.1%) ⇒ 9.75% (+추가 공격력 100당 8.45%) (입힌 피해의 70% ⇒ 65%)"]]];
}

//케넨
class PatchContent_Kennen{
  static List<String> BorNorM=["상향", "상향","상향","상향","상향"];
  static List<String> patchVer=["13.18", "13.5","12.20","12.15","12.5"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[11],PatchNoteLink.link[1],PatchNoteLink.link[9],PatchNoteLink.link[14],
  PatchNoteLink.link[24]];
  static List<List<String>> Detail_Title =[
    ["E - 번개 질주", "R - 날카로운 소용돌이"],
    ["Q - 천둥의 표창","W - 전류 방출", "E - 번개 질주"],
  ["E - 번개 질주"],
  ["W - 전류 방출","R - 날카로운 소용돌이"],
  ["W - 전류 방출"]];
  static List<List<List<String>>> Detail_Content =[
    [["기력 소모량: 100/95/90/85/80 ⇒ 80 (모든 스킬 레벨에서)"],
    ["재사용 대기시간: 120초 (모든 스킬 레벨에서) ⇒ 120/100/80초"]],
    
    [["재사용 대기시간: 8/7/6/5/4초 ⇒ 7/6.25/5.5/4.75/4초","마법 피해량: 75/120/165/210/255 (+주문력의 75%) ⇒ 75/125/175/225/275 (+주문력의 85%)"],
  ["(신규) 자기장: 적 챔피언에게 표식이 남으면 케넨에게 사거리가 표시됩니다."],
  ["미니언에게 입히는 피해 계수: 50% ⇒ 65%"]],

  [["(신규) 그림자 수리검술: E - 번개 질주가 종료된 후 케넨이 추가 공격 속도를 획득하면 이제 2.5의 공격 속도 제한을 초과할 수 있습니다."]],
  
  [["재사용 대기시간 14/12/10/8/6초 ⇒ 13/11.25/9.5/7.75/6초","마법 피해량 60/85/110/135/160 ⇒ 70/95/120/145/170"],
  ["타격당 마법 피해량 40/75/110 (+주문력의 20%) ⇒ 40/75/110 (+주문력의 22.5%)"]],
  
  [["최대 중첩 시 기본 공격 추가 마법 피해량 20/30/40/50/60 (+추가 공격력의 60/70/80/90/100%) (+주문력의 25%) ⇒ 35/45/55/65/75 (+추가 공격력의 80/90/100/110/120%) (+주문력의 35%)"]]];
}

//카직스
class PatchContent_Khazix{
  static List<String> BorNorM=["하향", "하향", "상향","조정", "하향"];
  static List<String> patchVer=["13.17", "13.12", "13.8","13.7", "12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[10], PatchNoteLinkPlus.link[5], PatchNoteLinkPlus.link[1],PatchNoteLinkPlus.link[0], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["Q - 공포 감지"],
    ["기본 능력치"],
    ["Q - 공포 감지"],
    ["Q - 공포 감지","W - 공허의 가시","R - 공허의 습격"],
  ["W - 공허의 가시"]];
  static List<List<List<String>>> Detail_Content =[
    [["물리 피해량: 70/95/120/145/170 (+추가 공격력의 115%) ⇒ 70/95/120/145/170 (+추가 공격력의 110%)"]],

    [["기본 공격력: 63 ⇒ 60"]],

    [["물리 피해량: 60/85/110/135/160 (+추가 공격력의 115%) ⇒ 70/95/120/145/170 (+추가 공격력의 115%)"]],
    
    [["고립 범위: 425 ⇒ 375"],
  ["진화 둔화율: 60% ⇒ 40%", "고립된 대상에게 적용되는 진화 둔화율: 90% ⇒ 75%"],
  ["효과 지속시간: 10초 ⇒ 12초"]],
  
  [["체력 회복량 60/85/110/135/160 (+주문력의 50%) ⇒ 55/75/95/115/135 (+주문력의 50%)"]]];
}

//킨드레드
class PatchContent_Kindred{
  static List<String> BorNorM=["하향","하향", "하향", "상향","하향","상향","하향"];
  static List<String> patchVer=["13.17", "13.14", "13.13", "13.10","13.1B","12.22","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[10], PatchNoteLinkPlus.link[7],
    PatchNoteLinkPlus.link[6], PatchNoteLinkPlus.link[3],PatchNoteLink.link[4], 
  PatchNoteLink.link[7],PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["E - 차오르는 공포"],
    ["기본 능력치", "Q - 화살 세례"],
    ["기본 능력치"],
    ["기본 능력치", "W - 늑대의 광기","E - 차오르는 공포"],
    ["Q - 화살 세례"],
  ["Q - 화살 세례"],
  ["W - 늑대의 광기", "R - 양의 안식처"]];

  static List<List<List<String>>> Detail_Content =[
    [["물리 피해량: 80/100/120/140/160 (+추가 공격력의 80%) (+대상 잃은 체력의 8% (+표식당 0.5%)) ⇒ 80/100/120/140/160 (+추가 공격력의 80%) (+대상 잃은 체력의 5% (+표식당 0.5%))", "둔화율: 1초 동안 50% (+주문력 100당 5%) ⇒ 1초 동안 30% (+주문력 100당 5%)"]],

  [["기본 체력: 580 ⇒ 610","기본 방어력: 26 ⇒ 29"],
  ["물리 피해량: 50/75/100/125/150 (+추가 공격력의 75%) ⇒ 40/65/90/115/140 (+추가 공격력의 75%)", "재사용 대기시간: 8초 ⇒ 9초"]],

    [["기본 체력: 610 ⇒ 580", "기본 방어력: 29 ⇒ 26"]],
    
    [["체력 증가량: 99 ⇒ 104","공격력 증가량: 2.5 ⇒ 3.25"],
    ["마법 피해량: 25/30/35/40/45 (+추가 공격력의 20%) (+대상 현재 체력의 1.5% (+표식당 1%)) ⇒ 25/30/35/40/45 (+추가 공격력의 20%) (+주문력의 20%) (+대상 현재 체력의 1.5% (+표식당 1%))"],
  ["둔화율: 50% ⇒ 50% (+주문력 100당 5%)", "치명타 기준값: 대상 최대 체력의 15~65%, 치명타 확률에 비례 ⇒ 대상 최대 체력의 25~75%, 치명타 확률에 비례"]],

    [["물리 피해량: 60/85/110/135/160 (+추가 공격력의 75%) ⇒ 50/75/100/125/150 (+추가 공격력의 75%)"]],
  
  [["사용 후 추가 공격 속도: 25% ⇒ 35%"]],
  
  [["기본 지속 효과 최대 중첩 시 체력 회복량 49~100 ⇒ 47~81 (잃은 체력에 따라)"],
  ["체력 회복량 250/325/400 ⇒ 225/300/375"]]];
}

//클레드
class PatchContent_Kled{
  static List<String> BorNorM=["상향","조정"];
  static List<String> patchVer=["12.13","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[16], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[["Q - 덫날리기 (탑승 상태)","W - 버럭버럭"],
  ["기본 지속 효과 - 겁쟁이 도마뱀", "Q - 덫날리기", "W - 버럭버럭", "R - 돌겨어어억!!!"]];
  static List<List<List<String>>> Detail_Content =[[["던질 때의 피해량 30/55/80/105/130 (+추가 공격력의 60%) ⇒ 30/55/80/105/130 (+추가 공격력의 65%)", "2차 발동 피해량 60/110/160/210/260 (+추가 공격력의 120%) ⇒ 60/110/160/210/260 (+추가 공격력의 130%)"],
  ["재사용 대기시간 12/10.5/9/7.5/6초 ⇒ 11/9.5/8/6.5/5초"]],
  
  [["스칼 재탑승 시 스칼 체력 스칼 최대 체력의 50/60/70/80% ⇒ 45/55/65/75% (1/6/11/16레벨에서)"],
  ["끌어당긴 적 고통스러운 상처 60% ⇒ 50%"],
  ["재사용 대기시간 14/12.5/11/9.5/8초 ⇒ 12/10.5/9/7.5/6초"],
  ["재사용 대기시간 160/140/120초 ⇒ 140/125/110초"]]];
}

//코그모
class PatchContent_KogMaw{
  static List<String> BorNorM=["상향", "하향", "상향","하향"];
  static List<String> patchVer=["14.5", "13.12", "13.8","12.11"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[22],PatchNoteLinkPlus.link[5], PatchNoteLinkPlus.link[1],PatchNoteLink.link[18]];
  static List<List<String>> Detail_Title =[
    ['기본 지속 효과 - 이케시아식 마무리', "Q - 부식성 침", "E - 공허의 분비물", "R - 살아있는 곡사포"],
    ["W - 생체마법 폭격"],
    ["기본 지속 효과 - 이케시아식 마무리","Q - 부식성 침","E - 공허의 분비물"],
    ["Q - 부식성 침","W - 생체마법 폭격"]];
  static List<List<List<String>>> Detail_Content =[
    [["추가 이동 속도: 4초 동안 0~40% ⇒ 4초 동안 10~50%"],
    ["스킬 사용 시간: 0.25초 ⇒ 이제 코그모의 기본 공격 프레임 시간과 일치합니다."],
    ["둔화율: 30/35/40/45/50% ⇒ 40/45/50/55/60%"],
    ["최소 피해량: 100/140/180 (+추가 공격력의 65%) (+주문력의 35%) ⇒ 100/140/180 (+추가 공격력의 75%) (+주문력의 35%)"]],

    [["추가 마법 피해량: 대상 최대 체력의 3.5/4.25/5/5.75/6.5% (+주문력 100당 1%) ⇒ 대상 최대 체력의 3/3.75/4.5/5.25/6% (+주문력 100당 1%)"]],

    [["(신규) 달려라 멍멍아!: 이제 코그모가 기본 지속 효과 - 이케시아식 마무리 상태에서 유체화 효과를 얻습니다.", "고정 피해: 125~550 (레벨에 따라) ⇒ 140~650 (레벨에 따라)"],
    ["재사용 대기시간: 8초 ⇒ 7초"],
    ["마나 소모량: 60/70/80/90/100 ⇒ 40/55/70/85/100", "둔화율: 20/28/36/44/52% ⇒ 30/35/40/45/50%"]],
    
    [["방어력 및 마법 저항력 감소량 25/27/29/31/33% ⇒ 23/25/27/29/31%", "기본 지속 효과 추가 공격 속도 15/20/25/30/35% ⇒ 10/15/20/25/30%"],
  ["적중 시 최대 체력 비례 피해량 3/4/5/6/7% ⇒ 3.5/4.25/5/5.75/6.5%"]]];
}

//크산테
class PatchContent_KSante{
  static List<String> BorNorM=["조정", "상향", "하향", "하향","상향", "조정", "하향", "하향","하향","상향"];
  static List<String> patchVer=["14.4", "13.24", "13.23", "13.22", "13.21", "13.20", "13.12","13.3","13.1","12.23"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[21], PatchNoteLinkPlus.link[17],PatchNoteLinkPlus.link[16],PatchNoteLinkPlus.link[15],PatchNoteLinkPlus.link[14], PatchNoteLinkPlus.link[13], PatchNoteLinkPlus.link[5], PatchNoteLink.link[3],PatchNoteLink.link[5],PatchNoteLink.link[6]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "Q - 엔토포 타격", "W - 길을 여는 자", "E - 발놀림"],
    ["W - 길을 여는 자"],
    ["Q - 엔토포 타격", "W - 길을 여는 자", "E - 발놀림", "R - 총공세"],
    ["Q - 엔토포 타격"],
    ["기본 지속 효과 - 불굴의 본능", "Q - 엔토포 타격", "W - 길을 여는 자", "R - 총공세"],
    ["기본 능력치", "기본 지속 효과 - 불굴의 본능", "Q - 엔토포 타격", "W - 길을 여는 자", "W - 길을 여는 자 (총공세 버전)", "R - 총공세"],
    ["E - 발놀림"],
    ["기본 능력치","Q - 엔토포 타격","W - 길을 여는 자", "R - 총공세"],
  ["기본 능력치","기본 지속 효과 - 불굴의 본능","W - 길을 여는 자"],
  ["기본 능력치" ,"E - 발놀림"]];

  static List<List<List<String>>> Detail_Content =[
    [["기본 체력: 570 ⇒ 625", "기본 마나: 290 ⇒ 320"],
    ["(삭제) 둔화 없는 총공세: 더 이상 R - 총공세 중 둔화 효과를 적용하지 않습니다."],
    ["추가 방어력 계수: 50% ⇒ 85%", "추가 마법 저항력 계수: 50% ⇒ 85%", "(삭제) 총공세 최소 정신 집중 시간: 더 이상 R - 총공세 중 최소 정신 집중 시간이 0.5초로 감소하지 않습니다.", "(삭제) 총공세 재사용 대기시간 감소: 더 이상 R - 총공세 중 재사용 대기시간이 18/16.5/15/13.5/12초로 감소하지 않습니다."],
    ["돌진 속도: 1,500 ⇒ 900", "아군에게 향할 시 돌진 속도: 1,800 ⇒ 1,100 + 이동 속도", "총공세 돌진 속도: 2,100 ⇒ 1,450"]],

    [["마나 소모량: 60/65/70/75/80 ⇒ 40/45/50/55/60", "피해량: 20/40/60/80/100 (+공격력의 50%) (+추가 방어력의 30%) (+추가 마법 저항력 30%) (+대상 최대 체력의 6/7/8/9/10%) ⇒ 20/40/60/80/100 (+공격력의 50%) (+추가 방어력의 50%) (+추가 마법 저항력의 50%) (+대상 최대 체력의 6/7/8/9/10%)"]],

    [["마나 소모량: 마나 15 ⇒ 마나 28/26/24/22/20", "피해량: 30/60/90/120/150 (+공격력의 40%) (+추가 방어력의 30%) (+추가 마법 저항력의 30%) ⇒ 30/55/80/105/130 (+공격력의 40%) (+추가 방어력의 30%) (+추가 마법 저항력의 30%)"],
    ["버그 수정: 크산테가 W - 길을 여는 자의 돌진을 더 빨리 쓸 수 있던 버그를 수정했습니다. 이제 W - 길을 여는 자의 집중 시간이 일찍 종료되어도 돌진 없이 단순히 종료됩니다."],
    ["보호막 흡수량: 45/65/85/105/125 (+추가 체력의 15%) ⇒ 50/90/130/170/210 (+추가 체력의 10%)"],
    ["기본 지속 효과 추가 피해량: 45/60/75% (6/11/16레벨) ⇒ 30~78% (6~18레벨에서, 선형적으로 증가)", "추가 공격력: 15/30/45 (+추가 방어력의 25%) (+추가 마법 저항력의 25%) ⇒ 10/25/40 (+추가 방어력의 25%) (+추가 마법 저항력의 25%)"]],

    [["최소 스킬 사용 시간에 필요한 추가 체력: 1,200 ⇒ 1,600"]],

    [["총공세 추가 피해량: 35% ⇒ 45/60/75% (6/11/16레벨에서)"],
    ["최소 스킬 사용 시간에 필요한 추가 체력: 1,800 ⇒ 1,600", "툴팁 업데이트: 이제 툴팁에 재사용 대기시간과 스킬 사용 시간 감소에 필요한 방어력 및 마법 저항력, 체력이 항상 표시됩니다. 총공세 툴팁이 간소화되고 업데이트되었습니다."],
    ["방해가 되는 돌진: 이제 W - 길을 여는 자의 정신 집중이 시작되면 E - 발놀림의 돌진을 방해하지 않습니다.", "최대 정신 집중 시간: 1.0초 ⇒ 1.5초 (참고: 기본 및 총공세 버전의 W - 길을 여는 자 모두 해당됩니다.)", "툴팁 업데이트: 총공세 툴팁이 간소화되고 업데이트되었습니다."],
    ["체력 회복량: 챔피언에게 입힌 물리 및 고정 피해에 비례하여 계산됩니다. ⇒ 챔피언에게 입힌 모든 피해에 비례하여 계산됩니다.", "Q - 엔토포 타격 + E - 발놀림 연계 기본 공격 초기화: 0.1초 ⇒ 즉시"]],

    [["기본 체력: 610 ⇒ 570", "체력 증가량: 108 ⇒ 115", "방어력 증가량: 4.7 ⇒ 5.2"],
    ["총공세 추가 피해량: 35% (+추가 방어력 100당 20%) (+추가 마법 저항력 100당 20%) ⇒ 35%"],
    ["(신규) 어딜 점멸하려고: Q3 - 엔토포 타격 준비 시간 중에 점멸이 비활성화됩니다.", "(신규) 능력치 확인: Shift 키-툴팁이 방어력/마법 저항력 및 체력의 재사용 대기시간과 스킬 사용 시간에 대한 진행 상황을 보여줍니다.", "물리 피해량: 50/75/100/125/150 (+공격력의 40%) (+추가 방어력의 30%) (+추가 마법 저항력의 30%) ⇒ 30/60/90/120/150 (+공격력의 40%) (+추가 방어력의 30%) (+추가 마법 저항력의 30%)"],
    ["마나 소모량: 75/80/85/90/95 ⇒ 60/65/70/75/80", "(신규) 최소 정신 집중 시간: 0.65초 (참고: 최대 정신 집중 시간은 1초로 전과 동일)", "(신규) 최대 피해량: W - 길을 여는 자의 피해량, 군중 제어 효과, 돌진 거리 및 다른 모든 효과가 더 이상 스킬의 충전 시간에 비례하지 않습니다.", "받는 피해량 감소: 25% (+추가 방어력 100당 10%) (+추가 마법 저항력 100당 10%) (+추가 체력 100당 1%) ⇒ 40~65% (챔피언 레벨에 따라)","기절 지속시간: 0.3/0.35/0.4/0.45/0.5~0.85/0.95/1.05/1.15/1.25초 ⇒ 1.25초", "피해량: 대상 최대 체력의 2/2.25/2.5/2.75/3~7/7.25/7.5/7.75/8% ⇒ 20/40/60/80/100 (+총공격력의 50%) (+추가 방어력의 30%) (+추가 마법 저항력의 30%) (+대상 최대 체력의 6/7/8/9/10%)"],
    ["(신규) 최소 정신 집중 시간: 0.5초 (참고: 최대 정신 집중 시간은 1초로 전과 동일)", "(신규) 최대 피해량: W - 길을 여는 자의 피해량, 군중 제어 효과, 돌진 거리 및 다른 모든 효과가 더 이상 스킬의 충전 시간에 비례하지 않고 최대 해당 수치를 입힙니다.", "받는 피해량 감소: 30% (+추가 방어력 100당 12%) (+추가 마법 저항력 100당 12%) (+추가 체력 100당 1.2%) ⇒ 50~75% (챔피언 레벨에 따라)", "(삭제) 추가 피해량 삭제: 총공세 상태일 때, W - 길을 여는 자가 총공세 상태에 돌입할 때 제공되는 추가 공격력으로 인한 피해량을 제외하고 더 이상 추가 피해량을 입히지 않습니다.", "재사용 대기시간: 24/22/20/18/16초 ⇒ 18/16.5/15/13.5/12초"],
    ["최대 체력 기준치: 55% ⇒ 65%", "밀려나는 거리: 350 ⇒ 300", "최초 스킬 사용 시 피해량: 35/70/105(+공격력의 20%)의 물리 피해 ⇒ 70/110/150(+주문력의 65%)의 마법 피해", "벽 충돌 성공 시 피해량: 150/250/350의 물리 피해 ⇒ 70/110/150(+주문력의 65%)의 마법 피해", "기본 공격 초기화: 기본 공격 초기화 시간이 크산테의 기본 형태와 동일하도록 느려졌습니다.", "(신규) 중첩 소진: 총공세를 사용하면 Q - 엔토포 타격의 중첩이 초기화됩니다.", "획득한 추가 공격력: 5 (+추가 방어력의 32.5%) (+추가 마법 저항력의 32.5%) ⇒ 15/30/45 (+추가 방어력의 25%) (+추가 마법 저항력의 25%)", "체력 회복량: 모든 피해 흡혈 10% (+추가 체력 100당 0.75%) ⇒ 챔피언에게 입히는 모든 피해의 10/15/20%만큼 체력 회복", "(신규) 덜어진 무게: 이제 총공세 상태일 때 크산테가 25/35/45%의 추가 공격 속도를 획득합니다."]],

    [["재사용 대기시간: 9/8.5/8/7.5/7초 ⇒ 10.5/10/9.5/9/8.5초"]],
    
    [["체력 증가량: 108 ⇒ 114"],
  ["Q3 - 엔토포 타격 공중에 띄우기 지속시간: 1초 ⇒ 0.65초","Q3 - 엔토포 타격 기절 지속시간: 1~1.25초 ⇒ 1초"],
  ["최소 기절 지속시간: 0.35/0.45/0.55/0.65/0.75초 ⇒ 0.3/0.35/0.4/0.45/0.5초"],
  ["저항력 감소: 추가 저항력의 65% ⇒ 추가 저항력의 85%"]],
  
  [["기본 이동 속도: 335 ⇒ 330"],
  ["기본 피해량: 10~25 (레벨에 따라) ⇒ 5~20 (레벨에 따라)"],
  ["최소 물리 피해량: 대상 최대 체력의 4.25/4.5/4.75/5/5.25% ⇒ 대상 최대 체력의 2/2.25/2.5/2.75/3%", "최대 물리 피해량: 대상 최대 체력의 8.25/8.5/8.75/9/9.25% ⇒ 대상 최대 체력의 7/7.25/7.5/7.75/8%"]],
  
  [["기본 체력 재생: 8.5 ⇒ 9.5", "체력 증가량: 104 ⇒ 108"],
  ["(신규) 기본 공격 초기화: 이제 E - 발놀림이 크산테가 기본 상태일 때 기본 공격을 일부 초기화하며 총공세 상태일 때 기본 공격을 완전히 초기화합니다.", "자애로운 벽: 이제 크산테가 벽에 매우 가까이 있는 경우 벽을 넘을 수 있도록 E - 발놀림을 조정했습니다."]]];
}

//르블랑
class PatchContent_Leblanc{
  static List<String> BorNorM=["상향", "하향", "상향", "하향", "상향", "상향","상향","하향"];
  static List<String> patchVer=["14.8", "14.1", "13.21", "13.19","13.5","13.3","12.14","12.3"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[25], PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[14], PatchNoteLinkPlus.link[12], PatchNoteLink.link[1],PatchNoteLink.link[3],PatchNoteLink.link[15],
  PatchNoteLink.link[26]];
  static List<List<String>> Detail_Title =[
    ["Q - 악의의 인장", "W - 왜곡"],
    ["기본 능력치", "Q - 악의의 인장", "E - 환영 사"],
    ["W - 왜곡", "E - 환영 사슬"],
    ["기본 능력치", "W - 왜곡", "E - 환영 사슬"],
    ["Q - 악의의 인장","R - 모방"],
  ["기본 능력치","Q - 악의의 인장","R - 모방"],
  ["기본 능력치","W - 왜곡"],
  ["W - 왜곡"]];
  static List<List<List<String>>> Detail_Content =[
    [["마법 피해량: 65/90/115/140/165 (+주문력의 45%) ⇒ 70/95/120/145/170 (+주문력의 45%)"],
    ["재사용 대기시간: 18/16/14/12/10초 ⇒ 15/13.75/12.5/11.25/10초"]],

    [["공격 속도 계수: 0.625 ⇒ 0.4", "공격 속도 증가량: 1.5% ⇒ 2.35%", "공격력 증가량: 2.7 ⇒ 2.2"],
    ["피해량: 65/90/115/140/165 (+주문력의 40%) ⇒ 65/90/115/140/165 (+주문력의 45%)"],
    ["피해량: 50/70/90/110/130 (+주문력의 35%) ⇒ 50/70/90/110/130 (+주문력의 40%)"]],

    [["마법 피해량: 75/115/155/195/235 (+주문력의 65%) ⇒ 75/115/155/195/235 (+주문력의 75%)"],
    ["속박 발동 피해량: 80/120/160/200/240 (+주문력의 70%) ⇒ 80/120/160/200/240 (+주문력의 80%)"]],

    [["공격 속도 계수: 0.625 ⇒ 0.4", "공격 속도 증가량: 1.4% ⇒ 2.2%", "공격력 증가량: 3.5 ⇒ 2.7", "마나 증가량: 55 ⇒ 25", "마나 재생 증가량: 1 ⇒ 0.8"],
    ["마법 피해량: 75/115/155/195/235 (+주문력의 60%) ⇒ 75/115/155/195/235 (+주문력의 65%)"],
    ["사슬 적중 시 마법 피해량: 50/70/90/110/130 (+주문력의 30%) ⇒ 50/70/90/110/130 (+주문력의 35%)"]],
    
    [["(신규) 마나를 돌려받는 묘기: Q - 악의의 인장이나 R - 모방한 악의의 인장으로 유닛을 처치하면 마나의 100%를 돌려받고 스킬의 남은 재사용 대기시간이 30% 감소합니다.", "(신규) 미니언이 사라지는 마술: 이제 Q - 악의의 인장이 미니언에게 10~146(레벨에 따라)의 피해를 추가로 입힙니다."],
  ["(신규) 모방 - 악의의 인장: 이제 R - 모방: 악의의 인장이 Q - 악의의 인장 미니언 추가 피해를 모방합니다."]],

  [["마나 재생: 6 ⇒ 8", "마나 재생 증가량: 0.8 ⇒ 1"],
  ["마나 소모량: 50/55/60/65/70 ⇒ 50 (모든 스킬 레벨에서)"],
  ["재사용 대기시간: 60/45/30초 ⇒ 50/40/30초"]],
  
  [["기본 마나 334 ⇒ 400", "마나 증가량 50 ⇒ 55"],
  ["피해량 75/110/145/180/215 (+주문력의 60%) ⇒ 75/115/155/195/235 (+주문력의 60%)"]],
  
  [["기본 피해량 75/115/155/195/235 ⇒ 75/110/145/180/215"]]];
}

//리신
class PatchContent_LeeSin{
  static List<String> BorNorM=["상향", "상향", "하향","상향", "상향","상향","상향","하향","하향"];
  static List<String> patchVer=["13.19", "13.13", "13.7","13.3", "12.18","12.15","12.11","12.10","12.7"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[12], PatchNoteLinkPlus.link[6], PatchNoteLinkPlus.link[0], PatchNoteLink.link[3], PatchNoteLink.link[11],PatchNoteLink.link[14],
  PatchNoteLink.link[18], PatchNoteLink.link[19],PatchNoteLink.link[22]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치","W - 강철의 의지", "E - 폭풍"],
    ["Q - 음파/공명의 일격"],
    ["기본 능력치"],
  ["Q - 음파/공명의 일격","E - 폭풍/무력화"],
  ["기본 능력치","W - 방호/강철의 의지"],
  ["Q - 음파/공명의 일격", "W - 방호/강철의 의지","E - 폭풍/무력화"],
  ["기본 능력치", "Q - 음파/공명의 일격"],
  ["W - 방호", "W - 강철의 의지"],
  ["기본 능력치","Q - 음파/공명의 일격"]];

  static List<List<List<String>>> Detail_Content =[
    [["기본 방어력: 34 ⇒ 36"],
    ["생명력 흡수 및 주문 흡혈량: 5/10.5/16/21.5/27% ⇒ 10/14/18/22/26%"],
    ["마법 피해량: 35/65/95/125/155 (+공격력의 100%) ⇒ 35/60/85/110/135 (+공격력의 100%)"]],

    [["음파 피해량: 55/80/105/130/155 (+추가 공격력의 110%) ⇒ 55/80/105/130/155 (+추가 공격력의 115%)", "공명의 일격 최소 피해량: 55/80/105/130/155 (+추가 공격력의 110%) ⇒ 55/80/105/130/155 (+추가 공격력의 115%)", "공명의 일격 최대 피해량: 110/160/210/260/310 (+추가 공격력의 220%) ⇒ 110/160/210/260/310 (+추가 공격력의 230%)"]],
    
    [["기본 공격력: 68 ⇒ 66", "기본 방어력: 36 ⇒ 34"]],
  
  [["음파 물리 피해량: 55/80/105/130/155 (+추가 공격력의 100%) ⇒ 55/80/105/130/155 (+추가 공격력의 110%)", "공명의 일격 최소 물리 피해량: 55/80/105/130/155 (+추가 공격력의 100%) ⇒ 55/80/105/130/155 (+추가 공격력의 110%) (참고: 최대 피해량은 여전히 최소 피해량의 두 배입니다.)"],
  ["총 피해량: 100/130/160/190/220 (+추가 공격력의 100%) ⇒ 35/65/95/125/155 (+총 공격력의 100%)", "둔화율: 20/30/40/50/60% ⇒ 20/35/50/65/80%"]],
  
  [["체력 증가량 99 ⇒ 105"],
  ["생명력 흡수 및 주문 흡혈 5/9.5/14/18.5/23% ⇒ 5/10.5/16/21.5/27%"]],
  
  [["공명의 일격 기력 소모량 30 ⇒ 25"],
  ["강철의 의지 기력 소모량 30 ⇒ 25"],
  ["무력화 기력 소모량 30 ⇒ 25"]],

  [["기본 공격력 66 ⇒ 68"],
  ["음파 피해량 50/75/100/125/150 (+추가 공격력의 100%) ⇒ 55/80/105/130/155 (+추가 공격력의 100%)","공명의 일격 최소 피해량 50/75/100/125/150 (+추가 공격력의 100%) ⇒ 55/80/105/130/155 (+추가 공격력의 100%)", "공명의 일격 최대 피해량 100/150/200/250/300 (+추가 공격력의 200%) ⇒ 110/160/210/260/310 (+추가 공격력의 200%)"]],
  
  [["보호막 흡수량 55/110/165/220/275 (+주문력의 80%) ⇒ 50/100/150/200/250 (+주문력의 80%)"],
  ["추가 생명력 흡수 및 주문 흡혈 5/10/15/20/25% ⇒ 5/9.5/14/18.5/23%"]],
  
  [["기본 공격력 68 ⇒ 66"],
  ["음파 피해량 55/80/105/130/155 (+추가 공격력의 100%) ⇒ 50/75/100/125/150 (+추가 공격력의 100%)", "공명의 일격 최소 피해량 55/80/105/130/155 (+추가 공격력의 100%) ⇒ 50/75/100/125/150 (+추가 공격력의 100%)", "공명의 일격 최대 피해량 110/160/210/260/310 (+추가 공격력의 200%) ⇒ 100/150/200/250/300 (+추가 공격력의 200%)"]]];
}

//레오나
class PatchContent_Leona{
  static List<String> BorNorM=["상향", "상향","상향", "상향"];
  static List<String> patchVer=["13.24","13.8", "12.15","12.12"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[17],PatchNoteLinkPlus.link[1],PatchNoteLink.link[14],PatchNoteLink.link[17]];
  static List<List<String>> Detail_Title =[
    ["W - 일식", "R - 흑점 폭발"],
    ["W - 일식"],
    ["Q - 여명의 방패","R - 흑점 폭발"],
  ["기본 지속 효과 - 햇빛 "]];
  static List<List<List<String>>> Detail_Content =[
    [["추가 방어력: 20/25/30/35/40 (+추가 방어력의 20%) ⇒ 20/27.5/35/42.5/50 (+추가 방어력의 20%)", "추가 마법 저항력: 20/25/30/35/40 (+추가 마법 저항력의 20%) ⇒ 20/27.5/35/42.5/50 (+추가 마법 저항력의 20%)"],
    ["피해량: 100/175/250 (+주문력의 80%) ⇒ 150/225/300 (+주문력의 80%)"]],

    [["추가 방어력: 15/20/25/30/35 (+추가 방어력의 20%) ⇒ 20/25/30/35/40 (+추가 방어력의 20%)", "추가 마법 저항력: 15/20/25/30/35 (+추가 마법 저항력의 20%) ⇒ 20/25/30/35/40 (+추가 마법 저항력의 20%)", "마법 피해량: 45/80/115/150/185 (+주문력의 40%) ⇒ 55/90/125/160/195 (+주문력의 40%)"]],
    
    [["마나 소모량 45/50/55/60/65 ⇒ 35/40/45/50/55"],
  ["기절 및 둔화 지속시간 1.5초 ⇒ 1.75초"]],

  [["마법 피해량 25~144 ⇒ 32~168 (레벨에 따라)"]]];
}

//릴리아
class PatchContent_Lillia{
  static List<String> BorNorM=["하향", "상향","상향","하향","상향","상향", "하향","하향","상향","상향"];
  static List<String> patchVer=["14.3","13.8","13.1B","12.23","12.22","12.15","12.11","12.10","12.7","12.3"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[20],PatchNoteLinkPlus.link[1],PatchNoteLink.link[4],PatchNoteLink.link[6],
  PatchNoteLink.link[7],PatchNoteLink.link[14],PatchNoteLink.link[18], PatchNoteLink.link[19],PatchNoteLink.link[22],
  PatchNoteLink.link[26]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 꿈나무 지팡이", "Q - 뾰로롱 강타"],
    ["기본 지속 효과 - 꿈나무 지팡이"],
    ["기본 지속 효과 - 꿈나무 지팡이","Q - 뾰로롱 강타","E - 데굴데굴 씨앗"],
  ["기본 지속 효과","Q - 뾰로롱 강타"],
  ["기본 능력치", "기본 지속 효과 - 꿈나무 지팡이"],
  ["기본 지속 효과 - 꿈나무 지팡이"],
  ["기본 능력치","기본 지속 효과 - 꿈나무 지팡이"],
  ["기본 지속 효과 - 꿈나무 지팡이"],
  ["기본 지속 효과 - 꿈나무 지팡이", "W - 이익! 쿵!"],
  ["R - 감미로운 자장가"]];
  static List<List<List<String>>> Detail_Content =[
    [["대상 최대 체력 비례 피해량: 5% (+주문력의 1.5%) ⇒ 5% (+주문력의 1.25%)"],
    ["피해량: 70/90/110/130/150 (+주문력의 90%) ⇒ 70/90/110/130/150 (+주문력의 70%)"]],

    [["몬스터 대상 최대 피해량: 50~150 (레벨에 따라) ⇒ 70~150 (레벨에 따라) (참고: 1레벨 기준 체력이 1,328을 넘는 몬스터를 대상으로 했을 때 피해를 40% 더 입히는 것이며, 체력이 낮아질수록 점점 줄어들어 949 이하인 몬스터를 대상으로는 0%가 됩니다. 칼날부리의 체력은 1,100이며 붉은 덩굴정령, 푸른 파수꾼, 심술두꺼비, 돌거북 및 어스름 늑대는 모두 새로운 최대 피해량이 적용됩니다.)", "몬스터 대상 체력 회복량: 24~75 (레벨에 따라) (+주문력의 5.4%) ⇒ 39~54 (레벨에 따라) (+주문력의 15%)", "챔피언 대상 체력 회복량: 6~120 (레벨에 따라) (+주문력의 18%) ⇒ 6~90 (레벨에 따라) (+주문력의 30%)"]],
    
    [["마법 피해량: 대상 최대 체력의 5% (+주문력 100당 1.2%) ⇒ 대상 최대 체력의 5% (+주문력 100당 1.5%)"],
  ["마법 피해량: 35/45/55/65/75 (+주문력의 40%) ⇒ 35/45/55/65/75 (+주문력의 45%)", "가장자리 추가 고정 피해량: 35/45/55/65/75 (+주문력의 40%) ⇒ 35/45/55/65/75 (+주문력의 45%)"],
  ["마법 피해량: 70/95/120/145/170 (+주문력의 45%) ⇒ 70/95/120/145/170 (+주문력의 60%)","재사용 대기시간: 16초 (모든 스킬 레벨에서) ⇒ 14초"]],
  
  [["꿈나무 지팡이 최대 체력 비례 피해량: 6% ⇒ 5%"],
  ["마법 피해량: 35/50/65/80/95 (+주문력의 40%) ⇒ 35/45/55/65/75 (+주문력의 40%)", "가장자리 추가 고정 피해량: 35/50/65/80/95 (+주문력의 40%) ⇒ 35/45/55/65/75 (+주문력의 40%)"]],

  [["기본 공격 유형: 원거리 ⇒ 근접", "기본 체력: 625 ⇒ 605", "체력 증가량: 104 ⇒ 105"],
  ["챔피언 대상 체력 회복량: 10.5~124.5 (레벨에 따라)(+주문력의 18%) (참고: 선형적으로 증가) ⇒ 6~120 (레벨에 따라)(+주문력의 18%) (참고: 이제 능력치 증가 계수를 따릅니다.)"]],
  
  [["몬스터 대상 최대 피해량 40~100 (레벨에 따라) ⇒ 50~150 (레벨에 따라)"]],
  
  [["기본 체력 650 ⇒ 625"],
  ["꿈가루 피해량 대상 최대 체력의 6% (+주문력 100당 1.5%) ⇒ 대상 최대 체력의 6% (+주문력 100당 1.2%)"]],
  
  [["대형 몬스터 대상 체력 회복량 27~104 (레벨에 따라) (+주문력의 6%) ⇒ 24~75 (레벨에 따라) (+주문력의 5.4%)", "챔피언 대상 체력 회복량 12~140 (레벨에 따라) (+주문력의 20%) ⇒ 11~125 (레벨에 따라) (+주문력의 18%)"]],
  
  [["챔피언 대상 체력 회복량 12~140 (레벨에 따라) (+주문력의 12%) ⇒ 12~140 (레벨에 따라) (+주문력의 20%)"],
  ["피해량 70/90/110/130/150 (+주문력의 35%) ⇒ 80/100/120/140/160 (+주문력의 35%)"]],
  
  [["수면 지속시간 1.5/2/2.5초 ⇒ 2/2.25/2.5초"]]];
}

//리산드라
class PatchContent_Lissandra{
  static List<String> BorNorM=["상향", "상향", "상향","하향"];
  static List<String> patchVer=["13.19", "13.14", "13.1","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[12], PatchNoteLinkPlus.link[7], PatchNoteLink.link[5], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["W - 서릿발"],
    ["기본 지속 효과 - 냉기의 지배", "Q - 얼음 파편", "R - 얼음 무덤"],
    ["기본 능력치","Q - 얼음 파편","W - 서릿발"],
  ["R - 얼음 무덤"]];
  static List<List<List<String>>> Detail_Content =[
    [["속박 지속시간: 1.1/1.2/1.3/1.4/1.5초 ⇒ 1.25/1.35/1.45/1.55/1.65초"]],

    [["얼음 노예 이동 방식: 얼음 노예가 폭발 직전 마지막 순간에 정지합니다. ⇒ 얼음 노예가 폭발할 때까지 목표를 계속 추격합니다.", "(신규) 숨어 봤자 소용없다: 이제 얼음 노예가 적을 이미 추적하고 있다면 수풀까지 적을 따라서 들어갑니다.", "(신규) 네가 보여: 얼음 노예가 전장의 안개에서도 적에게 드러납니다."],
    ["둔화 적용: Q - 얼음 파편이 처음 적중한 적에게 둔화를 적용합니다. ⇒ 이제 Q - 얼음 파편이 적중한 모든 적에게 둔화를 적용합니다.", "얼음 파편 미사일: 스킬 사용 이전이 아닌 스킬 사용 이후 위치에서 Q - 얼음 파편이 발동됩니다."],
    ["체력 회복량: 90/140/190 (+주문력의 25%) (잃은 체력에 비례해 0~100% 증가) ⇒ 100/150/200 (+주문력의 55%) (잃은 체력에 비례해 0~100% 증가) (참고: 이제 최대 체력 회복 수치는 0%가 아닌 30% 이하 체력에서 적용됩니다.)", "피해 및 둔화율 적용 주기: 초당 4번 ⇒ 초당 16번", "돌진 상호 작용: 돌진 저지 관련 체계가 소규모로 업데이트되었습니다."]],
    
    [["체력 증가량: 104 ⇒ 110"],
  ["둔화율: 16/19/22/25/28% ⇒ 20/24/28/32/36%"],
  ["재사용 대기시간: 14/13/12/11/10초⇒ 12/11/10/9/8초"]],
  
  [["최소 체력 회복량 100/150/200 (+주문력의 30%) ⇒ 90/140/190 (+주문력의 25%)"]]];
}

//루시안
class PatchContent_Lucian{
  static List<String> BorNorM=["상향", "상향", "조정", "하향","하향","상향","상향"];
  static List<String> patchVer=["13.24", "13.16", "13.12", "13.1B","12.12","12.5","12.4"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[17],PatchNoteLinkPlus.link[9],PatchNoteLinkPlus.link[5], PatchNoteLink.link[4],PatchNoteLink.link[17],PatchNoteLink.link[24],
  PatchNoteLink.link[25]];
  static List<List<String>> Detail_Title =[
    ["E - 끈질긴 추격"],
    ["기본 지속 효과 - 빛의 사수"],
    ["기본 지속 효과 - 빛의 사수"],
    ["기본 능력치"],
  ["기본 능력치", "Q - 꿰뚫는 빛"],
  ["기본 능력치","기본 지속 효과 - 경계"],
  ["Q - 꿰뚫는 빛"]];
  static List<List<List<String>>> Detail_Content =[
    [["재사용 대기시간: 22/20/18/16/14초 ⇒ 19/17.75/16.5/15.25/14초"]],

    [["적중 시 추가 마법 피해: 10 (+공격력의 15%) ⇒ 15 (+공격력의 15%)"]],

    [["경계 피해량: 14 (+공격력의 20%) ⇒ 10 (+공격력의 15%)", "발동 조건: 다른 아군이 루시안을 강화하면 루시안의 다음 기본 공격 2회가 추가 마법 피해를 입힙니다. ⇒ 아군이 루시안에게 체력 회복 또는 보호막 효과를 부여하거나, 근처 적 챔피언이 이동 불가 상태가 되면 루시안의 다음 기본 공격 2회가 추가 마법 피해를 입힙니다."]],
    
    [["기본 마나: 349 ⇒ 320", "마나 증가량: 38 ⇒ 43", "기본 마나 재생: 8.18 ⇒ 7", "마나 재생 증가량: 0.7 ⇒ 0.8"]],
  
  [["기본 공격력 62 ⇒ 60"],
  ["피해량 95/130/165/200/235 (+추가 공격력의 60/75/90/105/120%) ⇒ 95/125/155/185/215 (+추가 공격력의 60/75/90/105/120%)"]],
  
  [["공격력 증가량 2.3 (18레벨 공격력 101.1) ⇒ 2.9 (18레벨 공격력 111.3)"],
  ["적중 시 추가 마법 피해량  14 (+공격력의 10%) ⇒ 14 (+공격력의 20%)"]],
  
  [["마나 소모량 50/60/70/80/90 ⇒ 48/56/64/72/80"]]];
}

//룰루
class PatchContent_Lulu{
  static List<String> BorNorM=["상향", "상향", "하향", "하향","하향","하향"];
  static List<String> patchVer=["14.4", "13.16", "13.12", "12.18","12.10","12.2"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[21], PatchNoteLinkPlus.link[9],PatchNoteLinkPlus.link[5], PatchNoteLink.link[11], PatchNoteLink.link[19],PatchNoteLink.link[27]];
  static List<List<String>> Detail_Title =[
    ["Q - 반짝반짝 창", "E - 도와줘, 픽스!", "R - 급성장"],
    ["기본 능력치", "Q - 반짝반짝 창", "E - 도와줘, 픽스!"],
    ["기본 능력치", "기본 지속 효과 - 요정 친구 픽스","E - 도와줘, 픽스!"],
    ["W - 변덕쟁이"],
  ["E - 도와줘, 픽스!","R - 급성장"],
  ["W - 변덕쟁이"]];

  static List<List<List<String>>> Detail_Content =[
    [["두 번째 화살 피해량: 첫 번째 화살 피해량의 25% ⇒ 첫 번째 화살 피해량의 50%"],
    ["마법 피해량: 80/120/160/200/240 (+주문력의 50%) ⇒ 80/125/170/215/260 (+주문력의 50%)", "보호막 흡수량: 75/115/155/195/235 (+주문력의 55%) ⇒ 80/125/170/215/260 (+주문력의 55%)"],
    ["추가 체력: 275/525/575 (+주문력의 45%) ⇒ 275/525/575 (+주문력의 55%)"]],

    [["체력 증가량: 88 ⇒ 92"],
    ["마법 피해량: 70/105/140/175/210 (+주문력의 40%) ⇒ 70/105/140/175/210 (+주문력의 50%)"],
    ["보호막 흡수량: 80/120/160/200/240 (+주문력의 40%) ⇒ 80/120/160/200/240 (+주문력의 50%)"]],
    
    [["방어력: 29 ⇒ 26"],
     ["마법 피해량: 15~117 (레벨에 따라) ⇒ 9~111 (레벨에 따라)"],
     ["보호막 흡수량: 75/110/145/180/215 (+주문력의 55%) ⇒ 75/115/155/195/235 (+주문력의 55%)"]],
    
    [["이동 속도 30% ⇒ 25%", "무력화 지속시간 1.25/1.5/1.75/2.0/2.25초 ⇒ 1.2/1.4/1.6/1.8/2.0초", "재사용 대기시간 17/16/15/14/13초 ⇒ 17/16.5/16/15.5/15초"]],
  
  [["보호막 흡수량 80/120/160/200/240 (+주문력의 40%) ⇒ 75/110/145/180/215 (+주문력의 35%)"],
  ["추가 체력 300/450/600 (+주문력의 50%) ⇒ 275/425/575 (+주문력의 45%)"]],
  
  [["재사용 대기시간 16/15/14/13/12초 ⇒ 17/16/15/14/13초"]]];
}

//럭스
class PatchContent_Lux{
  static List<String> BorNorM=["상향", "상향", "상향", "상향","하향"];
  static List<String> patchVer=["14.7", "14.1", "13.17", "12.23","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[24],PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[10], PatchNoteLink.link[6],  PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 광채", "Q - 빛의 속박"],
    ["기본 능력치","W - 프리즘 보호막"],
    ["기본 능력치", "기본 지속 효과 - 광채", "Q - 빛의 속박", "E - 광휘의 특이점"],
    ["E - 광휘의 특이점", "R - 최후의 섬광"],
  ["W - 프리즘 보호막"]];

  static List<List<List<String>>> Detail_Content =[
    [["마법 피해량: 30~200 (레벨에 따라) (+주문력의 25%) ⇒ 30~200 (레벨에 따라) (+주문력의 30%)"],
    ["마법 피해량: 80/120/160/200/240 (+주문력의 60%) ⇒ 80/120/160/200/240 (+주문력의 65%)"]],

    [["기본 체력: 560 ⇒ 580", "기본 방어력: 19 ⇒ 21", "공격 속도 증가량: 2% ⇒ 3%"],
    ["흡수량: 40/55/70/85/100 (+주문력의 35%) ⇒ 40/55/70/85/100 (+주문력의 40%)"]],

    [["기본 마나 재생: 8 ⇒ 7"],
    ["마법 피해량: 20~190 (레벨에 따라) (+주문력의 20%) ⇒ 30~200 (레벨에 따라) (+주문력의 25%)"],
    ["재사용 대기시간: 11초 (모든 스킬 레벨에서) ⇒ 11/10.5/10/9.5/9초"],
    ["마법 피해량: 70/120/170/220/270 (+주문력의 80%) ⇒ 65/115/165/215/265 (+주문력의 80%)"]],
    
    [["주문력 계수 증가: 70/120/170/220/270 (+주문력의 70%) ⇒ 70/120/170/220/270 (+주문력의 80%)"],
  ["주문력 계수 증가: 300/400/500 (+주문력의 100%) ⇒ 300/400/500 (+주문력의 120%)"]],
  
  [["보호막 흡수량 45/65/85/105/125 (+주문력의 35%) ⇒ 40/55/70/85/100 (+주문력의 35%)"]]];
}

//말파이트
class PatchContent_Malphite{
  static List<String> BorNorM=["하향","상향","상향","상향","상향","하향"];
  static List<String> patchVer=["13.8","13.4","12.23", "12.19","12.16","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[1],PatchNoteLink.link[2],PatchNoteLink.link[6],
  PatchNoteLink.link[10],PatchNoteLink.link[13]
  , PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["W - 천둥소리"],
    ["W - 천둥소리"],
  ["E - 지면 강타"],
  ["W - 천둥소리","R - 멈출 수 없는 힘"],
  ["기본 지속 효과 - 화강암 방패","W - 천둥소리"],
  ["기본 지속 효과 - 화강암 방패"]];
  static List<List<List<String>>> Detail_Content =[
    [["강화된 공격 피해량: 30/45/60/75/90 (+주문력의 20%)(+방어력의 15%) ⇒ 30/40/50/60/70 (+주문력의 20%)(+방어력의 15%)", "범위 물리 피해량: 15/25/35/45/55 (+주문력의 30%) (+방어력의 20%) ⇒ 15/25/35/45/55 (+주문력의 30%) (+방어력의 15%)"]],
    
    [["재사용 대기시간: 12/11.5/11/10.5/10초 ⇒ 10/9.5/9/8.5/8초","강화된 공격 물리 피해량: 30/45/60/75/90 (+주문력의 20%) (+방어력의 10%) ⇒ 30/45/60/75/90 (+주문력의 20%) (+방어력의 15%)","부채꼴 범위 물리 피해량: 15/25/35/45/55 (+주문력의 30%) (+방어력의 15%) ⇒ 15/25/35/45/55 (+주문력의 30%) (+방어력의 20%)"]],
  
  [["마법 피해량: 60/95/130/165/200 (+주문력의 60%) (+방어력의 30%) ⇒ 70/110/150/190/230 (+주문력의 60%) (+방어력의 40%)", "마나 소모량: 50/55/60/65/70 ⇒ 50 (모든 스킬 레벨에서)"]],
  
  [["부채꼴 범위 물리 피해량: 15/25/35/45/55 (+주문력의 20%) (+방어력의 15%) ⇒ 15/25/35/45/55 (+주문력의 30%) (+방어력의 15%)"],
  ["마법 피해량: 200/300/400 (+주문력의 80%) ⇒ 200/300/400 (+주문력의 90%)"]],
  
  [["재사용 대기시간 (1/7/13 레벨에서) 10/8/6초 ⇒ 8/7/6초"],
  ["재사용 대기시간 12초 (모든 스킬 레벨에서) ⇒ 12/11.5/11/10.5/10초"]],
  
  [["보호막 흡수량 최대 체력의 10% ⇒ 9%"]]];
}

//말자하
class PatchContent_Malzahar{
  static List<String> BorNorM=["조정", "상향"];
  static List<String> patchVer=["13.16", "12.21"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[9],PatchNoteLink.link[8]];
  static List<List<String>> Detail_Title =[
    ["E - 재앙의 환상"],
      ["E - 재앙의 환상"]];
  static List<List<List<String>>> Detail_Content =[
    [["피해 주기: 0.5초 ⇒ 0.25초", "미니언 처형 기준값: 체력 15~45 (레벨에 따라) ⇒ 체력 10~30 (레벨에 따라)"]],
    
    [["(신규) 확인 사살: 이제 E - 재앙의 환상이 체력이 15~45 (1~11레벨에서) 미만인 미니언을 처형합니다."]]];
}

//마오카이
class PatchContent_Maokai{
  static List<String> BorNorM=["하향", "하향", "조정", "하향", "하향","하향","상향","상향","하향", "조정","조정","하향"];
  static List<String> patchVer=["14.5", "14.4", "14.3", "13.15", "13.4","13.1B","12.23","12.22","12.20","12.18","12.17","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[22],PatchNoteLinkPlus.link[21], PatchNoteLinkPlus.link[20], PatchNoteLinkPlus.link[7], PatchNoteLink.link[2],PatchNoteLink.link[4],PatchNoteLink.link[6],PatchNoteLink.link[7],
  PatchNoteLink.link[9], PatchNoteLink.link[11],PatchNoteLink.link[12], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "Q - 덤불 주먹", "W - 뒤틀린 전진"],
    ["기본 능력치", "Q - 덤불 주먹", "R - 대자연의 마수"],
    ["기본 능력치", "기본 지속 효과 - 마법 흡수", "Q - 덤불 주먹", "E - 묘목 던지기", "R - 대자연의 마수"],
  ["Q - 덤불 주먹"],
  ["Q - 덤불 주먹","E - 묘목 던지기"],
  ["Q - 덤불 주먹","E - 묘목 던지기"],
  ["기본 지속 효과 - 마법 흡수","Q - 덤불 주먹"],
  ["E - 묘목 던지기"],
  ["기본 지속 효과 - 마법 흡수","R - 대자연의 마수"],
  ["기본 지속 효과 - 마법 흡수", "Q - 덤불 주먹", "E - 묘목 던지기"],
  ["기본 지속 효과 - 마법 흡수","Q - 덤불 주먹","E - 묘목 던지기","R - 대자연의 마수"],
  ["기본 지속 효과 - 마법 흡수"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 이동 속도: 335 ⇒ 330"],
    ["몬스터 대상 추가 피해량: 80/100/120/140/160 ⇒ 120/130/140/150/160"],
    ["재사용 대기시간: 13/12/11/10/9초 ⇒ 14/13/12/11/10초"]],

    [["기본 방어력: 39 ⇒ 35"],
    ["마법 피해량: 70/120/170/220/270 (+대상 최대 체력의 2/2.5/3/3.5/4%) (+주문력의 40%) ⇒ 65/115/165/215/265 (+대상 최대 체력의 2/2.5/3/3.5/4%) (+주문력의 40%)"],
    ["속박 지속시간: 0.8~2.6초 (최대 1,000유닛 거리 내 이동한 거리에 비례) ⇒ 0.75~2.25초 (최대 1,000유닛 거리 내 이동한 거리에 비례)"]],

    [["기본 마나 재생: 7.2 ⇒ 6"],
    ["최대 체력 비례 체력 회복량: 4~34 (레벨에 따라) (+4%~12% (레벨에 따라)) ⇒ 4~12.8% (레벨에 따라)"],
    ["재사용 대기시간: 8/7.25/6.5/5.75/5초 ⇒ 7/6.5/6/5.5/5초", "마나 소모량: 60 ⇒ 40"],
    ["재사용 대기시간: 14초 ⇒ 16/15/14/13/12초", "마나 소모량: 45/55/65/75/85 ⇒ 60/65/70/75/80"],
    ["재사용 대기시간: 120/110/100초 ⇒ 130/110/90초"]],

  [["몬스터 대상 추가 피해량: 100/120/140/160/180 ⇒ 80/100/120/140/160"]],
    
  [["마법 피해량: 70/120/170/220/270 (+대상 최대 체력의 2/2.25/2.5/2.75/3%) (+주문력의 40%) ⇒ 70/120/170/220/270 (+대상 최대 체력의 2/2.5/3/3.5/4%) (+주문력의 40%) (참고: 이 상향으로 총 피해량이 7% 가량 늘어나게 됩니다.)"],
  ["재사용 대기시간: 10초 ⇒ 14초", "마법 피해량: 55/80/105/130/155 (+추가 체력의 5%) (+주문력의 35%) ⇒ 50/75/100/125/150 (+추가 체력의 5%) (+주문력의 25%) (참고: 수풀에 심어진 묘목은 두 배의 피해를 입힙니다.)", "수풀로 강화된 묘목 둔화율: 45% (+추가 체력 100당 0.9%) (+주문력 100당 4%) ⇒ 45% (+추가 체력 100당 1%) (+주문력 100당 1%)"]],
  
  [["몬스터 대상 추가 피해량: 120/140/160/180/200 ⇒ 100/120/140/160/180"],
  ["마법 피해량: 55/80/105/130/155 (+추가 체력의 6%) (+주문력의 40%) ⇒ 55/80/105/130/155 (+추가 체력의 5%) (+주문력의 35%)", "강화된 묘목 마법 피해량: 110/160/210/260/310 (+추가 체력의 12%) (+주문력의 80%) ⇒ 110/160/210/260/310 (+추가 체력의 10%) (+주문력의 70%)"]],
  
  [["체력 회복량: 4~34 (레벨에 따라) + (최대 체력의 4~10% (레벨에 따라)) ⇒ 4~34 (레벨에 따라) + (최대 체력의 4~12% (레벨에 따라))"],
  ["기본 피해량: 65/110/155/200/245 (+대상 최대 체력의 2/2.25/2.5/2.75/3%) ⇒ 70/120/170/220/270 (+대상 최대 체력의 2/2.25/2.5/2.75/3%)", "몬스터 대상 추가 피해량: 80/100/120/140/160 ⇒ 120/140/160/180/200"]],
  
  [["강화된 둔화율: 45% (+추가 체력 100당 0.6%) (+주문력 100당 2%) ⇒ 45% (+추가 체력 100당 0.9%) (+주문력 100당 4%)"]],

  [["최대 체력 비례 체력 회복량: +최대 체력의 4.5%~12% (레벨에 따라) ⇒ +최대 체력의 4%~10% (레벨에 따라) (참고: 이제 최대 체력 계수는 1, 6, 9, 11, 13, 15, 17레벨에서 4%, 5%, 6%, 7%, 8%, 9%, 10%입니다.)"],
  ["재사용 대기시간: 120/100/80초 ⇒ 120/110/100초"]],
  
  [["체력 회복량 4.8~14% (레벨에 따라) ⇒ 4.5~12% (레벨에 따라)"],
  ["몬스터 대상 추가 피해량 40/60/80/100/120 ⇒ 80/100/120/140/160"],
  ["피해량 55/80/105/130/155 (+추가 체력의 6%) (+주문력의 42.5%) ⇒ 55/80/105/130/155 (+추가 체력의 6%) (+주문력의 40%)", "강화된 묘목 피해량 110/160/210/260/310 (+추가 체력의 12%) (+주문력의 85%) ⇒ 110/160/210/260/310 (+추가 체력의 12%) (+주문력의 80%)"]],
  
  [["(신규)나무의 역습 대형 정글 몬스터에게 공격당하면 기본 지속 효과 - 마법 흡수의 재사용 대기시간이 몬스터의 기본 공격당 1.5초 감소합니다.", "체력 회복량 5~45 (+최대 체력의 4.5~11%) (1~15레벨에서) ⇒ 4~34 (+최대 체력의 4.8~14%) (1~17레벨에서)"],
  ["피해량 70/110/150/190/230 (+주문력의 40%) ⇒ 65/110/155/200/245 (+주문력의 40%)", "(신규) 너무 강력한 공격 이제 Q - 덤불 주먹이 최대 체력 비례 피해(2/2.25/2.5/2.75/3%)를 입힙니다.", "(신규) 뻗어나가는 가지 이제 Q - 덤불 주먹이 몬스터에게 40/60/80/100/120의 추가 피해를 입힙니다."],
  ["(삭제) 덜 치명적인 묘목 이제 묘목이 최대 체력 비례 피해를 입히지 않습니다.", "기본 피해량 20/45/70/95/120 (+대상 최대 체력의 7/7.25/7.5/7.75/8% (+주문력 100당 0.7%)) ⇒ 55/80/105/130/155 (+주문력의 42.5% +추가 체력의 6%)", "수풀 강화 피해량 40/90/140/190/240 (+대상 최대 체력의 14/14.5/15/15.5/16% (+주문력 100당 1.4%)) ⇒ 110/160/210/260/310 (+주문력의 85% +추가 체력의 12%)","(신규) 미니언 인권운동가 더 이상 미니언에게 수풀로 강화된 피해를 입히지 않습니다.", "마나 소모량 60/70/80/90/100 ⇒ 45/55/65/75/85", "둔화율 35% ⇒ 45%", "(신규) 묘목 무기력증 이제 수풀로 강화된 묘목이 적을 35% ⇒ 45% (+주문력 100당 2%) (추가 체력 1,000당 6%) 둔화시킵니다."],
  ["투사체 최초 속도 50 ⇒ 100", "투사체 최대 속도 650 ⇒ 750", "투사체 가속도 250 ⇒ 300", "(신규) 나무처럼 빠른 발 이제 적 챔피언이 맞으면 마오카이가 2초에 걸쳐 감소하는 40/50/60%의 추가 이동 속도를 얻습니다."]],
  
  [["강화된 기본 공격 체력 회복량 5~65 (+최대 체력의 5~15%) (17레벨에서) ⇒ 5~45 (+최대 체력의 4.5~11%) (15레벨에서)"]]];
}

//마스터이
class PatchContent_MasterYi{
  static List<String> BorNorM=["상향", "하향","하향","상향","하향","하향","하향"];
  static List<String> patchVer=["12.21", "12.19","12.15","12.13","12.11","12.9","12.5"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[14], PatchNoteLink.link[10],PatchNoteLink.link[14],PatchNoteLink.link[16],
  PatchNoteLink.link[18],PatchNoteLink.link[20],PatchNoteLink.link[24]];
  static List<List<String>> Detail_Title =[
    ["E - 우주류 검술"],
    ["기본 능력치","E - 우주류 검술"],
  ["E - 우주류 검술"],
  ["기본 능력치","Q - 일격 필살","W - 명상"],
  ["기본 능력치", "E - 우주류 검술"],
  ["R - 최후의 전사"],
  ["기본 능력치","Q - 일격 필살", "E - 우주류 검술"]];
  static List<List<List<String>>> Detail_Content =[
    [["재사용 대기시간: 18초 ⇒ 14초"]],
    
    [["공격력 증가량: 2.5 ⇒ 2.2"],
  ["추가 고정 피해량: 30/35/40/45/50 (+추가 공격력의 35%) ⇒ 30/35/40/45/50 (+추가 공격력의 30%)"]],
  
  [["재사용 대기시간 18/17/16/15/14초 ⇒ 18초 (모든 스킬 레벨에서)"]],
  
  [["기본 공격력 66 ⇒ 65","공격력 증가량 3 ⇒ 2.5","공격 사거리 125 ⇒ 175"],
  ["재사용 대기시간 18/17.5/17/16.5/16초 ⇒ 20/19.5/19/18.5/18초","(신규) 자유 선택 Q - 일격 필살 사용 후 마스터 이가 주 대상으로부터 75유닛 앞에 나타납니다. ⇒ 마스터 이는 기본적으로 주 대상으로부터 75유닛 앞에 나타납니다. 그러나 Q - 일격 필살 사용 중 우클릭하여 나타날 지점을 지정할 수 있습니다."],
  ["재사용 대기시간 28초 ⇒ 9초", "마나 소모량 50 ⇒ 40 + 초당 최대 마나의 6%", "명상 중 받는 피해 감소량 60/62.5/65/67.5/70% ⇒ 첫 0.5초 동안 90%, 남은 정신 집중 시간 동안45/47.5/50/52.5/55%", "받는 피해 감소 효과 유지 명상이 끝난 후 0.5초 (총 시간 4초 이내) ⇒ 명상이 끝난 후 0.5초"]],
  
  [["체력 증가량 106 ⇒ 100", "18레벨 체력 2,471 ⇒ 2,369"],
  ["적중 시 추가 고정 피해량 30/38/46/54/62 (+추가 공격력의 35%) ⇒ 30/35/40/45/50 (+추가 공격력의 35%)"]],
  
  [["추가 공격 속도 25/45/65% ⇒ 25/35/45%"]],
  
  [["기본 체력 599 ⇒ 550"],
  ["피해량 25/60/95/130/165 (+공격력의 90%), 같은 대상을 연속으로 공격하면 피해량 75% 감소 ⇒ 30/60/90/120/150 (+공격력의 50%), 같은 대상을 연속으로 공격하면 피해량 75% 감소", "치명타 적중 시 추가 피해량 60% (+추가 치명타 피해량) ⇒ 35% (+추가 치명타 피해량)","적중 시 피해량 100%, 다음 타격부터 25%로 감소 ⇒ 75%, 다음 타격부터 18.75%로 감소", "(신규) 수많은 적과 수많은 일격 이제 Q - 일격 필살로 적을 타격할 때마다 E - 우주류 검술을 포함한 적중 시 효과가 적용됩니다. (같은 대상을 연속으로 공격하면 적중 시 피해량도 75% 감소)", "느리지만 신중하게 이제 Q - 일격 필살의 재사용 대기시간 감소 효과가 스킬 가속에 비례합니다. 예를 들어, 마스터 이의 스킬 가속이 100이면 적을 공격할 때마다 재사용 대기시간이 1초가 아닌 0.5초 감소합니다.", "더 신중하게 Q - 일격 필살을 사용 중일 때 E - 우주류 검술 및 R - 최후의 전사 지속시간이 감소하지 않습니다. (W - 명상과 동일)", "우주류 깜짝 검술 이제 마스터 이가 Q - 일격 필살을 사용하는 도중에 E - 우주류 검술 및 R - 최후의 전사를 사용할 수 있습니다."],
  ["고정 피해량 30/40/50/60/70 (+추가 공격력의 35%) ⇒ 30/38/46/54/62 (+추가 공격력의 30%)"]]];
}

//밀리오
class PatchContent_Milio{
  static List<String> BorNorM=["상향", "상향", "하향", "하향"];
  static List<String> patchVer=["13.20", "13.16", "13.14", "13.12"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[13], PatchNoteLinkPlus.link[9],PatchNoteLinkPlus.link[7], PatchNoteLinkPlus.link[5]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 타오르는 힘", "E - 따스한 포옹", "R - 생명의 온기"],
    ["Q - 초특급 불꽃 킥", "E - 따스한 포옹"],
    ["기본 지속 효과 - 타오르는 힘", "E - 따스한 포옹"],
    ["기본 능력치", "기본 지속 효과 - 타오르는 힘"]];

  static List<List<List<String>>> Detail_Content =[
    [["불태우기 상태: 불태우기 피해는 아군이 적용했어도 이제 밀리오의 피해로 간주되어 화학공학 부패기와 같은 특정 아이템을 통해 상호작용할 수 있습니다. 킬은 불태우기 효과를 적용한 아군에게 주어져서 밀리오가 의도치 않게 확인 사살해서 킬을 강탈하는 것을 방지합니다."],
    ["재사용 대기시간: 18/17/16/15/14초 ⇒ 17/16/15/14/13초", "보호막 흡수량: 60/85/110/135/160 (+주문력의 30%) ⇒ 60/90/120/150/180 (+주문력의 30%)"],
    ["체력 회복량: 150/250/350 (+주문력의 30%) ⇒ 150/250/350 (+주문력의 50%)"]],

    [["마법 피해량: 90/135/180/225/270 (+주문력의 90%) ⇒ 80/145/210/275/340 (+주문력의 120%)"],
    ["보호막 흡수량: 60/80/100/120/140 (+주문력의 25%) ⇒ 60/85/110/135/160 (+주문력의 30%)"]],

    [["불태우기 피해량: 25~80 (레벨에 따라) (+주문력의 20%) ⇒ 15~50 (레벨에 따라) (+주문력의 20%)"],
    ["추가 이동 속도: 15/17.5/20/22.5/25% ⇒ 12/14/16/18/20%"]],

    [["방어력: 28 ⇒ 26", "방어력 증가량: 4.9 ⇒ 4.6"],
  ["강화된 공격 피해량: 공격력의 15%~35% (아군 레벨에 따라) ⇒ 공격력의 15%"]]];
}

//미스포춘
class PatchContent_MissFortune{
  static List<String> BorNorM=["상향","하향", "하향", "상향", "조정"];
  static List<String> patchVer=["13.1B","12.21","12.18","12.17", "12.5"];
  static List<String> patchNoteLink= [PatchNoteLink.link[4], PatchNoteLink.link[8],PatchNoteLink.link[11],
  PatchNoteLink.link[12],PatchNoteLink.link[24]];
  static List<List<String>> Detail_Title =[["기본 능력치"],
  ["E - 총알은 비를 타고", "R - 쌍권총 난사"],
  ["기본 능력치"],
  ["Q - 한 발에 두 놈", "E - 총알은 비를 타고"],
  ["W - 활보"]];
  static List<List<List<String>>> Detail_Content =[[["마나 증가량: 35 ⇒ 40", "마나 재생: 8.05 ⇒ 8", "마나 재생 증가량: 0.65 ⇒ 0.8"]],
  
  [["마법 피해량: 70/100/130/160/190 (+주문력의 100%)⇒70/100/130/160/190 (+주문력의 120%)", "둔화율: 50% (+주문력 100당 4%)⇒40% (+주문력 100당 6%)"],
  ["매회 발사당 피해량: 공격력의 75% + 주문력의 20%⇒공격력의 75% + 주문력의 25%"]],
  
  [["공격력 증가량 2.7 ⇒ 2.4", "체력 증가량 107 ⇒ 103"]],

  [["물리 피해량 20/40/60/80/100 (+공격력의 100%) (+주문력의 35%) ⇒ 20/45/70/95/120 (+공격력의 100%) (+주문력의 35%)", "사용 시간 0.25초 ⇒ 기본 공격 시간과 동일"],
  ["재사용 대기시간 18/16/14/12/10초 ⇒ 18/17/16/15/14초", "최대 피해량 (8회에 걸쳐) 80/115/150/185/220 (+주문력의 80%) ⇒ 70/100/130/160/190 (+주문력의 100%)", "둔화율 40/45/50/55/60% ⇒ 50% (+주문력 100당 4%)"]],
  
  [["누구보다 빠르게 이제 미스 포츈이 재생성될 때 W - 활보의 이동 속도 증가 효과가 최대로 적용됩니다."]]];
}

//오공
class PatchContent_MonkeyKing{
  static List<String> BorNorM=["상향", "상향", "상향", "하향", "하향", "상향","하향","조정","하향","하향","상향"];
  static List<String> patchVer=["14.5", "14.3", "13.16", "13.13", "13.7", "12.20","12.17","12.14","12.11","12.7"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[22],PatchNoteLinkPlus.link[20], PatchNoteLinkPlus.link[9],PatchNoteLinkPlus.link[6], PatchNoteLinkPlus.link[0], PatchNoteLink.link[9],
  PatchNoteLink.link[12],PatchNoteLink.link[15],PatchNoteLink.link[17],PatchNoteLink.link[18],PatchNoteLink.link[22]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 바위 피부"],
    ["Q - 파쇄격", "E - 근두운 급습"],
    ["기본 능력치", "Q - 파쇄격", "W - 분신 전사"],
    ["E - 근두운 급습"],
    ["기본 능력치","W - 분신 전사","E - 근두운 급습"],
  ["R - 회전격"],
  ["기본 능력치"],
  ["기본 능력치","기본 지속 효과 - 바위 피부"],
  ["E - 근두운 급습", "R - 회전격"],
  ["W - 분신 전사","E - 근두운 급습"],
  ["Q - 파쇄격","W - 분신 전사", "E - 근두운 급습"]];

  static List<List<List<String>>> Detail_Content =[
    [["최대 중첩 수: 10 ⇒ 5", "중첩당 증폭 배율: 50% ⇒ 100%", "중첩 감소 주기: 한 번에 전부 감소 ⇒ 시간에 따라 하나씩 감소"]],

    [["추가 사거리: 75/100/125/150/175 ⇒ 135/145/155/165/175", "추가 물리 피해량: 20/45/70/95/120 (+추가 공격력의 45%) ⇒ 20/45/70/95/120 (+추가 공격력의 55%)"],
    ["추가 물리 피해량: 20/45/70/95/120 (+추가 공격력의 45%) ⇒ 20/45/70/95/120 (+추가 공격력의 55%)"]],

    [["마나 재생 증가량: 0.65 ⇒ 0.8"],
    ["마나 소모량: 40 ⇒ 20"],
    ["마나 소모량: 80/70/60/50/40 ⇒ 60/55/50/45/40"]],

    [["(삭제) 몬스터 대상 피해량 계수: 120% ⇒ 100% (참고: 몬스터 대상 피해량 계수 삭제)"]],
    
    [["공격력: 68 ⇒ 66"],
  ["재사용 대기시간: 22/19.5/17/14.5/12초 ⇒ 22/20/18/16/14초"],
  ["추가 공격 속도: 40/45/50/55/60% ⇒ 35/40/45/50/55%"]],

  [["궁극기 사용시 회당 피해량: 대상 최대 체력의 8/12/16% (+공격력의 220%) ⇒ 대상 최대 체력의 8/12/16% (+공격력의 275%)"]],
  
  [["기본 공격 속도 0.711 ⇒ 0.680","기본 이동 속도 345 ⇒ 340"]],
  
  [["기본 체력 재생 5초당 2.5 ⇒ 5초당 3.5"],
  ["중첩당 체력 재생 (최대 10회 중첩) 0.5% ⇒ 0.35%"]],
  
  [[" 몬스터 대상 피해량 160% ⇒ 120%"],
  ["재사용 대기시간 120/105/90초 ⇒ 130/110/90초"]],

  [["재사용 대기시간 20/18/16/14/12초 ⇒ 22/19.5/17/14.5/12초"],
  ["몬스터 대상 피해량 180% ⇒ 160%"]],
  
  [["재사용 대기시간 9/8.5/8/7.5/7초 ⇒ 8/7.5/7/6.5/6초"],
  ["재사용 대기시간 20/19/18/17/16초 ⇒ 20/18/16/14/12초", "(신규) 벽도 날 막을 수는 없다 이제 오공이 W - 분신 전사로 벽을 통과할 수 있습니다."],
  ["마법 피해량 80/110/140/170/200 (+주문력의 80%) ⇒ 80/110/140/170/200 (+주문력의 100%)" ,"몬스터 대상 추가 마법 피해량 50% ⇒ 80%"]]];
}

//모데카이저
class PatchContent_Mordekaiser{
  static List<String> BorNorM=["조정", "상향","하향","하향","상향"];
  static List<String> patchVer=["14.8", "13.24", "12.23","12.10","12.8"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[25], PatchNoteLinkPlus.link[17],PatchNoteLink.link[6], PatchNoteLink.link[19],PatchNoteLink.link[21]];
  static List<List<String>> Detail_Title =[
    ["Q - 말살", "E - 죽음의 손아귀", "R - 죽음의 세계"],
    ["Q - 말살", "R - 죽음의 세계"],
    ["기본 지속 효과 - 암흑 탄생"],
  ["W - 불멸"],
  ["기본 지속 효과 - 암흑 탄생"]];
  static List<List<List<String>>> Detail_Content =[
    [["재사용 대기시간: 9/7.75/6.5/5.25/4초 ⇒ 8/7/6/5/4초"],
    ["마법 피해량: 80/95/110/125/140 (+주문력의 60%) ⇒ 70/85/100/115/130 (+주문력의 60%)"],
    ["(신규) 죽음의 세계 탈출 상호작용: 더 이상 수은 장식띠, 헤르메스의 시미터, 알리스타의 R - 꺾을 수 없는 의지, 갱플랭크의 W - 괴혈병 치료, 밀리오 R - 생명의 온기, 올라프의 R - 라그나로크, 렝가의 강화된 야성 W - 전투의 포효를 사용해 모데카이저 R - 죽음의 세계에서 탈출할 수 없습니다. 하지만 여전히 군중 제어 면역에는 R - 죽음의 세계가 적용되지 않습니다."]],

    [["피해량: 75/95/115/135/155 (+5~139 (레벨에 따라)) (+주문력의 60%) ⇒ 75/95/115/135/155 (+5~139 (레벨에 따라)) (+주문력의 70%)"],
    ["도망쳐 봐라: 이제 R - 죽음의 세계 사용을 시작할 때 시야가 끊어지지 않습니다. 즉, 모데카이저가 R - 죽음의 세계를 사용할 때 수풀 속으로 도망쳐도 스킬 사용이 취소되지 않습니다. 참고: 전체 스킬 지속시간 동안 대상의 위치가 드러나지는 않기에 죽음의 세계에 모데카이저와 함께 들어가도 여전히 수풀에 숨는 전략은 유효합니다."]],

    [["몬스터 대상 최대 피해량: 180 ⇒ 28~164 (레벨에 따라)", "몬스터 대상 기본 지속 효과 발동: 모든 몬스터 타격 시 중첩 생성 ⇒ 대형 몬스터 타격 시 중첩 생성"]],
  
  [["보호막 흡수량 체력 전환율 40/42.5/45/47.5/50% ⇒ 35/37.5/40/42.5/45%"]],
  
  [["추가 이동 속도 3% (모든 레벨에서) ⇒ 3/6/9% (1/6/11레벨에서)"]]];
}

//모르가나
class PatchContent_Morgana{
  static List<String> BorNorM=["상향", "상향", "하향"];
  static List<String> patchVer=["13.21","13.20", "12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[14], PatchNoteLinkPlus.link[13],  PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["W - 고통의 그림자"],
    ["W - 고통의 그림자", "E - 칠흑의 방패", "R - 영혼의 족쇄"],
    ["기본 지속 효과 - 영혼 흡수"]];
  static List<List<List<String>>> Detail_Content =[
    [["초당 마법 피해량: 12/22/32/42/52 (+주문력의 17%) ⇒ 12/23/34/45/56 (+주문력의 17%)", "몬스터 대상 피해량 계수: 165% ⇒ 170%"]],

    [["초당 마법 피해량: 12/22/32/42/52 (+주문력의 14%) ⇒ 12/22/32/42/52 (+주문력의 17%)", "몬스터 대상 피해량 계수: 155% ⇒ 165%"],
    ["재사용 대기시간: 24/22/20/18/16초 ⇒ 26/23.5/21/18.5/16초"],
    ["추가 이동 속도: 사슬로 묶은 적을 향해 이동 시 5/30/55% ⇒ 모든 방향 이동 시 10/35/60%", "기절 지속시간: 모든 스킬 레벨에서 1.5초 ⇒ 1.5/1.75/2초", "마법 피해량: 150/225/300 (+주문력의 70%) ⇒ 175/250/325 (+주문력의 80%) (참고: 이 스킬은 전과 동일하게 최초 스킬 사용 시 한 번, 사슬로 인해 기절할 때 한 번으로 총 두 번 타격합니다.)"]],
    
    [["스킬 체력 회복량 챔피언, 대형 미니언, 중형 및 대형 몬스터 대상 피해량의 20% ⇒ 18%"]]];
}

//나미
class PatchContent_Nami{
  static List<String> BorNorM=["상향", "상향", "하향","하향","하향","상향","조정"];
  static List<String> patchVer=["14.7", "13.15", "13.1B","12.17","12.10","12.4","12.3"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[24],PatchNoteLinkPlus.link[8], PatchNoteLink.link[4],PatchNoteLink.link[12], PatchNoteLink.link[19],
  PatchNoteLink.link[25],PatchNoteLink.link[26]];
  static List<List<String>> Detail_Title =[
    ["W - 밀물 썰물", "E - 파도 소환사의 축복"],
  ["기본 지속 효과 - 밀려오는 파도", "Q - 물의 감옥"],
  ["W - 밀물 썰물","E - 파도 소환사의 축복"],
  ["E - 파도 소환사의 축복"],
  ["W - 밀물 썰물"],
  ["E - 파도 소환사의 축복"],
  ["기본 지속 효과 - 밀려오는 파도","E - 파도 소환사의 축복"]];
  static List<List<List<String>>> Detail_Content =[
    [["마법 피해량: 60/100/140/180/220 (+주문력의 55%) ⇒ 60/95/130/165/200 (+주문력의 50%)", "체력 회복량: 55/75/95/115/135 (+주문력의 25%) ⇒ 55/80/105/130/155 (+주문력의 40%)", "튕길 시 감소량: -15% (+주문력 100당 7.5%) ⇒ -10% (+주문력 100당 10%)"],
    ["마법 피해량: 20/35/50/65/80 (+주문력의 20%) ⇒ 20/30/40/50/60 (+주문력의 20%)"]],
    
  [["추가 이동 속도: 90 (+주문력의 20%) ⇒ 100 (+주문력의 25%)"],
  ["마법 피해량: 75/130/185/240/295 (+주문력의 50%) ⇒ 90/145/200/255/310 (+주문력의 50%)"]],
    
  [["마법 피해량: 70/110/150/190/230 (+주문력 50%) ⇒ 60/100/140/180/220 (+주문력 55%)"],
  ["타격 당 추가 마법 피해량: 25/40/55/70/85 (+주문력의 20%) ⇒ 20/35/50/65/80 (+주문력의 20%)"]],
  
  [["(삭제)  나미의 E - 파도 소환사의 축복 사용 시 세 번의 강화 효과가 각각 피해를 입힐 때마다 감전 룬의 발동 조건에 따로 적용되지 않도록 변경했습니다. E - 파도 소환사의 축복(및 강화 효과)은 이제 감전 룬과 같은 효과에 대해 하나의 주문으로 간주됩니다."]],
  
  [["체력 회복량 60/85/110/135/160 (+주문력의 30%) ⇒ 55/75/95/115/135 (+주문력의 25%)"]],
  
  [["적중 시 피해량 (공격당) 20/35/50/65/80 (+주문력의 20%) ⇒ 25/40/55/70/85 (+주문력의 20%)"]],
  
  [["추가 이동 속도 1.5초 동안 45 (+주문력의 20%) ⇒ 90 (+주문력의 20%), 1.5초에 걸쳐 원래대로 돌아옴"],
  ["적중 시 피해량 (공격당) 25/40/55/70/85 (+주문력의 20%) ⇒ 20/35/50/65/80 (+주문력의 20%)"]]];
}

//나서스
class PatchContent_Nasus{
  static List<String> BorNorM=["상향", "상향", "상향","하향"];
  static List<String> patchVer=["14.7", "13.12","12.19","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[24],PatchNoteLinkPlus.link[5], PatchNoteLink.link[10], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 영혼의 포식자", "Q - 흡수의 일격"],
    ["기본 지속 효과 - 영혼의 포식자", "R - 사막의 분노"],
    ["Q - 흡수의 일격","W - 쇠약","R - 사막의 분노"],
  ["기본 지속 효과 - 영혼의 포식자"]];
  static List<List<List<String>>> Detail_Content =[
    [["생명력 흡수: 11/16/21% (레벨에 따라) ⇒ 12/18/24% (레벨에 따라)"],
    ["추가 물리 피해량: 30/50/70/90/110 (+흡수의 일격 중첩 수) ⇒ 40/60/80/100/120 (+흡수의 일격 중첩 수)"]],

    [["생명력 흡수: 9/14/19% ⇒ 11/16/21%"], 
    ["재사용 대기시간: 120초 ⇒ 120/100/80초"]],
    
    [["강화된 기본 공격 사거리: 150 (추가 사거리 25) ⇒ 175 (추가 사거리 50)"],
  ["공격 속도 둔화율: 이동 속도 둔화율의 50% (23.5/29.5/35.5/41.5/47.5%) ⇒ 이동 속도 둔화율의 75% (새로운 공격 속도 둔화율: 35.25/44.25/53.25/62.25/71.25%)"],
  ["챔피언 크기 증가: +챔피언 크기의 30% ⇒ +챔피언 크기의 30/35/40% (6/11/16레벨에서)", "(신규) 거대한 멍멍이: 이제 피해 범위가 나서스의 크기에 따라 증가합니다.", "피해 주기: 1초마다 ⇒ 0.5초마다 (참고: 전체 피해량은 변화 없음)"]],
  
  [["생명력 흡수 10/16/22% ⇒ 9/14/19% (1/7/13레벨에서)"]]];
}

//나피리 13.14 합류
class PatchContent_Naffiri{
  static List<String> BorNorM=["상향", "하향", "하향","하향"];
  static List<String> patchVer=["14.1", "13.23", "13.17", "13.16"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[16],PatchNoteLinkPlus.link[10], PatchNoteLinkPlus.link[9]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "기본 지속 효과 - 늘어나는 무리"],
    ["기본 지속 효과 - 늘어나는 무리", "E - 적출"],
    ["기본 능력치", "기본 지속 효과 - 늘어나는 무리", "Q - 다르킨 단검", "E - 적출"],
    ["기본 능력치"]];

  static List<List<List<String>>> Detail_Content =[
    [["기본 이동 속도: 335 ⇒ 340", "무리 피해량: 5~25 (레벨에 따라) (+추가 공격력의 4.5%) ⇒ 6~30 (레벨에 따라) (+추가 공격력의 4.5%)"],
    ["재사용 대기시간: 30/25/20/15초 (1/6/11/16레벨에서) ⇒ 30/25/20/15/10초 (1/6/9/12/15레벨에서)"]],

    [["무리의 공격력: 6~29.8 (레벨에 따라) (+추가 공격력의 4.5%) ⇒ 5~25 (레벨에 따라) (+추가 공격력의 4.5%)"],
    ["칼날 폭발 피해량: 65/100/135/170/205 (+추가 공격력의 80%) ⇒ 60/90/120/150/180 (+추가 공격력의 80%)", "최대 적출 피해량: 100/150/200/250/300 (+추가 공격력의 130%) ⇒ 95/140/185/230/275 (+추가 공격력의 130%)"]],

    [["기본 체력: 650 ⇒ 635"],
    ["재사용 대기시간: 25~10 (레벨에 따라) ⇒ 30~15 (레벨에 따라)", "(신규) 멍멍아, 앉아!: 이제 나피리의 무리가 근접 공격에 100%의 추가 피해를 입습니다."],
    ["재사용 시 최소 피해량: 35/50/65/80/95 (+추가 공격력의 70%) ⇒ 30/45/60/75/90 (+추가 공격력의 40%)", "재사용 시 최대 피해량: 70/100/130/160/190 (+추가 공격력의 70%) ⇒ 60/90/100/130/180 (+추가 공격력의 70%)", "재사용 시 체력 회복량: 45/65/85/105/125 (+추가 공격력의 40%) ⇒ 45/60/75/90/105 (+추가 공격력의 40%)"],
    ["돌진 물리 피해량: 35/50/65/80/95 (+추가 공격력의 60%) ⇒ 35/50/65/80/95 (+추가 공격력의 50%)", "폭발 물리 피해량: 65/100/135/170/205 (+추가 공격력의 90%) ⇒ 65/100/135/170/205 (+추가 공격력의 80%)"]],

    [["기본 방어력: 32 ⇒ 30", "기본 공격력: 57 ⇒ 55", "기본 공격 속도: 0.688 ⇒ 0.663"]]];
}

//노틸러스
class PatchContent_Nautilus{
  static List<String> BorNorM=["상향","하향"];
  static List<String> patchVer=["13.3","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[3], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[["기본 지속 효과 - 강력한 일격","W - 타이탄의 분노","E - 역조"],
  ["W - 타이탄의 분노"]];
  static List<List<List<String>>> Detail_Content =[[["추가 피해량: 8~110 (레벨에 따라) ⇒ 14~116 (레벨에 따라)"],
  ["마나 소모량: 80 ⇒ 60", "보호막 흡수량: 40/50/60/70/80 (+최대 체력의 8/9/10/11/12%) ⇒ 50/60/70/80/90 (+최대 체력의 8/9/10/11/12%)"],
  ["마법 피해량: 55/85/115/145/175 (+주문력의 30%) ⇒ 55/90/125/160/195 (+주문력의 50%)"]],
  
  [["보호막 흡수량 45/55/65/75/85 (+최대 체력의 9/10/11/12/13%) ⇒ 40/50/60/70/80 (+최대 체력의 8/9/10/11/12%)"]]];
}

//니코
class PatchContent_Neeko{
  static List<String> BorNorM=["하향", "상향","조정","상향","상향"];
  static List<String> patchVer=["13.13", "13.10","13.9","12.7","12.4"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[6], PatchNoteLinkPlus.link[3],PatchNoteLinkPlus.link[2],
  PatchNoteLink.link[22],PatchNoteLink.link[25]];
  static List<List<String>> Detail_Title =[
    ["Q - 꽃망울 폭발", "W - 형상 분리", "R - 만개"],
    ["Q - 꽃망울 폭발", "W - 형상 분리", "R - 만개"],
    ["기본 지속 효과 - 태고의 마력", "Q - 꽃망울 폭발", "W - 형상 분리", "E - 칭칭올가미", "R - 만개"],
    ["W - 형상 분리"],
  ["기본 능력치", "Q - 꽃망울 폭발", "W - 형상 분리"]];
  static List<List<List<String>>> Detail_Content =[
    [["재사용 대기시간: 7초 ⇒ 9/8.5/8/7.5/7초"],
    ["발동 시 추가 피해량: 50/80/110/140/170 (+주문력의 60%) ⇒ 40/75/110/145/180 (+주문력의 60%)"],
    ["궁극기 사용 시 변신 지속 시간: 궁극기 사용 시간인 1.25초 동안 니코의 변신이 유지됩니다. ⇒ 궁극기 사용 시간의 첫 0.5초 동안 니코의 변신이 유지되고, 나머지 0.75초는 변신이 해제됩니다."]],
    
    [["몬스터 대상 추가 피해량: 30/40/50/60/70 ⇒ 35/50/65/80/95"],
  ["몬스터 대상 추가 피해량: 50 ⇒ 75"],
  ["마법 피해량: 150/350/550 (+주문력의 100%) ⇒ 150/350/550 (+주문력의 120%)"]],
  
    [["니코가 쇼마를 받아!: 에픽 몬스터를 제외한 몬스터, 미니언, 덫, 와드 또는 식물 근처에 2초 동안 있으면 해당 유닛의 쇼마를 저장합니다. 바에 있는 아이콘을 누르면 해당 유닛으로 변신할 수 있습니다. 니코 얼굴 아이콘을 누르면 니코로 돌아갑니다. 작은 'X' 표시를 눌러 현재 저장된 쇼마를 지울 수 있으며 한 번에 하나의 유닛만 저장할 수 있습니다.", "니코의 변신은 단단해!: 이제 피해를 입어도 변신이 풀리지 않으며 변신한 니코가 죽거나 군중 제어기의 효과를 받았을 때만 변신이 풀립니다.", "(삭제)제한 속도 초과: 이제 니코가 자신보다 능력치가 더 높은 변신 대상의 기본 공격 속도/이동 속도를 이어받지 않습니다.", "재사용 대기시간: 25~10초 (레벨에 따라) ⇒ 2초"],
    ["2차/3차 폭발 피해: 40/65/90/115/140 (+주문력의 20%) ⇒ 35/60/85/110/135 (+주문력의 25%)", "피해 반경: 225 ⇒ 250 (참고: 이제 언제나 최대 사거리 E - 칭칭올가미 속박에 Q - 꽃망울 폭발을 맞출 수 있습니다.)", "(신규)정글의 꽃: 이제 Q - 꽃망울 폭발이 몬스터를 대상으로 30/40/50/60/70 추가 피해를 입힙니다.", "(신규)안정적인 폭발: 이제 최대 사거리 너머로 Q - 꽃망울 폭발을 사용하면 니코가 스킬을 사용하기 위해 움직이는 대신 스킬을 최대 사거리로 사용합니다."],
    ["(신규)니코가 니코를 움직여: 사용 후 스킬을 재사용해 분신을 다른 위치로 보낼 수 있습니다.", "(신규)니코는 재밌어!: 이제 분신이 Q - 꽃망울 폭발/E - 칭칭올가미/춤/농담/도발/귀환/웃음의 애니메이션 및 음향을 지속 시간이 끝날 때까지 따라 합니다.", "니코 정글!: 강화된 공격이 몬스터에게 50의 추가 피해를 입힙니다.", "니코는 하나야: 니코의 분신이 니코 100 범위 앞에 생성됩니다. ⇒ 니코의 분신이 동일한 위치에 생성됩니다."],
    ["마법 피해량: 80/115/150/185/220 (+주문력의 60%) ⇒ 70/105/140/175/210 (+주문력의 65%)"],
    ["궁극기 조정: 1.25초 동안 정신 집중을 한 후 니코가 공중으로 도약해 0.6초 동안 주변의 모든 적을 띄워 올립니다. 이후 띄워진 적과 함께 떨어지며 마법 피해를 입히고 0.75초 동안 기절시킵니다.", "재사용 대기시간: 90초 ⇒ 120/105/90초", "마법 피해량: 200/425/650 (+주문력의 130%) ⇒ 150/350/550 (+주문력의 100%)", "(삭제)니코는 보호막 필요 없어!: 이제 니코가 R - 만개 정신 집중 시 보호막을 얻지 않습니다."]
    ],

    [["기본 지속 효과 추가 마법 피해량 50/70/90/110/130 (+주문력의 60%) ⇒ 50/80/110/140/170 (+주문력의 60%)", "기본 지속 효과 추가 이동 속도 10/15/20/25/30% ⇒ 10/17.5/25/32.5/40%"]],
  
  [["피격 판정 범위 크기 80 ⇒ 65"],
  ["추가 폭발 피해량 40/60/80/100/120 (+주문력의 20%) ⇒ 40/65/90/115/140 (+주문력의 20%)"],
  ["재사용 대기시간 20/19/18/17/16초 ⇒ 16/15/14/13/12초"]]];
}

//니달리
class PatchContent_Nidalee{
  static List<String> BorNorM=["하향", "상향", "상향", "상향", "상향","하향","하향","상향"];
  static List<String> patchVer=["14.5", "14.3", "13.16", "13.13", "13.8","12.10","12.9","12.6"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[22],PatchNoteLinkPlus.link[20], PatchNoteLinkPlus.link[9],PatchNoteLinkPlus.link[6], PatchNoteLinkPlus.link[1], PatchNoteLink.link[19],PatchNoteLink.link[20],
  PatchNoteLink.link[23]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "Q - 숨통 끊기"],
    ["기본 능력치", "E - 태고의 생명력"],
    ["E - 할퀴기"],
    ["기본 능력치"],
    ["기본 능력치"],
    ["인간 형태 E - 태고의 생명력"],
  ["기본 능력치"],
  ["인간 형태 W - 매복 덫", "인간 형태 E - 태고의 생명력","쿠거 형태 W - 급습"]];

  static List<List<List<String>>> Detail_Content =[
    [["기본 이동 속도: 340 ⇒ 335"],
    ["사냥당하는 적 대상 추가 피해량: 40% ⇒ 30%"]],

    [["마법 저항력 증가량: 1.3 ⇒ 1.45"],
    ["최소 체력 회복량: 35/50/65/80/95 (+주문력의 27.5%) ⇒ 50/75/100/125/150 (+주문력의 35%) (참고: 최대 회복량은 여전히 최소 회복량의 두 배입니다.)", "추가 공격 속도: 20/30/40/50/60% ⇒ 30/40/50/60/70%"]],

    [["피해량: 80/140/200/260 (+주문력의 45%) ⇒ 80/140/200/260 (+추가 공격력의 40%) (+주문력의 45%)"]],

    [["이동 속도: 335 ⇒ 340"]],

    [["기본 방어력: 28 ⇒ 32", "방어력 증가량: 4.7 ⇒ 5"]],
    
    [["기본 체력 회복량 35/55/75/95/115 (+주문력의 32.5%) ⇒ 35/50/65/80/95 (+주문력의 27.5%)"]],
  
  [["기본 체력 570 ⇒ 540"]],
  
  [["마나 소모량 40/45/50/55/60 ⇒ 30/35/40/45/50"],
  ["마나 소모량 50/60/70/89/90 ⇒ 50/55/60/65/70", "스킬 사거리 600 ⇒ 900 (W - 매복 덫과 동일)"],
  ["광역 피해 범위 225 ⇒ 250"]]];
}

//닐라 12.13 등장
class PatchContent_Nilah{
  static List<String> BorNorM=["하향", "조정", "조정"];
  static List<String> patchVer=["13.22", "12.23", "12.13"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[15],PatchNoteLink.link[6],PatchNoteLink.link[16]];
  static List<List<String>> Detail_Title =[
    ["Q - 무형의 검", "R - 환희"],
    ["Q - 무형의 검", "R - 환희"],
  ["기본 능력치", "기본 지속 효과 - 영원한 기쁨","Q - 무형의 검 ", "E - 급류"]];
  static List<List<List<String>>> Detail_Content =[
    [["추가 공격 속도: 10~60% (레벨에 따라) ⇒ 10~50% (레벨에 따라)"],
    ["지속 피해량: 60/120/180 (+추가 공격력의 112%) ⇒ 60/120/180 (+추가 공격력의 80%)", "최대 총피해량: 185/345/505 (+추가 공격력의 232%) ⇒ 185/345/505 (+추가 공격력의 200%)"]],

    [["물리 피해량: 5/10/15/20/25 (+총 공격력의 90/100/110/120/130%) ⇒ 5/10/15/20/25 (+총 공격력의 90/97.5/105/112.5/120%)", "치명타 확률 비례 피해량 증가: 0~100%, 치명타 확률에 비례 ⇒ 0~120%, 치명타 확률에 비례", "기본 지속 효과 챔피언 대상 공격 시 (기본 및 Q - 무형의 검 사용) 체력 회복량: 감소 후 피해량의 0~15%, 치명타 확률에 비례 ⇒ 감소 후 피해량의 0~20%, 치명타 확률에 비례"],
  ["지속 피해량: 15/30/45 (+추가 공격력의 35%) ⇒ 15/30/45 (+추가 공격력의 28%)", "총 피해량: 185/345/505 (+추가 공격력의 260%) ⇒ 185/345/505 (+추가 공격력의 232%)", "체력 회복량: 감소 후 피해량의 30~45%, 치명타 확률에 비례 ⇒ 감소 후 피해량의 20~50%, 치명타 확률에 비례"]],
  
  [["기본 체력 590 ⇒ 570", "기본 방어력 30 ⇒ 27"],
  ["체력 회복 효과 증가 10% ⇒ 7.5%", "보호막 효과 증가 20% ⇒ 15%"],
  ["강화된 기본 공격 총 공격력의 110% ⇒ 총 공격력의 100%", "추가 공격 속도 15-65% (레벨에 따라) ⇒ 10-60% (레벨에 따라)"],
  ["재충전 대기 시간 24/21/18/15/12초 ⇒ 26/22.5/19/15.5/12초"]]];
}

//녹턴
class PatchContent_Nocturne{
  static List<String> BorNorM=["하향","상향","상향","하향","상향"];
  static List<String> patchVer=["12.18","12.17","12.14","12.10","12.2"];
  static List<String> patchNoteLink= [PatchNoteLink.link[11],PatchNoteLink.link[12],PatchNoteLink.link[15], PatchNoteLink.link[19]
  ,PatchNoteLink.link[27]];
  static List<List<String>> Detail_Title =[["기본 능력치"],
  ["기본 능력치","기본 지속 효과 - 그림자 칼날"],
  ["기본 지속 효과 - 그림자 칼날"],
  ["기본 지속 효과 - 그림자 칼날"],
  ["기본 능력치", "Q - 황혼의 인도자"]];
  static List<List<List<String>>> Detail_Content =[[["공격력 증가량 3.1 ⇒ 2.6"]],
  
  [["공격 속도 계수 0.668 ⇒ 0.721"],
  ["재사용 대기시간 14초 ⇒ 13초"]],
  
  [["미니언 대상 피해량 이제 공격 대상으로 지정한 미니언에게 입히는 피해량이 50% 감소하지 않습니다. (참고: 녹턴의 기본 지속 효과 - 그림자 칼날에 피해를 입는 다른 모든 미니언에게는 여전히 50% 감소된 피해를 입힙니다.)"]],
  
  [["강화된 기본 공격 시 체력 회복량 적중한 적 하나당 15~40 (레벨에 따라) (+주문력의 15%) ⇒ 13~30 (레벨에 따라) (+주문력의 30%) (미니언 대상으로 여전히 50% 감소)"]],
  
  [["체력 증가량 85 >> 95"],
  ["공격력 계수 75% ⇒ 85%"]]];
}

//누누와윌럼프
class PatchContent_Nunu{
  static List<String> BorNorM=["상향", "상향","상향","상향","하향","하향"];
  static List<String> patchVer=["13.19", "12.22","12.19","12.11","12.10","12.4"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[12], PatchNoteLink.link[7],PatchNoteLink.link[10],PatchNoteLink.link[18], PatchNoteLink.link[19]
  ,PatchNoteLink.link[25]];
  static List<List<String>> Detail_Title =[
    ["E - 눈덩이 팡팡팡"],
    ["Q - 잡아먹기"],
  ["R - 절대 영도"],
  ["Q - 잡아먹기","E - 눈덩이 팡팡팡"],
  ["Q - 잡아먹기"],
  ["기본 능력치", "Q - 잡아먹기"]];
  static List<List<List<String>>> Detail_Content =[
    [["타격당 마법 피해량: 16/24/32/40/48 (+주문력의 10%) ⇒ 16/24/32/40/48 (+주문력의 15%)", "최대 총 마법 피해량: 144/216/288/360/432 (+주문력의 90%) ⇒ 144/216/288/360/432 (+주문력의 135%) (참고: 적을 속박할 때 발생하는 피해를 포함하면 총 피해량은 164/246/328/410/492(+주문력의 215%)입니다.)"]],

    [["챔피언이 아닌 대상에게 입히는 고정 피해량: 340/500/660/820/980 ⇒ 400/600/800/1,000/1,200"]],

  [["마법 피해량: 625/950/1,275 (+주문력의 250%) ⇒ 625/950/1,275 (+주문력의 300%)"]],
  
  [["챔피언 이외의 적 대상 체력 회복량 65/95/125/155/185 (+주문력의 70%)(+추가 체력의 6%) ⇒ 65/95/125/155/185 (+주문력의 90%) (+추가 체력의 10%)", "챔피언 대상 체력 회복량 39/57/75/93/111 (+주문력의 42%) (+추가 체력의 3.6%) ⇒ 39/57/75/93/111 (+주문력의 54%) (+추가 체력의 6%)"],
  ["재사용 대기시간 14초 (모든 스킬 레벨에서) ⇒ 14/13/12/11/10초"]],
  
  [["챔피언 이외의 적 대상 기본 체력 회복량 75/110/145/180/215 (+주문력의 90%) (+추가 체력의 10%) ⇒ 65/95/125/155/185 (+주문력의 70%) (+추가 체력의 6%) (챔피언을 대상으로 여전히 60% 감소)"]],
  
  [["체력 증가량 82 ⇒ 76", "18레벨 체력 1,934 ⇒ 1,832"],
  ["챔피언 대상 체력 회복량 60/88/116/144/172 (+주문력의 72%) (+추가 체력의 8%) ⇒ 45/66/87/108/129 (+주문력의 54%) (+추가 체력의 6%)"]]];
}

//올라프
class PatchContent_Olaf{
  static List<String> BorNorM=["상향", "상향", "하향","상향","조정","하향","조정"];
  static List<String> patchVer=["14.8", "14.7", "13.7", "12.13","12.11","12.10","12.9"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[25], PatchNoteLinkPlus.link[24],PatchNoteLinkPlus.link[0], PatchNoteLink.link[16],PatchNoteLink.link[18],
  PatchNoteLink.link[19],PatchNoteLink.link[20]];
  static List<List<String>> Detail_Title =[
    ["Q - 역류"],
    ["Q - 역류", "W - 버티기", "E - 무모한 강타", "R - 라그나로크"],
    ["기본 지속 효과 - 광전사의 분노","Q - 역류"],
  ["기본 능력치", "기본 지속 효과 - 광전사의 분노","Q - 역류"],
  ["기본 지속 효과 - 광전사의 분노", "Q - 역류","W - 버티기", "R - 라그나로크"],
  ["W - 버티기"],
  ["기본 능력치", "기본 지속 효과 - 광전사의 분노", "Q - 역류", "W - 버티기", "R - 라그나로크"]];
  static List<List<List<String>>> Detail_Content =[
    [["몬스터 대상 추가 피해량: 5/10/15/20/25 ⇒ 5/15/25/35/45"]],

    [["(신규) 추가 몬스터 피해량: 5/10/15/20/25"],
    ["추가 공격 속도 지속시간: 4초 ⇒ 5초", "마나 소모량: 30 ⇒ 50"],
    ["돌려받는 재사용 대기시간: 기본 공격당 1초 ⇒ 기본 공격당 1초, 몬스터 대상 기본 공격당 2초"],
    ["마나 소모량: 0 ⇒ 100"]],
    
    [["공격 속도: 60~100% (레벨에 따라) ⇒ 50~100% (레벨에 따라)"],
  ["물리 피해량: 70/120/170/220/270 (+추가 공격력의 100%) ⇒ 65/115/165/215/265 (+추가 공격력의 100%)"]],
  
  [["체력 재생 8.5 ⇒ 6.5","체력 재생 증가량 0.9 ⇒ 0.6", "18레벨 체력 재생 23.8 ⇒ 16.7"],
  ["최대 추가 공격 속도 40~100% (레벨에 따라) ⇒ 60~100% (레벨에 따라)"],
  ["마나 소모량 40/45/50/55/60 ⇒ 50/55/60/65/70"]],
  
  [["생명력 흡수 최대치 도달에 필요한 체력 최대 체력의 22.5% ⇒ 최대 체력의 30%", "생명력 흡수 10~30% (레벨에 따라) ⇒ 8~25% (레벨에 따라)"],
  ["방어력 감소 20/22.5/25/27.5/30% ⇒ 20% (모든 스킬 레벨에서)", "피해량 60/110/160/210/260 (+추가 공격력의 100%) ⇒ 70/120/170/220/270 (+추가 공격력의 100%)", "재사용 최소 대기시간 3초 ⇒ 2.5초"],
  ["보호막 흡수량 10/40/70/100/130 (+잃은 체력의 22.5%) ⇒ 10/40/70/100/130 (+잃은 체력의 17.5%)", "재사용 대기시간 16/14.5/13/11.5/10초 ⇒ 16/15/14/13/12초"],
  ["기본 지속 효과 방어력 및 마법 저항력 10/25/40 ⇒ 10/20/30"]],
  
  [["보호막 흡수량 10/45/80/115/150 (+잃은 체력의 25%) ⇒ 10/40/70/100/130 (+잃은 체력의 22.5%)"]],
  
  [["공격력 증가량 3.5 ⇒ 4.7", "18레벨 공격력 127.5 ⇒ 148", "체력 증가량 100 ⇒ 105", "마나 증가량 42 ⇒ 50"],
  ["최대 추가 공격 속도 99% ⇒ 40~100% (레벨에 따라)", "(신규) 포기하지마 이제 기본 지속 효과 - 광전사의 분노가 올라프의 잃은 체력에 따라 10~30%(레벨에 따라)의 생명력 흡수 효과를 부여합니다.", "광전사의 수학 추가 효과는 체력이 0%일 때 최대치에 도달합니다. ⇒ 체력이 30%일 때 최대치에 도달합니다."],
  ["재사용 대기시간 7초 ⇒ 9초", "피해량 80/125/170/215/260 ⇒ 60/110/160/210/260", "최소 사거리 300 ⇒ 425", "마나 소모량 60 (모든 스킬 레벨에서) ⇒ 40/45/50/55/60", "(신규) 갑옷을 너무 믿지 마 이제 Q - 역류가 적중한 챔피언의 방어력을 4초 동안 20/22.5/25/27.5/30% 감소시킵니다. (참고: 도끼가 적중할 때마다 지속시간 초기화)", "도끼 던지기의 달인 이제 도끼를 집으면 Q - 역류의 재사용 대기시간이 초기화되지만 도끼를 3초마다 한 번씩만 던질 수 있습니다. (참고: 3초의 재사용 대기시간은 스킬 가속의 영향을 받습니다.)", "지나가요 Q - 역류의 편의성을 개선하여 Q - 역류를 사용했을 때 더 일관적으로 정글 몬스터를 통과할 수 있도록 했습니다."],
  ["새로운 이름 광포한 공격 ⇒ 버티기", "재사용 대기시간 16초 (모든 스킬 레벨에서) ⇒ 16/14.5/13/11.5/10초", "공격 속도 50/60/70/80/90% ⇒ 40/50/60/70/80%", "스킬 지속시간 6초 ⇒ 4초", "(신규) 그냥 이제 W - 버티기가 올라프의 기본 공격을 초기화합니다.", "(신규) 끝까지 이제 스킬 사용 시 올라프가 2.5초 동안 10/45/80/115/150(+잃은 체력의 25%, 현재 체력의 30%를 넘을 수 없음)의 피해를 흡수하는 보호막을 얻습니다.", "(삭제) 버티고 이제 생명력 흡수 효과를 제공하지 않습니다.", "(삭제) 버텨라 이제 올라프의 잃은 체력에 따라 회복량 증가 효과를 제공하지 않습니다."],
  ["추가 공격력 15/20/25 (+공격력의 30%) ⇒ 10/20/30 (+공격력의 25%)", "지속시간 6초 ⇒ 3초", "기본 지속 효과 방어력 및 마법 저항력 20/30/40 ⇒ 10/25/40", "(삭제) 나를 막을 수 없다 이제 R - 라그나로크를 사용할 때 기본 지속 효과의 추가 저항력이 사라지지 않습니다.", "(신규) 내 분노는 무한하다 챔피언에게 기본 공격이나 E - 무모한 강타를 사용하면 R - 라그나로크의 지속시간이 2.5초 증가합니다. 올라프는 라그나로크를 무한으로 유지할 수 있습니다."]]];
}

//오리아나
class PatchContent_Orianna{
  static List<String> BorNorM=["상향", "상향", "상향","상향","하향"];
  static List<String> patchVer=["13.17", "13.12","13.4","13.1B","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[10], PatchNoteLinkPlus.link[5], PatchNoteLink.link[2],PatchNoteLink.link[4], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "W - 명령: 불협화음"],
    ["R - 명령: 충격파"],
    ["기본 능력치","W - 명령: 불협화음"],
  ["기본 지속 효과 - 시계태엽 감기","Q - 명령: 공격","W - 명령: 불협화음", "R - 명령: 충격파"],
  ["E - 명령: 보호"]];
  static List<List<List<String>>> Detail_Content =[
    [["체력 증가량: 105 ⇒ 110"],
    ["마법 피해량: 60/105/150/195/240 (+주문력의 70%) ⇒ 70/120/170/220/270 (+주문력의 70%)"]],

    [["마법 피해량: 250/350/450 (+주문력의 90%) ⇒ 250/400/550 (+주문력의 95%)"]],
    
    [["기본 방어력: 17 ⇒ 20"],
  ["마나 소모량: 70/75/80/85/90 ⇒ 60/65/70/75/80"]],
  
  [["(업데이트) 째깍 째깍: 10~50 (1, 4, 7, 10, 13, 16레벨에서) ⇒ 10~50 (레벨에 따라)(참고: 피해량은 전과 동일합니다.)"],
  ["후속 대상 타격 시 피해량 감소: 구체는 처음 타격한 대상에게 100%의 피해를 입히며, 이후 다른 대상을 타격할 때마다 10%씩 감소한 피해를 입힙니다. ⇒ 구체는 처음 타격한 대상에게 100%의 피해를 입히며, 이후 타격하는 모든 대상에게 70%의 피해를 입힙니다."],
  ["마나 소모량: 70/80/90/100/110 ⇒ 70/75/80/85/90"],
  ["마법 피해량: 200/275/350 (+주문력의 80%) ⇒ 250/350/450 (+주문력의 90%)"]],
  
  [["보호막 흡수량 60/100/140/180/220 (+주문력의 50%) ⇒ 55/90/125/160/195 (+주문력의 45%)"]]];
}

//오른
class PatchContent_Ornn{
  static List<String> BorNorM=["상향","조정"];
  static List<String> patchVer=["14.6", "12.21"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[23],PatchNoteLink.link[8]];
  static List<List<String>> Detail_Title =[
    ["E - 화염 돌진"],
    ["R - 대장장이 신의 부름"]];
  static List<List<List<String>>> Detail_Content =[
    [["재사용 대기시간: 16/15/14/13/12초 ⇒ 14/13.5/13/12.5/12초"]],

    [["최대 둔화율: 40/50/60%⇒60% (모든 스킬 레벨에서)"]]];
}

//판테온
class PatchContent_Pantheon{
  static List<String> BorNorM=["조정","상향","상향"];
  static List<String> patchVer=["13.5","12.14","12.7"];
  static List<String> patchNoteLink= [PatchNoteLink.link[1],PatchNoteLink.link[15],PatchNoteLink.link[22]];
  static List<List<String>> Detail_Title =[["기본 능력치","Q - 혜성의 창","E - 방패 돌격"],
  ["Q - 혜성의 창"],
  ["기본 능력치", "Q - 혜성의 창","E - 방패 돌격","R - 거대 유성"]];
  static List<List<List<String>>> Detail_Content =[[["5초당 기본 체력 재생: 7.5 ⇒ 6","공격 속도: 0.644 ⇒ 0.658"],
  ["재사용 대기시간: 13/11.75/10.5/9.25/8초 ⇒ 11/10.25/9.5/8.75/8초", "마나 소모량: 30 ⇒ 25", "Q - 혜성의 창 짧게 누를 시 준비 시간: 0.25초 ⇒ 0.2초"],
  ["재사용 대기시간: 22/20.5/19/17.5/16초 ⇒ 22/21/20/19/18초"]],
  
  [["미니언 및 몬스터 대상 피해량 미니언 및 몬스터에게 70%의 피해를 입힙니다. ⇒ 미니언에게 70%의 피해를 입히고 몬스터에게 105%의 피해를 입힙니다."]],
  
  [["기본 체력 재생 9 ⇒ 7.5"],
  ["짧게 누를 때 사거리 550 유닛 ⇒ 600 유닛", "짧게 누를 때 범위 150 유닛 ⇒ 120 유닛"],
  ["(삭제) 흔들리지 않는 방패 이제 E - 방패 돌격이 활성화되어 있을 때 뒤로 이동해도 판테온의 이동 속도가 감소하지 않습니다."],
  ["판테온의 불시착 이제 판테온이 지정한 위치에 0.25초 더 빠르게 착지합니다."]]];
}

//뽀삐
class PatchContent_Poppy{
  static List<String> BorNorM=["상향","하향","하향","상향"];
  static List<String> patchVer=["13.8","12.16","12.10","12.8"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[1],PatchNoteLink.link[13], PatchNoteLink.link[19], 
  PatchNoteLink.link[21]];
  static List<List<String>> Detail_Title =[
    ["Q - 망치 강타","W - 굳건한 태세"],
    ["Q - 망치 강타"],
  ["기본 지속 효과 - 강철의 외교관"],
  ["W - 굳건한 태세","R - 수호자의 심판"]];
  static List<List<List<String>>> Detail_Content =[
    [["대상 체력 비례 피해량: 8% ⇒ 9%"],
    ["추가 저항력: 10% ⇒ 12% (참고: 뽀삐의 체력이 40% 미만일 때는 효과가 두 배인 24%로 늘어납니다.)"]],
    
    [["미니언/몬스터 대상 최대 피해량 50/80/110/140/170 ⇒ 30/60/90/120/150 (참고: 이 최대 피해량은 최초 사용과 재사용시 모두 적용됩니다.)"]],

  [["보호막 흡수량 최대 체력의 15/17.5/20% ⇒ 13/15.5/18% (1/7/13레벨에서)"]],

  [["재사용 대기시간 24/22/20/18/16초 ⇒ 20/18/16/14/12초"],
  ["짧게 눌렀을 때 공중에 띄우기 지속시간 0.75초 ⇒ 1초", "충전 시 탄도체 속도 2,000 ⇒ 2,500", "충전 시 밀어내는 거리 2,400 ⇒ 3,400", "충전 취소 시 재사용 대기시간 반환 30초 ⇒ 15초"]]];
}

//파이크
class PatchContent_Pyke{
  static List<String> BorNorM=["상향", "상향","상향","하향","조정"];
  static List<String> patchVer=["14.3","13.19","13.3","12.10","12.9"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[20], PatchNoteLinkPlus.link[12], PatchNoteLink.link[3], PatchNoteLink.link[19],PatchNoteLink.link[20]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "Q - 뼈 작살", "W - 유령 잠수", "E - 망자의 물살"],
    ["기본 능력치", "W - 유령 잠수"],
    ["E - 망자의 물살"],
  ["기본 지속 효과 - 가라앉은 자들의 축복"],
  ["기본 지속 효과 - 가라앉은 자들의 축복","Q - 뼈 작살","R - 깊은 바다의 처형"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 방어력: 45 ⇒ 47"],
    ["피해량: 100/150/200/250/300 (+추가 공격력의 60%) ⇒ 100/150/200/250/300 (+추가 공격력의 75%)", "마나 소모량: 74/78/82/86/90 ⇒ 70/75/80/85/90"],
    ["추가 이동 속도: 40% (+물리 관통력 1당 1.5%) ⇒ 45% (+물리 관통력 1당 2%)"],
    ["피해량: 105/145/185/225/265 (+추가 공격력의 100%) ⇒ 100/150/200/250/300 (+추가 공격력의 100%)"]],

    [["체력 증가량: 104 ⇒ 110"],
    ["재사용 대기시간: 12/11.5/11/10.5/10초 ⇒ 12/11/10/9/8초"]],

    [["물리 피해량: 105/135/165/195/225 (+추가 공격력의 100%) ⇒ 105/145/185/225/265 (+추가 공격력의 100%)"]],
  
  [["회색 체력 상한 최대 체력의 60% ⇒ 55%", "회색 체력으로 비축하는 피해량 10% (+물리 관통력 1당 0.25%) ⇒ 9% (+물리 관통력 1당 0.2%)", "적이 둘 이상 있을 때 회색 체력으로 비축하는 피해량 45% (+물리 관통력 1당 0.5%) ⇒ 40% (+물리 관통력 1당 0.4%)"]],
  
  [["주변에 적이 둘 이상 있을 때 회색 체력으로 비축하는 피해량 40% (+물리 관통력당 0.5%) ⇒ 45% (+물리 관통력당 0.5%)"],
  ["뼈에 좋은 이제 Q - 뼈 작살이 적 챔피언에게 적중하면 마나를 돌려받습니다.","마나 소모량 50/55/60/65/70 ⇒ 74/78/82/86/90", "마나 반환: 50% ⇒ 75%"],
  ["재사용 대기시간 120/100/80초 ⇒ 100/85/70초", "(삭제) 가벼운 돈주머니 이제 파이크가 R - 깊은 바다의 처형으로 적 챔피언을 처형해도 �수당� 골드를 받지 않습니다. (마지막으로 처치에 관여한 아군은 �수당�을 받습니다)", "(삭제) 추가 수당은 없어 이제 아군이 파이크의 R - 깊은 바다의 처형 스킬 범위 내에 있는 적을 처치해도 파이크가 �수당� 골드를 획득하지 않습니다."]]];
}

//키아나
class PatchContent_Qiyana{
  static List<String> BorNorM=["상향", "상향","하향","하향","하향"];
  static List<String> patchVer=["13.24", "13.5","12.15","12.4","12.2"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[17],PatchNoteLink.link[1],PatchNoteLink.link[14],PatchNoteLink.link[25],
  PatchNoteLink.link[27]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치"],
    ["Q - 원소의 분노/이쉬탈의 칼날","E - 대담무쌍"],
  ["기본 지속 효과 - 왕가의 특권"],
  ["기본 지속 효과 - 왕가의 특권"],
  ["기본 능력치","Q - 이쉬탈의 칼날"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 마나: 325 ⇒ 375", "마나 증가량: 50 ⇒ 60"]],
    
    [["물리 피해량: 50/80/110/140/170 (+추가 공격력의 75%)⇒ 50/85/120/155/190 (+추가 공격력의 75%)"],
  ["재사용 대기시간: 12/11/10/9/8초 ⇒ 11/10/9/8/7초"]],
  
  [["피해량 15~83 (레벨에 따라)(+추가 공격력의 45%)(+주문력의 30%) ⇒ 15~83 (레벨에 따라)(+추가 공격력의 30%)(+주문력의 30%)"]],
  
  [["추가 물리 피해량 15~83 (레벨에 따라) (+추가 공격력의 55%) (+주문력의 30%) ⇒ 15~83 (레벨에 따라) (+추가 공격력의 45%) (+주문력의 30%)"]],
  
  [["기본 체력 재생 7.5 ⇒ 6"],
  ["수풀 구역 지속시간 3.5초 ⇒ 3초"]]];
}

//퀸
class PatchContent_Quinn{
  static List<String> BorNorM=["하향", "조정", "상향"];
  static List<String> patchVer=["13.20", "13.17", "12.3"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[13], PatchNoteLinkPlus.link[10], PatchNoteLink.link[26]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치"],
    ["기본 능력치", "Q - 실명 공격", "E - 공중제비"],
    ["W - 예리한 감각","R - 공중 강습"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 체력: 603 ⇒ 565", "이동 속도: 335 ⇒ 330", "공격력 증가량: 2.4 ⇒ 2.7"]],

    [["체력 증가량: 99 ⇒ 107"],
    ["물리 피해량: 20/45/70/95/120 (+공격력의 80/90/100/110/120%) (+주문력의 50%) ⇒ 20/40/60/80/100 (+공격력의 80/90/100/110/120%) (+주문력의 50%)"],
    ["물리 피해량: 40/70/100/130/160 (+추가 공격력의 20%) ⇒ 40/65/90/115/140 (+추가 공격력의 20%)"]],
    
    [["추가 공격 속도 20/30/40/50/60% ⇒ 28/36/44/52/60%"],
  ["강습 피해량 공격력의 40% ⇒ 공격력의 70%"]]];
}

//라칸
class PatchContent_Rakan{
  static List<String> BorNorM=["하향","상향","조정", "상향","상향","하향"];
  static List<String> patchVer=["13.8","13.3","12.22", "12.19","12.11","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[1],PatchNoteLink.link[3],PatchNoteLink.link[7],
  PatchNoteLink.link[10],
  PatchNoteLink.link[18], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ['기본 능력치'],
    ["Q - 빛나는 깃털","W - 화려한 등장"],
  ["기본 능력치"],
  ["기본 지속 효과 - 요술 망토","Q - 빛나는 깃털"],
  ["Q - 빛나는 깃털", "W - 화려한 등장","E - 전쟁무도"],
  ["기본 지속 효과 - 요술 망토", "Q - 빛나는 깃털"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 방어력: 32 ⇒ 30", "방어력 증가량: 5.1 ⇒ 4.9"]],
    
    [["재사용 대기시간: 12/11/10/9/8초 ⇒ 11/10/9/8/7초", "마나 소모량: 60 ⇒ 45", "기본 체력 회복량: 30~115 (레벨에 따라) (+주문력의 55%) ⇒ 40~210 (레벨에 따라) (+주문력의 55%)"],
  ["마법 피해량: 70/125/180/235/290 (+주문력의 70%) ⇒ 70/120/170/220/270 (+주문력의 80%)"]],
  
  [["기본 공격 유형: 원거리 ⇒ 근접"]],
  
  [["보호막 흡수량: 30~225 (레벨에 따라) (+주문력의 85%) ⇒ 30~225 (레벨에 따라) (+주문력의 95%)"],
  ["마법 피해량: 70/115/160/205/250 (+주문력의 60%) ⇒ 70/115/160/205/250 (+주문력의 70%)"]],
  
  [["체력 회복량 18~90 (레벨에 따라) ⇒ 30~115 (레벨에 따라)"],
  ["재사용 대기시간 18/16.5/15/13.5/12초 ⇒ 16/14.5/13/11.5/10초"],
  ["마나 소모량 60/70/80/90/100 ⇒ 40/45/50/55/60","보호막 흡수량 35/60/85/110/135 (+주문력의 70%) ⇒ 50/75/100/125/150 (+주문력의 70%)"]],
  
  [["보호막 흡수량 33~254 (레벨에 따라) (+주문력의 90%) ⇒ 30~225 (레벨에 따라) (+주문력의 85%)"],
  ["체력 회복량 18~120 (레벨에 따라) (+주문력의 70%) ⇒ 18~90 (레벨에 따라) (+주문력의 55%)"],
  ["보호막 흡수량 40/65/90/115/140 (+주문력의 80%) ⇒ 35/60/85/110/135 (+주문력의 70%)"]]];
}

//람머스
class PatchContent_Rammus{
  static List<String> BorNorM=["상향", "하향", "하향", "하향","조정","하향","상향","상향","상향"];
  static List<String> patchVer=["13.22", "13.21", "13.7", "13.5","13.1","12.23","12.22","12.20","12.15"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[15],PatchNoteLinkPlus.link[14], PatchNoteLinkPlus.link[0],PatchNoteLink.link[1],PatchNoteLink.link[5],
  PatchNoteLink.link[6],PatchNoteLink.link[7],PatchNoteLink.link[9],PatchNoteLink.link[14]];
  static List<List<String>> Detail_Title =[
    ["W - 몸 말아 웅크리기"],
    ["Q - 대회전", "W - 몸 말아 웅크리기"],
    ["W - 몸 말아 웅크리기"],
  ["기본 능력치","Q - 대회전"],
  ["기본 능력치","W - 몸 말아 웅크리기"],
  ["W - 몸 말아 웅크리기"],
  ["W - 몸 말아 웅크리기"],
  ["W - 몸 말아 웅크리기","R - 지진 폭격"],
  ["R - 지진 폭격"]];
  static List<List<List<String>>> Detail_Content =[
    [["추가 방어력: 30 (+총 방어력의 35/45/55/65/75%) ⇒ 40 (+총 방어력의 35/45/55/65/75%)"]],

    [["마법 피해량: 100/125/150/175/200 (+주문력의 100%) ⇒ 80/110/140/170/200 (+주문력의 100%)"],
    ["추가 방어력: 35 (+총 방어력의 40/50/60/70/80%) ⇒ 30 (+총 방어력의 35/45/55/65/75%)"]],

    [["추가 방어력: 35 (+총 방어력의 40/55/70/85/100%) ⇒ 35 (+총 방어력의 40/50/60/70/80%)"]],
  
  [["공격력 증가량: 3.5 ⇒ 2.75"],
  ["마법 피해량: 100/130/160/190/220 (+주문력의 100%) ⇒ 100/125/150/175/200 (+주문력의 100%)"]],

  [["기본 공격력: 56 ⇒ 55", "기본 체력: 634 ⇒ 675","기본 방어력: 36 ⇒ 40"],
  ["고정 방어력: 40 ⇒ 35", "방어력 계수: 60/70/80/90/100% ⇒ 40/55/70/85/100%", "(신규) 계산? 그래: 람머스의 W - 몸 말아 웅크리기로 증가하는 고정 저항력 수치가 이제 W - 몸 말아 웅크리기가 제공하는 저항력 비율로도 증폭됩니다."]],
  
  [["재사용 대기시간: 6초 ⇒ 7초", "추가 방어력: 50 ⇒ 40", "추가 마법 저항력: 15 ⇒ 10"]],
  
  [["추가 방어력 기본 수치: 40 ⇒ 50", "추가 마법 저항력 기본 수치: 10 ⇒ 15"]],

  [["자신 대상 둔화율: 30% ⇒ 0% (삭제)"],
  ["돌진 속도: 이동 속도의 105% ⇒ 이동 속도의 110%"]],
  
  [["재사용 대기시간 110/95/80초 ⇒ 90초 (모든 스킬 레벨에서)", "기본 스킬 사거리 600 ⇒ 800", "돌진 사거리 증가량 1.3 ⇒ 1.5 (참고: 이동 속도에 따라 사거리가 증가하는 비율입니다.)", "최소 돌진 속도 700 ⇒ 900", "최대 돌진 속도 1,800 ⇒ 2,000"]]];
}

//렉사이
class PatchContent_RekSai{
  static List<String> BorNorM=["하향", "조정", "상향", "조정", "하향", "하향", "하향", "하향", "상향","하향","하향"];
  static List<String> patchVer=["14.7", "14.6", "14.5", "14.4", "13.19", "13.16","13.14", "13.13", "13.11", "12.19","12.1"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[24],PatchNoteLinkPlus.link[23],PatchNoteLinkPlus.link[22],PatchNoteLinkPlus.link[21], PatchNoteLinkPlus.link[12], PatchNoteLinkPlus.link[9], PatchNoteLinkPlus.link[7], PatchNoteLinkPlus.link[6], PatchNoteLinkPlus.link[4], PatchNoteLink.link[10],PatchNoteLink.link[28]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 제르사이의 분노"],
    ["W - 매복", "R - 공허의 돌진"],
    ["기본 능력치", "Q - 여왕의 진노", "W - 매복 / 돌출", "E - 땅굴 파기", "E - 성난 이빨", "R - 공허의 돌진"],
    ["기본 능력치", "기본 지속 효과 - 제르사이의 분노", "Q - 여왕의 진노 (돌출 상태)", "Q - 먹잇감 추적 (매복 상태)", "W - 매복", "W - 돌출", "E - 땅굴 파기", "E - 성난 이빨", "R - 공허의 돌진"],
    ["기본 지속 효과 - 제르사이의 분노", "Q - 여왕의 진노", "W - 매복", "W - 돌출"],
    ["Q - 여왕의 진노"],
    ["W - 돌출", "E - 성난 이빨"],
    ["기본 능력치"],
    ["기본 지속 효과 - 제르사이의 분노", "Q - 여왕의 진노 (돌출 상태)", "Q - 먹잇감 추적 (매복 상태)", "W - 돌출"],
    ["기본 능력치"],
  ["E - 성난 이빨", "E - 땅굴 파기"]];

  static List<List<List<String>>> Detail_Content =[
    [["미니언, 와드, 식물 대상 분노 획득량: 12.5 ⇒ 5", "체력 회복량: 최대 체력의 12~20% (레벨에 따라) ⇒ 10~20% (레벨에 따라)"]],

    [["버그 수정: 이제 우클릭으로 공격 시 언제나 주 대상에게 피해를 입히고 공중으로 띄웁니다. 밀리오 또는 고속 연사포로 인해 사거리가 늘어난 경우에도 동일하게 적용됩니다. 이 부분은 14.5 패치 기간에 추가 패치로 일부 수정되었습니다."],
    ["편의성 개선 업데이트: 이제 R - 공허의 돌진을 사용 사거리 밖에서 미리 입력할 수 있으며, 미리 입력 시 렉사이는 스킬 사용 사거리까지 이동합니다.", "버그 수정: 렉사이가 R - 공허의 돌진을 사용한 직후에 기절당하면 스킬이 취소되던 버그를 수정했습니다."]],

    [["공격 준비 시간: 26.67% (+공격 속도의 100%) ⇒ 20% (+공격 속도의 60%) (참고: 이는 1레벨에 전체 공격 애니메이션 출력 시간이 25% 감소한다는 의미이며, 18레벨에 발걸음 분쇄기, 룬 및 Q - 여왕의 진노 사용 효과 적용 시 3% 감소합니다.)", "기본 공격 사용 프레임: 12 ⇒ 10 (참고: 이는 기본 공격이 공격 애니메이션에서 20% 빠르게 피해를 입힌다는 의미입니다.)", "치명타 사용 프레임: 9 ⇒ 10"],
    ["편의성 개선 변경사항: 더 이상 기본 공격이 중간에 취소되지 않으며, 이제 다른 강화된 공격과 같아집니다.", "사용 프레임: 12 ⇒ 9 (참고: 이는 강화된 공격이 공격 애니메이션에서 33% 빠르게 타격한다는 의미입니다.)", "버그 수정: 이제 공격이 한 챔피언에게만 적중한 경우 쇼진의 창 중첩을 획득합니다."],
    ["(신규) 들뜨는 변화: 이제 돌출은 적용 가능한 범위 내 모든 대형 몬스터를 공중으로 띄웁니다.", "(신규) 들뜨지 않는 변화: 이제 돌출은 최근 공중으로 띄워져 돌출에 면역인 대상에게도 피해를 입힙니다. (공중으로 띄우지는 않습니다.)", "버그 수정: 렉사이가 매복 후 빠르게 돌출한 경우 기본 공격이 멈추던 버그를 수정했습니다."],
    ["버그 수정 진행 중: 렉사이가 벽을 넘을 경우 가끔 돌진에 실패하던 버그의 발생 빈도를 감소시켰습니다. 해당 버그가 발생하는 경우를 더 지켜보고 해결 방안을 찾아 문제를 수정하도록 하겠습니다."],
    ["분노 100에서의 추가 피해량: 대상 최대 체력의 6/8/10/12/14% ⇒ 대상 최대 체력의 8/9.5/11/12.5/14%","몬스터 대상 최대 추가 피해량: 60~400 (레벨에 따라) ⇒ 75~400 (레벨에 따라)"],
    ["피해량: 100/250/400 (+추가 공격력의 100%) (+대상이 잃은 체력의 20/25/30%) ⇒ 150/300/450 (+추가 공격력의 100%) (+대상이 잃은 체력의 25/30/35%)"],],

    [["기본 이동 속도: 335 ⇒ 340", "기본 체력 재생: 7.5 ⇒ 2.5", "체력 재생 증가량: 0.65 ⇒ 0.5"],
    ["최대 체력 회복량: 10 (+최대 체력의 2~10% (레벨에 따라)) ⇒ 최대 체력의 12~20% (레벨에 따라)", "(신규) 챔피언이 아닌 대상에게서 분노 생성: 미니언, 식물 그리고 와드에 기본 공격이나 스킬이 적중하면 50%의 분노만 생성됩니다."],
    ["(신규) 공격 유형: Q - 여왕의 진노가 이제 스킬 기반이 아닌 기본 공격 기반으로 작용합니다. 즉, 전체 공격 시간 및 공격 사이의 시간은 렉사이의 실제 공격 속도에 기반합니다.", "(신규) 추가 공격 속도: 이제 Q - 여왕의 진노가 기본 공격 3회에 대해 45%의 추가 공격 속도를 얻습니다. (참고: 결과적으로는 기존 스킬 기반의 공격 흐름과 비슷해집니다.)"],
    ["재사용 대기시간: 12/11.5/11/10.5/10초 ⇒ 10초 (모든 스킬 레벨에서)", "피해량: 60/95/130/165/200 (+추가 공격력의 50%) (+주문력의 70%)의 물리 피해 ⇒ 50/80/110/140/170 (+추가 공격력의 25%) (+주문력의 70%)의 마법 피해"],
    ["매복 상태일 때 추가 이동 속도: 5/10/15 (1/6/11레벨에서) ⇒ 5/10/15/20/25 (스킬 레벨에 따라)", "시야 반경: 25% ⇒ 35%"],
    ["(신규) 무리짓는 건 무서워: W - 돌출이 이제 주 대상만이 아닌 모든 챔피언을 1초간 공중에 띄웁니다.", "(삭제) 달려!: W - 돌출이 더 이상 적을 공중에 띄운 후 0.5초간 40% 둔화시키지 않습니다.", "피해량: 50/85/120/155/190 (+추가 공격력의 80%)의 물리 피해 ⇒ 50/75/100/125/150 (+주문력의 80%)의 마법 피해"],
    ["재사용 대기시간: 26/24/22/20/18초 ⇒ 18/17/16/15/14초", "땅굴 재사용 대기시간: 10/8/6/4/2초 ⇒ 6/5/4/3/2초","일반 시전 돌진 속도: 550 + 장화로 얻은 이동 속도 ⇒ 500 + 전체 이동 속도 (참고: 이제 우클릭 돌진 속도와 동일합니다.)", "(삭제) 편의성 개선: E - 땅굴 파기를 일반 시전으로 사용할 때 생기던 0.05초의 지체가 삭제됩니다.", "(신규) 편의성 개선: 렉사이가 이미 생성된 땅굴을 약 20% 더 빠르게 사용합니다 (참고: 최종 돌진 속도는 바뀌지 않습니다.)"],
    ["물리 피해량: 5/10/15/20/25 (+공격력의 70%) ⇒ 총공격력의 100%", "분노 100 추가 피해량: 고정 피해로 피해량 두 배 ⇒ +대상 최대 체력의 6~14% (스킬 레벨에 따라)", "재사용 대기시간: 12초 ⇒ 10초", "(신규) 번쩍: 이제 E - 성난 이빨이 최대 강화 상태일 때 치명타 장식 효과를 표시합니다."],
    ["물리 피해량: 100/250/400 (+추가 공격력의 175%) (+대상이 잃은 체력의 20/25/30%) ⇒ 100/250/400 (+추가 공격력의 100%) (+대상이 잃은 체력의 20/25/30%)"]],

    [["매복 상태일 때 최대 회복량 15~125 (+최대 체력의 2~12% (3레벨마다 증가)) ⇒ 10 (+최대 체력의 2~10% (레벨마다 증가))"],
    ["추가 물리 피해량: 총 공격력의 34/38/42/46/50% ⇒ 총 공격력의 30/35/40/45/50%"],
    ["추가 이동 속도: 15/20/25/30 (1/6/11/16레벨에서) ⇒ 5/10/15 (1/6/11레벨에서)"],
    ["물리 피해량: 50/65/80/95/110 (+추가 공격력의 80%) ⇒ 50/85/120/155/190 (+추가 공격력의 80%)"]],

    [["추가 물리 피해량: 21/27/33/39/45 (+추가 공격력의 50%) ⇒ 총 공격력의 34/38/42/46/50%"]],

    [["물리 피해량: 55/70/85/100/115 (+추가 공격력의 80%) ⇒ 50/65/80/95/110 (+추가 공격력의 80%)"], 
    ["물리 피해량: 55/60/65/70/75 (+추가 공격력의 85%) ⇒ 5/10/15/20/25 (+총 공격력의 70%)"]],

    [["기본 공격력: 61 ⇒ 58", "기본 체력: 640 ⇒ 600"]],

    [["진동 감지 주기: 1.5초 ⇒ 1초", "최대 분노에서 체력 회복량: 20~190 (레벨에 따라) ⇒ [15 (+3레벨마다 20)] + [2% (+3레벨마다 최대 체력의 2%)]"],
    ["재사용 대기시간: 4초 (모든 스킬 레벨에서) ⇒ 4/3.5/3/2.5/2 (스킬 레벨에 따라)", "효과 지속시간: 5초 ⇒ 3초", "(신규)공격을 멈추지 마세요: 이제 기본 공격 시 Q - 여왕의 진노 효과 지속시간이 초기화됩니다.", "(삭제)벌써 끝나 버리다니: 렉사이가 1.5초 이상 매복 상태를 유지해도 Q - 여왕의 진노 효과가 더 이상 일찍 종료되지 않습니다."],
    ["시야 지속시간: 2.5초 ⇒ 5초"],
    ["편의성 개선 업데이트: 대상 지정 시 사거리를 대상을 지정하지 않았을 때의 사거리와 동일한 거리로 늘렸습니다. (참고: 적을 클릭하여 공중에 띄울 때보다 W 키를 눌러 가장자리에 걸치도록 공중에 띄울 때 더 긴 사거리가 적용되어, 최대 사거리를 활용하기 위해서는 W 키를 사용해야만 했던 최적화 방식을 이제 따르지 않아도 됩니다.)"]],

    [["기본 공격력: 64 ⇒ 61"]],
  
  [["물리 피해량 50/60/70/80/90 (+추가 공격력의 85%) ⇒ 55/60/65/70/75 (+추가 공격력의 85%)"],
  ["재사용 대기시간 26/23/20/17/14초 ⇒ 26/24/22/20/18초"]]];
}

//렐
class PatchContent_Rell{
  static List<String> BorNorM=["하향", "하향", "조정", "하향", "조정", "하향", "조정", "상향","하향"];
  static List<String> patchVer=["14.7", "13.18", "13.15", "13.14", "13.13", "13.12", "13.11","12.17","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[24],PatchNoteLinkPlus.link[11],PatchNoteLinkPlus.link[8], PatchNoteLinkPlus.link[7], PatchNoteLinkPlus.link[6], PatchNoteLinkPlus.link[5], PatchNoteLinkPlus.link[4], 
  PatchNoteLink.link[12], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ['기본 능력치', "Q - 파열의 일격", "W - 붕괴/탑승", "E - 전속력"],
    ["E - 전속력"],
  ["기본 지속 효과 - 갑옷 파쇄", "Q - 파열의 일격", "W - 철마술: 탑승"],
    ["기본 능력치", "기본 지속 효과 - 갑옷 파쇄"],
    ["기본 능력치", "Q - 파열의 일격", "W - 철마술: 붕괴/탑승", "E - 전속력"],
    ["기본 능력치", "Q - 파열의 일격", "W - 철마술: 붕괴", "W - 철마술: 탑승", "E - 전속력"],
    ["기본 능력치", "기본 지속 효과 - 갑옷 파쇄", "Q - 파열의 일격", "W - 철마술: 붕괴","W - 철마술: 탑승", "E - 인력과 척력"],
    ["W - 철마술: 붕괴","E - 인력과 척력"],
  ["Q - 파멸의 일격", "W - 철마술 (붕괴)"]];

  static List<List<List<String>>> Detail_Content =[
    [["마법 저항력 증가량: 1.85 ⇒ 2.05"],
    ["추가 몬스터 피해량: 삭제"],
    ["W - 붕괴 추가 몬스터 피해량: 삭제", "W - 탑승 추가 몬스터 피해량: 삭제"],
    ["추가 몬스터 피해량: 삭제"]],

    [["추가 이동 속도 (적에게서 멀어질 경우): 15/17.5/20/22.5/25% ⇒ 12/14/16/18/20%", "추가 이동 속도 (적에게 접근할 경우): 30/35/40/45/50% ⇒ 24/28/32/36/40%"]],

  [["일관성이 핵심: 이제 모든 스킬 및 기본 공격이 피해를 먼저 입힌 후 기본 지속 효과 - 갑옷 파쇄를 적용합니다. (참고: 이전에는 Q - 파열의 일격과 W - 철마술: 탑승 그리고 R - 자기 폭풍이 기본 지속 효과 - 갑옷 파쇄를 적용한 후 피해를 입혔으며 E - 전속력과 기본 공격은 그 반대로 작동했습니다.)"],
  ["Q - 파열의 일격 점멸 상호작용: 점멸 사용 후 Q - 파열의 일격이 기존 지정 위치에 따라 발동합니다. ⇒ 점멸 사용 후 Q - 파열의 일격 각도가 고정된 채로 발동합니다. (참고: 이 변경으로 스킬이 더 직관적으로 느껴지고 예상하는 결과에 부응하게 됩니다.)"],
  ["편의성 개선 변경사항: 대상을 지정한 후 넘기기 전의 돌진 속도가 증가합니다. 이 변경으로 일부 버그가 해결되고 스킬이 더 빠르게 느껴지며 반응성이 향상됩니다.", "몬스터 승마술: 렐의 W - 철마술: 탑승이 에픽 몬스터에게 추가 피해를 입히지 않던 버그를 수정했습니다."]],


    [["기본 방어력: 39 ⇒ 36"],
    ["방어력 및 마법 저항력 강탈량: 3% ⇒ 2%", "방어력 및 마법 저항력 최소 강탈량: 1.25~3 (챔피언 레벨에 따라) ⇒ 0.8~2 (챔피언 레벨에 따라)", "방어력 및 마법 저항력 최대 강탈량: 15% ⇒ 10%"]],


    [["체력 재생 증가량: 1.7 ⇒ 1.5", "기본 마법 저항력: 32 ⇒ 30", "마법 저항력 증가량: 2.05 ⇒ 1.85"],
    ["몬스터 대상 추가 피해량: 150/220/290/360/430 ⇒ 170/245/320/395/470 (참고: 이제 Q - 파열의 일격을 먼저 올려보세요!)"],
    ["W - 철마술: 붕괴 보호막 흡수량: 35/60/85/110/135 (+최대 체력의 12%) ⇒ 15/40/65/90/110 (+최대 체력의 12%)", "보행 공격 속도: 15/20/25/30/35% ⇒ 30%"],
    ["몬스터 대상 추가 피해량: 100/145/190/235/280 ⇒ 120/165/210/255/300"]],

    [["기본 적응형 능력치: 공격력 ⇒ 주문력"],
    ["스킬 사용 시간: 0.5초 ⇒ 0.4초", "마법 피해량: 70/110/150/190/230 (+주문력의 60%) ⇒ 60/100/140/180/220 (+주문력의 60%)", "정글 몬스터 대상 피해량: 기본 피해량의 300% ⇒ 몬스터 대상 150/220/290/360/430의 추가 피해"],
    ["마법 피해량: 70/100/130/160/190 (+주문력의 60%) ⇒ 60/90/120/150/180 (+주문력의 60%)", "정글 몬스터 대상 피해량: 기본 피해량의 300% ⇒ 몬스터 대상 125/150/175/200/225의 추가 피해"],
    ["정글 몬스터 대상 피해량: 기본 피해량의 300% ⇒ 몬스터 대상 55/110/165/220/275의 추가 피해"],
    ["마법 피해량: 35/50/65/80/95 (+주문력의 50%) (+대상 최대 체력의 4%) ⇒ 25/35/45/55/65 (+주문력의 50%) (+대상 최대 체력의 3%)", "정글 몬스터 대상 피해량: 기본 피해량의 250% ⇒ 몬스터 대상 100/145/190/235/280의 추가 피해", "(신규)몬스터 대상 체력 비례 피해량 상한치: 150"]],

    [["체력 재생: 1.4 ⇒ 1.7","체력 재생 증가량: 0.11 ⇒ 0.17","공격 속도: 0.55 ⇒ 0.625","공격 속도 증가량: 0.02 ⇒ 0.015","기본 방어력: 32 ⇒ 39" , "이동 속도: 335 ⇒ 330"],
    ["기본 지속 효과 지속시간: 4초 ⇒ 5초", "방어력 및 마법 저항력 감소량: 10% ⇒ 2.5%", "(신규)쌓고 또 쌓고: 방어력 및 마법 저항력 감소 효과가 이제 대상별로 최대 5회 중첩됩니다. 렐의 모든 스킬이 기본 지속 효과 중첩을 부여합니다.", "방어력 및 마법 저항력 최소 강탈량: 5~12 (레벨에 따라) ⇒ 1.25~3 (레벨에 따라)","방어력 및 마법 저항력 강탈량: 2.5% ⇒ 3%", "(신규)망자의 저항력: 렐이 빼앗은 방어력 및 마법 저항력은 대상이 처치되어도 전체 지속시간 동안 유지됩니다.", "(삭제)말을 타고: 이제 기본 지속 효과 - 갑옷 파쇄가 적중 시 추가 마법 피해를 입히지 않습니다.", "(삭제)석양을 향해: 이제 새로운 대상 공격을 공격해도 모든 대상에 대한 기본 지속 효과 - 갑옷 파쇄의 지속시간이 초기화되지 않습니다.", "(삭제)떠나간 그대: 이제 미니언에게는 기본 지속 효과 - 갑옷 파쇄가 적용되지 않습니다."],
    ["기절의 일격: 이제 Q - 파열의 일격이 적중한 모든 대상을 0.75초 동안 기절시킵니다.", "(삭제)체력 회복? 필요 없어: 더 이상 Q - 파열의 일격이 렐이나 아군의 체력을 회복시키지 않습니다.", "사거리: 렐의 전방으로 685 유닛, 렐의 후방으로 150 유닛 거리 ⇒ 렐의 전방으로 520 유닛, 렐의 후방으로 220 유닛 거리", "재사용 대기시간: 9/8/7/6/5초 ⇒ 11/10.5/10/9.5/9초", "마법 피해량: 70/115/160/205/250 (+주문력의 50%) ⇒ 70/110/150/190/230 (+주문력의 60%)", "스킬 사용 시간: 0.35초 ⇒ 0.5초", "(신규)정글 렐?: 정글 몬스터에게 300%의 피해를 입힙니다.", "(신규)맞았으면 좋겠네!: Q - 파열의 일격 사용 시 렐이 창을 휘두르며 전방으로 100 유닛 거리만큼 전진합니다.", "(삭제)완전한 피해: 변경 전 렐의 Q - 파열의 일격은 처음 적중한 대상에게만 기본 지속 효과 - 갑옷 파쇄의 효과를 적용했으며, 나머지 대상에게는 감소한 피해를 입혔습니다. 이제 모든 대상에게 동일한 피해를 입히고 기본 지속 효과 - 갑옷 파쇄의 효과를 적용합니다."],
    ["(신규)보행 시 추가 공격 속도: 15/20/25/30/35%", "(신규)보행 시 추가 공격 사거리: 공격 사거리가 75 늘어납니다.", "보행 시 추가 방어력 및 마법 저항력: 10% ⇒ 12%", "보행 시 이동 속도: 280의 고정값으로 감소 ⇒ 15% 감소 (참고: 게임 초반에는 하향, 후반에는 상향으로 작용할 것입니다.)","자신 대상 둔화율: 15% ⇒ 10%", "(삭제)아무도 날 멈출 수 없어: 보행 시 최대 이동 속도 제한이 삭제되었습니다.", "마법 피해량: 70/105/140/175/210 (+주문력의 60%) ⇒ 70/100/130/160/190 (+주문력의 60%)", "착지 시 최대 이동 거리: 375 ⇒ 320", "스킬 범위 반지름: 200 ⇒ 180", "도약 사거리: 500 ⇒ 400", "착지 속도: 도약 속도의 85% ⇒ 도약 속도의 100%", "(신규)정글 렐 붐은 온다: 이제 정글 몬스터에게 300%의 피해를 입힙니다."],
    ["(삭제)탑승 시 추가 이동 속도: 더 이상 탑승 시 추가 이동 속도를 부여하지 않습니다.", "사용 시 이동 속도 증가량: 3.5초 동안 25/30/45/40/45% ⇒ 30%, 1초에 걸쳐 빠르게 감소"],
    ["(신규)기본 지속 효과 - 탑승 민첩성: 탑승 중 렐이 1~13 레벨에서 5/8/11/14/17/20/24/28/32/36/40/45/50의 이동 속도를 얻습니다. 전투 중에는 효과가 50%로 감소합니다.", "(신규)사용 시 - 전속력: 렐과 아군 하나가 돌진하며 총 이동 속도가 첫 2초에 걸쳐 75%에서 100%까지 서서히 증가합니다. 적이나 대상 아군을 향해 이동하면 30/35/40/45/50%까지 두 배로 증가합니다. 추가로, 렐의 다음 기본 공격이나 Q - 파열의 일격이 일정 범위로 폭발을 일으켜 35/50/65/80/95 (+최대 체력의 4%) (+주문력의 50%) (+최대 체력의 2/2.5/3/3.5/4%)에 해당하는 피해를 입힙니다."]],
    
    [["보행 시 이동 속도 250 ⇒ 280"],
  ["재사용 대기시간 18/16.25/14.5/12.75/11초 ⇒ 13초"]],
  
  [["적중 챔피언당 체력 회복량 10/15/20/25/30 (+잃은 체력의 5%) ⇒ 10/15/20/25/30 (+잃은 체력의 4%)"],
  ["보호막 흡수량 40/70/100/130/160 (+최대 체력의 13%) ⇒ 35/60/85/110/135 (+최대 체력의 12%)"]]];
}

//레나타 //12.4 합류
class PatchContent_Renata{
  static List<String> BorNorM=["하향","하향","하향", "하향"];
  static List<String> patchVer=["12.14","12.10","12.9", "12.4"];
  static List<String> patchNoteLink= [PatchNoteLink.link[15], PatchNoteLink.link[19],PatchNoteLink.link[20],
  PatchNoteLink.link[25]];
  static List<List<String>> Detail_Title =[["기본 능력치"],
  ["E - 충성 고객 우대"],
  ["기본 능력치","기본 지속 효과 - 영향력"],
  ["기본 능력치", "기본 지속 효과 - 영향력", "W - 긴급 구제"]];
  static List<List<List<String>>> Detail_Content =[[["기본 체력 595 ⇒ 545","기본 공격력 51 ⇒ 49"]],
  
  [["보호막 흡수량 50/70/90/110/130 (+주문력의 50%) ⇒ 50/65/80/95/110 (+주문력의 50%)"]],
  
  [["기본 방어력 29 ⇒ 27"],
  ["표식 적용 시 추가 마법 피해량 대상 최대 체력의 1~3.5% (1~13레벨에서) (+주문력 100당 1%) ⇒ 대상 최대 체력의 1~2% (1~9레벨에서) (+주문력 100당 2%)", "표식 적용 대상 추가 마법 피해량 대상 최대 체력의 1~3.5% (1~13레벨에서) (+주문력 100당 1%) ⇒ 대상 최대 체력의 1~2% (1~9레벨에서) (+주문력 100당 2%) (표식이 없는 대상에 대한 피해량은 전과 동일)"]],
  
  [["방어력 증가량 4 ⇒ 3.5", "18레벨 방어력 97 ⇒ 88.5"],
  ["표식 피해량 대상 최대 체력의 1~5.25% (레벨에 따라) (+주문력 100당 1%) ⇒ 대상 최대 체력의 1~3.5% (1~11레벨에서) (+주문력 100당1%)"],
  ["재사용 대기시간 28/26/24/22/20초 ⇒ 28/27/26/25/24초", "부활 시 체력 35% ⇒ 20%"]]];
}

//레넥톤
class PatchContent_Renekton{
  static List<String> BorNorM=["상향", "하향", "상향", "하향","상향","조정"];
  static List<String> patchVer=["14.4", "13.19", "13.11","12.17","12.13","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[21], PatchNoteLinkPlus.link[12], PatchNoteLinkPlus.link[4], PatchNoteLink.link[12],PatchNoteLink.link[16], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["Q - 양떼 도륙", "E - 자르고 토막내기", "R - 강신"],
    ["기본 능력치"],
    ["E - 자르고 토막내기", "R - 강신"],
    ["Q - 양떼 도륙"],
  ["R - 강신"],
  ["Q - 양떼 도륙", "강화된 Q - 양떼 도륙"]];

  static List<List<List<String>>> Detail_Content =[
    [["챔피언 대상 체력 회복량: 12/18/24/30/36 (+추가 공격력의 15%) ⇒ 12/20/28/36/44 (+추가 공격력의 17%)"],
    ["재사용 대기시간: 16/15/14/13/12초 ⇒ 16/14.5/13/11.5/10초"],
    ["추가 체력: 250/400/550 ⇒ 300/500/700"]],

    [["기본 마법 저항력: 32 ⇒ 28"]],

    [["재사용 대기시간: 18/17/16/15/14초 ⇒ 16/15/14/13/12초"],
    ["재사용 대기시간: 120초 (모든 스킬 레벨에서) ⇒ 120/100/80초", "틱당 마법 피해량 (0.5초): 25/50/75 ⇒ 30/60/90"]],
    
    [["피해량 65/100/135/170/205 (+추가 공격력의 80%) ⇒ 60/90/120/150/180 (+추가 공격력의 100%)", "분노 강화 피해량 100/150/200/250/300 (+추가 공격력의 120%) ⇒ 90/135/180/225/270 (+추가 공격력의 140%)"]],
  
  [["초당 마법 피해량 25/50/75 (+주문력의 10%) ⇒ 20/50/75 (+주문력의 10%)(+추가 공격력의 10%)"]],

  [["재사용 대기시간 8초 ⇒ 7초", "챔피언 이외의 적 대상 체력 회복량 2/3/4/5/6 (+추가 공격력의 3%) ⇒ 2/3/4/5/6 (+추가 공격력의 2%)", "챔피언 대상 체력 회복량 12/18/24/30/36 (+추가 공격력의 16%) ⇒ 12/18/24/30/36 (+추가 공격력의 15%)"],
  ["챔피언 이외의 적 대상 회복량 6/9/12/15/18 (+추가 공격력의 9%) ⇒ 6/9/12/15/18 (+추가 공격력의 6%)", "챔피언 대상 회복량 36/54/72/90/108 (+추가 공격력의 48%) ⇒ 36/54/72/90/108 (+추가 공격력의 45%)"]]];
}

//랭가
class PatchContent_Rengar{
  static List<String> BorNorM=["하향", "하향", "하향","조정","조정","조정"];
  static List<String> patchVer=["14.3","13.14", "12.11","12.7","12.6","12.2"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[20],PatchNoteLinkPlus.link[7], PatchNoteLink.link[18],PatchNoteLink.link[22],
  PatchNoteLink.link[23],PatchNoteLink.link[27]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "Q - 포악함"],
    ["기본 능력치", "Q - 포악함"],
    ["기본 능력치","R - 사냥의 전율"],
  ["Q - 포악함","W - 전투의 포효"],
  ["기본 지속 효과 - 보이지 않는 포식자", "Q - 포악함", "E - 올가미 투척","R - 사냥의 전율"],
  ["R - 사냥의 전율"]];

  static List<List<List<String>>> Detail_Content =[
    [["기본 체력: 620 ⇒ 590"],
    ["추가 피해량: 30/60/90/120/150 (+공격력의 0/5/10/15/20%) ⇒ 30/60/90/120/150 (+공격력의 0/3.75/7.5/11.25/15%)", "강화된 추가 피해량: 30~235 (레벨에 따라) (+공격력의 40%) ⇒ 30~235 (레벨에 따라) (+공격력의 30%)"]],

    [["5초당 기본 체력 재생: 7 ⇒ 6"],
    ["치명타 피해량 전환량: 95% ⇒ 75%"]],

    [["기본 체력 655 ⇒ 620"],
  ["재사용 대기시간 110/90/70초 ⇒ 110/100/90초"]],
  
  [["(신규) 야옹이 장갑 Q - 포악함의 포탑 대상 추가 피해량이 40% 감소합니다."],
  ["몬스터 대상 추가 마법 피해량 65~130 (레벨에 따라) ⇒ 85~150 (레벨에 따라)"]],
  
  [["고양이야 이리온 렝가의 야성 중첩이 없을 때 도약하면 야성 중첩 1을 획득합니다. ⇒ 렝가의 야성 중첩이 모두 소멸한 뒤 도약하면 야성 중첩 1을 얻습니다. (다음 도약까지 획득하는 야성 중첩 횟수와 상관없이)", "완벽한 도약 이제 렝가가 0.3~0.45초의 무작위 대기시간 대신 0.35초 동안 수풀에 숨거나 위장 상태(아군 세나의 E - 검은 안개의 저주 위장 포함)를 유지하면 일관적으로 도약할 수 있습니다. (변수를 제한하기 위해 도약 사거리를 약간 상향했습니다.)", "(신규) 포악한 고양이 이제 렝가의 체력 바 아래에 새로운 야성 자원 표시 바가 추가되어 현재 보유한 야성 중첩을 보여줍니다. (다음 도약으로 야성 중첩이 생성되는 경우 다른 색상으로 표시됩니다.)", "모든 야성 중첩 소멸 전투에서 벗어난 뒤 8초 ⇒ 전투에서 벗어난 뒤 10초", "뼈이빨 목걸이 중첩 처지 관여 제한 시간 적 챔피언에게 피해를 입힌 후 1.5초 ⇒ 3초 이내에 해당 챔피언이 처치되면 중첩 획득"],
  ["(신규) 흉포한 공격 이제 렝가의 Q - 포악함으로 강화된 기본 공격에 항상 치명타가 적용됩니다. 일반적인 치명타 피해량이 적용되는 대신 치명타 확률이 1% 증가할 때마다 강화된 기본 공격의 피해량이 0.66%씩 증가합니다. (무한의 대검 완벽 효과 적용시 0.99%로 증가)", "스크래쳐 포탑 이제 Q - 포악함으로 강화된 기본 공격이 포탑에 적용됩니다.", "고양이 풀이 아니야 이제 Q - 포악함으로 강화된 기본 공격이 식물에 소모되지 않습니다."],
  ["투척의 달인 이제 렝가가 도약 도중에 E - 올가미 투척을 사용하면 스킬이 즉시 발동합니다. (시전 시간 없음)", "(신규) 까꿍 이제 2초 동안 처음 적중한 대상에 대한 절대 시야를 얻고 150 범위 내의 시야가 확보됩니다."],
  ["포식자의 감 이제 R - 사냥의 전율이 가장 가까운 적 챔피언에 대한 절대 시야와 함께 100 범위 내의 시야가 확보됩니다."]],
  
  [["(신규) 위장과 도약 고유 - 렝가가 위장 상태일 때 다음 기본 공격으로 적에게 도약할 수 있습니다."]]];
}

//리븐
class PatchContent_Riven{
  static List<String> BorNorM=["상향", "상향","하향"];
  static List<String> patchVer=["13.23", "13.4","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[16],PatchNoteLink.link[2], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["Q - 부러진 날개", "R - 추방자의 검"],
    ["기본 지속 효과 - 룬 검"],
  ["E - 용맹"]];
  static List<List<List<String>>> Detail_Content =[
    [["피해량: 15/35/55/75/95 (+공격력의 45/50/55/60/65%) ⇒ 15/35/55/75/95 (+공격력의 50/55/60/65/70%)"],
    ["추가 공격력: 20% ⇒ 25%"]],
    
    [["추가 물리 피해량: 총 공격력의 30/36/42/48/54/60% (1/6/9/12/15/18레벨에서) ⇒ 총 공격력의 30~60% (레벨에 따라) (참고: 이제 선형적으로 성장하여, 레벨당 추가 공격력의 1.75%가 더해집니다.)", "(신규) 나뭇꾼: 이제 룬 검의 추가 피해가 포탑에도 피해를 입히지만, 추가 피해량의 50%만 적용됩니다.", "(신규) 중첩이 명료해: 리븐의 기본 지속 효과 - 룬 검의 중첩이 이제 플레이어 본인만 볼 수 있는 자원 바로 표시됩니다."]],
  
  [["보호막 흡수량 85/115/145/175/205 (+추가 공격력의 120%) ⇒ 80/105/130/155/180 (+추가 공격력의 110%)"]]];
}

//럼블
class PatchContent_Rumble{
  static List<String> BorNorM=["하향", "조정", "상향","하향","상향"];
  static List<String> patchVer=["14.2", "13.12","13.5","12.10","12.4"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[5], PatchNoteLink.link[1], PatchNoteLink.link[19],PatchNoteLink.link[25]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "Q - 화염방사기", "E - 전기 작살"],
    ["기본 능력치", "기본 지속 효과 - 고철장 거인", "Q - 화염방사기", "W - 고철 방패", "E - 전기 작살", "R - 이퀄라이저 미사일"],
    ["E - 전기 작살"],
  ["W - 고철 방패"],
  ["기본 능력치"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 공격력: 61 ⇒ 64"],
      ["피해량: 135/150/165/180/195 (+주문력의 110%) (+대상 최대 체력의 6/7/8/9/10%) ⇒ 125/140/155/170/185 (+주문력의 110%) (+대상 최대 체력의 6/7/8/9/10%)"],
    ["마법 저항력 감소: 12/14/16/18/20% ⇒ 10/12/14/16/18%", "E - 전기 작살 피해량: 60/85/110/135/160 (+주문력의 40%) ⇒ 60/85/110/135/160 (+주문력의 50%)"]],

    [["기본 체력: 659 ⇒ 625", "체력 증가량: 99 ⇒ 105", "기본 체력 재생: 8 ⇒ 7"],
    ["열기 최대치: 100 ⇒ 150", "위험 상태: 50 이상 (참고: 전과 동일)", "과열 상태에서 몬스터 대상 체력 비례 피해량 상한치: 80 ⇒ 65~150 (레벨에 따라)", "과열 상태 공격 속도: 20~80% (레벨에 따라) ⇒ 50~130% (레벨에 따라)", "과열 상태 지속 시간: 5.25초 ⇒ 4초"],
    ["마법 피해량: 180/220/260/300/340 (+주문력의 110%) ⇒ 135/150/165/180/195 (+대상 최대 체력의 6/7/8/9/10%) (+주문력의 110%)", "미니언 대상 피해 계수: 60/65/70/75/80% ⇒ 55/60/65/70/75%", "(신규) 몬스터 대상 체력 비례 피해량 상한치: 65~300 (레벨에 따라)"],
    ["보호막 흡수량: 60/90/120/150/180 (+주문력의 45%) ⇒ 25/55/85/115/145 (+최대 체력의 4%) (+주문력의 25%)"],
    ["열기 생성량: 10 ⇒ 20"],
    ["재사용 대기시간: 100/85/70초 ⇒ 130/105/80초"]],


    [["작살 1회 명중 시 적 마법 저항력 감소: 10% ⇒ 12/14/16/18/20%", "작살 2회 명중 시 적 마법 저항력 감소: 20% ⇒ 24/28/32/36/40%"]],
  
  [["보호막 흡수량 60/95/130/165/200 (+주문력의 50%) ⇒ 60/90/120/150/180 (+주문력의 45%)"]],
  
  [["기본 방어력 31 ⇒ 36"]]];
}

//라이즈
class PatchContent_Ryze{
  static List<String> BorNorM=["상향", "상향", "하향","상향","상향","하향","상향"];
  static List<String> patchVer=["14.8", "13.12", "13.1B","12.19","12.11","12.7","12.5"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[25], PatchNoteLinkPlus.link[5], PatchNoteLink.link[4],PatchNoteLink.link[10],PatchNoteLink.link[18],
  PatchNoteLink.link[22],PatchNoteLink.link[24]];
  static List<List<String>> Detail_Title =[
    ["W - 룬 감옥"],
    ["기본 지속 효과 - 비전 연마", "E - 주문 전이"],
    ["기본 능력치","기본 지속 효과 - 비전 연마"],
  ["Q - 과부하","W - 룬 감옥"],
  ["Q - 과부하","E - 주문 전이"],
  ["Q - 과부하"],
  ["기본 지속 효과 - 비전 연마", "Q - 과부하"]];
  static List<List<List<String>>> Detail_Content =[
    [["둔화율: 35% ⇒ 50%", "재사용 대기시간: 13/12/11/10/9초 ⇒ 11/10.5/10/9.5/9초"]],

    [["최대 마나 증가량: 주문력 100당 6% ⇒ 주문력 100당 10%"],
    ["마법 피해량: 60/90/120/150/180 (+주문력의 45%) (+추가 마나의 2%) ⇒ 60/90/120/150/180 (+주문력의 50%) (+추가 마나의 2%)", "투사체 속도: 3,500 ⇒ 4,000"]],

    [["마법 저항력: 36 ⇒ 32"],
  ["최대 마나 증가량: 주문력 100당 10% ⇒ 주문력 100당 6%"]],
  
  [["마법 피해량: 70/90/110/130/150 (+주문력의 50%) (+추가 마나의 2%) ⇒ 70/90/110/130/150 (+주문력의 55%) (+추가 마나의 2%)"],
  ["마법 피해량: 80/110/140/170/200 (+주문력의 60%) (+추가 마나의 4%) ⇒ 80/110/140/170/200 (+주문력의 70%) (+추가 마나의 4%)"]],
  
  [["재사용 대기시간 6초 ⇒ 5초"],
  ["피해량 60/80/100/120/140 (+주문력의 30%) (+추가 마나의 2%) ⇒ 60/90/120/150/180 (+주문력의 45%) (+추가 마나의 2%)", "마나 소모량 40/55/70/85/100 ⇒ 35/45/55/65/75"]],
  
  [["마법 피해량 70/90/110/130/150 (+주문력의 45%) (+추가 마나의 3%) ⇒ 70/90/110/130/150 (+주문력의 50%) (+추가 마나의 2%)"]],
  
  [["최대 마나 증가량 주문력 100당 5% ⇒ 주문력 100당 10%"],
  ["피해량 75/100/125/150/175 (+주문력의 40%) (+추가 마나의 3%) ⇒ 70/90/110/130/150 (+주문력의 45%) (+추가 마나의 3%)"]]];
}

//사미라
class PatchContent_Samira{
  static List<String> BorNorM=["상향", "상향","하향","상향","상향","상향"];
  static List<String> patchVer=["13.17", "13.5","13.4","12.11","12.5","12.2"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[10], PatchNoteLink.link[1],PatchNoteLink.link[2],PatchNoteLink.link[18],
  PatchNoteLink.link[24],PatchNoteLink.link[27]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치"],
    ["기본 지속 효과 - 무모한 충동"],
  ["기본 지속 효과 - 무모한 충동", "R - 지옥불 난사"],
  ["기본 능력치","Q - 천부적 재능"],
  ["기본 능력치", "R - 지옥불 난사"],
  ["R - 지옥불 난사"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 체력: 600 ⇒ 630"]],
    
    [["중첩당 이동 속도: 중첩당 1/2/3/4% (최대 6~24%) ⇒ 중첩당 2/2.5/3/3.5% (최대 12~21%)"]],
  
  [["이동 속도: 중첩당 3.5% ⇒ 중첩당 1/2/3/4% (1/6/11/16레벨에서)"],
  ["생명력 흡수 효율: 66.7% ⇒ 50%"]],
  
  [["공격력 증가량 3 ⇒ 3.3", "18레벨 공격력 108 ⇒ 113.1"],
  ["피해량 0/5/10/15/20 (+공격력의 80/90/100/110/120%) ⇒ 0/5/10/15/20 (+공격력의 85/95/105/115/125%)"]],
  
  [["체력 증가량 88 ⇒ 94", "18레벨 체력 2,026 ⇒ 2,128", "방어력 증가량 3 ⇒ 3.5", "18레벨 방어력 77 ⇒ 85.5"],
  ["재사용 대기시간 8초 ⇒ 5초"]],
  
  [["탄환당 물리 피해량 0/10/20 (+공격력의 50%) ⇒ 5/15/25 (+공격력의 50%)", "대상당 총 물리 피해량 0/100/200 (+공격력의 500%) ⇒ 50/150/250 (+공격력의 500%)"]]];
}

//세주아니
class PatchContent_Sejuani{
  static List<String> BorNorM=["하향","하향", "상향"];
  static List<String> patchVer=["13.15", "13.7", "12.8"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[8], PatchNoteLinkPlus.link[0], PatchNoteLink.link[21]];
  static List<List<String>> Detail_Title =[
  ["W - 혹한의 서릿발"],
  ["기본 지속 효과 - 혹한의 분노","Q - 혹한의 맹습", "R - 빙하 감옥"],
  ["기본 지속 효과 - 혹한의 분노"]];
  static List<List<List<String>>> Detail_Content =[
    [["첫 번째 스킬 피해: 20/25/30/35/40 (+주문력의 20%) (+최대 체력의 2%) ⇒ 10/15/20/25/30 (+주문력의 20%) (+최대 체력의 2%)", "두 번째 스킬 피해: 30/70/110/150/190 (+주문력의 60%) (+최대 체력의 6%) ⇒ 20/60/100/140/180 (+주문력의 60%) (+최대 체력의 6%)"]],
    
    [["에픽 몬스터 대상 최대 피해량: 300 ⇒ 250"],
  ["재사용 대기시간: 18/16.5/15/13.5/12초 ⇒ 19/17.5/16/14.5/13초"],
  ["재사용 대기시간: 120/100/80초 ⇒ 130/110/90초"]],
  
  [["서리 갑옷 발동 대기시간 세주아니가 12초 ⇒ 12~6초 (레벨에 따라) 동안 챔피언 또는 대형 정글 몬스터로부터 피해를 입지 않으면 서리 갑옷을 얻습니다."]]];
}

//세나
class PatchContent_Senna{
  static List<String> BorNorM=["하향", "하향", "하향", "상향", "상향","상향","조정","하향","하향","하향","상향"];
  static List<String> patchVer=["14.6", "14.5", "13.22", "13.18", "13.4","13.1B","12.12","12.11","12.10","12.3","12.2"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[23],PatchNoteLinkPlus.link[22],PatchNoteLinkPlus.link[15],PatchNoteLinkPlus.link[11],PatchNoteLink.link[2],PatchNoteLink.link[4], PatchNoteLink.link[17],
  PatchNoteLink.link[18], PatchNoteLink.link[19],PatchNoteLink.link[26],PatchNoteLink.link[27]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 면죄"],
    ["Q - 꿰뚫는 어둠"],
    ["Q - 꿰뚫는 어둠"],
    ["기본 지속 효과 - 면죄", "W - 마지막 포옹"],
    ["기본 능력치","R - 여명의 그림자"],
  ["기본 능력치"],
  ["기본 능력치", "Q - 꿰뚫는 어둠", "W - 마지막 포옹"],
  ["기본 지속 효과 - 면죄","Q - 꿰뚫는 어둠"],
  ["기본 능력치", "기본 지속 효과 - 면죄","Q - 꿰뚫는 어둠", "R - 여명의 그림자"],
  ["기본 지속 효과 - 면죄"],
  ["Q - 꿰뚫는 어둠"]];
  static List<List<List<String>>> Detail_Content =[
    [["미니언 처치 시 안개 유령 생성 확률: 8.333% ⇒ 2.8%"]],

    [["피해량: 30/60/90/120/150 (+추가 공격력의 50%) ⇒ 30/60/90/120/150 (+추가 공격력의 40%)"]],

    [["피해량: 30/65/100/135/170 (+추가 공격력의 50%) ⇒ 30/60/90/120/150 (+추가 공격력의 50%)", "체력 회복량: 40/55/70/85/100 (+추가 공격력의 30%) (+주문력의 40%) (+물리 관통력 1당 1.6) ⇒ 40/50/60/70/80 (+추가 공격력의 30%) (+주문력의 40%) (+물리 관통력 1당 1.6)"]],

    [["(삭제) 치명타 피해량 감소: 더 이상 치명타 피해량이 8.5% 감소하지 않습니다."],
    ["광역 효과: 이제 마지막 포옹의 광역 속박에 적중당한 적은 세나의 기본 지속 효과 - 면죄가 적용됩니다."]],
    
    [["공격 속도 계수 (추가 공격 속도 100%당 공격 속도): 0.30 ⇒ 0.40"],
  ["물리 피해량: 250/375/500 (+추가 공격력의 100%) (+주문력의 70%) ⇒ 250/400/550 (+추가 공격력의 115%) (+주문력의 70%)", "재사용 대기시간: 160/140/120초 ⇒ 140/120/100초"]],
  
  [["마나 재생 증가량: 0.4 ⇒ 0.7"]],
  
  [["기본 체력 560 ⇒ 530"],
  ["기본 피해량 40/70/100/130/160 ⇒ 30/65/100/135/170"],
  ["속박 지속시간 1.25/1.5/1.75/2/2.25초 ⇒ 1/1.25/1.5/1.75/2초"]],

  [["세나가 처치한 미니언으로부터 안개 영혼이 생성될 확률 2.166% ⇒ 8.333%"],
  ["둔화율 20% (+추가 공격력 100당 10%) ⇒ 15% (+추가 공격력 100당 10%)", "둔화 지속시간 2초 ⇒ 1/1.25/1.5/1.75/2초"]],
  
  [["기본 체력 590 ⇒ 560"],
  ["추가 물리 피해량 대상 현재 체력의 1~16% (11레벨에서) ⇒ 1~10% (10레벨에서)"],
  ["체력 회복량 40/60/80/100/120 (+추가 공격력의 40%) (+주문력의 40%) (+물리 관통력 1당 1.6) ⇒ 40/55/70/85/100 (+추가 공격력의 30%) (+주문력의 40%) (+물리 관통력 1당 1.6)"],
  ["보호막 흡수량 120/160/200 (+주문력의 40%) (+영혼 하나당 1.5) ⇒ 100/150/200 (+주문력의 40%) (+영혼 하나당 1.5)"]],
  
  [["빠른 계산 세나가 미니언과 소형 몬스터를 처치하면 10% 확률 ⇒ 2.7777% 확률로 안개 망령이 생성됩니다. (나머지는 전과 동일)"]],
  
  [["(신규) 시야 방해 이제 적중당한 모든 적의 이동 속도를 2초 동안 20% (+주문력 100당 6%) (+추가 공격력 100당 10%) 감소시킵니다."]]];
}

//세라핀
class PatchContent_Seraphine{
  static List<String> BorNorM=["조정", "조정", "조정", "하향","상향","하향","조정"];
  static List<String> patchVer=["14.5", "13.22", "13.21", "12.14","12.12","12.10","12.5"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[22],PatchNoteLinkPlus.link[15],PatchNoteLinkPlus.link[14], PatchNoteLink.link[15],PatchNoteLink.link[17], PatchNoteLink.link[19],
  PatchNoteLink.link[24]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "기본 지속 효과 - 무대 장악", "Q - 고음", "W - 소리 장막", "E - 비트 발사", "R - 앙코르"],
    ["기본 지속 효과 - 무대 장악", "Q - 고음", "W - 소리 장막"],
    ["기본 능력치", "Q - 고음", "W - 소리 장막", "E - 비트 발사"],
    ["W - 소리 장막"],
  ["기본 지속 효과 - 무대 장악", "E - 비트 발사"],
  ["W - 소리 장막"],
  ["W - 소리 장막","E - 비트 발사"]];
  static List<List<List<String>>> Detail_Content =[
    [["이동 속도: 325 ⇒ 330", "마나 증가량: 50 ⇒ 25", "마나 재생: 0.4 ⇒ 0.95", "기본 공격력: 55 ⇒ 50"],
    ["피해량: 5/10/18/30 (+주문력의 5%) (1/6/11/16레벨에서) ⇒ 4~25 (레벨에 따라, 선형적으로 증가) (+주문력의 4%)", "(삭제) 미니언 대상 피해량 계수 300%가 삭제되었습니다."],
    ["투사체 속도: 1,200 ⇒ 1,300", "재사용 대기시간: 10/8.75/7.5/6.25/5초 ⇒ 8/7.5/7/6.5/6초", "마나 소모량: 65/70/75/80/85 ⇒ 60/70/80/90/100", "피해량: 55/80/105/130/155 (+주문력의 50%) ⇒ 60/85/110/135/160 (+주문력의 50%)", "잃은 체력 비례 최대 피해량 증폭: 50% ⇒ 60%", "잃은 체력 비례 최대 피해량 증폭: 50% ⇒ 60%", "(삭제) 피해량 증폭이 이제 챔피언이 아닌 대상에게 적용되지 않습니다.", "(삭제) 더 이상 투사체가 날아가는 동안 미니언이 다른 미니언에게 처치당하는 것을 막지 않습니다."],
    ["재사용 대기시간: 28/25/22/19/16초 ⇒ 22/21/20/19/18초", "마나 소모량: 80/85/90/95/100 ⇒ 70/75/80/85/90", "보호막: 50/75/100/125/150 (+주문력의 20%) ⇒ 60/85/110/135/160 (+주문력의 20%)", "세라핀 추가 이동 속도: 20% (+주문력의 4%) ⇒ 20% (+주문력의 2%)"],
    ["재사용 대기시간: 10초 ⇒ 11/10.5/10/9.5/9초", "마나 소모량: 60/65/70/75/80 ⇒ 60 (모든 스킬 레벨에서)", "피해량: 60/95/130/165/200 (+주문력의 35%) ⇒ 70/100/130/160/190 (+주문력의 50%)", "둔화 지속시간: 1.25초 ⇒ 1.1/1.2/1.3/1.4/1.5초", "미니언 대상 피해량: 100% ⇒ 70%"],
    ["피해량: 150/200/250 (+주문력의 60%) ⇒ 150/200/250 (+주문력의 40%)", "재사용 대기시간: 160/130/100초 ⇒ 160/140/120초"]],

    [["음표당 피해량: 4/8/14/25 (레벨에 따라) (+주문력의 7%) ⇒ 5/10/18/30 (레벨에 따라) (+주문력의 5%)"],
    ["재사용 대기시간: 9/8/7/6/5 ⇒ 10/8.75/7.5/6.25/5"],
    ["보호막 흡수량: 50/75/100/125/150 (+주문력의 25%) ⇒ 50/75/100/125/150 (+주문력의 20%)"]],

    [["기본 마나 재생: 8 ⇒ 11.5", "마나 재생 증가량: 1 ⇒ 0.4", "기본 마나: 440 ⇒ 360", "마나 증가량: 40 ⇒ 50", "기본 방어력: 19 ⇒ 26", "체력 증가량: 104 ⇒ 90", "공격 속도 증가량: 1% ⇒ 2%"],
    ["재사용 대기시간: 10/8.75/7.5/6.25/5초 ⇒ 9/8/7/6/5초", "피해량: 55/70/85/100/115 (+주문력의 45/50/55/60/65%) ⇒ 55/80/105/130/155 (+주문력의 50%)"],
    ["마나 소모량: 50/60/70/80/90 ⇒ 80/85/90/95/100", "재사용 대기시간: 28/26/24/22/20 ⇒ 28/25/22/19/16", "보호막 흡수량: 50/70/90/110/130 (+주문력의 25%) ⇒ 50/75/100/125/150 (+주문력의 25%)", "잃은 체력 비례 회복량: 5/5.5/6/6.5/7% (+주문력 100당 0.4%) ⇒ 3/3.5/4/4.5/5%"],
    ["마나 소모량: 60/70/80/90/100 ⇒ 60/65/70/75/80", "마법 피해량: 60/80/100/120/140 (+주문력의 35%) ⇒ 60/95/130/165/200 (+주문력의 35%)"]],
    
    [["보호막 흡수량 50/70/90/110/130 (+주문력의 35%) ⇒ 50/70/90/110/130 (+주문력의 25%)", "아군 챔피언 하나당 잃은 체력의 5/5.5/6/6.5/7% (+주문력 100당 0.6%) ⇒ 잃은 체력의 5/5.5/6/6.5/7% (+주문력 100당 0.4%)"]],
  
  [["음표 1개당 주문력 계수 6/7/8/9% (1/6/11/16레벨에서) ⇒ 7% (모든 레벨에서)"],
  ["재사용 대기시간 11/10.5/10/9.5/9초 ⇒ 10초", "둔화 및 기절 지속시간 1초 ⇒ 1.25초"]],
  
  [["보호막 흡수량 60/80/100/120/140 (+주문력의 40%) ⇒ 50/70/90/110/130 (+주문력의 35%)","아군 챔피언 하나당 체력 회복량 대상이 잃은 체력의 5/5.5/6/6.5/7% (+주문력 100당 0.75%) ⇒ 5/5.5/6/6.5/7% (+주문력 100당 0.6%)"]],
  
  [["마나 소모량 50/70/90/110/130 ⇒ 50/60/70/80/90", "재사용 대기시간 26/25/24/23/22초 ⇒ 28/26/24/22/20초", "보호막 흡수량 75~225 (레벨에 따라) (+주문력의 45%) ⇒ 60/80/100/120/140 (+주문력의 40%)", "아군 보호막 흡수량 50~150 (레벨에 따라) (+주문력의 30%) ⇒ 60/80/100/120/140 (+주문력의 40%) (참고: 이제 아군이 세라핀과 동일한 보호막을 얻습니다.)", "체력 회복량 (이미 보호막을 보유한 경우) 범위 내의 아군 한 명당 잃은 체력의 5% (+주문력 100당 1.125%) ⇒ 범위 내의 아군 한 명당 잃은 체력의 5/5.5/6/6.5/7% (+주문력 100당 0.75%)"],
  ["재사용 대기시간 13/12/11/10/9초 ⇒ 11/10.5/10/9.5/9초"]]];
}

//세트
class PatchContent_Sett{
  static List<String> BorNorM=["하향","상향","상향"];
  static List<String> patchVer=["12.20","12.17","12.4"];
  static List<String> patchNoteLink= [PatchNoteLink.link[9],PatchNoteLink.link[12],PatchNoteLink.link[25]];
  static List<List<String>> Detail_Title =[["기본 능력치","기본 지속 효과 - 투기장의 투지"],
  ["W - 강펀치","E - 안면 강타"],
  ["기본 능력치"]];
  static List<List<List<String>>> Detail_Content =[[["마법 저항력: 32 ⇒ 28"],
  ["잃은 체력 5%당 체력 재생량: 0.25/0.5/1/2 ⇒ 0.15/0.5/1/2", "오른쪽 주먹 공격력 계수: 추가 공격력의 50% ⇒ 추가 공격력의 55%"]],
  
  [["공격력 계수 추가 공격력 100당 20% ⇒ 추가 공격력 100당 25%"],
  ["둔화율 50% ⇒ 70%"]],
  
  [["체력 증가량 93 ⇒ 100","18레벨 체력 2,181 ⇒ 2,300"]]];
}

//샤코
class PatchContent_Shaco{
  static List<String> BorNorM=["상향","하향", "상향", "상향","조정"];
  static List<String> patchVer=["14.3", "13.16", "13.14", "13.1","12.12"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[20], PatchNoteLinkPlus.link[9],PatchNoteLinkPlus.link[7], PatchNoteLink.link[5],PatchNoteLink.link[17]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "W - 깜짝 상자", "E - 양날 독", "R - 환각"],
    ["기본 능력치", "W - 깜짝 상자"],
    ["Q - 속임수"],
    ["Q - 속임수","E - 양날 독"],
  ["기본 능력치", "기본 지속 효과 - 암습","Q - 속임수", "W - 깜짝 상자", "E - 양날 독"]];

  static List<List<List<String>>> Detail_Content =[
    [["마나 재생 증가량: 0.45 ⇒ 0.35"],
    ["마나 소모량: 70 (모든 스킬 레벨에서) ⇒ 70/65/60/55/50", "몬스터 대상 추가 피해량: 10/20/30/40/50 ⇒ 20/35/50/65/80", "공허 유충 저항력: 샤코의 깜짝 상자가 더 이상 공허 유충에게 한 번에 처치되지 않습니다."],
    ["마나 소모량: 65 ⇒ 75"],
    ["휘리릭: 이제 샤코의 분신이 샤코에게 돌아가거나 어떤 이유에서든 순간이동하면 주황색 연기를 생성합니다.", "분신 타이머: 이제 샤코의 분신 지속시간이 HUD에 표시됩니다.", "버그 수정: 더 이상 주문을 사용할 때 샤코의 분신이 기본 공격 대상을 잃어버리지 않습니다."]],

    [["기본 마나 재생: 7.15 ⇒ 6"],
    ["마나 소모량: 50/55/60/65/70 ⇒ 70 (모든 스킬 레벨에서)"]],

    [["추가 물리 피해량: 25/35/45/55/65 (+추가 공격력의 50%) ⇒ 25/35/45/55/65 (+추가 공격력의 60%)", "뒤에서 공격 시 추가 치명타 피해량: 40% ⇒ 55%"]],
    
    [["마나 소모량: 60 ⇒ 40", "암습 시 치명타 추가 피해량: 30% ⇒ 40%"],
  ["마법 피해량: 70/95/120/145/170 (+추가 공격력의 75%)(+주문력의 60%) ⇒ 70/95/120/145/170 (+추가 공격력의 80%)(+주문력의 60%)", "체력이 최대 체력의 30% 미만인 대상에게 입히는 마법 피해량: 105/142.5/180/217.5/255 (+추가 공격력의 112.5%)(+주문력의 90%) ⇒ 105/142.5/180/217.5/255 (+추가 공격력의 120%)(+주문력의 90%)"]],
  
  [["체력 증가량 103 ⇒ 99", "18레벨 체력 2,381 ⇒ 2,313", "방어력 증가량 4.7 ⇒ 4", "18레벨 방어력 109.9 ⇒ 98"],
  ["추가 공격력 계수 15% ⇒ 25%"],
  ["물리 피해량 25/35/45/55/65 (+추가 공격력의 25%) ⇒ 25/35/45/55/65 (+추가 공격력의 50%)"],
  ["마법 피해량 10/15/20/25/30 (+주문력의 9%) ⇒ 10/15/20/25/30 (+주문력의 12%)", "재사용 대기시간 16초 ⇒ 15초", "지속시간 40(+주문력의 5%)초 ⇒ 49(+주문력의 10%)초"],
  ["마법 피해량 70/95/120/145/170 (+추가 공격력의 70%) (+주문력의 50%) ⇒ 70/95/120/145/170 (+추가 공격력의 75%) (+주문력의 60%)"]]];
}

//쉔
class PatchContent_Shen{
  static List<String> BorNorM=["상향","상향", "상향","하향","하향"];
  static List<String> patchVer=["14.6", "14.2", "12.15","12.10","12.2"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[23],PatchNoteLinkPlus.link[18],PatchNoteLink.link[14], PatchNoteLink.link[19],PatchNoteLink.link[27]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 기 보호막"],
    ["기본 능력치"],
    ["E - 그림자 돌진"],
  ["기본 지속 효과 - 기 보호막", "R - 단결된 의지"],
  ["Q - 황혼 강습"]];
  static List<List<List<String>>> Detail_Content =[
    [["돌려받는 재사용 대기시간: 4/4.5/5/5.5/6/6.5/7/7.5 (1/6/9/12/14/16/17/18레벨에서) ⇒ 4~7.5 (레벨에 따라 선형적으로 증가) (참고: 이는 2~17레벨에서 상향이며, 8~16레벨에서 가장 두드러집니다.)"]],

    [["기본 공격력: 60 ⇒ 64"]],
    
    [["기본 지속 효과 - 기 보호막 또는 E - 그림자 돌진으로 피해를 입혔을 시 기력 회복량 30/35/40 ⇒ 30/40/50"]],
  
  [["보호막 흡수량 50~101 (레벨에 따라) (+추가 체력의 14%) ⇒ 50~101 (레벨에 따라) (+추가 체력의 12%)"],
  ["보호막 흡수량 140/320/500 (+추가 체력의 17.5%) ⇒ 130/290/450 (+추가 체력의 16%)"]],
  
  [["추가 피해량 증가 10~40 (+3레벨마다 6) (+대상 최대 체력의 5/5.5/6/6.5/7% (+주문력 100당 2%)) ⇒ 10~40 (+3레벨마다 6) (+대상 최대 체력의 4/4.5/5/5.5/6% (+주문력 100당 2%))"]]];
}

//쉬바나
class PatchContent_Shyvana{
  static List<String> BorNorM=["상향","하향","하향", "상향", "하향","상향"];
  static List<String> patchVer=["14.3","13.16", "13.15", "13.14", "12.23","12.19"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[20], PatchNoteLinkPlus.link[9],PatchNoteLinkPlus.link[8], PatchNoteLinkPlus.link[7], PatchNoteLink.link[6],PatchNoteLink.link[10]];
  static List<List<String>> Detail_Title =[
    ["Q - 두 번 물어뜯기", "W - 연소"],
    ["W - 연소"],
    ["기본 능력치"],
    ["Q - 두 번 물어뜯기", "E - 화염 숨결"],
    ["E - 화염 숨결"],
  ["W - 연소","E - 화염 숨결","R - 용의 강림"]];
  static List<List<List<String>>> Detail_Content =[
    [["강화 공격 추가 피해량: 공격력의 100% (+주문력의 35%) ⇒ 공격력의 100% (+주문력의 50%)", "추가 공격 속도: 40/45/50/55/60% ⇒ 50/55/60/65/70%"],
    ["추가 이동 속도: 30/35/40/45/50% (+주문력의 0.08%) ⇒ 30/35/40/45/50% (+주문력의 0.12%)"]],

    [["초당 피해량: 20/32/45/57/70 (+추가 공격력의 30%) ⇒ 20/30/40/50/60 (+추가 공격력의 20%)", "적중 시 피해량: 5/8/11.25/14.25/17.5 (+추가 공격력의 7.5%) ⇒ 5/7/9/11/13 (+추가 공격력의 5%)"]],

  [["공격력 증가량: 레벨당 3.4 ⇒ 레벨당 3", "체력 증가량: 레벨당 109 ⇒ 레벨당 104"]],

    [["추가 물리 피해량: 공격력의 20/35/50/65/80% (+주문력의 25%) ⇒ 공격력의 20/40/60/80/100% (+주문력의 25%)", "(신규) 공격 속도 증가: 쉬바나의 다음 기본 공격 2번의 공격 속도가 40/45/50/55/60% 증가합니다.", "재사용 대기시간: 7/6.5/6/5.5/5초 ⇒ 8/7.5/7/6.5/6초"],
    ["불씨가 남은 대상 적중 시 추가 마법 피해: 대상 최대 체력의 3% ⇒ 대상 최대 체력의 3% (+추가 공격력 100당 1%)"]],
    
    [["표식이 남은 적 대상 강화된 기본 공격: 대상 최대 체력의 3.5% ⇒ 대상 최대 체력의 3%"]],

  [["틱당 마법 피해량: 10/16.25/22.5/28.75/35 (+추가 공격력의 10%) ⇒ 10/16.25/22.5/28.75/35 (+추가 공격력의 15%)", "적중 시 추가 마법 피해량: 5/8.125/11.25/14.375/17.5 (+추가 공격력의 5%) ⇒ 5/8.125/11.25/14.375/17.5 (+추가 공격력의 7.5%)"],
  ["표식이 남은 적 대상 적중 시 피해량: 대상 최대 체력의 3.75% ⇒ 대상 최대 체력의 3.5%", "피해량: 60/100/140/180/220 (+공격력의 30%) (+주문력의 70%) ⇒ 60/100/140/180/220 (+공격력의 40%) (+주문력의 90%)", "용 형상 추가 피해량: 추가 피해량 100~160 (레벨에 따라) (+공격력의 30%) (+주문력의 30%) ⇒ 추가 피해량 75~135 (레벨에 따라) (+공격력의 30%) (+주문력의 30%) (참고: E - 화염 숨결의 기본 피해량에 더하여 추가로 입히는 피해량입니다.)"],
  ["마법 피해량: 150/250/350 (+주문력의 100%) ⇒ 150/250/350 (+주문력의 130%)"]]];
}

//스몰더 14.3 합류
class PatchContent_Smolder{
  static List<String> BorNorM=["상향", "하향", "조정", "조정"];
  static List<String> patchVer=["14.7", "14.6", "14.5", "14.4"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[24],PatchNoteLinkPlus.link[23],PatchNoteLinkPlus.link[22],PatchNoteLinkPlus.link[21]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "Q - 초강력 화염 숨결"],
    ["Q - 초강력 화염 숨결", "W - 에취!", "E - 펄럭펄럭"],
    ["Q - 초강력 화염 숨결", "E - 펄럭펄럭", "R - 엄마아아아!"],
    ["Q - 초강력 화염 숨결", "W - 에취!", "R - 엄마아아아!"]];

  static List<List<List<String>>> Detail_Content =[
    [["방어력: 24 ⇒ 26"],
    ["치명타 확률 비례 추가 물리 피해량: 0~30% ⇒ 0~50%"]],

    [["처형 기준값: 2% (+중첩당 0.025%) ⇒ 6.5% (참고: 용 훈련 225회 중첩 시 기존 처형 기준값은 7.625%입니다.)", "처형 조건: 스몰더가 유닛을 처형하려면 직접 피해를 입혀야 하며, 더 이상 아군이 입힌 피해로 처형되지 않습니다."],
    ["투사체 범위: 125 ⇒ 115"],
    ["이동 속도: 100% ⇒ 75%"]],

    [["3단계 진화 추가 고정 피해량: 대상 최대 체력의 6.5% ⇒ 대상 최대 체력의 (추가 공격력의 2% + 주문력의 1% + 용 훈련 중첩의 0.8%)%"],
    ["폭격 횟수: 5~10 (치명타 확률에 따라) ⇒ 5 (+용 훈련 중첩 50당 1)", "폭격이 기본 공격이 아니라는 점을 명확하게 하기 위해 툴팁을 업데이트했습니다."],
    ["피해량: 225/350/475 (+추가 공격력의 110%) (+주문력의 100%) ⇒ 200/300/400 (+추가 공격력의 110%) (+주문력의 100%)", "범위 중심 피해량 증가 계수: 30% ⇒ 50%", "자신 대상 체력 회복량: 110/160/210 (+주문력의 75%) ⇒ 100/135/170 (+추가 공격력의 50%) (+주문력의 75%)"]],

    [["125중첩 시 불꽃 개수: 2 (+용 훈련 중첩 100당 1) ⇒ 1 (+용 훈련 중첩 67당 1)", "편의성 개선 업데이트: 스몰더의 Q - 초강력 화염 숨결이 날아가던 도중 미니언이 처치되어도 용 훈련 중첩을 얻을 수 있습니다."],
    ["재사용 대기시간: 13/12.5/12/11.5/11초 ⇒ 14/13/12/11/10초", "기본 물리 피해량: 70/90/110/130/150 (+공격력의 25%) (+주문력의 35%) ⇒ 50/80/110/140/170 (+공격력의 25%) (+주문력의 20%)", "폭발 물리 피해량: 25/40/55/70/85 (+주문력의 65%) ⇒ 25/40/55/70/85 (+추가 공격력의 25%) (+주문력의 80%)"],
    ["불타는 분노: 이제 스몰더의 어미는 스몰더가 쓰러져도 멈추지 않습니다. 그리고 어미는 화가 머리끝까지 날 겁니다. 그런 심한 행동을 하시다니..."]]];
}

//신지드
class PatchContent_Singed{
  static List<String> BorNorM=["하향", "상향","하향","하향"];
  static List<String> patchVer=["14.1", "12.15","12.12","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[18],PatchNoteLink.link[14],PatchNoteLink.link[17], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["Q - 맹독의 자취"],
    ["기본 지속 효과 - 독성 급류", "R - 광기의 물약"],
  ["W - 초강력 접착제", "R - 광기의 물약"],
  ["Q - 맹독의 자취"]];
  static List<List<List<String>>> Detail_Content =[
    [["피해량: 40/60/80/100/120 (+주문력의 90%) ⇒ 40/60/80/100/120 (+주문력의 80%)"]],

    [["추가 이동 속도 20% ⇒ 25%", "대상별 재사용 대기시간 10초 ⇒ 8초"],
  ["추가 능력치 20/60/100 ⇒ 30/65/100"]],
  
  [["둔화율 60% ⇒ 50/55/60/65/70%"],
  ["추가 능력치 30/60/90 ⇒ 20/60/100"]],
  
  [["(R - 광기의 물약 활성화 시) 고통스러운 상처 40% ⇒ 30%"]]];
}

//사이온
class PatchContent_Sion{
  static List<String> BorNorM=["상향", "하향","상향","상향","하향"];
  static List<String> patchVer=["14.6", "13.9","13.1","12.23","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[23],PatchNoteLinkPlus.link[2],PatchNoteLink.link[5],PatchNoteLink.link[6], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["Q - 대량 학살 강타", "W - 영혼의 용광로"],
    ["기본 지속 효과 - 영광스러운 죽음"],
    ["기본 능력치","Q - 대량 학살 강타"],
  ["기본 능력치","Q - 대량 학살 강타"],
  ["W - 영혼의 용광로"]];
  static List<List<List<String>>> Detail_Content =[
    [["최소 피해량: 40/60/80/100/120 (+총공격력의 45/52.5/60/67.5/75%) ⇒ 40/60/80/100/120 (+총공격력의 40/50/60/70/80%)", "최대 피해량: 90/155/220/285/350 (+총공격력의 135/157.5/180/202.5/225%) ⇒ 90/155/220/285/350 (+총공격력의 120/150/180/210/240%)"],
    ["보호막 흡수량: 60/85/110/135/160 (+최대 체력의 8/9/10/11/12%) ⇒ 60/75/90/105/120 (+최대 체력의 8/10/12/14/16%)"]],

    [["체력 감소량: 2~19 (1+레벨당 1) ⇒ 2.3~24.4 (1+레벨당 1.3)"]],

    [["기본 체력: 615 ⇒ 655"],
  ["최대 충전 시 피해량: 70/135/200/265/330 ⇒ 90/155/220/285/350"]],
  
  [["기본 마나: 330 ⇒ 400","마나 증가량: 42 ⇒ 52"],
  ["기본 피해량: 30/50/70/90/110 ⇒ 40/60/80/100/120"]],
  
  [["보호막 흡수량 60/85/110/135/160 (+최대 체력의 10/11/12/13/14%) ⇒ 60/85/110/135/160 (+최대 체력의 8/9/10/11/12%)"]]];
}

//시비르
class PatchContent_Sivir{
  static List<String> BorNorM=["상향", "상향", "상향", "하향","하향","하향","조정"];
  static List<String> patchVer=["14.5", "13.12", "13.1B","12.17","12.15","12.14","12.13"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[22], PatchNoteLinkPlus.link[5], PatchNoteLink.link[4], PatchNoteLink.link[12],PatchNoteLink.link[14],PatchNoteLink.link[15],
  PatchNoteLink.link[16]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치"],
    ["기본 능력치", "W - 튕기는 부메랑"],
    ["기본 능력치"],
  ["기본 능력치","W - 튕기는 부메랑"],
  ["기본 능력치", "E - 주문 방어막","R - 사냥 개시"],
  ["Q - 부메랑 검","W - 튕기는 부메랑"],
  ["기본 능력치","기본 지속 효과 - 재빠른 발놀림","Q - 부메랑 검","W - 튕기는 부메랑", "E - 주문 방어막", "R - 사냥 개시"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 방어력: 26 ⇒ 30"]],

    [["공격력 증가량: 2.8 ⇒ 2.5"],
    ["튕길 시 피해량: 공격력의 25/30/35/40/45% ⇒ 공격력의 30/35/40/45/50%"]],
    
    [["마나 증가량: 40 ⇒ 45", "W - 튕기는 부메랑 마나 소모량: 60/65/70/75/80 ⇒ 60 (모든 스킬 레벨에서)"]],
  
  [["공격력 증가량 3 ⇒ 2.8"],
  ["튕기는 피해량 공격력 계수 총 공격력의 30/35/40/45/50% ⇒ 총 공격력의 25/30/35/40/45%"]],
  
  [["공격력 증가량 3.3 ⇒ 3"], 
  ["재사용 대기시간 22/20/18/16/14초 ⇒ 24/22.5/21/19.5/18초"],
  ["재사용 대기시간 100/85/70초 ⇒ 120/100/80초"]],
  
  [["스킬 사용 시간 버그 수정 0.25~0.18초, 공격 속도에 비례하여 감소 ⇒ 0.25~0.10초, 공격 속도에 비례하여 감소"],
  ["미니언 대상 피해량 80% ⇒ 65%", "(신규) 골드는 영원하지 이제 튕기는 공격이 타격한 미니언에게 남은 체력이 15 미만인 경우 처형합니다."]],
  
  [["기본 체력 632 ⇒ 600", "기본 마나 325 ⇒ 340", "마나 증가량 50 ⇒ 40", "기본 마나 재생 초당 1.6 ⇒ 초당 1.2", "마나 재생 증가량 0.18 ⇒ 0.16", "기본 공격력 63 ⇒ 58", "공격력 증가량 3 ⇒ 3.3", "공격 속도 증가량 1.6% ⇒ 2%"],
  ["추가 이동 속도 35/40/45/50/55 ⇒ 55/60/65/70/75 (1/6/11/16/18레벨에서)", "추가 이동 속도 지속시간 2초 ⇒ 1.5에 걸쳐 감소"],
  ["기본 피해량 35/50/65/80/95 (+총 공격력의 70/85/100/115/130%) (+주문력의 50%) ⇒ 15/30/45/60/75 (+총 공격력의 80/85/90/95/100%) (+주문력의 60%)", "재사용 대기시간 7초 (모든 스킬 레벨에서) ⇒ 10/9.5/9/8.5/8초", "사용 시간 0.25초 ⇒ 0.25~0초 (공격 속도에 비례하여 감소)", "(신규) 치명적 부메랑 이제 치명타 확률에 비례하며 치명타 확률 100%에서 최대 50%의 추가 피해를 입힙니다.", "마나 소모량 70/80/90/100/110 ⇒ 55/60/65/70/75", "탄도체 속도 1,350 ⇒ 던질 때 1,450, 돌아올 때 1,200"],
  ["피해량 총 공격력의 30/45/60/75/90% ⇒ 총 공격력의 30/35/40/45/50%","마나 소모량 75 ⇒ 60/65/70/75/80", "효과 지속시간 기본 공격 3회 ⇒ 4초", "재사용 대기시간 12/10.5/9/7.5/6초 ⇒ 12초 (모든 스킬 레벨에서)", "(신규) 속도 강화 이제 W - 튕기는 부메랑 사용 시 시비르가 20/25/30/35/40%의 추가 공격 속도를 얻습니다.", "(신규) 작지만 강한 이제 미니언에게 80%의 피해를 입힙니다.", "튕기는 최대 횟수 무제한 ⇒ 공격당 8회", "튕기는 사거리 450 ⇒ 500 (참고: 1티모미터 정도 늘어난 거리)", "튕기는 탄도체 속도 700 ⇒ 1,000", "(신규) 튕기기 강화 이제 W - 튕기는 부메랑이 이미 타격한 대상에게 추가로 1회 더 튕길 수 있습니다. W - 튕기는 부메랑은 새로운 대상에게 우선적으로 튕깁니다."],
  ["재사용 대기시간 22/19/16/13/10초 ⇒ 22/20/18/16/14초", "(신규) 회복 보호막 이제 적 스킬을 막으면 총 공격력의 60/65/70/75/80% (+주문력의 50%) 만큼 체력을 회복합니다.", "(신규) 잘 가 이제 적 스킬을 막으면 기본 지속 효과 - 재빠른 발놀림의 효과가 발동합니다.", "(삭제) 막으나 마나 이제 적 스킬을 막아도 마나를 회복하지 않습니다."],
  ["재사용 대기시간 120/100/80초 ⇒ 100/85/70초", "지속시간 8초 (모든 스킬 레벨에서) ⇒ 8/10/12초", "(신규) 사냥은 계속된다 이제 R - 사냥 개시의 효과가 활성화된 상태에서 시비르가 처치에 관여하면 지속시간이 초기화됩니다.", "(신규) 재빠른 공격 이제 R - 사냥 개시의 지속시간 동안 시비르의 기본 공격이 기본 스킬 재사용 대기시간을 공격당 0.5초씩 감소시킵니다.", "(삭제) 공격 속도여 안녕 이제 R - 사냥 개시가 시비르에게 추가 공격 속도를 부여하지 않습니다.", "(삭제) 시작은 천천히 이제 스킬 사용 직후 시비르 및 아군에게 폭발적인 이동 속도를 부여하지 않습니다."]]];
}

//스카너
class PatchContent_Skarner{
  static List<String> BorNorM=["조정", "하향"];
  static List<String> patchVer=["14.8", "12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[25], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 진동의 가닥", "기본 능력치", "Q - 부서진 대지/지반 돌출", "W - 대지의 수호자"],
    ["W - 수정 외골격"]];
  static List<List<List<String>>> Detail_Content =[
    [["피해량: 대상 최대 체력의 7~12% ⇒ 대상 최대 체력의 7~10%"],
    ["마나 증가량: 45 ⇒ 40", "마나 재생 증가량: 0.45 ⇒ 0.6"],
    ["부서진 대지 피해량: 10/20/30/40/50 (+추가 공격력의 40%) (+추가 체력의 6%) ⇒ 10/25/40/55/70 (+추가 공격력의 60%) (+스카너 추가 체력의 5%)","지반 돌출 피해량: 10/20/30/40/50 (+추가 공격력의 40%) (+추가 체력의 6%) ⇒ 10/25/40/55/70 (+추가 공격력의 60%) (+스카너 추가 체력의 5%) (+대상 최대 체력의 15%)", "마나 소모량: 40/45/50/55/60 ⇒ 30/35/40/45/50", "효과 지속시간: 3.5초 ⇒ 5초 (참고: 여전히 공격 및 E - 이쉬탈의 격돌 사용 시 스킬 효과 지속시간이 초기화됩니다.)", "지반 돌출 재사용 제한 시간: 0.75초 ⇒ 0.5초", "부서진 대지 스킬 사용 시간: 0.5초 ⇒ 0.35초 (참고: 이는 스카너가 땅에서 바위를 뜯어내고 이동 및 공격이 가능해지는 데 소요되는 시간을 의미합니다.)"],
    ["마나 소모량: 50/55/60/65/70 ⇒ 60/65/70/75/80", "마법 피해량: 60/90/120/150/180 (+주문력의 80%) ⇒ 50/70/90/110/130 (+주문력의 80%)"]],
    
    [["보호막 흡수량 최대 체력의 10/11/12/13/14% (+주문력의 80%) ⇒ 최대 체력의 9/10/11/12/13% (+주문력의 80%)"]]];
}

//소나
class PatchContent_Sona{
  static List<String> BorNorM=["상향", "상향","하향","하향"];
  static List<String> patchVer=["14.7",  "12.19","12.10","12.1"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[24],PatchNoteLink.link[10], PatchNoteLink.link[19],PatchNoteLink.link[28]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 파워 코드", "Q - 용맹의 찬가", "W - 인내의 아리아", "E - 기민함의 노래"],
    ["Q - 용맹의 찬가","E - 기민함의 노래"],
  ["W - 인내의 아리아"],
  ["기본 능력치","E - 기민함의 노래"]];
  static List<List<List<String>>> Detail_Content =[
    [["스타카토 추가 피해량: 40% ⇒ 50%"],
    ["아군 추가 마법 피해량: 10/15/20/25/30 (+주문력의 20%) ⇒ 10/15/20/25/30 (+주문력의 10%)"],
    ["체력 회복량: 30/45/60/75/90 (+주문력의 15%) ⇒ 30/45/60/75/90 (+주문력의 30%)"],
    ["아군 이동 속도: 10/11/12/13/14% (+주문력 100당 2%) ⇒ 10/12/14/16/18% (+주문력 100당 2%)"]],
    
    [["기본 피해량: 40/70/100/130/160 ⇒ 50/80/110/140/170"],
  ["파워 코드 둔화율: 40% (+주문력 100당 4%) ⇒ 50% (+주문력 100당 4%)"]],
  
  [["보호막 흡수량 25/50/75/100/125 (+주문력의 30%) ⇒ 25/45/65/85/105 (+주문력의 25%)", "체력 회복량 30/50/70/90/110 (+주문력의 20%) ⇒ 30/45/60/75/90 (+주문력의 15%)"]],
  
  [["방어력 증가량 3.3 ⇒ 3"],
  ["재사용 대기시간 12초 ⇒ 14초"]]];
}

//소라카
class PatchContent_Soraka{
  static List<String> BorNorM=["상향", "조정","하향","하향"];
  static List<String> patchVer=["14.4", "12.12","12.10","12.8"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[21], PatchNoteLink.link[17], PatchNoteLink.link[19],PatchNoteLink.link[21]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 구원", "Q - 별부름", "E - 별의 균형", "R - 기원"],
    ["R - 기원"],
  ["W - 은하의 마력" "R - 기원"],
  ["W - 은하의 마력"]];

  static List<List<List<String>>> Detail_Content =[
    [["추가 이동 속도: 70% ⇒ 90%"],
    ["체력 총회복량: 50/65/80/95/110 (+주문력의 30%) ⇒ 60/75/90/105/120 (+주문력의 30%)"],
    ["버그 수정: E - 별의 균형이 이제 매번 다르게 적용되는 지연 시간 없이 영역 내의 적을 즉시 침묵시킵니다."],
    ["재사용 대기시간: 160/145/130초 ⇒ 150/135/120초"]],

    [["체력 회복량 125/200/275 (+주문력의 50%) ⇒ 150/250/350 (+주문력의 50%)", "(삭제) 깊은 상처 이제 대상의 고통스러운 상처를 제거하지 않습니다."]],
  
  [["체력 회복량 100/130/160/200/220 (+주문력의 65%) ⇒ 90/110/130/150/170 (+주문력의 50%)"],
  ["체력 회복량 130/215/300 (+주문력의 55%) ⇒ 125/205/285 (+주문력의 50%)"]],
  
  [["회복량 100/135/170/205/240 (+주문력의 70%) ⇒ 100/130/160/190/220 (+주문력의 65%)"]]];
}

//스웨인
class PatchContent_Swain{
  static List<String> BorNorM=["상향","하향","하향","조정"];
  static List<String> patchVer=["13.9","12.11","12.10","12.8"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[2],PatchNoteLink.link[18], PatchNoteLink.link[19],PatchNoteLink.link[21]];
  static List<List<String>> Detail_Title =[
    ["Q - 죽음의 손길"],
    ["기본 지속 효과 - 굶주린 새떼", "W - 제국의 눈", "R - 악의 승천"],
  ["기본 지속 효과 - 굶주린 새떼", "R - 악의 승천"],
  ["기본 능력치", "기본 지속 효과 - 굶주린 새떼","Q - 죽음의 손길", "W - 제국의 눈", "E - 속박명령", "R - 악의 승천", "R - 악의 불길"]];
  static List<List<List<String>>> Detail_Content =[
    [["마법 피해량: 60/80/100/120/140 (+주문력의 38%) ⇒ 65/85/105/125/145 (+주문력의 40%)", "번개당 추가 피해량: 12/22/32/42/52 (+주문력의 8%) ⇒ 15/25/35/45/55 (+주문력의 10%)", "최대 마법 피해량: 108/168/228/288/348 (+주문력의 70%) ⇒ 125/185/245/305/365 (+주문력의 80%)"]],
    
    [["체력 회복량 3.5/4.5/5.5/7% ⇒ 3/4/5/6%"],
  ["마법 피해량 80/120/160/200/240 (+주문력의 70%) ⇒ 80/115/150/185/220 (+주문력의 55%)"],
  ["초당 회복량 15/30/45 (+주문력의 20%) ⇒ 15/27.5/40 (+주문력의 18%)"]],
  
  [["영혼 조각당 회복량 최대 체력의 4/5.5/7/9% ⇒ 3.5/4.5/5.5/7% (1/6/11/16레벨에서)"],
  ["초당 체력 회복량 15/40/65 (+주문력의 25%) ⇒ 15/30/45 (+주문력의 20%)"]],
  
  [["기본 방어력 23 ⇒ 26", "기본 이동 속도 325 ⇒ 330"],
  ["영혼 조각 체력 회복량 최대 체력의 4/5.5/7% ⇒ 최대 체력의 4/5.5/7%/9% (1/6/11/16레벨에서)", "영혼 조각당 최대 체력 증가량 5 ⇒ 12", "(삭제) 가까이 오지 마 이제 스웨인의 기본 지속 효과 - 굶주린 새떼로 이동 불가 상태인 적을 끌어당겨 영혼 조각을 뜯어낼 수 없습니다. (E - 속박명령 참고)"],
  ["피해량 55/75/95/115/135 (+주문력의 40%) ⇒ 60/80/100/120/140 (+주문력의 38%)", "적중한 번개당 추가 피해량 8.25/15/23.75/34.5/47.25 (+주문력의 6/8/10/12/14%) ⇒ 12/22/32/42/52 (+주문력의 8%)", "최대 피해량 (번개 5개 적중) 88/135/190/253/324 (+주문력의 64/72/80/88/96%) ⇒ 108/168/228/288/348 (+주문력의 70%)", "재사용 대기시간 9/7.5/6/4.5/3초 ⇒ 7/6/5/4/3초", "마나 소모량 65/70/75/80/85 ⇒ 45/50/55/60/65"],
  ["마나 소모량 70/80/90/100/110 ⇒ 60/65/70/75/80", "(신규) 유리한 고지 이제 W - 제국의 눈 스킬 신호를 보내면 팀 채팅으로 현재 보이는 사거리 내의 적 챔피언이 표시됩니다. (트위스티드 페이트나 녹턴의 궁극기와 동일)"],
  ["(신규) 한심한 체스말 이제 스킬을 재사용하여 E - 속박명령으로 속박한 모든 챔피언을 끌어당길 수 있으며 각 챔피언으로부터 영혼 조각을 1개씩 뜯어냅니다.", "(삭제) 조용한 희생 이제 스웨인이 적을 끌어당길 때 피해를 입히지 않습니다.", "(신규) 진정한 선지자 속박된 모든 대상의 모습을 드러냅니다.", "(신규) 악의 할인 R - 악의 승천을 활성화했을 때 E - 속박명령의 재사용 대기시간이 20% 감소합니다."],
  ["재사용 대기시간 120초 ⇒ 100/80/60초", "흡수 초당 피해량 35/50/65 (+주문력의 14%) ⇒ 20/40/60 (+주문력의 10%)", "흡수 초당 회복량 20/35/40 (+주문력의 16%) ⇒ 15/40/65 (+주문력의 25%)", "(삭제) 거대한 새 이제 R - 악의 승천이 활성화되어 있을 때 스웨인에게 추가 체력 125/200/275를 부여하지 않습니다.", "(삭제) 일석이조 이제 R - 악의 승천이 활성화되어 있을 때 영혼 조각의 추가 체력이 두 배로 증가하지 않습니다.", "(삭제) 지속시간 12초 ⇒ 악마의 힘에 비례", "악마의 힘 R - 악의 승천을 활성하면 스웨인이 악마의 힘 50을 얻으며 처음에는 악마의 힘이 초당 10씩 감소합니다. R - 악의 승천을 활성화하고 5초가 지나면 악마의 힘이 초당 15씩 감소합니다.", "(신규) 영혼 강탈자 스웨인이 적 챔피언을 흡수하는 동안 악마의 힘이 초당 20씩 증가합니다.", "거대한 악의 에너지 R - 악의 승천을 활성화하고 2초가 지나면 R - 악의 불길을 사용할 수 있습니다. R - 악의 불길은 한 번만 사용할 수 있지만 사용해도 R - 악의 승천이 종료되지 않습니다."],
  ["피해량 100/150/200 (+주문력의 50%) ⇒ 150/225/300 (+주문력의 60%)", "(신규) 발화 이제 R - 악의 불길이 적을 60% 둔화시키며 이동 속도는 1.5초에 걸쳐 원래대로 돌아옵니다.", "(삭제) 저장 대신 소비 이제 R - 악의 불길이 흡수한 체력에 비례하여 추가 피해를 입히지 않습니다."]]];
}

//사일러스
class PatchContent_Sylas{
  static List<String> BorNorM=["상향", "상향", "상향", "하향","상향","하향","상향"];
  static List<String> patchVer=["14.8", "14.7", "13.16", "12.17","12.11","12.10","12.8"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[25], PatchNoteLinkPlus.link[24],PatchNoteLinkPlus.link[9],PatchNoteLink.link[12],PatchNoteLink.link[18], PatchNoteLink.link[19],
  PatchNoteLink.link[21]];
  static List<List<String>> Detail_Title =[
    ["Q - 사슬 후려치기"],
    ["재사용 대기시간: 140/120/100 ⇒ 160/135/110"],
    ["기본 능력치"],
    ["기본 능력치","Q - 사슬 후려치기"],
  ["W - 국왕시해자", "E - 도주/억압"],
  ["W - 국왕시해자"],
  ["R - 강탈"]];
  static List<List<List<String>>> Detail_Content =[
    [["몬스터 대상 피해량: 70% ⇒ 100%"]],

    [["미니언 및 몬스터 대상 피해량: 40% ⇒ 미니언 대상 40%, 몬스터 대상 70%"]],

    [["기본 마나: 310 ⇒ 400"]],

    [["기본 체력 595 ⇒ 575"],
  ["재사용 대기시간 10/9/8/7/6초 ⇒ 11/10/9/8/7초"]],
  
  [["마나 소모량 60/70/80/90/100 ⇒ 50/60/70/80/90", "체력 회복량 20/40/60/80/100 (+주문력의 35%) ⇒ 20/40/60/80/100 (+주문력의 40%)", "재사용 대기시간 13/11.25/9.5/7.75/6초 ⇒ 12/10.5/9/7.5/6초"],
  ["재사용 대기시간 14/13/12/11/10초 ⇒ 13/12/11/10/9초"]],
  
  [["체력 회복량 25/50/75/100/125 (+주문력의 40%) ⇒ 20/40/60/80/100 (+주문력의 35%)"]],
  
  [["재사용 대기시간 100/70/40초 ⇒ 80/55/30초"]]];
}

//신드라
class PatchContent_Syndra{
  static List<String> BorNorM=["상향", "하향","조정"];
  static List<String> patchVer=["13.19", "12.23","12.19"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[12], PatchNoteLink.link[6],PatchNoteLink.link[10]];
  static List<List<String>> Detail_Title =[
    ["Q - 어둠 구체"],
    ["W - 의지의 힘", "E - 적군 와해"],
  ["기본 능력치","기본 지속 효과 - 초월", "Q - 어둠 구체","W - 의지의 힘","E - 적군 와해","R - 풀려난 힘"]];
  static List<List<List<String>>> Detail_Content =[
    [["마법 피해량: 70/105/140/175/210 (+주문력의 70%) ⇒ 75/110/145/180/215 (+주문력의 70%)"]],
    
    [["초월 강화 추가 피해량: 15% (+주문력 100당 1.5%) ⇒ 12% (+주문력 100당 2%)"],
  ["재사용 대기시간: 15초 ⇒ 17초", "마법 피해량: 75/115/155/195/235 (+주문력의 55%) ⇒ 75/115/155/195/235 (+주문력의 45%)"]],

  [["기본 체력: 593 ⇒ 563"],
  ["기본 지속 효과 업데이트: 신드라가 레벨 업하거나 적 챔피언에게 피해를 입히면 분노의 조각(최대 120개)을 획득합니다. 분노의 조각은 신드라와 신드라의 스킬을 강화합니다.", "분노의 조각이 부여하는 마나: 신드라가 적으로부터 분노의 조각을 획득할 때마다 20~215(레벨에 따라)의 마나를 회복합니다.", "초월자: 분노의 조각을 120개 수집하면 신드라의 총 주문력이 15% 증가합니다.", "분노의 조각 획득 방법은 다음과 같습니다. 4초 이내에 적 챔피언에게 스킬을 2회 적중시키면 분노의 조각을 1/2/3개(1/11/18레벨에서) 획득합니다. 대상별 8초의 재사용 대기시간이 적용됩니다. 신드라가 레벨 업하면 분노의 조각을 5개 획득합니다. 공성 미니언을 처치하면 분노의 조각을 1개 획득합니다.", "(신규) 새로운 모습: 신드라의 스킬이 업그레이드되면 스킬 아이콘이 업그레이드 상태를 나타내는 새로운 아이콘으로 변경됩니다."],
  ["재사용 대기시간: 4초 ⇒ 7초", "마나 소모량: 40/50/60/70/80 ⇒ 40/45/50/55/60", "마법 피해량: 70/105/140/175/210 (+주문력의 65%) ⇒ 70/105/140/175/210 (+주문력의 70%)", "(신규) 초월한 어둠 구체: 분노의 조각을 40개 수집하면 Q - 어둠 구체가 2회까지 충전됩니다. (참고: 재사용 시 1.25초의 재사용 대기시간이 적용됩니다.)"],
  ["구체 들어올리기 포착 사거리: 400 단위 ⇒ 500 단위", "(신규) 도망쳐라, 놀잇감들아: 이제 구체를 제외한 유닛이 신드라에 의해 들어올려진 동안 사망할 수 없는 상태가 됩니다. 이전에는 들어올려진 유닛이 사망할 수도 있었던 잠시 동안의 틈이 있었지만, 삭제되었습니다.", "(신규) 초월한 의지의 힘: 분노의 조각을 60개 수집하면 W - 의지의 힘이 15%(+주문력 100당 1.5%)의 추가 고정 피해를 입힙니다."],
  ["재사용 대기시간: 18/17/16/15/14초 ⇒ 15초 (모든 스킬 레벨에서)", "기절 지속시간: 1.5초 ⇒ 1.25초", "마법 피해량: 85/130/175/220/265 (+주문력의 60%) ⇒ 75/115/155/195/235 (+주문력의 55%)", "와해 각도: 34도 ⇒ 56도", "(신규) 거리 두기: 가까운 거리에서 Q - 어둠 구체가 대상을 기절시키지 않을 확률을 줄였습니다.", "(삭제) 구체 발사: 이제 E - 적군 와해를 사용한 이후에 생성되는 어둠 구체는 탄도체 형태로 발사되지 않습니다.", "(신규) 초월한 적군 와해: 분노의 조각을 80개 수집하면 E - 적군 와해의 원뿔 범위가 증가하고 (56도 ⇒ 84도) 1.25초 동안 적을 70% 둔화시킵니다. 둔화 효과는 최초 군중 제어 효과 지속시간이 끝난 후에 부여됩니다."],
  ["구체당 피해량: 90/140/190 (+주문력의 20%) ⇒ 90/130/170 (+주문력의 17%)", "(신규) 신규 기본 지속 효과: 이제 R - 풀려난 힘이 Q - 어둠 구체에 10/20/30의 스킬 가속을 추가로 부여합니다.", "(신규) 초월한 풀려난 힘: 분노의 조각을 100개 수집하면 R - 풀려난 힘이 남은 체력이 최대 체력의 15% 미만인 적 챔피언을 처형합니다."]]];
}

//탐켄치
class PatchContent_TahmKench{
  static List<String> BorNorM=["하향", "상향", "상향","상향","하향", "상향","하향","조정"];
  static List<String> patchVer=["13.22", "13.21", "12.23","12.19","12.12", "12.11","12.10","12.2"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[15],PatchNoteLinkPlus.link[14], PatchNoteLink.link[6],PatchNoteLink.link[10],PatchNoteLink.link[17], 
  PatchNoteLink.link[18], PatchNoteLink.link[19],PatchNoteLink.link[27]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 절대 미각"],
    ["기본 지속 효과 - 절대 미각", "W - 심연 잠수"],
    ["기본 지속 효과 - 절대 미각", "Q - 혀 채찍", "W - 심연 잠수", "E - 두꺼운 피부", "R - 집어삼키기"],
  ["Q - 혀 채찍","W - 심연 잠수"],
  ["기본 능력치", "기본 지속 효과 - 절대 미각"],
  ["기본 지속 효과 - 절대 미각", "Q - 혀 채찍","R - 집어삼키기"],
  ["Q - 혀 채찍", "E - 두꺼운 피부"],
  ["Q - 혀 채찍", "E - 두꺼운 피부", "R - 집어삼키기"]];
  static List<List<List<String>>> Detail_Content =[
    [["추가 마법 피해량: 6~48 (레벨에 따라) (+추가 체력 100당 주문력의 2%) (+추가 체력의 5%) ⇒ 6~48 (레벨에 따라) (+추가 체력 100당 주문력의 2%) (+추가 체력의 4%)"]],

    [["추가 마법 피해량: 8~60 (레벨에 따라) (+추가 체력 100당 주문력의 2%) (+추가 체력의 3%) ⇒ 6~48 (레벨에 따라) (+추가 체력 100당 주문력의 2%) (+추가 체력의 5%)"],
    ["챔피언 적중 시 재사용 대기시간 반환: 40% ⇒ 40/42.5/45/47.5/50%"]],
    
    [["기본 공격 및 Q - 혀 채찍 적중 시 추가 마법 피해량: 8~60 (레벨에 따라) (+추가 체력의 3%) ⇒ 8~60 (레벨에 따라) (+추가 체력의 3%) (+추가 체력 100당 주문력의 2%)"],
  ["마법 피해량: 80/130/180/230/280 (+주문력의 90%) ⇒ 80/130/180/230/280 (+주문력의 100%)", "자신 대상 체력 회복량: 10/15/20/25/30(+잃은 체력의 3/3.5/4/4.5/5%) ⇒ 10/15/20/25/30 (+잃은 체력의 5/5.5/6/6.5/7%)"],
  ["마법 피해량: 100/135/170/205/240 (+주문력의 125%) ⇒ 100/135/170/205/240 (+주문력의 150%)"],
  ["회색 체력으로 비축하는 피해량: 13/21/29/37/45% ⇒ 15/23/31/39/47%", "증가된 회색 체력으로 비축하는 피해량: 40/42.5/45/47.5/50% ⇒ 42/44/46/48/50%"],
  ["마법 피해량: 100/250/400 (+대상 최대 체력의 15% (+주문력 100당 5%)) ⇒ 100/250/400 (+대상 최대 체력의 15% (+주문력 100당 7%))", "보호막 지속시간: 집어삼키기가 끝나고 2.5초간 지속 ⇒ 집어삼키기가 끝나고 0.25초마다 50씩 사라질 때까지 감소"]],
  
  [["마법 피해량: 80/130/180/230/280 (+주문력의 70%) (+절대 미각 적중 시 피해 8~60 (레벨에 따라)) (+추가 체력의 3%) ⇒ 80/130/180/230/280 (+주문력의 90%) (+절대 미각 적중 시 피해 8~60 (레벨에 따라)) (+추가 체력의 3%)"],
  ["스킬 레벨당 피해량: 100/135/170/205/240 (+주문력의 100%) ⇒ 100/135/170/205/240 (+주문력의 125%)"]],
  
  [["체력 증가량 109 ⇒ 103"], 
  ["적중 시 추가 마법 피해량 8~60 (레벨에 따라) (+추가 체력의 4%) ⇒ 8~60 (레벨에 따라) (+추가 체력의 3%)"]],
  
  [["적중 시 추가 마법 피해량 8~60 (레벨에 따라) (+추가 체력의 2.5%) ⇒ 8~60 (레벨에 따라) (+추가 체력의 4%)"],
  ["적중 시 체력 회복량 10/12.5/15/17.5/20 (+잃은 체력의 3/3.5/4/4.5/5%) ⇒ 10/15/20/25/30 (+잃은 체력의 3/3.5/4/4.5/5%)"],
  ["보호막 흡수량 500/700/900 ⇒ 650/800/950"]],

  [["체력 회복량 10/15/20/25/30 (+잃은 체력의 4/4.5/5/5.5/6%) ⇒ 10/12.5/15/17.5/20 (+잃은 체력의 3/3.5/4/4.5/5%)"],
  ["회색 체력으로 전환되는 피해량 15/25/35/45/55% ⇒ 13/21/29/37/45%", "적이 둘 이상 있을 때 회색 체력으로 전환되는 피해량 45/50/55/60/65% ⇒ 40/42.5/45/47.5/50%"]],
  
  [["둔화율 40% ⇒ 50%"],
  ["회색 체력으로 비축하는 피해량 45/50/55/60/65% ⇒ 15/25/35/45/55%, 근처에 2명 이상의 적 챔피언이 있으면 45/50/55/60/65%로 증가 (생존 여부와 상관없이)", "회색 체력 소모 시 체력 회복량 30~100% (레벨에 따라) ⇒ 45~100% (레벨에 따라)"],
  ["집어삼킨 아군 보호막 흡수량 400/500/600 (+주문력의 100%) ⇒ 500/700/900 (+주문력의 150%)","아군을 집어삼켰을 때 이동 속도 증가량 아군을 집어삼켰을 때 이동 속도 30/20/10% 감소 ⇒ 3초 동안 탐 켄치의 이동 속도 40% 증가 (R - 집어삼키기의 지속시간과 상관없이)"]]];
}

//탈리야
class PatchContent_Taliyah{
  static List<String> BorNorM=["상향", "상향", "조정","하향","상향","하향","하향","조정"];
  static List<String> patchVer=["14.3", "13.15", "13.9","12.15","12.13","12.11","12.10","12.9"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[20], PatchNoteLinkPlus.link[8], PatchNoteLinkPlus.link[2],PatchNoteLink.link[14],PatchNoteLink.link[16],PatchNoteLink.link[18], PatchNoteLink.link[19]
  ,PatchNoteLink.link[20]];
  static List<List<String>> Detail_Title =[
    ["Q - 파편 난사", "E - 대지의 파동"],
    ["Q - 파편 난사", "E - 대지의 파동"],
    ["R - 바위술사의 벽"],
    ["E - 대지의 파동","R - 바위술사의 벽"],
  ["기본 지속 효과 - 바위타기", "Q - 파편 난사", "R - 바위술사의 벽"],
  ["기본 능력치", "Q - 파편 난사", "E - 대지의 파동", "R - 바위술사의 벽"],
  ["기본 지속 효과 - 바위타기", "Q - 파편 난사", "E - 대지의 파동"],
  ["기본 능력치", "기본 지속 효과 - 바위타기","Q - 파편 난사", "W - 지각변동", "E - 대지의 파동","R - 바위술사의 벽"]];
  static List<List<List<String>>> Detail_Content =[
    [["피해량: 50/70/90/110/130 (+주문력의 50%) ⇒ 60/78/96/114/132 (+주문력의 50%)"],
    ["재사용 대기시간: 16/15.5/15/14.5/14초 ⇒ 14초 (모든 스킬 레벨에서)"]],

    [["마법 피해량: 45/65/85/105/125 (+주문력의 50%) ⇒ 50/70/90/110/130 (+주문력의 50%)"],
    ["재사용 대기시간: 18/17/16/15/14초 ⇒ 16/15.5/15/14.5/14초", "몬스터 대상 피해량 계수: 150% ⇒ 175%"]],

    [["스킬 사용 제한 조건: 탈리야가 피해를 입히거나 받을 때 ⇒ 탈리야가 피해를 받을 때"]],
    
    [["재사용 대기시간 16/15/14/13/12초 ⇒ 18/17/16/15/14초"],
  ["벽 지속시간 5초 ⇒ 4초"]],
  
  [["(신규) 바위탈 시간 이제 탈리야의 기본 지속 효과 - 바위타기 재사용 대기시간이 리안드리의 고통과 같은 효과 피해로 인해 초기화되지 않습니다."],
  ["바위 조각 1개 피해량 40/60/80/100/120 (+주문력의 50%) ⇒ 45/65/85/105/125 (+주문력의 50%)", "바위 조각 5개 피해량 104/156/208/260/312 (+주문력의 130%) ⇒ 117/169/221/273/325 (주문력의 130%)", "바위 피해량 76/114/152/190/228 (+주문력의 95%) ⇒ 85.5/123.5/161.5/199.5/237.5 (+주문력의 95%)", "마나 소모량 60/65/70/75/80 ⇒ 55/60/65/70/75", "몬스터 대상 추가 피해량 30 (+주문력의 10%) ⇒ 25 (+주문력의 10%)", "(신규) 아주 단단한 바위 정글 몬스터에게 바위 (다져진 땅에서 Q - 파편 난사 사용 시 생성) 적중 시 3초 동안 기절시킵니다."],
  ["계속 달려봅시다 이제 탈리야가 와드나 덫을 공격해도 R - 바위술사의 벽의 재사용 대기시간이 시작되지 않습니다."]],

  [["기본 체력 570 ⇒ 550"],
  ["재사용 대기시간 6.5/5.5/4.5/3.5/2.5초 ⇒ 7/6/5/4/3초", "바위 조각 1개 피해량 38/61/84/107/130 (+주문력의 50%) ⇒ 40/60/80/100/120 (+주문력의 50%)", "바위 조각 5개 피해량 98.8/158.6/218.4/278.2/338 (+주문력의 130%) ⇒ 104/156/208/260/312 (+주문력의 130%)", "바위 피해량 72.4/115.9/159.6/203.3/247 (+주문력의 90%) ⇒ 75/114/152/190/228 (+주문력의 90%)"],
  ["날카로운 정글 바위 이제 E - 대지의 파동이 몬스터에게 150%의 피해를 입힙니다."],
  ["잠깐 기다려요 이제 탈리야가 스킬 이외의 피해를 입힌 후 3초 이내에 R - 바위술사의 벽을 사용할 수 없습니다."]],

  [["추가 이동 속도 10/20/35/55% ⇒ 10/15/25/40% (1/9/12/15레벨에서)","지형에서 떨어져 있을 때 기본 지속 효과 - 바위타기 추가 이동 속도 유지 시간 2.5초 ⇒ 3초"],
  ["(다져진 땅에서 사용 시) 둔화율 2초 동안 30/35/40/45/50% ⇒ 1.5초 동안 20/25/30/35/40%", "(다져진 땅에서 사용 시) 처음 적중한 적 대상 피해량 200% ⇒ 190%"],
  ["둔화율 20/22/24/26/28% ⇒ 20% (모든 스킬 레벨에서)", "기절 지속시간 0.6/0.7/0.8/0.9/1초 ⇒ 0.75초 (모든 스킬 레벨에서)"]],

  [["기본 체력 531 ⇒ 500", "기본 체력 재생 7 ⇒ 6.5", "체력 재생 증가량 0.7 ⇒ 0.65", "기본 마나 425 ⇒ 470", "기본 마나 재생 9.34 ⇒ 8", "마나 재생 증가량 0.85 ⇒ 0.8","기본 방어력 20 ⇒ 18", "이동 속도 335 ⇒ 330"],
  ["비전투 상태 추가 이동 속도 20~45% (레벨에 따라) ⇒ 10/20/35/55% (1/9/12/15레벨에서)", "지형에서 떨어져 있을 때 추가 이동 속도 유지 시간 1초 ⇒ 2.5초"],
  ["마나 소모량 50/60/70/80/90 ⇒ 60/65/70/75/80", "재사용 대기시간 7/6/5/4/3초 ⇒ 6.5/5.5/4.5/3.5/2.5초", "바위 조각 1개 피해량 70/95/120/145/170 (+주문력의 45%) ⇒ 38/61/84/107/130 (+주문력의 50%)", "추가 바위 조각 피해 감소량 50% ⇒ 60%", "바위 조각 5개 피해량 210/285/360/435/510 (+주문력의 135%) ⇒ 98.8/158.6/218.4/278.2/338 (+주문력의 130%)", "몬스터 대상 추가 바위 조각 피해 감소량 25% ⇒ 60%", "(신규) 효과는 굉장했다! 이제 각 바위 조각이 몬스터에게 30(+주문력의 10%)의 추가 피해를 입힙니다.", "(신규) 폭발하는 바위 조각 이제 바위 조각이 175 범위의 광역 피해를 입힙니다. (약 티모의 1.6배)", "바위처럼 단단하게 이제 Q - 파편 난사 사용 중에 탈리야가 경직 상태가 되어도 스킬이 중단되지 않습니다.", "그냥 바위가 아니야 이제 Q - 파편 난사를 다져진 땅 위에서 사용하면 다져진 땅을 소모하여 두 배의 피해[76/122/168/214/260 (+주문력의 100%)]를 입히는 바위 조각 1개를 발사하여 225 범위 내의 모든 적에게 피해를 입히고 2초 동안 이동 속도를 30/35/40/45/50% 감소시킵니다.", "다져진 땅에서 사용 시 마나 소모량 1 ⇒ 20", "다져진 땅에서 사용 시 최소 재사용 대기시간 1초 ⇒ 0.75초", "다져진 땅 지속시간 25초 ⇒ 30초", "다져진 땅 범위 300 ⇒ 400", "평평한 땅 이제 칼바람 나락의 다져진 땅 크기가 소환사의 협곡과 동일합니다.", "(신규) 새로운 돌덩이 다져진 땅 위에서 사용하는 Q - 파편 난사에 새로운 시각 효과, 음향 효과, 애니메이션 및 스킬 아이콘이 적용됩니다!"],
  ["마나 소모량 70/80/90/100/110 ⇒ 40/30/20/10/0", "재사용 대기시간 16/15/14/13/12초 ⇒ 14/12.5/11/9.5/8초", "공중에 띄우기 범위 200 ⇒ 225", "공중에 띄우기 발동 시간 0.8초 ⇒ 0.75초", "(삭제) 모래처럼 부드럽게 이제 W - 지각변동이 피해를 입히지 않습니다."],
  ["재사용 대기시간 16/14/12/10/8초 ⇒ 16/15/14/13/12초", "스킬 사용 시 피해량 50/75/100/125/150 (+주문력의 40%) ⇒ 60/105/150/195/240 (+주문력의 60%)", "둔화율 20% (+주문력의 4%) ⇒ 20/22/24/26/28% (주문력 계수 삭제)", "바위 폭발 피해량 50/60/70/80/90 (+주문력의 30%) ⇒ 25/45/65/85/105 (+주문력의 30%)", "바위 추가 적중 시 피해 감소량 15% ⇒ 25%", "바위 폭발 최대 피해량 155/186/217/248/279 (+주문력의 93%) ⇒ 62.5/112.5/162.5/212.5/262.5 (+주문력의 75%)", "스킬 사용 후 첫 번째 줄 생성까지 걸리는 시간 0.1초 ⇒ 0초", "첫 번째 줄 생성 후 다음 줄 생성까지 걸리는 시간 0.1초 ⇒ 0.17초", "지각 변동 이제 E - 대지의 파동이 탈리야를 기준으로 4개씩 6줄의 바위를 생성합니다. (기존에는 6개씩 4줄)", "돌조심 이제 바위 위로 돌진하는 적을 돌진 지속시간 + 0.6/0.7/0.8/0.9/1초 동안 기절시킵니다. (참고: 최대 기절 지속시간은 2초이며 정글 몬스터는 항상 최대 지속시간만큼 기절)", "(삭제) 그냥 바위 이제 E - 대지의 파동이 4초 후 폭발하여 추가 피해를 입히지 않습니다."],
  ["사거리 3,000/4,500/6,000 ⇒ 2,500/4,500/6,500", "벽에서 내려올 때 돌진 거리 400 ⇒ 700", "벽에서 내려올 때 돌진 속도 1,000 ⇒ 1,200", "긴급 탈출 탈리야가 R - 바위술사의 벽을 타고 이동할 때 지형을 클릭하면 벽을 기준으로 평행하게 뛰어내리는 대신 클릭한 위치로 최대 사거리만큼 돌진합니다.", "서핑 시작 이제 탈리야가 벽에서 내려올 때 더 수월하게 지형을 통과하여 돌진할 수 있습니다.", "(신규) 과속 방지 적 챔피언이나 포탑의 공격에 적중되면 3초 동안 R - 바위술사의 벽을 사용할 수 없습니다.", "(삭제) 안전한 이동 수단 이제 탈리야가 피해를 입어도 벽에서 뛰어내리지 않습니다."]]];
}

//탈론
class PatchContent_Talon{
  static List<String> BorNorM=["하향","하향","하향"];
  static List<String> patchVer=["13.6","12.10","12.2"];
  static List<String> patchNoteLink= [PatchNoteLink.link[0], PatchNoteLink.link[19],PatchNoteLink.link[27]];
  static List<List<String>> Detail_Title =[["기본 능력치","기본 지속 효과 - 검의 최후","W - 갈퀴손"],
  ["Q - 녹서스식 외교"],
  ["W - 갈퀴손"]];
  static List<List<List<String>>> Detail_Content =[[["마나: 377 ⇒ 400"],
  ["피해량: 75~255 (레벨에 따라) (+추가 공격력의 200%) ⇒ 80~280 (레벨에 따라) (+추가 공격력의 210%)"],
  ["마나 소모량: 55/60/65/70/75 ⇒ 50/55/60/65/70"]],
  
  [["체력 회복량 10~70 (레벨에 따라) ⇒ 9~55 (레벨에 따라)"]],
  
  [["몬스터 대상 피해량 130% ⇒ 105%"]]];
}

//타릭
class PatchContent_Taric{
  static List<String> BorNorM=["하향", "하향","상향","하향"];
  static List<String> patchVer=["14.1", "12.17","12.11","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[18],PatchNoteLink.link[12],PatchNoteLink.link[18], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "W - 수호의 고리"],
    ["기본 능력치","E - 황홀한 강타"],
  ["Q - 별빛 손길","E - 황홀한 강타"],
  ["Q - 별빛 손길", "W - 수호의 고리"]];
  static List<List<List<String>>> Detail_Content =[
    [["방어력 증가량: 4.6 ⇒ 4.3"],
    ["추가 방어력: 타릭 방어력의 10/11/12/13/14% ⇒ 타릭 방어력의 9/10/11/12/13%"]],
    
    [["기본 마법 저항력 32 ⇒ 28"],
  ["재사용 대기시간 15/14/13/12/11초 ⇒ 16/15/14/13/12초"]],
  
  [["중첩 당 체력 회복량 25 (+주문력의 15%) (+타릭 최대 체력의 0.75%) ⇒ 25 (+주문력의 15%) (+타릭 최대 체력의 1%)","마나 소모량 65/70/75/80/85 ⇒ 60 (모든 스킬 레벨에서)"],
  ["재사용 대기시간 17/16/15/14/13초 ⇒ 15/14/13/12/11초", "기절 지속시간 1.25초 ⇒ 1.5초"]],
  
  [["체력 회복량 30 (+주문력의 20%) (+최대 체력의 1%) ⇒ 25 (+주문력의 15% AP) (+최대 체력의 0.75%)"],
  ["보호막 흡수량 대상 최대 체력의 8/9/10/11/12% ⇒ 7/8/9/10/11%"]]];
}

//티모
class PatchContent_Teemo{
  static List<String> BorNorM=["상향", "하향", "하향", "상향"];
  static List<String> patchVer=["14.3", "14.2", "14.1", "12.14"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[20], PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[18],PatchNoteLink.link[15]];
  static List<List<String>> Detail_Title =[
    ["Q - 실명 다트"],
    ["E - 맹독 다트", "R - 유독성 함정"],
    ["Q - 실명 다트", "R - 유독성 함정"],
    ["기본 능력치","R - 유독성 함정"]];
  static List<List<List<String>>> Detail_Content =[
    [["편의성 개선: 이제 티모의 Q - 실명 다트가 적중하는 즉시 대상에게 실명을 적용하여 그 이후의 기본 공격에 티모가 피해를 입는 것을 방지합니다. 이제 실명 지속시간은 대상의 체력 바 위에 표시되는 해로운 효과 지속시간과 일치하게 됩니다."]],

    [["적중 시 마법 피해: 14/25/36/47/58 (+주문력의 30%) ⇒ 14/27/40/53/66 (+주문력의 30%)"],
    ["충전 시간: 30/25/20초 ⇒ 35/30/25초"]],

    [["피해량: 80/125/170/215/260 (+주문력의 80%) ⇒ 80/125/170/215/260 (+주문력의 70%)"],
    ["총피해량: 200/325/450 (+주문력의 55%) ⇒ 200/325/450 (+주문력의 50%)"]],
    
    [["마나 증가량 20 ⇒ 25"],
  ["설치 사거리 400/650/900 ⇒ 600/750/900", "피해량 200/325/450 (+주문력의 50%) ⇒ 200/325/450 (+주문력의 55%)", "마나 소모량 75 ⇒ 75/55/35"]]];
}

//쓰레쉬
class PatchContent_Thresh{
  static List<String> BorNorM=["상향", "상향", "상향", "조정", "조정","상향","상향","상향","조정"];
  static List<String> patchVer=["14.8", "14.4", "13.18", "13.7", "13.4","13.3","12.18","12.15","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[25], PatchNoteLinkPlus.link[21], PatchNoteLinkPlus.link[11],PatchNoteLinkPlus.link[0], PatchNoteLink.link[2],PatchNoteLink.link[3],PatchNoteLink.link[11],PatchNoteLink.link[14], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치"],
    ["기본 능력치", "E - 사슬 채찍", "R - 영혼 감옥"],
    ["W - 어둠의 통로"],
    ["Q - 사형 선고"],
  ["Q - 사형 선고","W - 어둠의 통로","E - 사슬 채찍"],
  ["Q - 사형 선고","W - 어둠의 통로", "E - 사슬 채찍"],
  ["기본 능력치","E - 사슬 채찍"],
  ["Q - 사형 선고"],
  ["기본 능력치", "W - 어둠의 통로"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 방어력: 31 ⇒ 33", "마법 저항력 증가량: 1.3 ⇒ 1.55"]],

    [["기본 방어력: 28 ⇒ 31"],
    ["마법 피해량: 75/115/155/195/235 (+주문력의 70%) ⇒ 75/120/165/210/255 (+주문력의 70%)"],
    ["재사용 대기시간: 140/120/100초 ⇒ 120/100/80초"]],

    [["보호막 흡수량: 50/70/90/110/130 (+영혼당 1.5) ⇒ 50/70/90/110/130 (+영혼당 2)"]],

    [["적중 시 돌려받는 재사용 대기시간: 3초 ⇒ 2초"]],
  
  [["마법 피해량: 100/145/190/235/280 (+주문력의 80%) ⇒ 100/150/200/250/300 (+주문력의 90%)", "재사용 대기시간: 19/17/15/13/11초 ⇒ 19/16.5/14/11.5/9초 (참고: 여전히 사형 선고를 적중시키면 재사용 대기시간이 3초 감소합니다.)"],
  ["재사용 대기시간: 22/20.5/19/17.5/16초 ⇒ 21/20/19/18/17초", "기본 보호막 흡수량: 50/75/100/125/150 ⇒ 50/70/90/110/130"],
  ["마법 피해량: 75/110/145/180/215 (+주문력의 60%) ⇒ 75/115/155/195/235 (+주문력의 70%)"]],
  
  [["마법 피해량: 100/140/180/220/260 (+주문력의 50%) ⇒ 100/145/190/235/280 (+주문력의 80%) (참고: 쓰레쉬의 주문력 계수는 영혼당 0.8의 피해를 입힌다고 생각하시면 편합니다. 주문력 기반 쓰레쉬 빌드를 사용하시는 게 아니라면 말이에요. 그러시진 않으시겠죠...)"],
  ["영혼당 보호막 흡수량: 2 ⇒ 1.5"],
  ["마법 피해량: 75/110/145/180/215 (+주문력의 40%) ⇒ 75/110/145/180/215 (+주문력의 60%) (참고: 영혼당 0.6의 피해를 입히게 됩니다)"]],
  
  [["체력 증가량 115 ⇒ 120"],
  ["마법 피해량 65/95/125/155/185 (+주문력의 40%) ⇒ 75/110/145/180/215 (+주문력의 40%)"]],
  
  [["재사용 대기시간 20/18/16/14/12초 ⇒ 19/17/15/13/11초", "마법 피해량 80/120/160/200/240 ⇒ 100/140/180/220/260"]],
  
  [["체력 증가량 95 ⇒ 115"],
  ["보호막 흡수량 60/90/120/150/180 (+영혼당 2) ⇒ 50/75/100/125/150 (+영혼당 2)"]]];
}

//트리스타나
class PatchContent_Tristana{
  static List<String> BorNorM=["하향", "상향","상향","상향"];
  static List<String> patchVer=["13.16", "12.16","12.8","12.2"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[9],PatchNoteLink.link[13],PatchNoteLink.link[21], PatchNoteLink.link[27]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치"],
    ["Q - 속사"],
  ["기본 능력치"],
  ["기본 능력치"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 방어력: 26 ⇒ 30", "방어력 증가량: 4.2 ⇒ 4.5", "기본 마법 저항력: 30 ⇒ 28", "기본 체력: 670 ⇒ 640"]],
    
    [["추가 공격 속도 50/65/80/95/110% ⇒ 65/80/95/110/125%"]],
  
  [["공격력 증가량 3.3 ⇒ 3.7", "18레벨 공격력 115.1 ⇒ 121.9"]],
  
  [["기본 체력 559 ⇒ 600", "기본 체력 재생 3.75 ⇒ 4"]]];
}

//트런들
class PatchContent_Trundle{
  static List<String> BorNorM=["하향", "상향","상향","상향","하향","하향","하향"];
  static List<String> patchVer=["14.3", "13.23", "13.9", "13.3","12.23","12.17","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[20],PatchNoteLinkPlus.link[16],PatchNoteLinkPlus.link[2],PatchNoteLink.link[3],PatchNoteLink.link[6],PatchNoteLink.link[12], 
  PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "Q - 깨물기"],
    ["기본 능력치", "Q - 깨물기"],
    ["기본 능력치"],
    ["W - 얼음 왕국","중요한 정보"],
  ["기본 능력치","R - 진압"],
  ["W - 얼음 왕국"],
  ["기본 지속 효과 - 헌납"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 체력: 686 ⇒ 650"],
    ["추가 공격력: 20/40/60/80/100 (+공격력의 15/25/35/45/55%) ⇒ 10/30/50/70/90 (+공격력의 15/25/35/45/55%)"]],

    [["공격력 증가량: 3 ⇒ 4"],
    ["마나 소모량: 30 ⇒ 20"]],

    [["기본 공격 속도: 0.6 ⇒ 0.67", "기본 마나: 281 ⇒ 340"]],
    
    [["재사용 대기시간: 18/17/16/15/14초 ⇒ 16/15/14/13/12초"],
  ["춤 솜씨 좀 볼까!: 이제 트런들의 춤 속도가 트런들의 이동 속도에 비례해 증가합니다."]],
  
  [["기본 공격 속도: 0.67 ⇒ 0.60"],
  ["대상 최대 체력 비례 피해량: 20/27.5/35% (+주문력 100당 2%) ⇒ 20/25/30% (+주문력 100당 2%)"]],
  
  [["재사용 대기시간 15/14/13/12/11초 ⇒ 18/17/16/15/14초"]],
  
  [["체력 회복량 적 최대 체력의 2~7% ⇒ 1.8~5.5% (레벨에 따라)"]]];
}

//트린다미어
class PatchContent_Tryndamere{
  static List<String> BorNorM=["상향", "하향", "조정", "상향","상향","하향","하향"];
  static List<String> patchVer=["14.6", "13.18", "13.17", "13.5","12.11","12.10","12.6"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[23],PatchNoteLinkPlus.link[11],PatchNoteLinkPlus.link[10], PatchNoteLink.link[1],PatchNoteLink.link[18], PatchNoteLink.link[19],
  PatchNoteLink.link[23]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치"],
    ["기본 능력치"],
    ["기본 능력치"],
    ["기본 능력치"],
  ["Q - 피의 갈망", "R - 불사의 분노"],
  ["Q - 피의 갈망"],
  ["E - 회전 베기", "R - 불사의 분노"]];
  static List<List<List<String>>> Detail_Content =[
    [["공격 속도 증가량: 2.9% ⇒ 3.4%"]],

    [["체력 증가량: 115 ⇒ 108", "기본 공격력: 68 ⇒ 66"]],

    [["공격 사거리: 125 ⇒ 175", "공격력: 72 ⇒ 68"]],
    
    [["체력 증가량: 112 ⇒ 115", "공격력 증가량: 3.7 ⇒ 4"]],
  
  [["기본 체력 회복량 25/33/41/49/57 ⇒ 30/40/50/60/70", "분노 1당 기본 체력 회복량 0.45/0.75/1.05/1.35/1.65 ⇒ 0.5/0.95/1.4/1.85/2.3"],
  ["재사용 대기시간 130/110/90초 ⇒ 120/100/80초"]],
  
  [["최소 체력 회복량 30/40/50/60/70 (+주문력의 30%) ⇒ 25/33/41/49/57 (+주문력의 30%)", "분노 1당 추가 체력 회복량 0.5/0.95/1.4/1.85/2.3 (+주문력의 1.2%) ⇒ 0.45/0.75/1.05/1.35/1.65 (+주문력의 1.2%)"]],
  
  [["치명타 적중 시 재사용 대기시간 감소 1초 (챔피언 적중 시 2초) ⇒ 0.75초 (챔피언 적중 시 1.5초)"],
  ["재사용 대기시간 110/100/90초 ⇒ 130/110/90초"]]];
}

//트위스티드페이트
class PatchContent_TwistedFate{
  static List<String> BorNorM=["하향", "하향", "상향", "상향", "상향", "상향","상향","하향"];
  static List<String> patchVer=["14.5", "14.4", "14.2", "13.17", "13.11", "13.1","12.17","12.3"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[22],PatchNoteLinkPlus.link[21], PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[10], PatchNoteLinkPlus.link[4], PatchNoteLink.link[5],PatchNoteLink.link[12],PatchNoteLink.link[26]];
  static List<List<String>> Detail_Title =[
    ["E - 속임수 덱"],
    ["기본 능력치", "W - 카드 뽑기", "E - 속임수 덱"],
    ["기본 능력치", "기본 지속 효과 - 사기 주사위", "Q - 와일드 카드", "W - 카드 뽑기", "E - 속임수 덱"],
    ["Q - 와일드 카드"],
    ["W - 카드 뽑기"],
    ["Q - 와일드 카드","W - 카드 뽑기"],
  ["Q - 와일드 카드","W - 카드 뽑기"],
  ["Q - 와일드 카드", "E - 속임수 덱"]];
  static List<List<List<String>>> Detail_Content =[
    [["추가 공격 속도: 10/22.5/35/47.5/60% ⇒ 10/20/30/40/50%", "추가 피해량: 65/90/115/140/165 (+추가 공격력의 75%) (+주문력의 40%) ⇒ 65/90/115/140/165 (+추가 공격력의 20%) (+주문력의 40%)"]],

    [["공격 속도 증가량: 3% ⇒ 2.5%"],
    ["마법 피해량: 40/60/80/100/120 (+공격력의 100%) (+주문력의 115%) ⇒ 40/60/80/100/120 (+공격력의 100%) (+주문력의 100%)"],
    ["추가 마법 피해량: 65/90/115/140/165 (+추가 공격력의 75%) (+주문력의 50%) ⇒ 65/90/115/140/165 (+추가 공격력의 75%) (+주문력의 40%)"]],

    [["기본 공격 속도: 0.651 ⇒ 0.625 (참고: 공격 속도 계수는 전과 동일)", "공격 속도 증가량: 3.22% ⇒ 3%"],
    ["(신규) 대성공: 이제 치명타 확률에 따라 6보다 1이 뜰 확률이 더 높은 육면체 주사위를 추가로 굴립니다"],
    ["피해량: 60/100/140/180/220 (+주문력의 90%) ⇒ 60/100/140/180/220 (+주문력의 90%) (+추가 공격력의 50%)"],
    ["(신규) 푸른색 치명타: 치명타 계수 0.575 추가 (치명타 확률에 따라 최대 57.5%까지 피해량 증가)", "(신규) 붉은색 치명타: 치명타 계수 0.350 추가(치명타 확률에 따라 최대 35%까지 피해량 증가)", "(신규) 황금색 치명타: 치명타 계수 0.250 추가(치명타 확률에 따라 최대 25%까지 피해량 증가)", "편의성 개선: 이제 트위스티드 페이트가 카드를 뽑으면 기본 공격이 초기화됩니다.", "편의성 개선: 이제 W - 카드 뽑기가 억제기와 넥서스에 적용됩니다."],
    ["추가 공격 속도: 10/17.5/25/32.5/40% ⇒ 10/22.5/35/47.5/60%", "피해량: 65/90/115/140/165 (+주문력의 50%) ⇒ 65/90/115/140/165 (+주문력의 50%) (+추가 공격력의 75%)", "편의성 개선: 이제 E - 속임수 덱이 포탑에 가하는 효과가 50%로 변경됩니다.", "편의성 개선: 이제 트위스티드 페이트의 E - 속임수 덱이 게임 시작 및 부활 시 전부 충전됩니다."]],

    [["마법 피해량: 60/100/140/180/220 (+주문력의 80%) ⇒ 60/100/140/180/220 (+주문력의 90%)"]],

    [["변경: 8/7.5/7/6.5/6초 ⇒ 6초 (모든 스킬 레벨에서)"]],
    
    [["재사용 대기시간: 6초 (모든 스킬 레벨에서) ⇒ 6/5.75/5.5/5.25/5초"],
  ["푸른색 카드 마법 피해량: 40/60/80/100/120 (+공격력의 100%)(+주문력의 90%) ⇒ 40/60/80/100/120 (+공격력의 100%) (+주문력의 115%)", "붉은색 카드 마법 피해량: 30/45/60/75/90 (+공격력의 100%)(+주문력의 60%) ⇒ 30/45/60/75/90 (+공격력의 100%)(+주문력의 70%)"]],
  
  [["주문력 계수 70% ⇒ 80%"],
  ["마나 소모량 40/55/70/85/100 ⇒ 30/40/50/60/70"]],
  
  [["마법 피해량 60/105/150/195/240 (+주문력의 65%) ⇒ 60/100/140/180/220 (+주문력의 70%)"],
  ["추가 공격 속도 20/25/30/35/40% ⇒ 10/17.5/25/32.5/40%"]]];
}

//트위치
class PatchContent_Twitch{
  static List<String> BorNorM=["상향", "하향","상향","상향"];
  static List<String> patchVer=["13.19","13.5","13.1B", "12.19"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[12], PatchNoteLink.link[1],PatchNoteLink.link[4], PatchNoteLink.link[10]];
  static List<List<String>> Detail_Title =[
    ["R - 무차별 난사"],
    ["E - 오염"],
  ["기본 능력치"],
  ["기본 지속 효과 - 맹독","E - 오염"]];
  static List<List<List<String>>> Detail_Content =[
    [["투사체 속도: 4,000 ⇒ 5,000"]],

    [["중첩당 마법 피해량: 주문력의 35% ⇒ 주문력의 30%"]],
  
  [["기본 마나: 287.2 ⇒ 300", "마나 재생 증가량: 0.45 ⇒ 0.7"]],
  
  [["스킬 레벨당 피해량: 1/2/3/4/5 (레벨에 따라) (+주문력의 2.5%) ⇒ 1/2/3/4/5 (레벨에 따라) (+주문력의 3%)"],
  ["중첩당 마법 피해량: (+주문력의 33%) ⇒ (+주문력의 35%)"]]];
}

//우디르, 12.16 리메이크
class PatchContent_Udyr{
  static List<String> BorNorM=["하향", "하향","조정","상향","조정","조정","하향"];
  static List<String> patchVer=["13.4","13.1B","12.23", "12.19","12.18","12.16","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[2],PatchNoteLink.link[4],PatchNoteLink.link[6],
  PatchNoteLink.link[10],PatchNoteLink.link[11],PatchNoteLink.link[13],PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[["기본 능력치", "Q - 야생 발톱", "R - 날개 돋친 폭풍"],
  ["Q - 야생 발톱","R - 날개 돋친 폭풍"],
  ["W - 강철 갑옷/E - 불길 쇄도/R - 날개 돋친 폭풍", "Q - 야생 발톱", "R - 날개 돋친 폭풍"],
  ["Q - 야생 발톱","W - 강철 갑옷","R - 날개 돋친 폭풍"],
  ["기본 능력치","Q - 야생 발톱","W - 강철 갑옷","R - 날개 돋친 폭풍"],
  ["Q - 야생 발톱","W - 강철 갑옷","E - 불길 쇄도"],
  ["W - 거북이 태세"]];
  static List<List<List<String>>> Detail_Content =[[["체력 증가량: 98 ⇒ 92", "기본 방어력: 34 ⇒ 31"],
  ["적중 시 추가 물리 피해량: 5/11/17/23/29/35 (+추가 공격력의 30%) ⇒ 5/11/17/23/29/35 (+추가 공격력의 25%)"],
  ["강화된 둔화율: 25/28/31/34/37/40% ⇒ 20/23/26/29/32/35%"]],
  
  [["추가 물리 피해량: 대상 최대 체력의 3/4/5/6/7/8% (+추가 공격력 100당 5%) ⇒ 대상 최대 체력의 3/4/5/6/7/8% (+추가 공격력 100당 4%)", "추가 공격 속도: 20/30/40/50/60/70% ⇒ 20/32/44/56/68/80%"],
  ["틱당 기본 피해량: 10/20/30/40/50/60 ⇒ 10/19/28/37/46/55"]],
  
  [["마나 소모량: 45~28 (레벨에 따라) ⇒ 40~23 (레벨에 따라)"],
  ["추가 물리 피해량: 대상 최대 체력의 3/4.4/5.8/7.2/8.6/10% (+추가 공격력 100당 6%) ⇒ 대상 최대 체력의 3/4/5/6/7/8% (+추가 공격력 100당 5%)", "적중 시 추가 물리 피해량: 5/13/21/28/37/45 (+추가 공격력의 20%) ⇒ 5/11/17/23/29/35 (+추가 공격력의 30%)", "각성 물리 피해량: 대상 최대 체력의 2~5% (+추가 공격력 100당 3%) ⇒ 대상 최대 체력의 2~4% (+추가 공격력 100당 2%)"],
  ["틱당 기본 피해량: 10/18/26/34/42/50 ⇒ 10/20/30/40/50/60"]],
  
  [["(신규) 미니언 대피령: 각성 Q - 야생 발톱이 이제 미니언을 대상으로 번개 하나당 최소 40~160(레벨에 따라)의 피해를 입힙니다."],
  ["미니언 대상 적중 시 체력 회복량: 회복량 감소 50% ⇒ 회복량 감소 40%"],
  ["미니언 대상 피해량: 40/55/70/85% (1/6/11/16레벨에서) ⇒ 50/60/70/80% (1/6/11/16레벨에서)"]],

  [["체력 증가량 106 ⇒ 98", "방어력 증가량 5.2 ⇒ 4.7"],
  ["마나 소모량 45~28 (레벨에 따라) ⇒ 20", "각성 시 연쇄 번개 주문력 계수 +주문력 100당 0.6% ⇒ +주문력 100당 0.8%", "(신규) 너에게 닿기를 처음 두 차례의 기본 공격이 각성된 Q - 야생 발톱의 기능에 맞게 50의 사거리를 얻습니다.", "(신규) 충격과 공포 이제 각성된 Q - 야생 발톱이 처음 두 차례의 공격으로 2~5% (레벨에 따라) (+추가 공격력 100당 3%) 만큼 추가 물리 피해를 입힙니다."],
  ["최대 체력 비례 체력 회복량 1.2/1.26/1.32/1.38/1.44/1.5% ⇒ 1.2%", "최대 체력 비례 보호막 흡수량 2/2.4/2.8/3.2/3.6/4.0% ⇒ 2/2.3/2.6/2.8/3.2/3.5%", "생명력 흡수 15% ⇒ 15/16/17/18/19/20%"],
  ["마법 피해량 20/38/56/74/92/110 (+주문력의 40%) ⇒ 20/36/52/68/84/100 (+주문력의 35%)", "미니언 대상 피해량 50/60/70/80% (1/6/11/16레벨에서) ⇒ 40/55/70/85% (1/6/11/16레벨에서)"]],

  [["물리 피해량 대상 최대 체력의 3/4.2/5.4/6.6/7.8/9% ⇒ 대상 최대 체력의 3/4.4/5.8/7.2/8.6/10%", "물리 피해량 공격력 계수 추가 공격력 100당 4% ⇒ 추가 공격력 100당 6%", "적중 시 물리 피해량 5/9/13/17/21/25 (+추가 공격력의 10%) ⇒ 5/13/21/29/37/45 (+추가 공격력의 20%)"],
  ["보호막 흡수량 45/60/75/90/105/120 (+주문력의 40%) (+최대 체력의 2/2.6/3.2/3.8/4.4/5%) ⇒ 45/60/75/90/105/120 (+주문력의 40%) (+최대 체력의 2/2.4/2.8/3.2/3.6/4%)", "적중 시 회복량 최대 체력의 1.2/1.32/1.44/1.56/1.68/1.8% (+주문력의 8%) ⇒ 최대 체력의 1.2/1.26/1.32/1.38/1.44/1.5% (+주문력의 8%)"],
  ["추가 이동 속도 30/34/38/42/46/50% ⇒ 30/37/44/51/58/65%","대상별 기절 재사용 대기시간 6/5.7/5.4/5.1/4.8/4.5초 ⇒ 6/5.6/5.2/4.8/4.4/4초"]],

  [["보호막 흡수량 60/95/130/165/200/235 (+주문력의 50%) ⇒ 60/90/120/150/180/210 (+주문력의 45%)", "체력 회복량 잃은 체력의 2.5~5% ⇒ 2~4%"]]];
}

//우르곳
class PatchContent_Urgot{
  static List<String> BorNorM=["하향"];
  static List<String> patchVer=["12.10"];
  static List<String> patchNoteLink= [ PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[["E - 경멸"]];
  static List<List<List<String>>> Detail_Content =[[["보호막 흡수량 60/80/100/120/140 (+추가 공격력의 150%) (+추가 체력의 15%) ⇒ 55/75/95/115/135 (+추가 공격력의 135%) (+추가 체력의 13.5%)"]]];
}

//바루스
class PatchContent_Varus{
  static List<String> BorNorM=["하향", "상향", "하향", "상향","하향","상향"];
  static List<String> patchVer=["14.4", "13.21", "13.13", "12.14","12.10","12.5"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[21], PatchNoteLinkPlus.link[14], PatchNoteLinkPlus.link[6], PatchNoteLink.link[15], PatchNoteLink.link[19],
  PatchNoteLink.link[24]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치"],
    ["W - 역병 화살", "E - 퍼붓는 화살"], 
    ["W - 역병 화살"],
    ["기본 능력치"],
  ["E - 퍼붓는 화살"],
  ["W - 역병 화살", "R - 부패의 사슬"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 공격력: 62 ⇒ 60"]],

    [["마법 피해량: 7/12/17/22/27 (+주문력의 35%) ⇒ 7/13/19/25/31 (+주문력의 35%)"],
    ["둔화율: 25/30/35/40/45% ⇒ 30/35/40/45/50%"]],

    [["적중 시 추가 마법 피해량: 7/12/17/22/27 (+주문력의 30%) ⇒ 7/12/17/22/27 (+주문력의 35%)", "역병 중첩당 피해량: 대상 최대 체력의 3/3.5/4/4.5/5% (+주문력 100당 2.5%) ⇒ 대상 최대 체력의 3/3.5/4/4.5/5% (+주문력 100당 1.5%)"]],
    
    [["기본 공격력 59 ⇒ 62"]],

  [["고통스러운 상처 40% ⇒ 30%"]],
  
  [["기본 지속 효과 적중 시 추가 마법 피해량 7/9/11/13/15 (+주문력의 30%) ⇒ 7/10.5/14/17.5/21 (+주문력의 30%)"],
  ["기본 마법 피해량 150/200/250 ⇒ 150/250/350"]]];
}

//베인
class PatchContent_Vayne{
  static List<String> BorNorM=["하향", "상향","하향","하향"];
  static List<String> patchVer=["14.5", "13.10","13.6","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[22],PatchNoteLinkPlus.link[3],PatchNoteLink.link[0], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 어둠 사냥꾼", "Q - 구르기"],
    ["Q - 구르기"],
    ["기본 지속 효과 - 어둠 사냥꾼","Q - 구르기","W - 은화살"],
  ["기본 능력치", "W - 은화살"]];
  static List<List<List<String>>> Detail_Content =[
    [["추가 이동 속도: 45 ⇒ 30 (참고: R - 결전의 시간이 지속되는 동안의 추가 이동 속도는 90으로 전과 동일합니다.)"],
    ["재사용 대기시간: 4/3.5/3/2.5/2초 ⇒ 6/5/4/3/2초"]],

    [["다음 공격 시 추가 물리 피해량: 공격력의 75/85/95/105/115% ⇒ 공격력의 75/85/95/105/115% +주문력의 50%"]],
    
    [["추가 이동 속도: 30 ⇒ 45"],
  ["추가 물리 피해량: 공격력의 60/65/70/75/80% ⇒ 공격력의 75/85/95/105/115%","강화된 기본 공격 지속시간: 7초 ⇒ 3초" ],
  ["최대 체력 비례 피해량: 대상 최대 체력의 4/6/8/10/12% ⇒ 대상 최대 체력의 6/7/8/9/10%"]],
  
  [["기본 체력 585 ⇒ 550"],
  ["추가 고정 피해량 50/65/80/95/110 (+대상 최대 체력의 4/6.5/9/11.5/14%) ⇒ 50/65/80/95/110 (+대상 최대 체력의 4/6/8/10/12%)"]]];
}

//베이가
class PatchContent_Veigar{
  static List<String> BorNorM=["상향", "상향","하향", "하향", "상향","하향","하향","상향"];
  static List<String> patchVer=["14.5", "14.2", "13.7", "13.6","13.4","12.11","12.4","12.2"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[22],PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[0], PatchNoteLink.link[0],PatchNoteLink.link[2],PatchNoteLink.link[18],PatchNoteLink.link[25]
  ,PatchNoteLink.link[27]];
  static List<List<String>> Detail_Title =[
    ["Q - 사악한 일격", "R - 태초의 폭발"],
    ["기본 능력치"],
    ["Q - 사악한 일격","W - 암흑 물질","E - 사건의 지평선","R - 태초의 폭발"],
  ["기본 능력치","W - 암흑 물질"],
  ["Q - 사악한 일격","W - 암흑 물질"],
  ["기본 능력치","E - 사건의 지평선"],
  ["기본 능력치","E - 사건의 지평선"],
  ["Q - 사악한 일격"]];
  static List<List<List<String>>> Detail_Content =[
    [["피해량: 80/120/160/200/240 (+주문력의 45/50/55/60/65%) ⇒ 80/120/160/200/240 (+주문력의 50/55/60/65/70%)"],
    ["재사용 대기시간: 120/90/60초 ⇒ 100/80/60초"]],

    [["기본 체력: 550 ⇒ 580"]],

    [["주문력 계수: 60% (모든 스킬 레벨에서) ⇒ 45/50/55/60/65%"],
  ["주문력 계수: 100% (모든 스킬 레벨에서) ⇒ 70/80/90/100/110%"],
  ["교활한 기절: 이제 베이가가 E - 사건의 지평선을 특정 벽 안에 세워 적이 시각 효과를 보지 못하게 할 수 없습니다."],
  ["주문력 계수: 75% (모든 스킬 레벨에서) ⇒ 65/70/75%"]],

  [["기본 체력: 575 ⇒ 550","기본 방어력: 21 ⇒ 18"],
  ["마법 피해량: 100/150/200/250/300 (+주문력의 100%) ⇒ 85/140/195/250/305 (+주문력의 100%)"]],
  
  [["사거리: 950 ⇒ 1,050"],
  ["사거리: 900 ⇒ 950"]],
  
  [["방어력 23 ⇒ 21", "방어력 증가량 3.75 ⇒ 4.0"],
  ["재사용 대기시간 18/16.5/15/13.5/12초 ⇒ 20/18/16/14/12초"]],

  [["기본 방어력 23 ⇒ 21", "방어력 증가량 3.75 ⇒ 4.0", "18레벨 방어력 86.75 ⇒ 89"],
  ["재사용 대기시간 18/16.5/15/13.5/12초 ⇒ 20/18/16/14/12초"]],
  
  [["재사용 대기시간 7/6.5/6/5.5/5초 ⇒ 6/5.5/5/4.5/4초", "대형 몬스터 및 미니언 처치 시 중첩 획득량 2 ⇒ 3"]]];
}

//벨코즈
class PatchContent_Velkoz{
  static List<String> BorNorM=["조정","상향", "상향"];
  static List<String> patchVer=["14.1", "13.23", "12.8"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[16],PatchNoteLink.link[21]];
  static List<List<String>> Detail_Title =[
    ["E - 지각 붕괴"],
    ["기본 지속 효과 - 유기물 분해"],
    ["Q - 플라즈마 분열","W - 공허 균열"]
    ];

  static List<List<List<String>>> Detail_Content =[
     [["투사체 위치 도달 시간: 0.55초 (고정) ⇒ 0.25~0.55초 (이동 거리에 따라)", "그렇게 빨린 안되지: 이제 벨코즈 E - 지각 붕괴의 원형 스킬 표시가 스킬을 사용한 직후가 아닌 스킬을 사용하고 0.25초 후 생성됩니다."]],

    [["3회 중첩 시 피해량: 33~169 (레벨에 따라) (+주문력의 50%) ⇒ 35~180 (레벨에 따라) (+주문력의 60%)"]],

    [["마법 피해량 80/120/160/200/240 (+주문력의 80%) ⇒ 80/120/160/200/240 (+주문력의 90%)"],
    ["1차 마법 피해량 30/50/70/90/110 (+주문력의 15%) ⇒ 30/50/70/90/110 (+주문력의 20%)"]]
  ];
}

//벡스
class PatchContent_Vex{
  static List<String> BorNorM=["상향", "상향","상향","하향"];
  static List<String> patchVer=["14.5", "13.17", "12.13","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[22],PatchNoteLinkPlus.link[10], PatchNoteLink.link[16], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 파멸과 우울", "E - 커지는 어둠"],
    ["Q - 안개 화살", "W - 거리 두기"], 
    ["Q - 안개 화살"],
  ["W - 거리 두기"]];
  static List<List<List<String>>> Detail_Content =[
    [["우울 표식 폭발 피해량: 30~140 (레벨에 따라) (+주문력의 20%) ⇒ 40~150 (레벨에 따라) (+주문력의 25%)"],
    ["(신규) 이제 E - 커지는 어둠으로 유닛을 처치하면 기본 지속 효과 - 파멸과 우울의 재사용 대기시간 감소 효과가 적용됩니다."]],

    [["마법 피해량: 60/105/150/195/240 (+주문력의 70%) ⇒ 70/115/160/205/250 (+주문력의 70%)"],
    ["재사용 대기시간: 20/18/16/14/12초 ⇒ 16/15/14/13/12초"]],
    
    [["재사용 대기시간 9/8/7/6/5초 ⇒ 8/7/6/5/4초", "마법 피해량 60/105/150/195/240 (+주문력의 60%) ⇒ 60/105/150/195/240 (+주문력의 70%)"]],
  
  [["보호막 흡수량 50/80/110/140/170 (+주문력의 80%) ⇒ 50/75/100/125/150 (+주문력의 75%)"]]];
}

//바이
class PatchContent_Vi{
  static List<String> BorNorM=["조정","하향", "하향", "하향"];
  static List<String> patchVer=["13.17", "13.13", "13.7", "12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[10], PatchNoteLinkPlus.link[6], PatchNoteLinkPlus.link[0], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 폭발 보호막", "W - 찌그러뜨리기", "E - 끈질긴 힘", "R - 정지 명령"],
    ["기본 지속 효과 - 폭발 보호막", "R - 정지 명령"],
    ["Q - 금고 부수기","E - 끈질긴 힘"],
  ["기본 지속 효과 - 폭발 보호막"]];
  static List<List<List<String>>> Detail_Content =[
    [["보호막 흡수량: 바이 최대 체력의 10% ⇒ 바이 최대 체력의 12%"],
    ["기본 지속 효과 - 폭발 보호막 재사용 대기시간 감소: 3초 ⇒ 4초"],
    ["재사용 대기시간: 14/12.5/11/9.5/8초 ⇒ 12/11/10/9/8초"],
    ["물리 피해량: 150/325/500 (+추가 공격력의 110%) ⇒ 150/275/400 (+추가 공격력의 90%)"]],

    [["보호막 계수: 최대 체력의 13% ⇒ 최대 체력의 10%"],
    ["재사용 대기시간: 120/100/80초 ⇒ 140/115/90초"]],
    
    [["최소 물리 피해량: 55/80/105/130/155 (+추가 공격력의 70%) ⇒ 45/70/95/120/145 (+추가 공격력의 80%)", "최대 물리 피해량: 110/160/210/260/310 (+추가 공격력의 140%) ⇒ 90/140/190/240/290 (+추가 공격력의 160%)"],
  ["물리 피해량: 10/30/50/70/90 (+공격력의 110%) (+주문력의 90%) ⇒ 0/15/30/45/60 (+공격력의 120%) (+주문력의 100%)"]],
  
  [["보호막 흡수량 최대 체력의 15% ⇒ 13%"]]];
}

//비에고
class PatchContent_Viego{
  static List<String> BorNorM=["상향","하향","하향"];
  static List<String> patchVer=["13.4","12.12","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[2],PatchNoteLink.link[17], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[["Q - 몰락한 왕의 검", "R - 심장 파괴자"],
  ["기본 지속 효과 - 군주의 지배", "E - 안개의 길", "R - 심장 파괴자"],
  ["기본 지속 효과 - 군주의 지배", "Q - 몰락한 왕의 검"]];
  static List<List<List<String>>> Detail_Content =[[["(신규) 치명적인 사랑: 이제 Q - 몰락한 왕의 검 기본 지속 효과의 적중 시 물리 피해에 치명타가 발동합니다."],
  ["물리 피해량: 대상 잃은 체력의 12/16/20% (+추가 공격력 100당 3%) ⇒ 대상 잃은 체력의 12/16/20% (+추가 공격력 100당 5%)"]],
  
  [["지배 시 기본 체력 회복 대상 최대 체력의 2.5% ⇒ 2%"],
  ["(삭제) 깜짝 기절 이제 W - 망령의 나락을 충전하는 도중에 E - 안개의 길을 사용해도 즉시 위장 상태에 돌입하지 않습니다."],
  ["추가 물리 피해량 체력이 가장 낮거나 가장 가까운 적이 잃은 체력의 15/20/25% (+추가 공격력 100당 3%) ⇒ 12/16/20% (+추가 공격력 100당 3%)"]],
  
  [["지배 시 체력 회복량 대상 최대 체력의 3% (+추가 공격력의 3%) (+주문력의 2%) (+공격 속도 100%당 5%) ⇒ 2.5% (+추가 공격력의 2.5%) (+주문력의 2%) (+공격 속도 100%당 5%)"],
  ["표식이 적용된 챔피언 기본 공격 시 체력 회복량 150% ⇒ 135%", "표식이 적용된 몬스터 기본 공격 시 체력 회복량 155% ⇒ 145% (미니언 대상으로 여전히 10%)"]]];
}

//빅토르
class PatchContent_Viktor{
  static List<String> BorNorM=["하향"];
  static List<String> patchVer=["12.10"];
  static List<String> patchNoteLink= [ PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[["Q - 힘의 흡수"]];
  static List<List<List<String>>> Detail_Content =[[["보호막 흡수량 30~115 (레벨에 따라) (+주문력의 20%) ⇒ 27~105 (레벨에 따라) (+주문력의 18%)"]]];
}

//블라디미르
class PatchContent_Vladimir{
  static List<String> BorNorM=["하향","상향"];
  static List<String> patchVer=["12.10","12.8"];
  static List<String> patchNoteLink= [ PatchNoteLink.link[19],PatchNoteLink.link[21]];
  static List<List<String>> Detail_Title =[["R - 혈사병"],
  ["기본 능력치"]];
  static List<List<List<String>>> Detail_Content =[[["추가 적중 대상 하나당 체력 회복량 피해량의 50% ⇒ 40%"]],
  
  [["기본 방어력 23 ⇒ 27"]]];
}

//볼리베어
class PatchContent_Volibear{
  static List<String> BorNorM=["하향", "하향", "상향", "상향", "상향","하향","하향","상향"];
  static List<String> patchVer=["14.7", "14.6", "14.4", "13.14", "13.9","12.13","12.10","12.2"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[24],PatchNoteLinkPlus.link[23],PatchNoteLinkPlus.link[21], PatchNoteLinkPlus.link[7], PatchNoteLinkPlus.link[2],PatchNoteLink.link[16], PatchNoteLink.link[19],PatchNoteLink.link[27]];
  static List<List<String>> Detail_Title =[
    ["Q - 번개 강타", "R - 폭풍을 부르는 자"],
    ["Q - 번개 강타", "R - 폭풍을 부르는 자"],
    ["Q - 번개 강타", "E - 천공 분열", "R - 폭풍을 부르는 자"],
    ["기본 지속 효과 - 무자비한 폭풍", "Q - 번개 강타", "W - 광란의 상처"],
    ["W - 광란의 상처"],
    ["Q - 번개 강타", "W - 광란의 상처", "E - 천공 분열"],
  ["W - 광란의 상처", "E - 천공 분열", "R - 폭풍을 부르는 자"],
  ["기본 능력치","E - 천공 분열"]];

  static List<List<List<String>>> Detail_Content =[
    [["치명타는 전체 스킬 피해량이 아닌 볼리베어의 공격력에만 적용됩니다."],
    ["재사용 대기시간: 140/120/100 ⇒ 160/135/110"]],

    [["추가 이동 속도: 12/17/22/27/32% ⇒ 12/16/20/24/28% (참고: 시야에 들어온 적 챔피언을 향해 이동 시 두 배로 증가합니다.)"],
    ["재사용 대기시간: 130/115/100초 ⇒ 140/120/100초"]],

    [["추가 이동 속도: 8/12/16/20/24% ⇒ 12/16/20/24/28% (참고: 이 추가 이동 속도는 적 챔피언을 향해 이동 시 여전히 두 배로 증가합니다.)"],
    ["재사용 대기시간: 13초 ⇒ 12초"],
    ["포탑 비활성화 시간: 3/4/5초 ⇒ 2/3/4초", "재사용 대기시간: 160/140/120초 ⇒ 130/115/100초", "도약 중 군중 제어 효과 저항: 군중 제어 효과 면역 ⇒ 저지 불가"]],

    [["번개 발톱 마법 피해량: 11~60 (레벨에 따라) (+주문력의 40%) ⇒ 11~60 (레벨에 따라) (+주문력의 50%)"],
    ["편의성 개선 업데이트: 공격 속도가 높은 상태로 기절을 적용한 후 볼리베어의 기본 공격에 생기던 문제를 수정했습니다."],
    ["체력 회복량: 20/35/50/65/80 (+잃은 체력의 8/10/12/14/16%) ⇒ 20/35/50/65/80 (+잃은 체력의 8/11/14/17/20%)"]],

    [["물리 피해량: 5/30/55/80/105 (+공격력의 100%) (+추가 체력의 5%) ⇒ 5/30/55/80/105 (+공격력의 100%) (+추가 체력의 6%)", "잃은 체력 비례 체력 회복 계수: 7/8.5/10/11.5/13% ⇒ 8/10/12/14/16%"]],
    
    [["추가 이동 속도 10/14/18/22/26% ⇒ 8/12/16/20/24%", "피해량 20/40/60/80/100 (+추가 공격력의 120%) ⇒ 10/30/50/70/90 (+추가 공격력의 120%)"],
  ["피해량 10/35/60/85/110 (+공격력의 100%) (+추가 체력의 6%) ⇒ 5/30/55/80/105 (+공격력의 100%) (+추가 체력의 5%)"],
  ["피해량 80/110/140/170/200 (+주문력의 80%) (+대상 최대 체력의 11/12/13/14/15%) ⇒ 80/110/140/170/200 (+주문력의 80%) (+대상 최대 체력의 9/10/11/12/13%)", "챔피언 이외의 적 대상 최대 피해량 750 ⇒ 650"]],
  
  [["체력 회복량 20/35/50/65/80 (+잃은 체력의 8/10/12/14/16%) ⇒ 20/35/50/65/80 (+잃은 체력의 7/8.5/10/11.5/13%)"],
  ["보호막 흡수량 최대 체력의 15% (+주문력의 80%) ⇒ 최대 체력의 14% (+주문력의 75%)"],
  ["추가 체력 200/400/600 ⇒ 175/350/525"]],
  
  [["공격력 증가량 3 ⇒ 3.5"],
  ["재사용 대기시간 15초 ⇒ 13초"]]];
}

//워윅
class PatchContent_Warwick{
  static List<String> BorNorM=["하향"];
  static List<String> patchVer=["12.10"];
  static List<String> patchNoteLink= [ PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[["Q - 야수의 송곳니"]];
  static List<List<List<String>>> Detail_Content =[[["체력 회복량 입힌 피해의 30/45/60/75/90% ⇒ 25/37.5/50/62.5/75%"]]];
}

//자야
class PatchContent_Xayah{
  static List<String> BorNorM=["하향", "하향","상향","상향","하향","상향"];
  static List<String> patchVer=["13.18", "13.5","13.1B","13.1","12.8","12.4"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[11],PatchNoteLink.link[1],PatchNoteLink.link[4], PatchNoteLink.link[5],PatchNoteLink.link[21],
  PatchNoteLink.link[25]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "E - 깃부르미"],
    ["E - 깃부르미"],
  ["기본 능력치"],
  ["기본 능력치"],
  ["Q - 깃털 연타"],
  ["E - 깃부르미"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 체력: 660 ⇒ 630", "체력 증가량: 102 ⇒ 107"],
    ["재사용 대기시간: 11/10.5/10/9.5/9초 ⇒ 13/12/11/10/9초"]],
    
    [["물리 피해량: 55/65/75/85/95 (+추가 공격력의 60%) ⇒ 50/60/70/80/90 (+추가 공격력의 60%)", "재사용 대기시간: 10/9.5/9/8.5/8초 ⇒ 11/10.5/10/9.5/9초"]],
  
  [["마나 재생 증가량: 0.75 ⇒ 0.8"]],
  
  [["기본 공격 속도/공격 속도 계수: 0.625 ⇒ 0.658"]],
  
  [["깃털당 피해량 45/65/85/105/125 (+추가 공격력의 50%) ⇒ 45/60/75/90/105 (+추가 공격력의 50%)", "재사용 대기시간 10/9/8/7/6초 ⇒ 10/9.5/9/8.5/8초"]],
  
  [["치명타 확률 피해량 계수 치명타 확률 1%당 0.5% ⇒ 0.75%의 추가 피해를 입힙니다."]]];
}

//제라스
class PatchContent_Xerath{
  static List<String> BorNorM=["하향", "상향", "상향"];
  static List<String> patchVer=["13.17", "13.14", "12.8"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[10], PatchNoteLinkPlus.link[7], PatchNoteLink.link[21]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "기본 지속 효과 - 마나 쇄도", "W - 파멸의 눈"],
    ["기본 마나: 459 ⇒ 400", "기본 지속 효과 - 마나 쇄도", "R - 비전 의식"],
    ["E - 충격 구체"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 마나 재생: 8 ⇒ 6.85"],
    ["유닛 처치 시 재사용 대기시간 반환: 2초 ⇒ 2.5초"],
    ["마나 소모량: 70/80/90/100/110 ⇒ 80/90/100/110/120"]],

    [["기본 마나: 459 ⇒ 400"],
    ["재사용 대기시간: 12초 ⇒ 16초", "(신규) 원 플러스 원: 유닛 처치 시 마나 쇄도의 재사용 대기시간이 2초 감소합니다.", "(신규) 포탑이 곧 힘: 이제 포탑을 타격했을 때도 마나 쇄도가 발동합니다."],
    ["사용 가능 횟수: 3/4/5 ⇒ 4/5/6", "마법 피해량: 200/250/300 (+주문력의 45%) ⇒ 180/230/280 (+주문력의 40%)", "(신규) 연속 저격: 비전 폭격에 맞은 챔피언에게 후속 비전 폭격이 20/25/30 (+주문력의 5%)의 추가 피해를 입힙니다. (참고: 이는 비전 폭격에 맞은 챔피언의 수와는 상관 없이 적용됩니다. 즉, 1명에게 적중했든 5명에게 적중했든 상관없이 스킬 한 번당 최대 1의 중첩을 적용합니다.)"]],
    
    [["기절 지속시간 0.5~2초 (이동한 거리에 따라) ⇒ 0.75~2.25 (이동한 거리에 따라)"]]];
}

//신짜오
class PatchContent_XinZhao{
  static List<String> BorNorM=["조정", "상향","상향","하향","하향"];
  static List<String> patchVer=["13.17", "12.21","12.11","12.10","12.5"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[10], PatchNoteLink.link[8],PatchNoteLink.link[18], PatchNoteLink.link[19],
  PatchNoteLink.link[24]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 결심"],
    ["기본 지속 효과 - 결심", "E - 무쌍돌격"],
  ["기본 지속 효과 - 결심","W - 풍전참뢰"],
  ["기본 지속 효과 - 결심"],
  ["E - 무쌍돌격", "R - 현월수호"]];
  static List<List<List<String>>> Detail_Content =[
    [["3회 중첩 시 체력 회복량: 6~74 (레벨에 따라) (+공격력의 10%) (+주문력의 65%) ⇒ 최대 체력의 3/3.5/4% (1/6/11레벨에서) (+주문력의 65%)"]],
    
    [["세 번째 공격 추가 피해량: 공격력의 15/25/35/45%⇒공격력의 15/30/45/60%", "체력 회복량: 6~74 (레벨에 따라) (+공격력의 10%) (+주문력의 55%)⇒6~74 (레벨에 따라) (+공격력의 10%) (+주문력의 65%)"],
  ["재사용 대기시간: 12초⇒11초"]],
  
  [["체력 회복량 6~74 (레벨에 따라) (+공격력의 7%) (+주문력의 55%) ⇒ 6~74 (레벨에 따라) (+공격력의 10%) (+주문력의 55%)"],
  ["찌르기 피해량 40/75/110/145/180 (+공격력의 80%) (+주문력의 50%) ⇒ 50/85/120/155/190 (+공격력의 90%) (+주문력의 65%)", "마나 소모량 60 (모든 스킬 레벨에서) ⇒ 60/55/50/45/40"]],
  
  [["체력 회복량 7~92 (레벨에 따라) (+추가 공격력의 10%) (+주문력의 55%) ⇒ 6~74 (레벨에 따라) (+추가 공격력의 7%) (+주문력의 55%)"]],
  
  [["재사용 대기시간 11초 ⇒ 12초"],
  ["무적 지속시간 5초 ⇒ 4초"]]];
}

//야스오
class PatchContent_Yasuo{
  static List<String> BorNorM=["상향", "상향", "상향", "하향","상향","상향"];
  static List<String> patchVer=["13.15", "13.10", "13.7", "12.10","12.7","12.2"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[8], PatchNoteLinkPlus.link[3], PatchNoteLinkPlus.link[0], PatchNoteLink.link[19],PatchNoteLink.link[22],
  PatchNoteLink.link[27]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 낭인의 길"],
    ["기본 능력치","기본 지속 효과 - 낭인의 길", "W - 바람 장막"],
    ["기본 지속 효과 - 낭인의 길","E - 질풍검"],
  ["기본 지속 효과 - 낭인의 길"],
  ["기본 능력치","R - 최후의 숨결"],
  ["Q - 강철 폭풍"]];
  static List<List<List<String>>> Detail_Content =[
    [["보호막 흡수량: 125~600 (레벨에 따라) ⇒ 125~600 (이제 기본 능력치 성장과 동일한 방식을 따릅니다.)"]],

    [["체력 증가량: 101 ⇒ 110"],
    ["기본 지속 효과 - 낭인의 길 보호막 흡수량: 100~575 ⇒ 125~600"],
    ["W - 바람 장막 재사용 대기시간: 30/27/24/21/18초 ⇒ 25/23/21/19/17초"]],    
    
    [["보호막 흡수량: 100/105/110/115/120/130/140/150/160/170/180/200/220/250/290/350/410/475 ⇒ 100/105/110/115/125/135/145/160/175/195/220/250/275/325/375/425/500/575"],
  ["중첩당 피해량 증가: E - 질풍검 기본 피해량의 25% ⇒ E - 질풍검 총 피해량의 15~25% (레벨에 따라 선형적으로 증가)","최대 중첩 수치: 2 ⇒ 4" ]],
  
  [["보호막 흡수량 115~525 ⇒ 100~475 (레벨에 따라)"]],
  
  [["체력 490 ⇒ 520"],
  ["재사용 대기시간 80/55/30초 ⇒ 70/50/30초"]],
  
  [["피해량 20/45/70/95/120 (+공격력의 100%) ⇒ 20/45/70/95/120 (+공격력의 105%)"]]];
}

//요네
class PatchContent_Yone{
  static List<String> BorNorM=["상향", "상향","하향","상향","상향"];
  static List<String> patchVer=["13.15", "13.10", "12.10","12.7","12.2"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[8], PatchNoteLinkPlus.link[3],  PatchNoteLink.link[19],PatchNoteLink.link[22],PatchNoteLink.link[27]];
  static List<List<String>> Detail_Title =[
    ["W - 영혼 가르기"],
    ["기본 능력치", "W - 영혼 가르기"],
    ["W - 영혼 가르기"],
  ["R - 운명봉인"],
  ["Q - 필멸의 검"]];
  static List<List<List<String>>> Detail_Content =[
    [["보호막 흡수량: 45~65 (레벨에 따라) (+추가 공격력의 65%) ⇒ 60~80 (레벨에 따라) (+추가 공격력의 65%)"]],


    [["기본 방어력: 28 ⇒ 30", "체력 증가량: 99 ⇒ 105"],
    ["재사용 대기시간: 16~6초, 추가 공격 속도에 비례 ⇒ 14~6초, 추가 공격 속도에 비례", "보호막 흡수량: 35~55 (레벨에 따라) (+추가 공격력의 55%) ⇒ 45~65 (레벨에 따라) (+추가 공격력의 65%)"]],
    
    [["보호막 흡수량 40~60 (레벨에 따라) (+추가 공격력의 60%) ⇒ 35~55 (레벨에 따라) (+추가 공격력의 55%)"]],
  
  [["재사용 대기시간 120/100/80초 ⇒ 120/90/60초"]],
  
  [["피해량 20/40/60/80/100 (+공격력의 100%) ⇒ 20/40/60/80/100 (+공격력의 105%)"]]];
}

//요릭
class PatchContent_Yorick{
  static List<String> BorNorM=["하향", "상향", "조정", "하향","상향","하향"];
  static List<String> patchVer=["14.5", "14.3", "13.15", "13.5","12.12","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[22],PatchNoteLinkPlus.link[20], PatchNoteLinkPlus.link[8], PatchNoteLink.link[1],PatchNoteLink.link[17], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 영혼의 길잡이", "E - 애도의 안개", "R - 군도의 장송곡"],
    ["기본 지속 효과 - 영혼의 길잡이", "Q - 최후의 의식", "E - 애도의 안개", "R - 군도의 장송곡"],
    ["R - 군도의 장송곡"],
    ["E - 애도의 안개"],
  ["기본 지속 효과 - 영혼의 길잡이", "R - 군도의 장송곡"],
  ["Q - 최후의 의식"]];
  static List<List<List<String>>> Detail_Content =[
    [["몬스터로부터 받는 피해량 감소 효과가 안개 망령에만 적용된다는 점이 명확하게 표시되도록 툴팁을 업데이트했습니다."],
    ["공격 8회 동안 저주 대상 추가 피해량: 30% ⇒ 20%"],
    ["안개 마녀 방어력 및 마법 저항력: 10~50 (레벨에 따라) ⇒ 30~90 (레벨에 따라)", "(삭제) 안개 마녀는 더 이상 광역 피해를 50% 감소시키지 않습니다.", "이제 툴팁에 안개 마녀가 공격로 미니언으로부터 70% 감소된 피해를 입는다는 점이 명시됩니다.","버그 수정: 안개 마녀의 최대 체력 비례 1/2/3% 피해량이 더 이상 쉔의 W - 의지의 결계와 같은 회피를 무시하지 않습니다. (참고: 실명 및 회피 모두 해당 부분 외 안개 마녀의 공격에는 적절하게 작동합니다.)"]],

    [["안개 망령 반응 사거리: 2,000 ⇒ 1,600", "(신규) 빠른 복귀: 이제 요릭의 안개 망령이 요릭에게 돌아갈 때 추가 이동 속도를 얻습니다. 추가 이동 속도는 안개 망령과 요릭 사이의 거리에 비례합니다."],
    ["체력 회복량: 10~68 (레벨에 따라), 체력이 50% 미만인 경우 두 배로 적용 ⇒ 10~68 (레벨에 따라) (+잃은 체력의 4/5/6/7/8%), 챔피언이 아닌 대상의 경우 절반만 적용", "마나 소모량: 25 ⇒ 20"],
    ["스킬 사용 시간: 0.33초 ⇒ 0.25초"],
    ["안개 마녀의 표적 공격 시 추가 피해량: 대상 최대 체력의 3/6/9% (상대가 몬스터일 경우 최대 100/200/300), 재사용 대기시간 2초 ⇒ 대상 최대 체력의 2/2.5/3% (상대가 몬스터일 경우 최대 100), 재사용 대기시간 없음"]],

  [["(신규) 돌아온 여왕: 이제 안개 마녀가 초당 2.5의 체력을 재생합니다.", "(신규) 안개 마녀의 방어력 및 마법 저항력: 0 ⇒ 10~50 (6~18레벨에서, 비선형적으로 증가)", "체력: 350/1,100/3,300 (+요릭 최대 체력의 75%) ⇒ 400~1,650 (6~18레벨에서, 비선형적으로 증가) (+요릭 최대 체력의 60%)"]],

    [["안개 망령 추가 피해량: 40% ⇒ 30% (참고: 추가 피해량은 안개 망령마다 최대 8회까지 적용됩니다.)"]],
  
  [["안개 망령 - 기본 체력 100~185 (레벨에 따라) (+요릭 최대 체력의 15%) ⇒ 110~212 (레벨에 따라) (+요릭 최대 체력의 20%)", "안개 망령 - 이동 속도 300 ⇒ 325"],
  ["안개 마녀 - 기본 체력 300/1,000/3,000 (+요릭 최대 체력의 70%) ⇒ 350/1,100/3,300 (+요릭 최대 체력의 75%)", "안개 마녀 - 표식이 새겨진 대상 추적 거리 1,600 ⇒ 1,000"]],
  
  [["최소 체력 회복량 12~82 (레벨에 따라) ⇒ 10~68 (레벨에 따라)"]]];
}

//유미
class PatchContent_Yuumi{
  static List<String> BorNorM=["하향", "하향", "조정", "하향","하향","하향","하향","하향", "조정", "조정"];
  static List<String> patchVer=["13.12", "13.6","13.5","13.1B","13.1","12.23","12.16","12.14","12.12","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[5],PatchNoteLink.link[0],PatchNoteLink.link[1],PatchNoteLink.link[4],PatchNoteLink.link[5]
  , PatchNoteLink.link[6],PatchNoteLink.link[13],PatchNoteLink.link[15],PatchNoteLink.link[17], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["W - 너랑 유미랑!", "E - 슈우우웅", "R - 대단원"],
    ["Q - 사르르탄","R - 대단원"],
  ["기본 능력치","기본 지속 효과 - 야옹이 친구","Q - 사르르탄","W - 너랑 유미랑!","E - 슈우우웅","R - 대단원"],
  ["기본 능력치", "기본 지속 효과 - 퐁퐁방울", "W - 너랑 유미랑!", "E - 슈우우웅"],
  ["Q - 사르르탄"],
  ["기본 지속 효과 - 퐁퐁방울","R - 대단원"],
  ["Q - 사르르탄","E - 슈우우웅","R - 대단원"],
  ["E - 슈우우웅"],
  ["기본 지속 효과 - 퐁퐁방울", "E - 슈우우웅"],
  ["기본 지속 효과 - 퐁퐁방울","E - 슈우우웅"]];
  static List<List<List<String>>> Detail_Content =[
    [["단짝 추가 효과: 체력 및 보호막 효과 10~20% (아군 레벨에 따라) ⇒ 5/7.5/10/12.5/15% (스킬 레벨에 따라)"],
    ["보호막 흡수량: 90/120/150/180/210 (+주문력의 30%) ⇒ 80/105/130/155/180 (+주문력의 30%)", "공격 속도 증가량: 35% (+주문력 100당 8%) ⇒ 25/27.5/30/32.5/35% (+주문력 100당 8%)"],
    ["파동당 체력 회복: 35/50/65 (+주문력의 15%) ⇒ 25/40/55 (+주문력의 15%)"]],
    
    [["Q - 사르르탄이 적중한 적을 대상으로 하는 단짝의 기본 공격 적중 시 피해량: 10/12/14/16/18/20 (+주문력의 10%) ⇒ 10/12/14/16/18/20 (+주문력의 5%)","재사용 대기시간: 7.5/7.25/7/6.75/6.5/6.25초 ⇒ 6.5초 (모든 스킬 레벨에서)", "마나 소모량: 50/55/60/65/70/75 ⇒ 50/60/70/80/90/100", "밀착 해제 시 탄도체 속도: 1,000 ⇒ 850" , "강화된 탄도체 속도: 1,900 ⇒ 1,650","최대 사거리 (직선 궤적): 2,000 ⇒ 1,725" ],
  ["(신규) 체력 회복 초과분 보호막 지속시간: 3초 ⇒ 1.5초 (참고: 보호막은 스킬 지속시간 (3.5초) 종료 후 명시된 시간만큼 추가로 지속됩니다.)","(삭제) 단짝 추가 저항력: 20/40/60 (+주문력의 10%) 방어력 및 마법 저항력 ⇒ 삭제"]],

  [["체력 증가량: 84 ⇒ 69","기본 마나: 400 ⇒ 440" ],
  ["(신규) 기초적인 보호: 유미가 스킬 또는 기본 공격으로 챔피언을 맞히면 유미가 체력을 회복하고 아군을 위해 체력 회복을 충전합니다. 다음 4초 안에 밀착 시 대상 아군도 회복시킵니다. 이 효과는 밀착한 동안에는 자동으로 일어납니다.","(신규) 친구 만들기: 유미가 밀착한 아군이 적 챔피언이나 미니언을 처치할 때마다 우정이 쌓입니다. 각 아군은 고유한 우정 점수를 가지며 단짝에게 밀착한 동안 유미의 스킬에 추가 효과가 생깁니다.", "재사용 대기시간: 20~10초 (1~11레벨에서)","체력 회복량: 25~110 (+주문력의 15%) (레벨에 따라)","길어지는 냥냥펀치: 유미의 기본 지속 효과 - 야옹이 친구가 준비되면 유미의 기본 공격 사거리가 50만큼 늘어납니다." ],
  ["스킬 설명: 유미가 미사일을 발사해 처음으로 맞힌 적에게 피해를 입히고 둔화시킵니다. 유미가 밀착한 동안 사용했다면 짧은 시간 동안 미사일을 조종할 수 있습니다. 이후 미사일이 강화되며 강화된 미사일은 속도가 매우 빨라지고 둔화 효과가 증가합니다.", "단짝 추가 효과: Q - 사르르탄의 둔화 효과가 항상 강화되며 적 챔피언을 맞출 시 5초 동안 단짝에게 10/12/14/16/18/20 (+주문력의 10%)의 적중 시 피해를 추가로 제공합니다. 적중 시 피해는 단짝의 치명타 확률에 따라 최대 75%까지 증가할 수 있습니다.", "재사용 대기시간: 7.5/7.25/7.0/6.75/6.5/6.25초", "마나 소모량: 50/55/60/65/70/75", "피해량: 60/90/120/150/180/210 (+주문력의 20%)", "둔화율: 1초 동안 20%", "단짝 강화된 피해량: 80/140/200/260/320/380 (+주문력의 35%)", "단짝 강화된 둔화율: 55/60/65/70/75/80%, 2초에 걸쳐 20%로 감소", "미사일 투사체 너비: 65 ⇒ 60", "(신규) 고양이의 눈: 이제 유미의 Q - 사르르탄에 적중된 적은 위치가 드러납니다. (참고: 은신한 적은 드러나지 않습니다.)"],
  ["(삭제) 추가 적응형 능력치: 유미 및 유미와 밀착한 아군이 더 이상 추가 적응형 능력치를 받지 않습니다.", "(삭제) 콩콩스럽지 않다냥: 유미의 W - 너랑 유미랑이 더 이상 콩콩이 소환의 이로운 효과로 판정되지 않습니다.", "단짝 추가 효과: 유미의 체력 회복 및 보호막 효과가 추가로 10~20% (밀착한 단짝 챔피언의 레벨에 따라) 증가하며 단짝은 적중 시 체력을 3/5/7/9/11 (+주문력의 4%) 회복합니다. 이 효과는 유미의 체력 회복 및 보호막 효과에 영향을 받습니다."],
  ["(신규) 체력 회복 대신 보호막: 이제 아군의 체력을 회복시키는 대신 보호막을 제공합니다.","재사용 대기시간: 12/11.5/11/10.5/10초", "마나 소모량: 80/90/100/110/120", "보호막 흡수량: 90/120/150/180/210 (+주문력의 30%)", "추가 이동 속도: 유미의 보호막이 남아있는 동안 (보호막이 파괴되거나 3초에 걸쳐 사라지기 전까지) 대상 아군이 20%의 추가 이동 속도를 얻습니다.", "추가 공격 속도: 35% (+주문력 100당 8%)", "밀착한 대상 마나 회복량: 유미가 밀착한 대상의 마나를 20/24/28/32/36 회복시킵니다. 마나 회복량은 대상이 잃은 마나에 따라 (잃은 마나의 30%~80%) 100%까지 증가합니다.", "도움의 발길: 유미는 아군을 가리지 않고 모두 보호할 수 있어야 하므로 E - 슈우우웅에는 단짝 추가 효과가 존재하지 않습니다." ],
  ["스킬 설명: 유미가 3.5초 동안 아군과 적에게 영향을 미치는 마법의 파동을 5회 발사합니다. 밀착 상태에서 사용 시 마우스로 파동을 조종할 수 있습니다. 파동은 아군 챔피언의 체력을 회복시키며 단짝은 체력 회복량이 130% 증가합니다. 모든 체력 회복 초과분은 보호막으로 전환되며 스킬이 종료된 후 3초 동안 유지됩니다. 적 챔피언에게는 파동이 피해를 입히고 중첩되는 둔화 효과를 적용합니다.", "재사용 대기시간: 110/100/90초 ⇒ 120/110/100초", "파동당 마법 피해량: 60/80/100 (+주문력의 20%) ⇒ 75/100/125 (+주문력의 20%)", "파동당 체력 회복: 35/50/65 (+주문력의 15%)", "둔화 지속시간: 1.25초", "둔화율: 10% + 맞은 파동 하나당 추가로 10% (최대 둔화율 50%)", "단짝 추가 효과: 파동이 스킬 지속시간 동안 단짝에게 20/40/60(+주문력의 10%)의 방어력과 마법 저항력을 제공합니다."]],
  
  [["공격 사거리: 500 ⇒ 425", "기본 공격력: 55 ⇒ 49", "기본 체력: 550 ⇒ 500", "기본 체력 재생: 7 ⇒ 5"],
  ["(신규) 공격 사거리: 퐁퐁방울로 강화된 공격이 25의 추가 사거리를 얻습니다.", "보호막 흡수량: 60~380 (레벨에 따라) ⇒ 45~300 (레벨에 따라)"],
  ["적응형 능력치: 12~20 (+추가 능력치의 12~20%) ⇒ 12~20 (+추가 능력치의 6~10%)"],
  ["(삭제) 이동 속도: 20% (+주문력 100당 2%) ⇒ 20% (참고: 주문력 계수가 삭제되었습니다.)"]],
  
  [["기본 피해량: 50/90/130/170/210/250 ⇒ 50/80/110/140/170/200", "강화된 기본 피해량: 60/110/160/210/260/310 ⇒ 60/100/140/180/220/260"]],
  
  [["재사용 대기시간: 14~6초 (레벨에 따라) ⇒ 18~6초 (레벨에 따라)"],
  ["속박 지속시간: 1.75초 ⇒ 1.25초"]],
  
  [["기본 피해량 (미강화) 50/80/110/140/170/200 ⇒ 50/90/130/170/210/250", "기본 피해량 (강화) 60/100/140/180/220/260 (+대상 현재 체력의 2/3.2/4.4/5.6/6.8/8%) ⇒ 60/110/160/210/260/310 (+대상 현재 체력의 3/4.2/5.4/6.6/7.8/9%)"],
  ["추가 이동 속도 20% (+주문력 100당 6%) ⇒ 20% (+주문력 100당 2%)", "재사용 대기시간 12/11/10/9/8초 ⇒ 12/11.5/11/10.5/10초"],
  ["재사용 대기시간 130/110/90초 ⇒ 110/100/90초"]],
  
  [["체력 회복량 70/90/110/130/150 (+주문력의 35%) ⇒ 70/90/110/130/150 (+주문력의 30%)"]],
  
  [["보호막 흡수량 56~360 (레벨에 따라) ⇒ 60~380 (레벨에 따라)","기본 공격 추가 사거리 50 ⇒ 0"],
  ["체력 회복량 70/100/130/160/190 (+주문력의 35%) ⇒ 70/90/110/130/150 (+주문력의 35%)", "추가 이동 속도 15% (+주문력 100당 6%) ⇒ 20% (+주문력 100당 6%)"]],

  [["보호막 흡수량 60~400 (레벨에 따라) (+주문력의 30%) ⇒ 56~360 (레벨에 따라) (+주문력의 25%)"],
  ["마나 소모량 40/45/50/55/60 (+최대 마나의 15%) ⇒ 40/45/50/55/60 (+최대 마나의 12%)"]]];
}

//자크
class PatchContent_Zac{
  static List<String> BorNorM=["하향", "하향", "상향", "하향","상향","하향"];
  static List<String> patchVer=["14.8", "14.5", "14.1", "13.3","12.23","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[25], PatchNoteLinkPlus.link[22],PatchNoteLinkPlus.link[18],PatchNoteLink.link[3],PatchNoteLink.link[6], PatchNoteLink.link[19]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치"],
    ["W - 불안정 물질"],
    ["기본 지속 효과 - 세포 분열", "E - 새총 발사", "R - 바운스!"],
    ["W - 불안정 물질","E - 새총 발사"],
  ["기본 지속 효과 - 세포 분열", "Q - 탄성 주먹"],
  ["기본 지속 효과 - 세포 분열"]];
  static List<List<List<String>>> Detail_Content =[
    [["5초당 기본 체력 재생: 8 ⇒ 5"]],

    [["피해량: 35/50/65/80/95 (+대상 최대 체력의 4/5/6/7/8% (+주문력 100당 3%)) ⇒ 40/50/60/70/80 (+대상 최대 체력의 4/5/6/7/8% (+주문력 100당 3%))"]],

    [["조각당 체력 회복량: 4/5/6/7% ⇒ 5/6/7/8%"],
    ["재사용 대기시간: 24/21/18/15/12초 ⇒ 22/19/16/13/10초"],
    ["재사용 대기시간: 130/115/100초 ⇒ 120/105/90초"]],
    
    [["마법 피해량: 35/50/65/80/95 (+대상 최대 체력의 4/5/6/7/8% (+주문력 100당 4%)) ⇒ 35/50/65/80/95 (+대상 최대 체력의 4/5/6/7/8% (+주문력 100당 3%))"],
  ["마법 피해량: 60/110/160/210/260 (+주문력의 90%) ⇒ 60/105/150/195/240 (+주문력의 80%)"]],
  
  [["조각당 체력 회복량: 최대 체력의 4/4.75/5.5/6.25% (R - 바운스! 스킬 레벨에 따라) ⇒ 최대 체력의 4/5/6/7% (R - 바운스! 스킬 레벨에 따라)"],
  ["재사용 대기시간: 15/13.5/12/10.5/9초 ⇒ 14/12.5/11/9.5/8초","기본 피해량: 40/55/70/85/100 (+자크 최대 체력의 2.5%) ⇒ 40/55/70/85/100 (+자크 최대 체력의 4%)"]],
  
  [["조각 흡수 시 체력 회복량 최대 체력의 5/6/7/8% ⇒ 4/4.75/5.5/6.25%"]]];
}

//제드
class PatchContent_Zed{
  static List<String> BorNorM=["상향", "하향", "조정","하향","상향","하향"];
  static List<String> patchVer=["14.1", "13.20", "13.5","12.23","12.15","12.2"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[18],PatchNoteLinkPlus.link[13], PatchNoteLink.link[1],PatchNoteLink.link[6],PatchNoteLink.link[14],PatchNoteLink.link[27]];
  static List<List<String>> Detail_Title =[
    ["W - 살아있는 그림자", "E - 그림자 베기", "R - 죽음의 표식"],
    ["W - 살아있는 그림자"],
    ["기본 능력치","E - 그림자 베기"],
  ["Q - 예리한 표창", "E - 그림자 베기"],
  ["W - 살아있는 그림자","E - 그림자 베기"],
  ["R - 죽음의 표식"]];
  static List<List<List<String>>> Detail_Content =[
    [["재사용 대기시간: 20/19.25/18.5/17.75/17초 ⇒ 20/19/18/17/16초"],
    ["피해량: 65/85/105/125/145 (+추가 공격력의 65%) ⇒ 65/90/115/140/165 (+추가 공격력의 65%)"],
    ["피해량: 공격력의 65% (+입힌 피해량의 25/40/55%) ⇒ 공격력의 100% (+입힌 피해량의 25/40/55%)"]],

    [["재사용 대기시간: 20/18.5/17/15.5/14초 ⇒ 20/19.25/18.5/17.75/17초"]],

    [["마법 저항력: 32 ⇒ 29"],
  ["재사용 대기시간: 5/4.75/4.5/4.25/4초 ⇒ 5/4.5/4/3.5/3초"]],
  
  [["기본 물리 피해량: 80/115/150/185/220 ⇒ 70/105/140/175/210"],
  ["재사용 대기시간: 5/4.5/4/3.5/3초 ⇒ 5/4.75/4.5/4.25/4초", "기본 물리 피해량: 70/90/110/130/150 ⇒ 65/85/105/125/145"]],
  
  [["그림자 스킬 모방 사거리 2,000 ⇒ 제한 없음"],
  ["기력 소모량 50 ⇒ 40"]],
  
  [["피해량 공격력의 100% (+표식이 적용된 대상에게 입힌 피해량의 25/40/55%) ⇒ 공격력의 65% (+표식이 적용된 대상에게 입힌 피해량의 25/40/55%)"]]];
}

//제리 //12.2 합류
class PatchContent_Zeri{
  static List<String> BorNorM=["하향", "상향", "상향", "하향", "하향", "하향", "하향","상향","하향","하향","하향","조정","하향","조정","하향","하향"];
  static List<String> patchVer=["14.8", "14.3", "13.24", "13.19", "13.12", "13.7", "13.1","12.23","12.16","12.14","12.12","12.11","12.7","12.5", "12.4","12.3"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[25], PatchNoteLinkPlus.link[20], PatchNoteLinkPlus.link[17],PatchNoteLinkPlus.link[12], PatchNoteLinkPlus.link[5], PatchNoteLinkPlus.link[0], PatchNoteLink.link[5],PatchNoteLink.link[6],PatchNoteLink.link[13],PatchNoteLink.link[15]
  ,PatchNoteLink.link[17],PatchNoteLink.link[18],PatchNoteLink.link[22],PatchNoteLink.link[24],PatchNoteLink.link[25]
  ,PatchNoteLink.link[26]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치"],
    ["기본 능력치", "R - 번개 방출"],
    ["기본 능력치", "W - 초강력 레이저"],
    ["기본 능력치"],
    ["기본 능력치", "기본 지속 효과 - 살아있는 배터리", "Q - 집중 사격", "E - 스파크 돌진"],
    ["기본 능력치","기본 지속 효과 - 살아있는 배터리","R - 번개 방출"],
  ["기본 능력치","Q - 집중 사격"],
  ["기본 능력치","기본 지속 효과 - 살아있는 배터리", "Q - 집중 사격", "W - 초강력 레이저", "E - 스파크 돌진", "R - 번개 방출"],
  ["Q - 집중 사격","W - 초강력 레이저"],
  ["Q - 집중 사격","R - 번개 방출"],
  ["기본 능력치", "W - 초강력 레이저", "R - 번개 방출"],
  ["Q - 집중 사격","W - 초강력 레이저", "E - 스파크 돌진","R - 번개 방출"],
  ["기본 능력치", "Q - 집중 사격","W - 초강력 레이저","E - 스파크 돌진","R - 번개 방출"],
  ["기본 능력치","Q - 집중 사격","E - 스파크 돌진", "R - 번개 방출"],
  ["충전되지 않은 기본 공격" , "충전된 기본 공격", "Q - 집중 사격","W - 초강력 레이저", "E - 스파크 돌진", "R - 번개 방출"],
  ["기본 능력치", "기본 공격","R - 번개 방출"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 체력: 630 ⇒ 600"]],

    [["기본 공격력: 53 ⇒ 56"],
    ["재사용 대기시간: 100/85/70 ⇒ 80/75/70"]],

    [["공격력 증가량: 1.3 ⇒ 2"],
    ["피해량: 20/60/100/140/180 (+공격력의 130%) (+주문력의 25%) ⇒ 30/70/110/150/190 (+공격력의 130%) (+주문력의 25%)"]],

    [["기본 이동 속도: 335 ⇒ 330"]],

    [["이동 속도: 330 ⇒ 335"],
    ["(삭제) 그렇게 빨린 안 되지: 제리가 적 보호막에 피해를 입히면 피해량의 45%에 해당하는 보호막을 얻고 제리가 보호막을 받을 때마다 2초간 이동 속도가 10% 증가하는 기본 지속 효과 - 살아있는 배터리의 효과가 삭제되었습니다.", "Q - 집중 사격 기본 지속 효과 이동: Q - 집중 사격의 기본 지속 효과가 제리의 기본 지속 효과 자리로 이동했습니다."],
    ["(삭제) Q - 집중 사격의 기본 지속 효과는 제리의 기본 지속 효과로: Q - 집중 사격의 기본 지속 효과가 제리의 기본 지속 효과 자리로 이동했습니다.", "삼위일체여 안녕: 이제 Q - 집중 사격이 주문 검 효과를 발동시키지 않습니다."],
    ["적중 시 최대 치명타 계수: 65% ⇒ 85%"]],
    
    [["체력 증가량: 115 ⇒ 110"],
  ["보호막 흡수량: 입힌 피해량의 60% ⇒ 입힌 피해량의 45%"],
  ["마법 피해량: 175/275/375 (+추가 공격력의 100%) (+주문력의 110%) ⇒ 175/275/375 (+추가 공격력의 85%) (+주문력의 110%)"]],

  [["공격력 증가량: 1.5 ⇒ 1.3"],
  ["총 기본 물리 피해량: 15/18/21/24/27 ⇒ 15/17/19/21/23"]],
  
  [["이동 속도: 325 ⇒ 330", "기본 공격력: 50 ⇒ 53", "기본 방어력: 20 ⇒ 24", "기본 체력: 600 ⇒ 630", "공격 속도 계수: 0.568 ⇒ 0.625", "체력 증가량: 109 ⇒ 115"],
  ["완전히 충전된 기본 공격 피해량: 90~200 (레벨에 따라) (+주문력의 90%) (+대상 최대 체력의 1~15% (레벨에 따라)) ⇒ 90~200 (레벨에 따라) (+주문력의 110%) (+대상 최대 체력의 1~15%)", "전광석화 추가 보호막: 곱연산 이동 속도 10% ⇒ 이동 속도 10% (참고: 이에 따라 보호막 중첩이 다른 이동 속도 제공 요소와 좋은 효과를 내기가 어려워집니다.)", "추가 이동 속도 지속시간: 3초 ⇒ 2초"],
  ["사거리: 825 ⇒ 750", "공격력으로 전환되는 공격 속도 초과분: 60% ⇒ 70%", "물리 피해량: 8/11/14/17/20 (+공격력의 100/105/110/115/120%) ⇒ 15/18/21/24/27 (+공격력의 104/108/112/116/120%)"],
  ["피해 유형: 마법 피해 ⇒ 물리 피해", "물리 피해량: 20/55/90/125/160 (+공격력의 100%)(+주문력의 40%) ⇒ 20/60/100/140/180 (+공격력의 130%) (+주문력의 25%)", "스킬 사용 시간: 공격 속도의 2.5배 ⇒ 0.55~0.3초 (공격 속도에 따라)", "투사체 속도: 2,200 ⇒ 2,500", "광선 사용 시간: 0.75초 ⇒ 0.85초"],
  ["마나 소모량: 80 ⇒ 90/85/80/75/70", "재사용 대기시간: 24/22.5/21/19.5/18초 ⇒ 22/21/20/19/18초", "(신규) 마법 같은 번개 탄환: 제리가 E - 스파크 돌진을 사용한 후 5초 동안 번개 탄환을 얻고 제리의 Q - 집중 사격이 처음 적중한 적에게 추가 마법 피해를 입힙니다.", "(신규) 처음 적중한 적에게 추가 마법 피해를 입히는 번개 탄환: 20/22/24/26/28 (+주문력의 20%)(+추가 공격력의 12%). 이 피해량은 제리의 치명타 확률에 따라 최대 65%까지 증가합니다.", "번개 탄환이 처음 적중한 후 관통 피해량 감소: 60/70/80/90/100% ⇒ 80/85/90/95/100%", "지형을 뛰어넘는 중 시야 범위: 850 단위 ⇒ 1,500 단위"],
  ["(삭제) 합선됨: 과충전된 동안 제리의 공격이 더 이상 적중 시 5/10/15(+주문력의 15%)의 추가 마법 피해를 입히지 않습니다.", "연쇄 번개 사거리: 450 ⇒ 650", "적중 시 마법 피해량: 150/250/350 (+주문력의 80%)(+추가 공격력의 80%) ⇒ 175/275/375 (+주문력의 110%)(+추가 공격력의 100%)", "폭주 기관차: 제리의 R - 번개 방출로 1명 이상의 챔피언을 맞추면 제리가 5초 동안 이동 속도 10%와 공격 속도 30%를 얻고 공격 시 연쇄 번개를 일으킵니다. 챔피언에 Q - 집중 사격이나 기본 공격을 적중시키면 이 효과의 지속시간을 1.5초만큼 초기화합니다. (참고: 이 효과는 기본 지속시간보다 더 길어질 수 없습니다.)", "끝없는 활력: 적 챔피언을 맞히면 제리에게 1.5초 동안 과충전 중첩 1(치명타의 경우 3)이 부여됩니다. 과충전 중첩에는 제한이 없으며 중첩당 이동 속도를 0.5%만큼 얻습니다."]],
  
  [["피해량 8/11/14/17/20 (+공격력의 105/110/115/120/125%) (+주문력의 60%) ⇒ 8/11/14/17/20 (+공격력의 100/105/110/115/120%) (+주문력의 60%)"],
  ["피해량 20/55/90/125/160 (+공격력의 130%) (+주문력의 60%) ⇒ 20/55/90/125/160 (+공격력의 100%) (+주문력의 40%)"]],
  
  [["(신규) 찌리릿 처형 이제 기본 공격이 남은 체력이 60~150 (레벨에 따라)(+주문력의 18%) 미만인 적을 처형합니다. (참고: 보호막이나 무적인 대상에 입힌 피해는 이 처형 효과를 발동하지 않습니다.)", "(삭제) 배터리 방전 충전되지 않은 제리의 기본 공격이 이제 남은 체력이 일정 비율 미만인 적에게 증가한 피해를 입히지 않습니다."],
  ["추가 마법 피해량 10/15/20 (+주문력의 15%) ⇒ 5/10/15 (+주문력의 15%)"]],
  
  [["체력 재생 증가량 0.55 ⇒ 0.7", "18레벨 체력 재생 12.6 ⇒ 15.15"],
  ["피해량 10/45/80/115/150 (+공격력의 150%) (+주문력의 70%) ⇒ 20/55/90/125/160 (+공격력의 130%) (+주문력의 60%)", "치명타 피해량 17.5/78.75/140/201.25/262.5 (+공격력의 262.5%) (+주문력의 122.5%) ⇒ 25/96.25/157.5/218.75/280 (+공격력의 227.5%) (+주문력의 105%)"],
  ["중첩당 추가 이동 속도 1% ⇒ 0.5%"]],

  [["사용 시 피해량 7/9/11/13/15 (+총 공격력의 110/112.5/115/117.5/120%) ⇒ 8/11/14/17/20 (+총 공격력의 105/110/115/120/125%)", "기본 지속 효과 충전 공격 피해량 90~200 (레벨에 따라) (+주문력의 80%) (+대상 최대 체력의 1~10% (1~13레벨에서)) ⇒ 90~200 (1~18레벨에서) (+주문력의 90%) (+대상 최대 체력의 1~15% (1~18레벨에서))", "(삭제) 기본 지속 효과 충전 공격 둔화율 1초 동안 18/26/34/42/50% ⇒ 삭제"],
  ["피해량 10/45/80/115/150 (+공격력의 140%) (+주문력의 70%) ⇒ 10/45/80/115/150 (+공격력의 150%) (+주문력의 70%)", "둔화율 30/40/50/60/70% ⇒ 30/35/40/45/50%", "재사용 대기시간 13/12/11/10/9초 ⇒ 12/11/10/9/8초", "(신규) 몰아치는 천둥 벽을 관통한 W - 초강력 레이저가 챔피언 및 몬스터에게 치명타로 적중합니다."],
  ["재사용 대기시간 26/24.5/23/21.5/20초 ⇒ 24/22.5/21/19.5/18초", "기본 공격 적중 시 재사용 대기시간 감소 1초 ⇒ 0.5초", "치명타 적중 시 재사용 대기시간 감소 3초 ⇒ 1.5초"],
  ["재사용 대기시간 120/95/70초 ⇒ 100/85/70초", "중첩당 이동 속도 증가량 1.5% ⇒ 1%", "R - 번개 방출이 적중한 챔피언 하나당 중첩 횟수 4 ⇒ 8"]],

  [["기본 체력 500 ⇒ 530","공격력 증가량 2 ⇒ 1.5", "공격력 53~87 (레벨에 따라) ⇒ 50~75.5 (레벨에 따라)", "기본 방어력 22 ⇒ 20", "체력 증가량 90 ⇒ 95", "18레벨 체력 2,030 ⇒ 2,115"],
  ["총 물리 피해량 10/15/20/25/30 (+총 공격력의 110%) ⇒ 7/9/11/13/15 (+총 공격력의 110/112.5/115/117.5/120%)", "한 발에 한 번 이제 Q - 집중 사격을 사용할 때마다 적중 시 효과가 한 번씩만 적용됩니다.", "너무 빨라 이제 제리가 Q - 집중 사격을 사용할 때마다 R - 번개 방출 중첩 및 E - 스파크 돌진 재사용 대기시간 감소 효과가 한 번씩만 발동합니다. (치명타 제외)", "(신규) 두 배로 짜릿한 Q - 집중 사격에 치명타가 발동하면 R - 번개 방출 중첩이 한 번 더 쌓이고 E - 스파크 돌진 재사용 대기시간이 한 번 더 감소합니다. (Q - 집중 사격이 챔피언에게 적중했을 때 1회 및 치명타가 발동했을 때 1회)","적 챔피언에게 치명타 적중 시 추가 R - 번개 방출 중첩 및 E - 재사용 대기시간 감소 횟수 1 ⇒ 2", "적 챔피언에게 Q - 집중 사격 및 치명타 적중 시 총 추가 R - 번개 방출 중첩 및 E - 재사용 대기시간 감소 횟수 2 ⇒ 3"],
  ["마법 피해량 40/75/110/145/180 (+총 공격력의 100%)(+주문력의 60%) ⇒ 10/45/80/115/150 (+총 공격력의 140%)(+주문력의 70%)","둔화 지속시간 1/1.25/1.5/1.75/2초 ⇒ 2초 (모든 스킬 레벨에서)"],
  ["재사용 대기시간 23초 ⇒ 26/24.5/23/21.5/20초"],
  ["재사용 대기시간 100/90/80초 ⇒ 120/95/70초"]],
  
  [["기본 공격력 58 ⇒ 53", "체력 증가량 85 (18레벨 체력 1,945) ⇒ 90 (18레벨 체력 2,030)", "기본 방어력 23 (레벨당 +3.5), 18레벨 방어력 82.5 ⇒ 22 (레벨당 +3), 18레벨 방어력 73", "기본 공격 - 충전된 기본 공격의 대상 최대 체력 비례 마법 피해량 3~15% (레벨에 따라) ⇒ 1~10% (1~7레벨에서 +0.5%, 8~13레벨에서 +1%)"],
  ["총 물리 피해량 9/13/17/21/25 (+공격력의 110%) ⇒ 10/15/20/25/30 (+공격력의 110%)"],
  ["재사용 대기시간 23/22/21/20/19초 ⇒ 23초 (모든 스킬 레벨에서)", "관통 피해량 80/85/90/95/100% ⇒ 60/70/80/90/100%"],
  ["스킬 최초 사용 시 적중한 적 하나당 중첩 횟수 3 ⇒ 4", "중첩당 추가 이동 속도 증가량 2% ⇒ 1.5%"]],

  [["마법 피해량 15~40 (레벨에 따라) (+주문력의 4%) ⇒ 10~25 (레벨에 따라) (+주문력의 3%)", "피해량 증가 체력이 35% 이하인 적에게 입히는 피해 300% 증가 ⇒ 체력이 35% 이하인 적에게 입히는 피해 500% 증가"],
  ["둔화율 20/25/30/35/40% ⇒ 14/23/32/41/50% (Q - 집중 사격 스킬 레벨에 따라)", "둔화 지속시간 1.5초 ⇒ 1초"],
  ["피해량 10/15/20/25/30 (+공격력의 110%) ⇒ 9/13/17/21/25 (+공격력의 110%)", "집중의 달인 이제 Q - 집중 사격의 기본 피해량에 치명타가 적용됩니다. (공격력 계수에 추가)", "공격 속도 초과분 공격력 전환 계수 50% ⇒ 60%"],
  ["둔화율 50/55/60/65/70% ⇒ 30/40/50/60/70%","재사용 대기시간 10초 (모든 스킬 레벨에서) ⇒ 13/12/11/10/9초"],
  ["재사용 대기시간 23/21.5/20/19.5/17초 ⇒ 23/22/21/20/19초", "재사용 대기시간 감소 충전된 기본 공격 또는 스킬에 적중된 챔피언 한 명당 1.5초 감소 ⇒ 충전된 기본 공격 또는 스킬에 적중된 챔피언 한 명당 1초 감소"],
  ["추가 공격 속도 30/35/40% ⇒ 30% (모든 스킬 레벨에서)"]],
  
  [["이동 속도 330 ⇒ 325"],
  ["최대 충전 시 대상 최대 체력 비례 피해량 3-20% (레벨에 따라) ⇒ 3-15% (레벨에 따라)"],
  ["연쇄 번개 마법 피해량 10/20/30 (+주문력의 15%) ⇒ 10/15/20 (+주문력의 15%)", "(신규) 정전기 제리가 과충전 상태일 때 Q - 집중 사격의 연쇄 번개에 치명타가 발동할 수 있습니다."]]];
}

//직스
class PatchContent_Ziggs{
  static List<String> BorNorM=["상향", "하향", "하향", "상향", "상향"];
  static List<String> patchVer=["14.3", "13.23", "13.22", "13.20", "12.20"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[20], PatchNoteLinkPlus.link[16],PatchNoteLinkPlus.link[15],PatchNoteLinkPlus.link[13], PatchNoteLink.link[9]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치", "W - 휴대용 폭약"],
    ["기본 능력치", "Q - 반동 폭탄", "W - 휴대용 폭약"],
    ["기본 능력치"],
    ["Q - 반동 폭탄"],
    ["Q - 반동 폭탄"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 방어력: 18 ⇒ 21", "방어력 증가량: 4.5 ⇒ 4.7"],
    ["재사용 대기시간: 24/21/18/15/12초 ⇒ 20/18/16/14/12초"]],

    [["기본 공격력: 54 ⇒ 55"],
    ["마법 피해량: 95/145/195/245/295 (+주문력의 65%) ⇒ 85/135/185/235/285 (+주문력의 65%)"],
    ["재사용 대기시간: 20/18/16/14/12초 ⇒ 24/21/18/15/12초", "마나 소모량: 65 ⇒ 80"]],
    
    [["기본 방어력: 22 ⇒ 18", "기본 공격 프레임: 20.8% ⇒ 20%"]],

    [["폭발 피격 판정 범위: 150 ⇒ 180"]],
    
    [["마법 피해량: 85/135/185/235/285 (+주문력의 65%) ⇒ 95/145/195/245/295 (+주문력의 65%)"]]];
}

//질리언
class PatchContent_Zilean{
  static List<String> BorNorM=[];
  static List<String> patchVer=[];
  static List<String> patchNoteLink= [];
  static List<List<String>> Detail_Title =[[]];
  static List<List<List<String>>> Detail_Content =[[[]]];
}

//조이
class PatchContent_Zoe{
  static List<String> BorNorM=["조이", "상향","상향","상향"];
  static List<String> patchVer=["13.17", "13.1B","12.16","12.8"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[10], PatchNoteLink.link[4],PatchNoteLink.link[13],PatchNoteLink.link[21]];
  static List<List<String>> Detail_Title =[
    ["기본 능력치","E - 헤롱헤롱쿨쿨방울"],
    ["E - 헤롱헤롱쿨쿨방울"],
  ["W - 주문도둑","E - 헤롱헤롱쿨쿨방울"],
  ["Q - 통통별", "R - 차원 넘기"]];
  static List<List<List<String>>> Detail_Content =[
    [["기본 체력 재생: 6.5 ⇒ 7.5"], 
    ["마법 저항력 감소: 20/22.5/25/27.5/30% ⇒ 30% (모든 스킬 레벨에서)"]],
    
    [["(신규) 골치 아픈 방울: 조이의 E - 헤롱헤롱쿨쿨방울에 맞아 수면 상태에 빠진 적은 마법 저항력이 20/22.5/25/27.5/30% 감소합니다. (참고: 대상이 잠에서 깨면 해당 효과는 사라집니다.)"]],
  
  [["(신규) 주문 도둑들 조이가 1,500 범위 내에 있을 경우 아군이 처치한 미니언도 주문 파편을 떨어뜨립니다."],
  ["마법 피해량 60/100/140/180/220 (+주문력의 40%) ⇒ 70/110/150/190/230 (+주문력의 45%)", "최대 깨우기 피해량 60/100/140/180/220 (+주문력의 40%) ⇒ 70/110/150/190/230 (+주문력의 45%)"]],
  
  [["마나 소모량 50/55/60/65/70 ⇒ 40/45/50/55/60"],
  ["마나 소모량 50 ⇒ 40"]]];
}

//자이라
class PatchContent_Zyra{
  static List<String> BorNorM=["하향", "조정", "조정", "상향","상향"];
  static List<String> patchVer=["14.4", "14.3", "13.21","13.14", "12.16"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[21], PatchNoteLinkPlus.link[20], PatchNoteLinkPlus.link[14], PatchNoteLinkPlus.link[7], PatchNoteLink.link[13],];
  static List<List<String>> Detail_Title =[
    ["기본 지속 효과 - 가시 정원"],
    ["기본 능력치", "Q - 치명적인 가시", "W - 맹렬한 성장"],
    ["기본 능력치", "기본 지속 효과 - 가시 정원", "Q - 치명적인 가시", "E - 휘감는 뿌리"],
    ["기본 지속 효과 - 가시 정원", "W - 맹렬한 성장", "E - 휘감는 뿌리", "R - 올가미 덩굴"],
  ["E - 휘감는 뿌리"]];
  static List<List<List<String>>> Detail_Content =[
    [["식물 마법 피해량: 20~88 (레벨에 따라) (+주문력의 18%) ⇒ 16~84 (레벨에 따라) (+주문력의 18%)", "에픽 몬스터를 제외한 몬스터에게 입히는 추가 피해량: 40~100 (레벨에 따라) ⇒ 60~100 (레벨에 따라)"]],

    [["기본 마나 재생: 13 ⇒ 7", "마나 재생 증가량: 0.4 ⇒ 0.8"],
    ["마나 소모량: 70 ⇒ 55"],
    ["미니언/몬스터 처치 관여 시 씨앗 충전 진척도: 20% ⇒ 35%"]],

    [["1레벨 공격 속도: 0.625 ⇒ 0.681 (참고: 공격 속도 계수는 전과 동일합니다.)"],
    ["식물 마법 피해량: 20~100 (레벨에 따라) (+주문력의 15%) ⇒ 20~88 (레벨에 따라) (+주문력의 18%)"],
    ["마법 피해량: 60/95/130/165/200 (+주문력의 60%) ⇒ 60/100/140/180/220 (+주문력의 65%)"],
    ["마법 피해량: 60/105/150/195/240 (+주문력의 50%) ⇒ 60/95/130/165/200 (+주문력의 60%)"]],

    [["광역 스킬로부터 식물이 입는 피해: 4 ⇒ 3", "원거리 기본 공격으로부터 식물이 입는 피해: 4 ⇒ 5", "몬스터 대상 식물 피해량: 에픽 몬스터가 아닌 몬스터에게 150% ⇒ 모든 몬스터에게 40~100(챔피언 레벨에 따라)의 추가 마법 피해"],
    ["스킬 첫 습득 시 씨앗 개수: 1 ⇒ 2"],
    ["점멸 상호작용: 이제 E - 휘감는 뿌리 스킬 사용 중에 점멸을 사용할 수 있습니다."],
    ["피해 적용 주기: 초당 4번 ⇒ 초당 16번", "작동 체계: 자이라가 R - 올가미 덩굴을 사용한 위치로 걸어갑니다. ⇒ 자이라가 R - 올가미 덩굴을 즉시 최대 사거리에서 사용합니다."]],
  
  [["시전 후 행동 불가 시간 0.15~0.4초 ⇒ 0.15초"]]];
}


//SharePreferences용 클래스
class IsFavorite_SharedPreferencess extends ChangeNotifier {
  // SharedPreferences 인스턴스
  SharedPreferences prefs;

  // 생성자(Constructor)
  IsFavorite_SharedPreferencess(this.prefs) {
    for(int i = 0; i<ChampionNameEn.length;i++) 
      IsFavoriteInClass[i] = prefs.getBool(ChampionNameEn[i]) ?? false;
  }

  //즐찾 여부 shared prefecrences 단에서 (꺼져도 저장 되어 있는 데이터)
  List<bool> IsFavoriteInClass =[
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false, //60
    
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false, //120
    
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false, //162
    false,false,false,false,false              //167
  ];
}