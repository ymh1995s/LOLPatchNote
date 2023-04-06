//스트럭트로 하는게 나은가? 챔피언 이름, bool?
//163개
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> ChampionName =
["가렌","갈리오","갱플랭크","그라가스","그레이브즈","그웬",
"나르","나미","나서스","노틸러스","녹턴","누누와윌럼프",
"니달리","니코","닐라","다리우스","다이애나","드레이븐",
"라이즈","라칸","람머스","럭스","럼블","레나타글라스크",
"레넥톤","레오나","렉사이","렐","랭가","루시안",
"룰루","르블랑","리신","리븐","리산드라","릴리아",
"마스터이","마오카이","말자하","말파이트","모데카이저","모르가나",
"문도박사","미스포츈","밀리오","바드","바루스","바이",
"베이가", "베인", "벡스", "벨베스", "벨코즈", "볼리베어",
"브라움","브랜드","블라디미르","블리츠크랭크","비에고","빅토르",
"뽀삐","사미라","사이온","사일러스","샤코","세나",
"세라핀","세주아니","세트","소나","소라카","쉔",
"쉬바나","스웨인","스카너","시비르","신짜오","신드라",
"신지드","쓰레쉬","아리","아무무","아우렐리온솔","아이번",
"아지르","아칼리","아크샨","아트룩스","아펠리오스","알리스타",
"애니","애니비아","애쉬","야스오","에코","엘리스",
"오공","오른","오리아나","울라프","요네","요릭",
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
"헤카림"];

List<String> ChampionNameEn =
["Garen","Galio","Gangplank","Gragas","Graves","Gwen",
"Gnar","Nami","Nasus","Nautilus","Nocturne","Nunu",
"Nidalee","Neeko","Nilah","Darius","Diana","Draven",
"Ryze","Rakan","Rammus","Lux","Rumble","Renata",
"Renekton","Leona","RekSai","Rell","Rengar","Lucian",
"Lulu","Leblanc","LeeSin","Riven","Lissandra","Lillia",
"MasterYi","Maokai","Malzahar","Malphite","Mordekaiser","Morgana",
"DrMundo","MissFortune","Milio","Bard","Varus","Vi",
"Veigar", "Vayne", "Vex", "Belveth", "Velkoz", "Volibear",
"Braum","Brand","Vladimir","Blitzcrank","Viego","Viktor",
"Poppy","Samira","Sion","Sylas","Shaco","Senna",
"Seraphine","Sejuani","Sett","Sona","Soraka","Shen",
"Shyvana","Swain","Skarner","Sivir","XinZhao","Syndra",
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
"Hecarim"];

var ChampionImgLink = List<String>.filled(163,"");

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
  false,false,false,false,false,false,
  
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,
  false,false,false,false,false,false,  
  false
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
class PatchNoteLinkPlus{
  //13.7 이후의 버전
  static List<String> link = [
    "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-13-7-notes/",];
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
      PatchContent_Hecarim.patchVer
    ];
    
var     BorNorMDataArr =[    
      PatchContent_Garen.BorNorM,
      PatchContent_Galio.BorNorM,
      PatchContent_Gangplank.BorNorM,
      PatchContent_Gragas.BorNorM,
      PatchContent_Graves.BorNorM,
      PatchContent_Gwen.BorNorM,
      PatchContent_Gnar.BorNorM,
      PatchContent_Nami.BorNorM,
      PatchContent_Nasus.BorNorM,
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
      PatchContent_Milio.BorNorM,
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
      PatchContent_Hecarim.BorNorM
    ];

var     patchNoteLinkArr=[
      PatchContent_Garen.patchNoteLink,
      PatchContent_Galio.patchNoteLink,
      PatchContent_Gangplank.patchNoteLink,
      PatchContent_Gragas.patchNoteLink,
      PatchContent_Graves.patchNoteLink,
      PatchContent_Gwen.patchNoteLink,
      PatchContent_Gnar.patchNoteLink,
      PatchContent_Nami.patchNoteLink,
      PatchContent_Nasus.patchNoteLink,
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
      PatchContent_Hecarim.patchNoteLink
    ];







//나중에 딕셔너리 형식으로 묶었으면 좋곘는데
class PatchNoteVer{
  static List<String> Ver = [];
}

//아트룩스
class PatchContent_Aatrox{
  static List<String> BorNorM=["상향", "하향","하향","조정", "하향","상향"];
  static List<String> patchVer=["13.5","13.1","12.20","12.14","12.10","12.4"];
  static List<String> patchNoteLink= [PatchNoteLink.link[1], PatchNoteLink.link[5],PatchNoteLink.link[9],PatchNoteLink.link[15]
  , PatchNoteLink.link[19],PatchNoteLink.link[25]];
}

//아리
class PatchContent_Ahri{
  static List<String> BorNorM=["상향","상향","하향","하향","하향","조정"];
  static List<String> patchVer=["13.4","12.21","12.17","12.9","12.5","12.3"];
  static List<String> patchNoteLink= [PatchNoteLink.link[2],PatchNoteLink.link[8],PatchNoteLink.link[12], PatchNoteLink.link[20],
  PatchNoteLink.link[24],PatchNoteLink.link[26]];
}

//아칼리
class PatchContent_Akali{
  static List<String> BorNorM=["상향"];
  static List<String> patchVer=["12.15"];
  static List<String> patchNoteLink= [PatchNoteLink.link[14]];
}

//아크샨
class PatchContent_Akshan{
  static List<String> BorNorM=["하향","하향"];
  static List<String> patchVer=["12.10","12.3"];
  static List<String> patchNoteLink= [ PatchNoteLink.link[19],PatchNoteLink.link[26]];
}

//알리스타
class PatchContent_Alistar{
  static List<String> BorNorM=["상향", "상향", "상향","상향","하향"];
  static List<String> patchVer=["13.7", "13.4","13.3","12.14","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[2], PatchNoteLink.link[3],PatchNoteLink.link[15], PatchNoteLink.link[19]];
}

//아무무
class PatchContent_Amumu{
  static List<String> BorNorM=["하향", "하향","상향","상향","상향","하향"];
  static List<String> patchVer=["13.4","13.3","12.23","12.12","12.4","12.3"];
  static List<String> patchNoteLink= [PatchNoteLink.link[2],PatchNoteLink.link[3],PatchNoteLink.link[6],PatchNoteLink.link[17]
  ,PatchNoteLink.link[25],PatchNoteLink.link[26]];
}

//애니비아
class PatchContent_Anivia{
  static List<String> BorNorM=["하향", "하향","하향"];
  static List<String> patchVer=["13.4","13.3","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[2], PatchNoteLink.link[3], PatchNoteLink.link[19]];
}

//애니
class PatchContent_Annie{
  static List<String> BorNorM=["하향", "상향","하향"];
  static List<String> patchVer=["13.7","12.12","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[0], PatchNoteLink.link[17], PatchNoteLink.link[19]];
}

//아펠리오스
class PatchContent_Aphelios{
  static List<String> BorNorM=["상향","상향","하향"];
  static List<String> patchVer=["13.4","12.11","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[2],PatchNoteLink.link[18], PatchNoteLink.link[19]];
}

//애쉬
class PatchContent_Ashe {
  static List<String> BorNorM = ["상향", "조정", "상향","상향"];
  static List<String> patchVer = ["13.6", "13.5","12.18","12.4"];
  static List<String> patchNoteLink = [PatchNoteLink.link[0],PatchNoteLink.link[1],PatchNoteLink.link[11],PatchNoteLink.link[25]];
}

//아우랠리온솔
class PatchContent_AurelionSol{
  static List<String> BorNorM=["하향", "하향", "조정"];
  static List<String> patchVer=["13.6","13.5", "13.3"];
  static List<String> patchNoteLink= [PatchNoteLink.link[0], PatchNoteLink.link[1],PatchNoteLink.link[3]];
}

//아지르
class PatchContent_Azir{
  static List<String> BorNorM=["상향","조정", "하향","하향","상향"];
  static List<String> patchVer=["13.7", "13.5","13.4","12.17","12.6"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[0], PatchNoteLink.link[1],PatchNoteLink.link[2],PatchNoteLink.link[12],PatchNoteLink.link[23]];
}

//바드
class PatchContent_Bard{
  static List<String> BorNorM=["하향","상향"];
  static List<String> patchVer=["12.10","12.8"];
  static List<String> patchNoteLink= [ PatchNoteLink.link[19],PatchNoteLink.link[21]];
}

//벨베스
class PatchContent_Belveth{
  static List<String> BorNorM=["하향","하향"];
  static List<String> patchVer=["12.21","12.12"];
  static List<String> patchNoteLink= [PatchNoteLink.link[8],PatchNoteLink.link[17]];
}

//블리츠크랭크
class PatchContent_Blitzcrank{
  static List<String> BorNorM=["하향","조정","상향","상향","하향"];
  static List<String> patchVer=["12.21","12.20","12.19","12.12","12.4"];
  static List<String> patchNoteLink= [PatchNoteLink.link[8],PatchNoteLink.link[9], PatchNoteLink.link[10],PatchNoteLink.link[17]
  ,PatchNoteLink.link[25]];
}

//브랜드
class PatchContent_Brand{
  static List<String> BorNorM=["하향","조정"];
  static List<String> patchVer=["12.11","12.3"];
  static List<String> patchNoteLink= [PatchNoteLink.link[18],PatchNoteLink.link[26]];
}

//브라움
class PatchContent_Braum{
  static List<String> BorNorM=["상향","상향"];
  static List<String> patchVer=["13.3","12.9"];
  static List<String> patchNoteLink= [PatchNoteLink.link[3],PatchNoteLink.link[20]];
}

//케이틀린
class PatchContent_Caitlyn{
  static List<String> BorNorM=["하향","상향","상향","하향"];
  static List<String> patchVer=["13.5","12.16","12.11","12.3"];
  static List<String> patchNoteLink= [PatchNoteLink.link[1],PatchNoteLink.link[13],PatchNoteLink.link[18],PatchNoteLink.link[26]];
}

//카밀
class PatchContent_Camille{
  static List<String> BorNorM=["상향","하향"];
  static List<String> patchVer=["12.17","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[12], PatchNoteLink.link[19]];
}

//카시오페아
class PatchContent_Cassiopeia{
  static List<String> BorNorM=["하향"];
  static List<String> patchVer=["12.10"];
  static List<String> patchNoteLink= [ PatchNoteLink.link[19]];
}

//초가스
class PatchContent_Chogath{
  static List<String> BorNorM=["상향","상향","상향","하향"];
  static List<String> patchVer=["13.4","12.23","12.22","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[2],PatchNoteLink.link[6],PatchNoteLink.link[7], PatchNoteLink.link[19]];
}

//코르키
class PatchContent_Corki{
  static List<String> BorNorM=["상향","하향","하향"];
  static List<String> patchVer=["12.21","12.13","12.3"];
  static List<String> patchNoteLink= [PatchNoteLink.link[8],PatchNoteLink.link[16],PatchNoteLink.link[26]];
}

//다리우스
class PatchContent_Darius{
  static List<String> BorNorM=["상향"];
  static List<String> patchVer=["12.6"];
  static List<String> patchNoteLink= [PatchNoteLink.link[23]];
}

//다이애나
class PatchContent_Diana{
  static List<String> BorNorM=["조정", "상향","상향"];
  static List<String> patchVer=["12.16","12.10","12.1"];
  static List<String> patchNoteLink= [PatchNoteLink.link[13], PatchNoteLink.link[19],PatchNoteLink.link[28]];
}

//드레이븐
class PatchContent_Draven{
  static List<String> BorNorM=["하향","상향"];
  static List<String> patchVer=["12.16","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[13], PatchNoteLink.link[19]];
}

//문도
class PatchContent_DrMundo{
  static List<String> BorNorM=["조정","하향", "조정","하향","하향","하향"];
  static List<String> patchVer=["13.6","13.1","12.23","12.12","12.10","12.4"];
  static List<String> patchNoteLink= [PatchNoteLink.link[0],PatchNoteLink.link[5], PatchNoteLink.link[6],PatchNoteLink.link[17]
  ,  PatchNoteLink.link[19],PatchNoteLink.link[25]];
}

//에코
class PatchContent_Ekko{
  static List<String> BorNorM=["상향","하향"];
  static List<String> patchVer=["12.19","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[10], PatchNoteLink.link[19]];
}

//앨리스
class PatchContent_Elise{
  static List<String> BorNorM=["하향","상향","상향","하향"];
  static List<String> patchVer=["13.4","12.20","12.13","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[2],PatchNoteLink.link[9],PatchNoteLink.link[16], PatchNoteLink.link[19]];
}

//이블린
class PatchContent_Evelynn{
  static List<String> BorNorM=["상향","상향"];
  static List<String> patchVer=["12.20","12.13"];
  static List<String> patchNoteLink= [PatchNoteLink.link[9],PatchNoteLink.link[16]];
}

//이즈리얼
class PatchContent_Ezreal{
  static List<String> BorNorM=["상향","상향"];
  static List<String> patchVer=["12.17","12.8"];
  static List<String> patchNoteLink= [PatchNoteLink.link[12],PatchNoteLink.link[21]];
}

//피들스틱
class PatchContent_Fiddlesticks{
  static List<String> BorNorM=["상향","하향","상향"];
  static List<String> patchVer=["12.13","12.10","12.8"];
  static List<String> patchNoteLink= [PatchNoteLink.link[16], PatchNoteLink.link[19],PatchNoteLink.link[21]];
}

//피오라
class PatchContent_Fiora{
  static List<String> BorNorM=["하향","하향","하향"];
  static List<String> patchVer=["13.1","12.12","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[5],PatchNoteLink.link[17], PatchNoteLink.link[19]];
}

//피즈
class PatchContent_Fizz{
  static List<String> BorNorM=["상향","상향","조정"];
  static List<String> patchVer=["13.5","12.19","12.11"];
  static List<String> patchNoteLink= [PatchNoteLink.link[1],PatchNoteLink.link[10],PatchNoteLink.link[18]];
}

//갈리오
class PatchContent_Galio{
  static List<String> BorNorM=["상향","상향","하향"];
  static List<String> patchVer=["13.6","12.13","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[0],PatchNoteLink.link[16], PatchNoteLink.link[19]];
}

//갱플랭크
class PatchContent_Gangplank{
  static List<String> BorNorM=["하향", "하향","조정","하향","상향","상향"];
  static List<String> patchVer=["13.5", "13.1B","12.14","12.10","12.7","12.1"];
  static List<String> patchNoteLink= [PatchNoteLink.link[1], PatchNoteLink.link[4],PatchNoteLink.link[15], PatchNoteLink.link[19],
  PatchNoteLink.link[22],PatchNoteLink.link[28]];
}

//가렌
class PatchContent_Garen{
  static List<String> BorNorM=["상향","하향"];
  static List<String> patchVer=["12.19","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[10], PatchNoteLink.link[19]];
}

//나르
class PatchContent_Gnar{
  static List<String> BorNorM=["하향"];
  static List<String> patchVer=["12.14"];
  static List<String> patchNoteLink= [PatchNoteLink.link[15]];
}

//그라가스
class PatchContent_Gragas{
  static List<String> BorNorM=["상향","하향"];
  static List<String> patchVer=["12.11","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[18], PatchNoteLink.link[19]];
}

//그레이브즈
class PatchContent_Graves{
  static List<String> BorNorM=["상향", "상향"];
  static List<String> patchVer=["13.7", "12.17"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[0], PatchNoteLink.link[12]];
}

//그웬
class PatchContent_Gwen{
  static List<String> BorNorM=["상향","하향","조정","하향","하향","상향","하향"];
  static List<String> patchVer=["12.20","12.15","12.13","12.11","12.10","12.7","12.5"];
  static List<String> patchNoteLink= [PatchNoteLink.link[9],PatchNoteLink.link[14],PatchNoteLink.link[16],PatchNoteLink.link[18]
  , PatchNoteLink.link[19],PatchNoteLink.link[22],PatchNoteLink.link[24]];
}

//헤카림
class PatchContent_Hecarim{
  static List<String> BorNorM=["하향","조정","상향","하향"];
  static List<String> patchVer=["12.18","12.17","12.9","12.6"];
  static List<String> patchNoteLink= [PatchNoteLink.link[11],PatchNoteLink.link[12],PatchNoteLink.link[20],PatchNoteLink.link[23]];
}

//하이머딩거
class PatchContent_Heimerdinger{
  static List<String> BorNorM=["하향","상향"];
  static List<String> patchVer=["13.1B","12.12"];
  static List<String> patchNoteLink= [PatchNoteLink.link[4],PatchNoteLink.link[17]];
}

//일라오이
class PatchContent_Illaoi{
  static List<String> BorNorM=["하향","조정","상향"];
  static List<String> patchVer=["12.10","12.6","12.4"];
  static List<String> patchNoteLink= [ PatchNoteLink.link[19],PatchNoteLink.link[23],PatchNoteLink.link[25]];
}

//이랠리아
class PatchContent_Irelia{
  static List<String> BorNorM=["상향","상향","하향"];
  static List<String> patchVer=["12.16","12.11","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[13],PatchNoteLink.link[18], PatchNoteLink.link[19]];
}

//아이번
class PatchContent_Ivern{
  static List<String> BorNorM=["상향","하향"];
  static List<String> patchVer=["12.12","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[17], PatchNoteLink.link[19]];
}

//잔나
class PatchContent_Janna{
  static List<String> BorNorM=["조정","하향","하향","조정"];
  static List<String> patchVer=["12.14","12.12","12.10","12.2"];
  static List<String> patchNoteLink= [PatchNoteLink.link[15],PatchNoteLink.link[17], PatchNoteLink.link[19],PatchNoteLink.link[27]];
}

//자르반
class PatchContent_JarvanIV{
  static List<String> BorNorM=["하향", "상향","상향","상향","하향"];
  static List<String> patchVer=["13.4","13.3","12.14","12.12","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[2],PatchNoteLink.link[3],PatchNoteLink.link[15],PatchNoteLink.link[17]
  , PatchNoteLink.link[19]];
}

//잭스
class PatchContent_Jax{
  static List<String> BorNorM=["하향","조정","상향"];
  static List<String> patchVer=["13.4","13.1","12.6"];
  static List<String> patchNoteLink= [PatchNoteLink.link[2],PatchNoteLink.link[5],PatchNoteLink.link[23]];
}

//제이스
class PatchContent_Jayce{
  static List<String> BorNorM=["상향","상향","상향","하향"];
  static List<String> patchVer=["13.1","12.20","12.16","12.7"];
  static List<String> patchNoteLink= [PatchNoteLink.link[5],PatchNoteLink.link[9],PatchNoteLink.link[13],PatchNoteLink.link[22]];
}

//진
class PatchContent_Jhin{
  static List<String> BorNorM=["상향"];
  static List<String> patchVer=["12.8"];
  static List<String> patchNoteLink= [PatchNoteLink.link[21]];
}

//징크스
class PatchContent_Jinx{
  static List<String> BorNorM=["상향","상향","하향"];
  static List<String> patchVer=["13.5","12.19","12.8"];
  static List<String> patchNoteLink= [PatchNoteLink.link[1],PatchNoteLink.link[10],PatchNoteLink.link[21]];
}

//카이사
class PatchContent_Kaisa{
  static List<String> BorNorM=["상향","상향","하향","조정"];
  static List<String> patchVer=["12.19","12.16","12.10","12.8"];
  static List<String> patchNoteLink= [PatchNoteLink.link[10],PatchNoteLink.link[13], PatchNoteLink.link[19],PatchNoteLink.link[21]];
}

//칼리스타
class PatchContent_Kalista{
  static List<String> BorNorM=["상향", "하향","하향","상향","상향"];
  static List<String> patchVer=["13.7", "12.18","12.15","12.7","12.4"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[0], PatchNoteLink.link[11],PatchNoteLink.link[14],PatchNoteLink.link[22],PatchNoteLink.link[25]];
}

//카르마
class PatchContent_Karma{
  static List<String> BorNorM=["하향"];
  static List<String> patchVer=["12.10"];
  static List<String> patchNoteLink= [ PatchNoteLink.link[19]];
}

//카서스
class PatchContent_Karthus{
  static List<String> BorNorM=["상향","상향"];
  static List<String> patchVer=["12.13","12.7"];
  static List<String> patchNoteLink= [PatchNoteLink.link[16],PatchNoteLink.link[22]];
}

//카사딘
class PatchContent_Kassadin{
  static List<String> BorNorM=["하향", "하향", "조정","상향","상향"];
  static List<String> patchVer=["13.3", "13.1B","12.23","12.17","12.8"];
  static List<String> patchNoteLink= [PatchNoteLink.link[3],PatchNoteLink.link[4],PatchNoteLink.link[6],PatchNoteLink.link[12]
  ,PatchNoteLink.link[21]];
}

//카타리나
class PatchContent_Katarina{
  static List<String> BorNorM=["상향", "조정","하향"];
  static List<String> patchVer=["13.7", "12.12","12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[0], PatchNoteLink.link[17],PatchNoteLink.link[19]];
}

//케일
class PatchContent_Kayle{
  static List<String> BorNorM=["상향","조정"];
  static List<String> patchVer=["13.3","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[3], PatchNoteLink.link[19]];
}

//케인
class PatchContent_Kayn{
  static List<String> BorNorM=["상향","상향","하향","조정", "하향","하향"];
  static List<String> patchVer=["13.3","12.23","12.18","12.14","12.11","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[3],PatchNoteLink.link[6],PatchNoteLink.link[11],PatchNoteLink.link[15]
  , PatchNoteLink.link[18], PatchNoteLink.link[19]];
}

//케넨
class PatchContent_Kennen{
  static List<String> BorNorM=["상향","상향","상향","상향"];
  static List<String> patchVer=["13.5","12.20","12.15","12.5"];
  static List<String> patchNoteLink= [PatchNoteLink.link[1],PatchNoteLink.link[9],PatchNoteLink.link[14],PatchNoteLink.link[24]];
}

//카직스
class PatchContent_Khazix{
  static List<String> BorNorM=["조정", "하향"];
  static List<String> patchVer=["13.7", "12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[0], PatchNoteLink.link[19]];
}

//킨드레드
class PatchContent_Kindred{
  static List<String> BorNorM=["하향","하향"];
  static List<String> patchVer=["13.1B","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[4], PatchNoteLink.link[19]];
}

//클레드
class PatchContent_Kled{
  static List<String> BorNorM=["상향","조정"];
  static List<String> patchVer=["12.13","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[16], PatchNoteLink.link[19]];
}

//코그모
class PatchContent_KogMaw{
  static List<String> BorNorM=["하향"];
  static List<String> patchVer=["12.11"];
  static List<String> patchNoteLink= [PatchNoteLink.link[18]];
}

//크산테
class PatchContent_KSante{
  static List<String> BorNorM=["하향","하향","상향"];
  static List<String> patchVer=["13.3","13.1","12.23"];
  static List<String> patchNoteLink= [PatchNoteLink.link[3],PatchNoteLink.link[5],PatchNoteLink.link[6]];
}

//르블랑
class PatchContent_Leblanc{
  static List<String> BorNorM=["상향", "상향","상향","하향"];
  static List<String> patchVer=["13.5","13.3","12.14","12.3"];
  static List<String> patchNoteLink= [PatchNoteLink.link[1],PatchNoteLink.link[3],PatchNoteLink.link[15],PatchNoteLink.link[26]];
}

//리신
class PatchContent_LeeSin{
  static List<String> BorNorM=["하향", "상향","상향","상향","하향","하향"];
  static List<String> patchVer=["13.7", "12.18","12.15","12.11","12.10","12.7"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[0], PatchNoteLink.link[11],PatchNoteLink.link[14],PatchNoteLink.link[18], PatchNoteLink.link[19]
  ,PatchNoteLink.link[22]];
}

//레오나
class PatchContent_Leona{
  static List<String> BorNorM=["상향"];
  static List<String> patchVer=["12.15"];
  static List<String> patchNoteLink= [PatchNoteLink.link[14]];
}

//릴리아
class PatchContent_Lillia{
  static List<String> BorNorM=["상향","하향","상향","상향", "하향","하향","상향","상향"];
  static List<String> patchVer=["13.1B","12.23","12.22","12.15","12.11","12.10","12.7","12,3"];
  static List<String> patchNoteLink= [PatchNoteLink.link[4],PatchNoteLink.link[6],PatchNoteLink.link[7],PatchNoteLink.link[14]
  ,PatchNoteLink.link[18], PatchNoteLink.link[19],PatchNoteLink.link[22],PatchNoteLink.link[26]];
}

//리산드라
class PatchContent_Lissandra{
  static List<String> BorNorM=["상향","하향"];
  static List<String> patchVer=["13.1","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[5], PatchNoteLink.link[19]];
}

//루시안
class PatchContent_Lucian{
  static List<String> BorNorM=["하향","하향","상향"];
  static List<String> patchVer=["13.1B","12.12","12.4"];
  static List<String> patchNoteLink= [PatchNoteLink.link[4],PatchNoteLink.link[17],PatchNoteLink.link[25]];
}

//룰루
class PatchContent_Lulu{
  static List<String> BorNorM=["하향","하향","하향"];
  static List<String> patchVer=["12.18","12.10","12.2"];
  static List<String> patchNoteLink= [PatchNoteLink.link[11], PatchNoteLink.link[19],PatchNoteLink.link[27]];
}

//럭스
class PatchContent_Lux{
  static List<String> BorNorM=["하향"];
  static List<String> patchVer=["12.10"];
  static List<String> patchNoteLink= [ PatchNoteLink.link[19]];
}

//말파이트
class PatchContent_Malphite{
  static List<String> BorNorM=["상향","상향","상향","상향","하향"];
  static List<String> patchVer=["13.4","12.23", "12.19","12.16","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[2],PatchNoteLink.link[6],PatchNoteLink.link[10],PatchNoteLink.link[13]
  , PatchNoteLink.link[19]];
}

//말자하
class PatchContent_Malzahar{
  static List<String> BorNorM=["상향"];
  static List<String> patchVer=["12.21"];
  static List<String> patchNoteLink= [PatchNoteLink.link[8]];
}

//마오카이
class PatchContent_Maokai{
  static List<String> BorNorM=["하향","하향","상향","하향", "조정","조정","하향"];
  static List<String> patchVer=["13.4","13.1B","12.23","12.20","12.18","12.17","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[2],PatchNoteLink.link[4],PatchNoteLink.link[6],PatchNoteLink.link[9]
  , PatchNoteLink.link[11],PatchNoteLink.link[12], PatchNoteLink.link[19]];
}

//마스터이
class PatchContent_MasterYi{
  static List<String> BorNorM=["하향","하향","상향","하향","하향","하향"];
  static List<String> patchVer=["12.19","12.15","12.13","12.11","12.9","12.5"];
  static List<String> patchNoteLink= [PatchNoteLink.link[10],PatchNoteLink.link[14],PatchNoteLink.link[16],PatchNoteLink.link[18]
  ,PatchNoteLink.link[20],PatchNoteLink.link[24]];
}

//밀리오
class PatchContent_Milio{
  static List<String> BorNorM=[];
  static List<String> patchVer=[];
  static List<String> patchNoteLink= [];
}

//미스포춘
class PatchContent_MissFortune{
  static List<String> BorNorM=["하향", "상향"];
  static List<String> patchVer=["12.21","12.17"];
  static List<String> patchNoteLink= [PatchNoteLink.link[8],PatchNoteLink.link[12]];
}

//오공
class PatchContent_MonkeyKing{
  static List<String> BorNorM=["하향", "상향","하향","하향","조정","하향","상향"];
  static List<String> patchVer=["13.7", "12.20","12.18","12.17","12.14","12.11","12.7"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[0], PatchNoteLink.link[9],PatchNoteLink.link[11],PatchNoteLink.link[12],PatchNoteLink.link[15]
  ,PatchNoteLink.link[18],PatchNoteLink.link[22]];
}

//모데카이저
class PatchContent_Mordekaiser{
  static List<String> BorNorM=["하향","하향","상향"];
  static List<String> patchVer=["12.23","12.10","12.8"];
  static List<String> patchNoteLink= [PatchNoteLink.link[6], PatchNoteLink.link[19],PatchNoteLink.link[21]];
}

//모르가나
class PatchContent_Morgana{
  static List<String> BorNorM=["하향"];
  static List<String> patchVer=["12.10"];
  static List<String> patchNoteLink= [ PatchNoteLink.link[19]];
}

//나미
class PatchContent_Nami{
  static List<String> BorNorM=["하향","하향","하향","상향","조정"];
  static List<String> patchVer=["13.1B","12.17","12.10","12.4","12.3"];
  static List<String> patchNoteLink= [PatchNoteLink.link[4],PatchNoteLink.link[12], PatchNoteLink.link[19],PatchNoteLink.link[25]
  ,PatchNoteLink.link[26]];
}

//나서스
class PatchContent_Nasus{
  static List<String> BorNorM=["상향","하향"];
  static List<String> patchVer=["12.19","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[10], PatchNoteLink.link[19]];
}

//노틸러스
class PatchContent_Nautilus{
  static List<String> BorNorM=["상향","하향"];
  static List<String> patchVer=["13.3","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[3], PatchNoteLink.link[19]];
}

//니코
class PatchContent_Neeko{
  static List<String> BorNorM=["상향","상향"];
  static List<String> patchVer=["12.7","12.4"];
  static List<String> patchNoteLink= [PatchNoteLink.link[22],PatchNoteLink.link[25]];
}

//니달리
class PatchContent_Nidalee{
  static List<String> BorNorM=["하향","하향","상향"];
  static List<String> patchVer=["12.10","12.9","12.6"];
  static List<String> patchNoteLink= [ PatchNoteLink.link[19],PatchNoteLink.link[20],PatchNoteLink.link[23]];
}

//닐라
class PatchContent_Nilah{
  static List<String> BorNorM=[];
  static List<String> patchVer=[];
  static List<String> patchNoteLink= [];
}

//녹턴
class PatchContent_Nocturne{
  static List<String> BorNorM=["하향","상향","상향","하향","상향"];
  static List<String> patchVer=["12.18","12.17","12.14","12.10","12.2"];
  static List<String> patchNoteLink= [PatchNoteLink.link[11],PatchNoteLink.link[12],PatchNoteLink.link[15], PatchNoteLink.link[19]
  ,PatchNoteLink.link[27]];
}

//누누
class PatchContent_Nunu{
  static List<String> BorNorM=["상향","상향","상향","하향","하향"];
  static List<String> patchVer=["12.22","12.19","12.11","12.10","12.4"];
  static List<String> patchNoteLink= [PatchNoteLink.link[7],PatchNoteLink.link[10],PatchNoteLink.link[18], PatchNoteLink.link[19]
  ,PatchNoteLink.link[25]];
}

//울라프
class PatchContent_Olaf{
  static List<String> BorNorM=["하향","상향","조정","하향","조정"];
  static List<String> patchVer=["13.7", "12.13","12.11","12.10","12.9"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[0], PatchNoteLink.link[16],PatchNoteLink.link[18], PatchNoteLink.link[19],PatchNoteLink.link[20]];
}

//오리아나
class PatchContent_Orianna{
  static List<String> BorNorM=["상향","상향","하향"];
  static List<String> patchVer=["13.4","13.1B","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[2],PatchNoteLink.link[4], PatchNoteLink.link[19]];
}

//오른
class PatchContent_Ornn{
  static List<String> BorNorM=["조정"];
  static List<String> patchVer=["12.21"];
  static List<String> patchNoteLink= [PatchNoteLink.link[8]];
}

//판테온
class PatchContent_Pantheon{
  static List<String> BorNorM=["조정","상향","상향"];
  static List<String> patchVer=["13.5","12.14","12.7"];
  static List<String> patchNoteLink= [PatchNoteLink.link[1],PatchNoteLink.link[15],PatchNoteLink.link[22]];
}

//뽀삐
class PatchContent_Poppy{
  static List<String> BorNorM=["하향","상향","상향"];
  static List<String> patchVer=["12.16","12.8","12.7"];
  static List<String> patchNoteLink= [PatchNoteLink.link[13],PatchNoteLink.link[21],PatchNoteLink.link[22]];
}

//파이크
class PatchContent_Pyke{
  static List<String> BorNorM=["상향","하향","조정"];
  static List<String> patchVer=["13.3","12.10","12.9"];
  static List<String> patchNoteLink= [PatchNoteLink.link[3], PatchNoteLink.link[19],PatchNoteLink.link[20]];
}

//키아나
class PatchContent_Qiyana{
  static List<String> BorNorM=["상향","하향","하향","하향"];
  static List<String> patchVer=["13.5","12.15","12.4","12.2"];
  static List<String> patchNoteLink= [PatchNoteLink.link[1],PatchNoteLink.link[14],PatchNoteLink.link[25],PatchNoteLink.link[27]];
}

//퀸
class PatchContent_Quinn{
  static List<String> BorNorM=["상향"];
  static List<String> patchVer=["12.3"];
  static List<String> patchNoteLink= [PatchNoteLink.link[26]];
}

//라칸
class PatchContent_Rakan{
  static List<String> BorNorM=["상향","조정", "상향","상향","하향"];
  static List<String> patchVer=["13.3","12.22", "12.19","12.11","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[3],PatchNoteLink.link[7],PatchNoteLink.link[10],PatchNoteLink.link[18]
  , PatchNoteLink.link[19]];
}

//람머스
class PatchContent_Rammus{
  static List<String> BorNorM=["하향", "하향","조정","상향","상향"];
  static List<String> patchVer=["13.7", "13.5","13.1","12.20","12.15"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[0],PatchNoteLink.link[1],PatchNoteLink.link[5],PatchNoteLink.link[9],PatchNoteLink.link[14]];
}

//렉사이
class PatchContent_RekSai{
  static List<String> BorNorM=["하향","하향"];
  static List<String> patchVer=["12.19","12.1"];
  static List<String> patchNoteLink= [PatchNoteLink.link[10],PatchNoteLink.link[28]];
}

//렐
class PatchContent_Rell{
  static List<String> BorNorM=["상향","하향"];
  static List<String> patchVer=["12.17","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[12], PatchNoteLink.link[19]];
}

//레나타
class PatchContent_Renata{
  static List<String> BorNorM=["하향","하향","하향"];
  static List<String> patchVer=["12.14","12.10","12.9"];
  static List<String> patchNoteLink= [PatchNoteLink.link[15], PatchNoteLink.link[19],PatchNoteLink.link[20]];
}

//레넥톤
class PatchContent_Renekton{
  static List<String> BorNorM=["하향","상향","조정","상향"];
  static List<String> patchVer=["12.17","12.13","12.10","12.9"];
  static List<String> patchNoteLink= [PatchNoteLink.link[12],PatchNoteLink.link[16], PatchNoteLink.link[19],PatchNoteLink.link[20]];
}

//랭가
class PatchContent_Rengar{
  static List<String> BorNorM=["하향","하향","조정","조정","조정"];
  static List<String> patchVer=["12.11","12.9","12.7","12.6","12.2"];
  static List<String> patchNoteLink= [PatchNoteLink.link[18],PatchNoteLink.link[20],PatchNoteLink.link[22],PatchNoteLink.link[23]
  ,PatchNoteLink.link[27]];
}

//리븐
class PatchContent_Riven{
  static List<String> BorNorM=["상향","하향"];
  static List<String> patchVer=["13.4","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[2], PatchNoteLink.link[19]];
}

//럼블
class PatchContent_Rumble{
  static List<String> BorNorM=["상향","하향","상향"];
  static List<String> patchVer=["13.5",'12.10',"12.4"];
  static List<String> patchNoteLink= [PatchNoteLink.link[1], PatchNoteLink.link[19],PatchNoteLink.link[25]];
}

//라이즈
class PatchContent_Ryze{
  static List<String> BorNorM=["하향","상향","상향","하향"];
  static List<String> patchVer=["13.1B","12.19","12.11","12.7"];
  static List<String> patchNoteLink= [PatchNoteLink.link[4],PatchNoteLink.link[10],PatchNoteLink.link[18],PatchNoteLink.link[22]];
}

//사미라
class PatchContent_Samira{
  static List<String> BorNorM=["상향","하향","상향","상향","상향"];
  static List<String> patchVer=["13.5","13.4","12.11","12.5","12.2"];
  static List<String> patchNoteLink= [PatchNoteLink.link[1],PatchNoteLink.link[2],PatchNoteLink.link[18],PatchNoteLink.link[24]
  ,PatchNoteLink.link[27]];
}

//세주아니
class PatchContent_Sejuani{
  static List<String> BorNorM=["하향", "상향"];
  static List<String> patchVer=["13.7", "12.8"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[0], PatchNoteLink.link[21]];
}

//세나
class PatchContent_Senna{
  static List<String> BorNorM=["상향","하향","하향","하향","상향"];
  static List<String> patchVer=["13.4","12.11","12.10","12.3","12.2"];
  static List<String> patchNoteLink= [PatchNoteLink.link[2],PatchNoteLink.link[18], PatchNoteLink.link[19],PatchNoteLink.link[26]
  ,PatchNoteLink.link[27]];
}

//세라핀
class PatchContent_Seraphine{
  static List<String> BorNorM=["하향","상향","하향","조정"];
  static List<String> patchVer=["12.14","12.12","12.10","12.5"];
  static List<String> patchNoteLink= [PatchNoteLink.link[15],PatchNoteLink.link[17], PatchNoteLink.link[19],PatchNoteLink.link[24]];
}

//세트
class PatchContent_Sett{
  static List<String> BorNorM=["하향","상향","상향"];
  static List<String> patchVer=["12.20","12.17","12.4"];
  static List<String> patchNoteLink= [PatchNoteLink.link[9],PatchNoteLink.link[12],PatchNoteLink.link[25]];
}

//샤코
class PatchContent_Shaco{
  static List<String> BorNorM=["상향","조정"];
  static List<String> patchVer=["13.1","12.12"];
  static List<String> patchNoteLink= [PatchNoteLink.link[5],PatchNoteLink.link[17]];
}

//쉔
class PatchContent_Shen{
  static List<String> BorNorM=["상향","하향","하향"];
  static List<String> patchVer=["12.15","12.10","12.2"];
  static List<String> patchNoteLink= [PatchNoteLink.link[14], PatchNoteLink.link[19],PatchNoteLink.link[27]];
}

//쉬바나
class PatchContent_Shyvana{
  static List<String> BorNorM=["하향","상향"];
  static List<String> patchVer=["12.23","12.19"];
  static List<String> patchNoteLink= [PatchNoteLink.link[6],PatchNoteLink.link[10]];
}

//신지드
class PatchContent_Singed{
  static List<String> BorNorM=["상향","하향","하향"];
  static List<String> patchVer=["12.15","12.12","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[14],PatchNoteLink.link[17], PatchNoteLink.link[19]];
}

//사이온
class PatchContent_Sion{
  static List<String> BorNorM=["상향","상향","하향","하향"];
  static List<String> patchVer=["13.1","12.23","12.10","12.9"];
  static List<String> patchNoteLink= [PatchNoteLink.link[5],PatchNoteLink.link[6], PatchNoteLink.link[19],PatchNoteLink.link[20]];
}

//시비르
class PatchContent_Sivir{
  static List<String> BorNorM=["하향","하향","하향","시비르"];
  static List<String> patchVer=["12.17","12.15","12.14","12.13"];
  static List<String> patchNoteLink= [PatchNoteLink.link[12],PatchNoteLink.link[14],PatchNoteLink.link[15],PatchNoteLink.link[16]];
}

//스카너
class PatchContent_Skarner{
  static List<String> BorNorM=["하향"];
  static List<String> patchVer=["12.10"];
  static List<String> patchNoteLink= [ PatchNoteLink.link[19]];
}

//소나
class PatchContent_Sona{
  static List<String> BorNorM=["상향","하향","하향"];
  static List<String> patchVer=["12.19","12.10","12.1"];
  static List<String> patchNoteLink= [PatchNoteLink.link[10], PatchNoteLink.link[19],PatchNoteLink.link[28]];
}

//소라카
class PatchContent_Soraka{
  static List<String> BorNorM=["조정","하향","하향"];
  static List<String> patchVer=["12.12","12.10","12.8"];
  static List<String> patchNoteLink= [PatchNoteLink.link[17], PatchNoteLink.link[19],PatchNoteLink.link[21]];
}

//스웨인
class PatchContent_Swain{
  static List<String> BorNorM=["하향","하향","조정"];
  static List<String> patchVer=["12.11","12.10","12.8"];
  static List<String> patchNoteLink= [PatchNoteLink.link[18], PatchNoteLink.link[19],PatchNoteLink.link[21]];
}

//사일러스
class PatchContent_Sylas{
  static List<String> BorNorM=["하향","상향","하향","상향"];
  static List<String> patchVer=["12.17","12.11","12.10","12.8"];
  static List<String> patchNoteLink= [PatchNoteLink.link[12],PatchNoteLink.link[18], PatchNoteLink.link[19],PatchNoteLink.link[21]];
}

//신드라
class PatchContent_Syndra{
  static List<String> BorNorM=["하향","조정"];
  static List<String> patchVer=["12.23","12.19"];
  static List<String> patchNoteLink= [PatchNoteLink.link[6],PatchNoteLink.link[10]];
}

//탐켄치
class PatchContent_TahmKench{
  static List<String> BorNorM=["상향","상향","상향","하향","조정"];
  static List<String> patchVer=["12.23","12.19","12.11","12.10","12.2"];
  static List<String> patchNoteLink= [PatchNoteLink.link[6],PatchNoteLink.link[10],PatchNoteLink.link[18], PatchNoteLink.link[19]
  ,PatchNoteLink.link[27]];
}

//탈리야
class PatchContent_Taliyah{
  static List<String> BorNorM=["하향","상향","하향","하향","조정"];
  static List<String> patchVer=["12.15","12.13","12.11","12.10","12.0"];
  static List<String> patchNoteLink= [PatchNoteLink.link[14],PatchNoteLink.link[16],PatchNoteLink.link[18], PatchNoteLink.link[19]
  ,PatchNoteLink.link[20]];
}

//탈론
class PatchContent_Talon{
  static List<String> BorNorM=["하향","하향","하향"];
  static List<String> patchVer=["13.6","12.10","12.2"];
  static List<String> patchNoteLink= [PatchNoteLink.link[0], PatchNoteLink.link[19],PatchNoteLink.link[27]];
}

//타릭
class PatchContent_Taric{
  static List<String> BorNorM=["하향","상향","하향"];
  static List<String> patchVer=["12.17","12.11","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[12],PatchNoteLink.link[18], PatchNoteLink.link[19]];
}

//티모
class PatchContent_Teemo{
  static List<String> BorNorM=["상향"];
  static List<String> patchVer=["12.14"];
  static List<String> patchNoteLink= [PatchNoteLink.link[15]];
}

//쓰레쉬
class PatchContent_Thresh{
  static List<String> BorNorM=["조정", "조정","상향","상향","상향","조정","상향"];
  static List<String> patchVer=["13.7", "13.4","13.3","12.18","12.15","12.10","12.9"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[0], PatchNoteLink.link[2],PatchNoteLink.link[3],PatchNoteLink.link[11],PatchNoteLink.link[14]
  , PatchNoteLink.link[19],PatchNoteLink.link[20]];
}

//트리스타나
class PatchContent_Tristana{
  static List<String> BorNorM=["상향","상향","상향"];
  static List<String> patchVer=["12.16","12.8","12.2"];
  static List<String> patchNoteLink= [PatchNoteLink.link[13],PatchNoteLink.link[21], PatchNoteLink.link[27]];
}

//트런들
class PatchContent_Trundle{
  static List<String> BorNorM=["상향","하향","하향","하향"];
  static List<String> patchVer=["13.3","12.23","12.17","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[3],PatchNoteLink.link[6],PatchNoteLink.link[12], PatchNoteLink.link[19]];
}

//트린다미어
class PatchContent_Tryndamere{
  static List<String> BorNorM=["상향","상향","하향","하향"];
  static List<String> patchVer=["13.5","12.11","12.10","12.6"];
  static List<String> patchNoteLink= [PatchNoteLink.link[1],PatchNoteLink.link[18], PatchNoteLink.link[19],PatchNoteLink.link[23]];
}

//트위스티드페이트
class PatchContent_TwistedFate{
  static List<String> BorNorM=["상향","상향","하향"];
  static List<String> patchVer=["13.1","12.17","12.3"];
  static List<String> patchNoteLink= [PatchNoteLink.link[5],PatchNoteLink.link[12],PatchNoteLink.link[26]];
}

//트위치
class PatchContent_Twitch{
  static List<String> BorNorM=["하향","상향"];
  static List<String> patchVer=["13.5","12.19"];
  static List<String> patchNoteLink= [PatchNoteLink.link[1],PatchNoteLink.link[10]];
}

//우디르
class PatchContent_Udyr{
  static List<String> BorNorM=["하향", "하향","상향","조정","하향"];
  static List<String> patchVer=["13.4","13.1B","12.19","12.18","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[2],PatchNoteLink.link[4],PatchNoteLink.link[10],PatchNoteLink.link[11]
  , PatchNoteLink.link[19]];
}

//우르곳
class PatchContent_Urgot{
  static List<String> BorNorM=["하향"];
  static List<String> patchVer=["12.10"];
  static List<String> patchNoteLink= [ PatchNoteLink.link[19]];
}

//바루스
class PatchContent_Varus{
  static List<String> BorNorM=["상향","하향","상향"];
  static List<String> patchVer=["12.14","12.10","12.9"];
  static List<String> patchNoteLink= [PatchNoteLink.link[15], PatchNoteLink.link[19],PatchNoteLink.link[20]];
}

//베인
class PatchContent_Vayne{
  static List<String> BorNorM=["하향","하향"];
  static List<String> patchVer=["13.6","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[0], PatchNoteLink.link[19]];
}

//베이가
class PatchContent_Veigar{
  static List<String> BorNorM=["하향", "하향", "상향","하향","하향","상향"];
  static List<String> patchVer=["13.7", "13.6","13.4","12.11","12.4","12.2"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[0], PatchNoteLink.link[0],PatchNoteLink.link[2],PatchNoteLink.link[18],PatchNoteLink.link[25]
  ,PatchNoteLink.link[27]];
}

//벨코즈
class PatchContent_Velkoz{
  static List<String> BorNorM=["상향"];
  static List<String> patchVer=["12.8"];
  static List<String> patchNoteLink= [PatchNoteLink.link[21]];
}

//백스
class PatchContent_Vex{
  static List<String> BorNorM=["상향","하향"];
  static List<String> patchVer=["12.13","12.1-"];
  static List<String> patchNoteLink= [PatchNoteLink.link[16], PatchNoteLink.link[19]];
}

//바이
class PatchContent_Vi{
  static List<String> BorNorM=["하향", "하향"];
  static List<String> patchVer=["13.7", "12.10"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[0], PatchNoteLink.link[19]];
}

//비에고
class PatchContent_Viego{
  static List<String> BorNorM=["상향","하향","하향"];
  static List<String> patchVer=["13.4","12.12","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[2],PatchNoteLink.link[17], PatchNoteLink.link[19]];
}

//빅토르
class PatchContent_Viktor{
  static List<String> BorNorM=["하향"];
  static List<String> patchVer=["12.10"];
  static List<String> patchNoteLink= [ PatchNoteLink.link[19]];
}

//블라디미르
class PatchContent_Vladimir{
  static List<String> BorNorM=["하향","상향"];
  static List<String> patchVer=["12.10","12.8"];
  static List<String> patchNoteLink= [ PatchNoteLink.link[19],PatchNoteLink.link[21]];
}

//볼리베어
class PatchContent_Volibear{
  static List<String> BorNorM=["하향","하향","상향"];
  static List<String> patchVer=["12.13","12.10","12.2"];
  static List<String> patchNoteLink= [PatchNoteLink.link[16], PatchNoteLink.link[19],PatchNoteLink.link[27]];
}

//워윅
class PatchContent_Warwick{
  static List<String> BorNorM=["하향"];
  static List<String> patchVer=["12.10"];
  static List<String> patchNoteLink= [ PatchNoteLink.link[19]];
}

//자야
class PatchContent_Xayah{
  static List<String> BorNorM=["하향","상향","하향","상향"];
  static List<String> patchVer=["13.5","13.1","12.8","12.4"];
  static List<String> patchNoteLink= [PatchNoteLink.link[1],PatchNoteLink.link[5],PatchNoteLink.link[21],PatchNoteLink.link[25]];
}

//제라스
class PatchContent_Xerath{
  static List<String> BorNorM=["상향"];
  static List<String> patchVer=["12.8"];
  static List<String> patchNoteLink= [PatchNoteLink.link[21]];
}

//신짜오
class PatchContent_XinZhao{
  static List<String> BorNorM=["상향","상향","하향","하향"];
  static List<String> patchVer=["12.21","12.11","12.10","12.5"];
  static List<String> patchNoteLink= [PatchNoteLink.link[8],PatchNoteLink.link[18], PatchNoteLink.link[19],PatchNoteLink.link[24]];
}

//야스오
class PatchContent_Yasuo{
  static List<String> BorNorM=["상향", "하향","상향","상향"];
  static List<String> patchVer=["13.7", "12.10","12.7","12.2"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[0], PatchNoteLink.link[19],PatchNoteLink.link[22],PatchNoteLink.link[27]];
}

//요네
class PatchContent_Yone{
  static List<String> BorNorM=["하향","상향"];
  static List<String> patchVer=["12.10","12.2"];
  static List<String> patchNoteLink= [ PatchNoteLink.link[19],PatchNoteLink.link[27]];
}

//요릭
class PatchContent_Yorick{
  static List<String> BorNorM=["하향","상향","하향"];
  static List<String> patchVer=["13.5","12.12","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[1],PatchNoteLink.link[17], PatchNoteLink.link[19]];
}

//유미
class PatchContent_Yuumi{
  static List<String> BorNorM=["하향", "조정", "하향","하향","하향","하향","하향", "조정", "조정"];
  static List<String> patchVer=["13.6","13.5","13.1B","13.1","12.23","12.16","12.14","12.12","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[0],PatchNoteLink.link[1],PatchNoteLink.link[4],PatchNoteLink.link[5]
  , PatchNoteLink.link[6],PatchNoteLink.link[13],PatchNoteLink.link[15],PatchNoteLink.link[17], PatchNoteLink.link[19]];
}

//자크
class PatchContent_Zac{
  static List<String> BorNorM=["하향","상향","하향"];
  static List<String> patchVer=["13.3","12.23","12.10"];
  static List<String> patchNoteLink= [PatchNoteLink.link[3],PatchNoteLink.link[6], PatchNoteLink.link[19]];
}

//제드
class PatchContent_Zed{
  static List<String> BorNorM=["조정","상향","하향"];
  static List<String> patchVer=["13.5","12.15","12.2"];
  static List<String> patchNoteLink= [PatchNoteLink.link[1],PatchNoteLink.link[14],PatchNoteLink.link[27]];
}

//제리
class PatchContent_Zeri{
  static List<String> BorNorM=["하향", "하향","상향","하향","하향","하향","조정","하향","하향","하향"];
  static List<String> patchVer=["13.7", "13.1","12.23","12.16","12.14","12.12","12.11","12.7","12.4","12.3"];
  static List<String> patchNoteLink= [PatchNoteLinkPlus.link[0], PatchNoteLink.link[5],PatchNoteLink.link[6],PatchNoteLink.link[13],PatchNoteLink.link[15]
  ,PatchNoteLink.link[17],PatchNoteLink.link[18],PatchNoteLink.link[22],PatchNoteLink.link[25],PatchNoteLink.link[26]];
}

//직스
class PatchContent_Ziggs{
  static List<String> BorNorM=["상향"];
  static List<String> patchVer=["12.20"];
  static List<String> patchNoteLink= [PatchNoteLink.link[9]];
}

//질리언
class PatchContent_Zilean{
  static List<String> BorNorM=[];
  static List<String> patchVer=[];
  static List<String> patchNoteLink= [];
}

//조이
class PatchContent_Zoe{
  static List<String> BorNorM=["상향","상향","상향"];
  static List<String> patchVer=["13.1B","12.16","12.8"];
  static List<String> patchNoteLink= [PatchNoteLink.link[4],PatchNoteLink.link[13],PatchNoteLink.link[21]];
}

//자이라
class PatchContent_Zyra{
  static List<String> BorNorM=[];
  static List<String> patchVer=[];
  static List<String> patchNoteLink= [];
}


//SharePreferences용 클래스
class IsFavorite_SharedPreferencess extends ChangeNotifier {
  // SharedPreferences 인스턴스
  SharedPreferences prefs;

  // 생성자(Constructor)
  IsFavorite_SharedPreferencess(this.prefs) {
    for(int i = 0; i<ChampionNameEn.length;i++) IsFavoriteInClass[i] = prefs.getBool(ChampionNameEn[i]) ?? false;
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
    false,false,false,false,false,false,
    
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,
    false,false,false,false,false,false,  
    false
  ];
}