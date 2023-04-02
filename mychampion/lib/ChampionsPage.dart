import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mychampion/OneChampionPageForm/Aatrox.dart';
import 'package:mychampion/OneChampionPageForm/Ahri.dart';
import 'package:mychampion/OneChampionPageForm/Akali.dart';
import 'package:mychampion/OneChampionPageForm/Akshan.dart';
import 'package:mychampion/OneChampionPageForm/Alistar.dart';
import 'package:mychampion/OneChampionPageForm/Amumu.dart';
import 'package:mychampion/OneChampionPageForm/Anivia.dart';
import 'package:mychampion/OneChampionPageForm/Annie.dart';
import 'package:mychampion/OneChampionPageForm/Aphelios.dart';
import 'package:mychampion/OneChampionPageForm/Ashe.dart';
import 'package:mychampion/OneChampionPageForm/AurelionSol.dart';
import 'package:mychampion/OneChampionPageForm/Azir.dart';
import 'package:mychampion/OneChampionPageForm/Bard.dart';
import 'package:mychampion/OneChampionPageForm/Belveth.dart';
import 'package:mychampion/OneChampionPageForm/Blitzcrank.dart';
import 'package:mychampion/OneChampionPageForm/Brand.dart';
import 'package:mychampion/OneChampionPageForm/Braum.dart';
import 'package:mychampion/OneChampionPageForm/Caitlyn.dart';
import 'package:mychampion/OneChampionPageForm/Camille.dart';
import 'package:mychampion/OneChampionPageForm/Cassiopeia.dart';
import 'package:mychampion/OneChampionPageForm/Chogath.dart';
import 'package:mychampion/OneChampionPageForm/Corki.dart';
import 'package:mychampion/OneChampionPageForm/Darius.dart';
import 'package:mychampion/OneChampionPageForm/Diana.dart';
import 'package:mychampion/OneChampionPageForm/DrMundo.dart';
import 'package:mychampion/OneChampionPageForm/Draven.dart';
import 'package:mychampion/OneChampionPageForm/Ekko.dart';
import 'package:mychampion/OneChampionPageForm/Elise.dart';
import 'package:mychampion/OneChampionPageForm/Evelynn.dart';
import 'package:mychampion/OneChampionPageForm/Ezreal.dart';
import 'package:mychampion/OneChampionPageForm/Fiddlesticks.dart';
import 'package:mychampion/OneChampionPageForm/Fiora.dart';
import 'package:mychampion/OneChampionPageForm/Fizz.dart';
import 'package:mychampion/OneChampionPageForm/Gangplank.dart';
import 'package:mychampion/OneChampionPageForm/Gnar.dart';
import 'package:mychampion/OneChampionPageForm/Gragas.dart';
import 'package:mychampion/OneChampionPageForm/Graves.dart';
import 'package:mychampion/OneChampionPageForm/Gwen.dart';
import 'package:mychampion/OneChampionPageForm/Hecarim.dart';
import 'package:mychampion/OneChampionPageForm/Heimerdinger.dart';
import 'package:mychampion/OneChampionPageForm/Illaoi.dart';
import 'package:mychampion/OneChampionPageForm/Irelia.dart';
import 'package:mychampion/OneChampionPageForm/Ivern.dart';
import 'package:mychampion/OneChampionPageForm/Janna.dart';
import 'package:mychampion/OneChampionPageForm/JarvanIV.dart';
import 'package:mychampion/OneChampionPageForm/Jax.dart';
import 'package:mychampion/OneChampionPageForm/Jayce.dart';
import 'package:mychampion/OneChampionPageForm/Jhin.dart';
import 'package:mychampion/OneChampionPageForm/Jinx.dart';
import 'package:mychampion/OneChampionPageForm/KSante.dart';
import 'package:mychampion/OneChampionPageForm/Kaisa.dart';
import 'package:mychampion/OneChampionPageForm/Kalista.dart';
import 'package:mychampion/OneChampionPageForm/Karma.dart';
import 'package:mychampion/OneChampionPageForm/Karthus.dart';
import 'package:mychampion/OneChampionPageForm/Kassadin.dart';
import 'package:mychampion/OneChampionPageForm/Katarina.dart';
import 'package:mychampion/OneChampionPageForm/Kayle.dart';
import 'package:mychampion/OneChampionPageForm/Kayn.dart';
import 'package:mychampion/OneChampionPageForm/Kennen.dart';
import 'package:mychampion/OneChampionPageForm/Khazix.dart';
import 'package:mychampion/OneChampionPageForm/Kindred.dart';
import 'package:mychampion/OneChampionPageForm/Kled.dart';
import 'package:mychampion/OneChampionPageForm/KogMaw.dart';
import 'package:mychampion/OneChampionPageForm/Leblanc.dart';
import 'package:mychampion/OneChampionPageForm/LeeSin.dart';
import 'package:mychampion/OneChampionPageForm/Leona.dart';
import 'package:mychampion/OneChampionPageForm/Lillia.dart';
import 'package:mychampion/OneChampionPageForm/Lissandra.dart';
import 'package:mychampion/OneChampionPageForm/Lucian.dart';
import 'package:mychampion/OneChampionPageForm/Lulu.dart';
import 'package:mychampion/OneChampionPageForm/Lux.dart';
import 'package:mychampion/OneChampionPageForm/Malphite.dart';
import 'package:mychampion/OneChampionPageForm/Malzahar.dart';
import 'package:mychampion/OneChampionPageForm/Maokai.dart';
import 'package:mychampion/OneChampionPageForm/MasterYi.dart';
import 'package:mychampion/OneChampionPageForm/Milio.dart';
import 'package:mychampion/OneChampionPageForm/MissFortune.dart';
import 'package:mychampion/OneChampionPageForm/MonkeyKing.dart';
import 'package:mychampion/OneChampionPageForm/Mordekaiser.dart';
import 'package:mychampion/OneChampionPageForm/Morgana.dart';
import 'package:mychampion/OneChampionPageForm/Nami.dart';
import 'package:mychampion/OneChampionPageForm/Nasus.dart';
import 'package:mychampion/OneChampionPageForm/Nautilus.dart';
import 'package:mychampion/OneChampionPageForm/Neeko.dart';
import 'package:mychampion/OneChampionPageForm/Nidalee.dart';
import 'package:mychampion/OneChampionPageForm/Nilah.dart';
import 'package:mychampion/OneChampionPageForm/Nocturne.dart';
import 'package:mychampion/OneChampionPageForm/Nunu.dart';
import 'package:mychampion/OneChampionPageForm/Olaf.dart';
import 'package:mychampion/OneChampionPageForm/Orianna.dart';
import 'package:mychampion/OneChampionPageForm/Ornn.dart';
import 'package:mychampion/OneChampionPageForm/Pantheon.dart';
import 'package:mychampion/OneChampionPageForm/Poppy.dart';
import 'package:mychampion/OneChampionPageForm/Pyke.dart';
import 'package:mychampion/OneChampionPageForm/Qiyana.dart';
import 'package:mychampion/OneChampionPageForm/Quinn.dart';
import 'package:mychampion/OneChampionPageForm/Rakan.dart';
import 'package:mychampion/OneChampionPageForm/Rammus.dart';
import 'package:mychampion/OneChampionPageForm/RekSai.dart';
import 'package:mychampion/OneChampionPageForm/Rell.dart';
import 'package:mychampion/OneChampionPageForm/Renata.dart';
import 'package:mychampion/OneChampionPageForm/Renekton.dart';
import 'package:mychampion/OneChampionPageForm/Rengar.dart';
import 'package:mychampion/OneChampionPageForm/Riven.dart';
import 'package:mychampion/OneChampionPageForm/Rumble.dart';
import 'package:mychampion/OneChampionPageForm/Ryze.dart';
import 'package:mychampion/OneChampionPageForm/Samira.dart';
import 'package:mychampion/OneChampionPageForm/Sejuani.dart';
import 'package:mychampion/OneChampionPageForm/Senna.dart';
import 'package:mychampion/OneChampionPageForm/Seraphine.dart';
import 'package:mychampion/OneChampionPageForm/Sett.dart';
import 'package:mychampion/OneChampionPageForm/Shaco.dart';
import 'package:mychampion/OneChampionPageForm/Shen.dart';
import 'package:mychampion/OneChampionPageForm/Shyvana.dart';
import 'package:mychampion/OneChampionPageForm/Singed.dart';
import 'package:mychampion/OneChampionPageForm/Sion.dart';
import 'package:mychampion/OneChampionPageForm/Sivir.dart';
import 'package:mychampion/OneChampionPageForm/Skarner.dart';
import 'package:mychampion/OneChampionPageForm/Sona.dart';
import 'package:mychampion/OneChampionPageForm/Soraka.dart';
import 'package:mychampion/OneChampionPageForm/Swain.dart';
import 'package:mychampion/OneChampionPageForm/Sylas.dart';
import 'package:mychampion/OneChampionPageForm/Syndra.dart';
import 'package:mychampion/OneChampionPageForm/TahmKench.dart';
import 'package:mychampion/OneChampionPageForm/Taliyah.dart';
import 'package:mychampion/OneChampionPageForm/Talon.dart';
import 'package:mychampion/OneChampionPageForm/Taric.dart';
import 'package:mychampion/OneChampionPageForm/Teemo.dart';
import 'package:mychampion/OneChampionPageForm/Thresh.dart';
import 'package:mychampion/OneChampionPageForm/Tristana.dart';
import 'package:mychampion/OneChampionPageForm/Trundle.dart';
import 'package:mychampion/OneChampionPageForm/Tryndamere.dart';
import 'package:mychampion/OneChampionPageForm/TwistedFate.dart';
import 'package:mychampion/OneChampionPageForm/Twitch.dart';
import 'package:mychampion/OneChampionPageForm/Udyr.dart';
import 'package:mychampion/OneChampionPageForm/Urgot.dart';
import 'package:mychampion/OneChampionPageForm/Varus.dart';
import 'package:mychampion/OneChampionPageForm/Vayne.dart';
import 'package:mychampion/OneChampionPageForm/Veigar.dart';
import 'package:mychampion/OneChampionPageForm/Velkoz.dart';
import 'package:mychampion/OneChampionPageForm/Vex.dart';
import 'package:mychampion/OneChampionPageForm/Vi.dart';
import 'package:mychampion/OneChampionPageForm/Viego.dart';
import 'package:mychampion/OneChampionPageForm/Viktor.dart';
import 'package:mychampion/OneChampionPageForm/Vladimir.dart';
import 'package:mychampion/OneChampionPageForm/Volibear.dart';
import 'package:mychampion/OneChampionPageForm/Warwick.dart';
import 'package:mychampion/OneChampionPageForm/Xayah.dart';
import 'package:mychampion/OneChampionPageForm/Xerath.dart';
import 'package:mychampion/OneChampionPageForm/XinZhao.dart';
import 'package:mychampion/OneChampionPageForm/Yasuo.dart';
import 'package:mychampion/OneChampionPageForm/Yone.dart';
import 'package:mychampion/OneChampionPageForm/Yorick.dart';
import 'package:mychampion/OneChampionPageForm/Yuumi.dart';
import 'package:mychampion/OneChampionPageForm/Zac.dart';
import 'package:mychampion/OneChampionPageForm/Zed.dart';
import 'package:mychampion/OneChampionPageForm/Zeri.dart';
import 'package:mychampion/OneChampionPageForm/Ziggs.dart';
import 'package:mychampion/OneChampionPageForm/Zilean.dart';
import 'package:mychampion/OneChampionPageForm/Zoe.dart';
import 'package:mychampion/OneChampionPageForm/Zyra.dart';
import 'package:provider/provider.dart';

import 'ChampionData/Data.dart';
import 'OneChampionPageForm/Galio.dart';
import 'OneChampionPageForm/Garen.dart';

late List<int> IsFavoriteNo;

class ChampionsPage extends StatefulWidget {
  const ChampionsPage({Key? key}) : super(key: key);

  @override
  State<ChampionsPage> createState() => _ChampionsPageState();
}

class _ChampionsPageState extends State<ChampionsPage> {
  void MoveOneChamp(BuildContext context, int index) {
    switch (index)
    {
      case 0: Navigator.push(context, MaterialPageRoute(builder: (context) => Garen(ChampIndex: index))).then((value){setState(() {});}); break;
      case 1: Navigator.push(context, MaterialPageRoute(builder: (context) => Galio(ChampIndex: index))).then((value){setState(() {});}); break;
      case 2: Navigator.push(context, MaterialPageRoute(builder: (context) => Gangplank(ChampIndex: index))).then((value){setState(() {});}); break;
      case 3: Navigator.push(context, MaterialPageRoute(builder: (context) => Gragas(ChampIndex: index))).then((value){setState(() {});}); break;
      case 4: Navigator.push(context, MaterialPageRoute(builder: (context) => Graves(ChampIndex: index))).then((value){setState(() {});}); break;
      case 5: Navigator.push(context, MaterialPageRoute(builder: (context) => Gwen(ChampIndex: index))).then((value){setState(() {});}); break;
      case 6: Navigator.push(context, MaterialPageRoute(builder: (context) => Gnar(ChampIndex: index))).then((value){setState(() {});}); break;
      case 7: Navigator.push(context, MaterialPageRoute(builder: (context) => Nami(ChampIndex: index))).then((value){setState(() {});}); break;
      case 8: Navigator.push(context, MaterialPageRoute(builder: (context) => Nasus(ChampIndex: index))).then((value){setState(() {});}); break;
      case 9: Navigator.push(context, MaterialPageRoute(builder: (context) => Nautilus(ChampIndex: index))).then((value){setState(() {});}); break;
      case 10: Navigator.push(context, MaterialPageRoute(builder: (context) => Nocturne(ChampIndex: index))).then((value){setState(() {});}); break;
      case 11: Navigator.push(context, MaterialPageRoute(builder: (context) => Nunu(ChampIndex: index))).then((value){setState(() {});}); break;
      case 12: Navigator.push(context, MaterialPageRoute(builder: (context) => Nidalee(ChampIndex: index))).then((value){setState(() {});}); break;
      case 13: Navigator.push(context, MaterialPageRoute(builder: (context) => Neeko(ChampIndex: index))).then((value){setState(() {});}); break;
      case 14: Navigator.push(context, MaterialPageRoute(builder: (context) => Nilah(ChampIndex: index))).then((value){setState(() {});}); break;
      case 15: Navigator.push(context, MaterialPageRoute(builder: (context) => Darius(ChampIndex: index))).then((value){setState(() {});}); break;
      case 16: Navigator.push(context, MaterialPageRoute(builder: (context) => Diana(ChampIndex: index))).then((value){setState(() {});}); break;
      case 17: Navigator.push(context, MaterialPageRoute(builder: (context) => Draven(ChampIndex: index))).then((value){setState(() {});}); break;
      case 18: Navigator.push(context, MaterialPageRoute(builder: (context) => Ryze(ChampIndex: index))).then((value){setState(() {});}); break;
      case 19: Navigator.push(context, MaterialPageRoute(builder: (context) => Rakan(ChampIndex: index))).then((value){setState(() {});}); break;
      case 20: Navigator.push(context, MaterialPageRoute(builder: (context) => Rammus(ChampIndex: index))).then((value){setState(() {});}); break;
      case 21: Navigator.push(context, MaterialPageRoute(builder: (context) => Rengar(ChampIndex: index))).then((value){setState(() {});}); break;
      case 22: Navigator.push(context, MaterialPageRoute(builder: (context) => Lux(ChampIndex: index))).then((value){setState(() {});}); break;
      case 23: Navigator.push(context, MaterialPageRoute(builder: (context) => Rumble(ChampIndex: index))).then((value){setState(() {});}); break;
      case 24: Navigator.push(context, MaterialPageRoute(builder: (context) => Renata(ChampIndex: index))).then((value){setState(() {});}); break;
      case 25: Navigator.push(context, MaterialPageRoute(builder: (context) => Renekton(ChampIndex: index))).then((value){setState(() {});}); break;
      case 26: Navigator.push(context, MaterialPageRoute(builder: (context) => Leona(ChampIndex: index))).then((value){setState(() {});}); break;
      case 27: Navigator.push(context, MaterialPageRoute(builder: (context) => RekSai(ChampIndex: index))).then((value){setState(() {});}); break;
      case 28: Navigator.push(context, MaterialPageRoute(builder: (context) => Rell(ChampIndex: index))).then((value){setState(() {});}); break;
      case 29: Navigator.push(context, MaterialPageRoute(builder: (context) => Lucian(ChampIndex: index))).then((value){setState(() {});}); break;
      case 30: Navigator.push(context, MaterialPageRoute(builder: (context) => Lulu(ChampIndex: index))).then((value){setState(() {});}); break;
      case 31: Navigator.push(context, MaterialPageRoute(builder: (context) => Leblanc(ChampIndex: index))).then((value){setState(() {});}); break;
      case 32: Navigator.push(context, MaterialPageRoute(builder: (context) => Riven(ChampIndex: index))).then((value){setState(() {});}); break;
      case 33: Navigator.push(context, MaterialPageRoute(builder: (context) => Lissandra(ChampIndex: index))).then((value){setState(() {});}); break;
      case 34: Navigator.push(context, MaterialPageRoute(builder: (context) => LeeSin(ChampIndex: index))).then((value){setState(() {});}); break;
      case 35: Navigator.push(context, MaterialPageRoute(builder: (context) => Lillia(ChampIndex: index))).then((value){setState(() {});}); break;
      case 36: Navigator.push(context, MaterialPageRoute(builder: (context) => MasterYi(ChampIndex: index))).then((value){setState(() {});}); break;
      case 37: Navigator.push(context, MaterialPageRoute(builder: (context) => Maokai(ChampIndex: index))).then((value){setState(() {});}); break;
      case 38: Navigator.push(context, MaterialPageRoute(builder: (context) => Malzahar(ChampIndex: index))).then((value){setState(() {});}); break;
      case 39: Navigator.push(context, MaterialPageRoute(builder: (context) => Malphite(ChampIndex: index))).then((value){setState(() {});}); break;
      case 40: Navigator.push(context, MaterialPageRoute(builder: (context) => Mordekaiser(ChampIndex: index))).then((value){setState(() {});}); break;
      case 41: Navigator.push(context, MaterialPageRoute(builder: (context) => Morgana(ChampIndex: index))).then((value){setState(() {});}); break;
      case 42: Navigator.push(context, MaterialPageRoute(builder: (context) => DrMundo(ChampIndex: index))).then((value){setState(() {});}); break;
      case 43: Navigator.push(context, MaterialPageRoute(builder: (context) => MissFortune(ChampIndex: index))).then((value){setState(() {});}); break;
      case 44: Navigator.push(context, MaterialPageRoute(builder: (context) => Milio(ChampIndex: index))).then((value){setState(() {});}); break;
      case 45: Navigator.push(context, MaterialPageRoute(builder: (context) => Bard(ChampIndex: index))).then((value){setState(() {});}); break;
      case 46: Navigator.push(context, MaterialPageRoute(builder: (context) => Varus(ChampIndex: index))).then((value){setState(() {});}); break;
      case 47: Navigator.push(context, MaterialPageRoute(builder: (context) => Vi(ChampIndex: index))).then((value){setState(() {});}); break;
      case 48: Navigator.push(context, MaterialPageRoute(builder: (context) => Veigar(ChampIndex: index))).then((value){setState(() {});}); break;
      case 49: Navigator.push(context, MaterialPageRoute(builder: (context) => Vayne(ChampIndex: index))).then((value){setState(() {});}); break;
      case 50: Navigator.push(context, MaterialPageRoute(builder: (context) => Vex(ChampIndex: index))).then((value){setState(() {});}); break;
      case 51: Navigator.push(context, MaterialPageRoute(builder: (context) => Belveth(ChampIndex: index))).then((value){setState(() {});}); break;
      case 52: Navigator.push(context, MaterialPageRoute(builder: (context) => Velkoz(ChampIndex: index))).then((value){setState(() {});}); break;
      case 53: Navigator.push(context, MaterialPageRoute(builder: (context) => Volibear(ChampIndex: index))).then((value){setState(() {});}); break;
      case 54: Navigator.push(context, MaterialPageRoute(builder: (context) => Braum(ChampIndex: index))).then((value){setState(() {});}); break;
      case 55: Navigator.push(context, MaterialPageRoute(builder: (context) => Brand(ChampIndex: index))).then((value){setState(() {});}); break;
      case 56: Navigator.push(context, MaterialPageRoute(builder: (context) => Vladimir(ChampIndex: index))).then((value){setState(() {});}); break;
      case 57: Navigator.push(context, MaterialPageRoute(builder: (context) => Blitzcrank(ChampIndex: index))).then((value){setState(() {});}); break;
      case 58: Navigator.push(context, MaterialPageRoute(builder: (context) => Viego(ChampIndex: index))).then((value){setState(() {});}); break;
      case 59: Navigator.push(context, MaterialPageRoute(builder: (context) => Viktor(ChampIndex: index))).then((value){setState(() {});}); break;
      case 60: Navigator.push(context, MaterialPageRoute(builder: (context) => Poppy(ChampIndex: index))).then((value){setState(() {});}); break;
      case 61: Navigator.push(context, MaterialPageRoute(builder: (context) => Samira(ChampIndex: index))).then((value){setState(() {});}); break;
      case 62: Navigator.push(context, MaterialPageRoute(builder: (context) => Sion(ChampIndex: index))).then((value){setState(() {});}); break;
      case 63: Navigator.push(context, MaterialPageRoute(builder: (context) => Sylas(ChampIndex: index))).then((value){setState(() {});}); break;
      case 64: Navigator.push(context, MaterialPageRoute(builder: (context) => Shaco(ChampIndex: index))).then((value){setState(() {});}); break;
      case 65: Navigator.push(context, MaterialPageRoute(builder: (context) => Senna(ChampIndex: index))).then((value){setState(() {});}); break;
      case 66: Navigator.push(context, MaterialPageRoute(builder: (context) => Seraphine(ChampIndex: index))).then((value){setState(() {});}); break;
      case 67: Navigator.push(context, MaterialPageRoute(builder: (context) => Sejuani(ChampIndex: index))).then((value){setState(() {});}); break;
      case 68: Navigator.push(context, MaterialPageRoute(builder: (context) => Sett(ChampIndex: index))).then((value){setState(() {});}); break;
      case 69: Navigator.push(context, MaterialPageRoute(builder: (context) => Sona(ChampIndex: index))).then((value){setState(() {});}); break;
      case 70: Navigator.push(context, MaterialPageRoute(builder: (context) => Soraka(ChampIndex: index))).then((value){setState(() {});}); break;
      case 71: Navigator.push(context, MaterialPageRoute(builder: (context) => Shen(ChampIndex: index))).then((value){setState(() {});}); break;
      case 72: Navigator.push(context, MaterialPageRoute(builder: (context) => Shyvana(ChampIndex: index))).then((value){setState(() {});}); break;
      case 73: Navigator.push(context, MaterialPageRoute(builder: (context) => Swain(ChampIndex: index))).then((value){setState(() {});}); break;
      case 74: Navigator.push(context, MaterialPageRoute(builder: (context) => Skarner(ChampIndex: index))).then((value){setState(() {});}); break;
      case 75: Navigator.push(context, MaterialPageRoute(builder: (context) => Sivir(ChampIndex: index))).then((value){setState(() {});}); break;
      case 76: Navigator.push(context, MaterialPageRoute(builder: (context) => Syndra(ChampIndex: index))).then((value){setState(() {});}); break;
      case 77: Navigator.push(context, MaterialPageRoute(builder: (context) => Singed(ChampIndex: index))).then((value){setState(() {});}); break;
      case 78: Navigator.push(context, MaterialPageRoute(builder: (context) => XinZhao(ChampIndex: index))).then((value){setState(() {});}); break;
      case 79: Navigator.push(context, MaterialPageRoute(builder: (context) => Thresh(ChampIndex: index))).then((value){setState(() {});}); break;
      case 80: Navigator.push(context, MaterialPageRoute(builder: (context) => Ahri(ChampIndex: index))).then((value){setState(() {});}); break;
      case 81: Navigator.push(context, MaterialPageRoute(builder: (context) => Amumu(ChampIndex: index))).then((value){setState(() {});}); break;
      case 82: Navigator.push(context, MaterialPageRoute(builder: (context) => AurelionSol(ChampIndex: index))).then((value){setState(() {});}); break;
      case 83: Navigator.push(context, MaterialPageRoute(builder: (context) => Ivern(ChampIndex: index))).then((value){setState(() {});}); break;
      case 84: Navigator.push(context, MaterialPageRoute(builder: (context) => Azir(ChampIndex: index))).then((value){setState(() {});}); break;
      case 85: Navigator.push(context, MaterialPageRoute(builder: (context) => Akali(ChampIndex: index))).then((value){setState(() {});}); break;
      case 86: Navigator.push(context, MaterialPageRoute(builder: (context) => Akshan(ChampIndex: index))).then((value){setState(() {});}); break;
      case 87: Navigator.push(context, MaterialPageRoute(builder: (context) => Aatrox(ChampIndex: index))).then((value){setState(() {});}); break;
      case 88: Navigator.push(context, MaterialPageRoute(builder: (context) => Aphelios(ChampIndex: index))).then((value){setState(() {});}); break;
      case 89: Navigator.push(context, MaterialPageRoute(builder: (context) => Alistar(ChampIndex: index))).then((value){setState(() {});}); break;
      case 90: Navigator.push(context, MaterialPageRoute(builder: (context) => Annie(ChampIndex: index))).then((value){setState(() {});}); break;
      case 91: Navigator.push(context, MaterialPageRoute(builder: (context) => Anivia(ChampIndex: index))).then((value){setState(() {});}); break;
      case 92: Navigator.push(context, MaterialPageRoute(builder: (context) => Ashe(ChampIndex: index))).then((value){setState(() {});}); break;
      case 93: Navigator.push(context, MaterialPageRoute(builder: (context) => Yasuo(ChampIndex: index))).then((value){setState(() {});}); break;
      case 94: Navigator.push(context, MaterialPageRoute(builder: (context) => Ekko(ChampIndex: index))).then((value){setState(() {});}); break;
      case 95: Navigator.push(context, MaterialPageRoute(builder: (context) => Elise(ChampIndex: index))).then((value){setState(() {});}); break;
      case 96: Navigator.push(context, MaterialPageRoute(builder: (context) => MonkeyKing(ChampIndex: index))).then((value){setState(() {});}); break;
      case 97: Navigator.push(context, MaterialPageRoute(builder: (context) => Ornn(ChampIndex: index))).then((value){setState(() {});}); break;
      case 98: Navigator.push(context, MaterialPageRoute(builder: (context) => Orianna(ChampIndex: index))).then((value){setState(() {});}); break;
      case 99: Navigator.push(context, MaterialPageRoute(builder: (context) => Yone(ChampIndex: index))).then((value){setState(() {});}); break;
      case 100: Navigator.push(context, MaterialPageRoute(builder: (context) => Yorick(ChampIndex: index))).then((value){setState(() {});}); break;
      case 101: Navigator.push(context, MaterialPageRoute(builder: (context) => Udyr(ChampIndex: index))).then((value){setState(() {});}); break;
      case 102: Navigator.push(context, MaterialPageRoute(builder: (context) => Urgot(ChampIndex: index))).then((value){setState(() {});}); break;
      case 103: Navigator.push(context, MaterialPageRoute(builder: (context) => Olaf(ChampIndex: index))).then((value){setState(() {});}); break;
      case 104: Navigator.push(context, MaterialPageRoute(builder: (context) => Warwick(ChampIndex: index))).then((value){setState(() {});}); break;
      case 105: Navigator.push(context, MaterialPageRoute(builder: (context) => Yuumi(ChampIndex: index))).then((value){setState(() {});}); break;
      case 106: Navigator.push(context, MaterialPageRoute(builder: (context) => Irelia(ChampIndex: index))).then((value){setState(() {});}); break;
      case 107: Navigator.push(context, MaterialPageRoute(builder: (context) => Evelynn(ChampIndex: index))).then((value){setState(() {});}); break;
      case 108: Navigator.push(context, MaterialPageRoute(builder: (context) => Ezreal(ChampIndex: index))).then((value){setState(() {});}); break;
      case 109: Navigator.push(context, MaterialPageRoute(builder: (context) => Illaoi(ChampIndex: index))).then((value){setState(() {});}); break;
      case 110: Navigator.push(context, MaterialPageRoute(builder: (context) => JarvanIV(ChampIndex: index))).then((value){setState(() {});}); break;
      case 111: Navigator.push(context, MaterialPageRoute(builder: (context) => Xayah(ChampIndex: index))).then((value){setState(() {});}); break;
      case 112: Navigator.push(context, MaterialPageRoute(builder: (context) => Zyra(ChampIndex: index))).then((value){setState(() {});}); break;
      case 113: Navigator.push(context, MaterialPageRoute(builder: (context) => Zac(ChampIndex: index))).then((value){setState(() {});}); break;
      case 114: Navigator.push(context, MaterialPageRoute(builder: (context) => Janna(ChampIndex: index))).then((value){setState(() {});}); break;
      case 115: Navigator.push(context, MaterialPageRoute(builder: (context) => Jax(ChampIndex: index))).then((value){setState(() {});}); break;
      case 116: Navigator.push(context, MaterialPageRoute(builder: (context) => Zed(ChampIndex: index))).then((value){setState(() {});}); break;
      case 117: Navigator.push(context, MaterialPageRoute(builder: (context) => Xerath(ChampIndex: index))).then((value){setState(() {});}); break;
      case 118: Navigator.push(context, MaterialPageRoute(builder: (context) => Zeri(ChampIndex: index))).then((value){setState(() {});}); break;
      case 119: Navigator.push(context, MaterialPageRoute(builder: (context) => Jayce(ChampIndex: index))).then((value){setState(() {});}); break;
      case 120: Navigator.push(context, MaterialPageRoute(builder: (context) => Zoe(ChampIndex: index))).then((value){setState(() {});}); break;
      case 121: Navigator.push(context, MaterialPageRoute(builder: (context) => Ziggs(ChampIndex: index))).then((value){setState(() {});}); break;
      case 122: Navigator.push(context, MaterialPageRoute(builder: (context) => Jhin(ChampIndex: index))).then((value){setState(() {});}); break;
      case 123: Navigator.push(context, MaterialPageRoute(builder: (context) => Zilean(ChampIndex: index))).then((value){setState(() {});}); break;
      case 124: Navigator.push(context, MaterialPageRoute(builder: (context) => Jinx(ChampIndex: index))).then((value){setState(() {});}); break;
      case 125: Navigator.push(context, MaterialPageRoute(builder: (context) => Chogath(ChampIndex: index))).then((value){setState(() {});}); break;
      case 126: Navigator.push(context, MaterialPageRoute(builder: (context) => Karma(ChampIndex: index))).then((value){setState(() {});}); break;
      case 127: Navigator.push(context, MaterialPageRoute(builder: (context) => Camille(ChampIndex: index))).then((value){setState(() {});}); break;
      case 128: Navigator.push(context, MaterialPageRoute(builder: (context) => Kassadin(ChampIndex: index))).then((value){setState(() {});}); break;
      case 129: Navigator.push(context, MaterialPageRoute(builder: (context) => Karthus(ChampIndex: index))).then((value){setState(() {});}); break;
      case 130: Navigator.push(context, MaterialPageRoute(builder: (context) => Cassiopeia(ChampIndex: index))).then((value){setState(() {});}); break;
      case 131: Navigator.push(context, MaterialPageRoute(builder: (context) => Kaisa(ChampIndex: index))).then((value){setState(() {});}); break;
      case 132: Navigator.push(context, MaterialPageRoute(builder: (context) => Khazix(ChampIndex: index))).then((value){setState(() {});}); break;
      case 133: Navigator.push(context, MaterialPageRoute(builder: (context) => Katarina(ChampIndex: index))).then((value){setState(() {});}); break;
      case 134: Navigator.push(context, MaterialPageRoute(builder: (context) => Kalista(ChampIndex: index))).then((value){setState(() {});}); break;
      case 135: Navigator.push(context, MaterialPageRoute(builder: (context) => Kennen(ChampIndex: index))).then((value){setState(() {});}); break;
      case 136: Navigator.push(context, MaterialPageRoute(builder: (context) => Caitlyn(ChampIndex: index))).then((value){setState(() {});}); break;
      case 137: Navigator.push(context, MaterialPageRoute(builder: (context) => Kayn(ChampIndex: index))).then((value){setState(() {});}); break;
      case 138: Navigator.push(context, MaterialPageRoute(builder: (context) => Kayle(ChampIndex: index))).then((value){setState(() {});}); break;
      case 139: Navigator.push(context, MaterialPageRoute(builder: (context) => KogMaw(ChampIndex: index))).then((value){setState(() {});}); break;      
      case 140: Navigator.push(context, MaterialPageRoute(builder: (context) => Corki(ChampIndex: index))).then((value){setState(() {});}); break;
      case 141: Navigator.push(context, MaterialPageRoute(builder: (context) => Quinn(ChampIndex: index))).then((value){setState(() {});}); break;
      case 142: Navigator.push(context, MaterialPageRoute(builder: (context) => KSante(ChampIndex: index))).then((value){setState(() {});}); break;
      case 143: Navigator.push(context, MaterialPageRoute(builder: (context) => Kled(ChampIndex: index))).then((value){setState(() {});}); break;
      case 144: Navigator.push(context, MaterialPageRoute(builder: (context) => Qiyana(ChampIndex: index))).then((value){setState(() {});}); break;
      case 145: Navigator.push(context, MaterialPageRoute(builder: (context) => Kindred(ChampIndex: index))).then((value){setState(() {});}); break;
      case 146: Navigator.push(context, MaterialPageRoute(builder: (context) => Taric(ChampIndex: index))).then((value){setState(() {});}); break;
      case 147: Navigator.push(context, MaterialPageRoute(builder: (context) => Talon(ChampIndex: index))).then((value){setState(() {});}); break;
      case 148: Navigator.push(context, MaterialPageRoute(builder: (context) => Taliyah(ChampIndex: index))).then((value){setState(() {});}); break;
      case 149: Navigator.push(context, MaterialPageRoute(builder: (context) => TahmKench(ChampIndex: index))).then((value){setState(() {});}); break;
      case 150: Navigator.push(context, MaterialPageRoute(builder: (context) => Trundle(ChampIndex: index))).then((value){setState(() {});}); break;
      case 151: Navigator.push(context, MaterialPageRoute(builder: (context) => Tristana(ChampIndex: index))).then((value){setState(() {});}); break;
      case 152: Navigator.push(context, MaterialPageRoute(builder: (context) => Tryndamere(ChampIndex: index))).then((value){setState(() {});}); break;
      case 153: Navigator.push(context, MaterialPageRoute(builder: (context) => TwistedFate(ChampIndex: index))).then((value){setState(() {});}); break;
      case 154: Navigator.push(context, MaterialPageRoute(builder: (context) => Twitch(ChampIndex: index))).then((value){setState(() {});}); break;
      case 155: Navigator.push(context, MaterialPageRoute(builder: (context) => Teemo(ChampIndex: index))).then((value){setState(() {});}); break;
      case 156: Navigator.push(context, MaterialPageRoute(builder: (context) => Pyke(ChampIndex: index))).then((value){setState(() {});}); break;
      case 157: Navigator.push(context, MaterialPageRoute(builder: (context) => Pantheon(ChampIndex: index))).then((value){setState(() {});}); break;
      case 158: Navigator.push(context, MaterialPageRoute(builder: (context) => Fiddlesticks(ChampIndex: index))).then((value){setState(() {});}); break;
      case 159: Navigator.push(context, MaterialPageRoute(builder: (context) => Fiora(ChampIndex: index))).then((value){setState(() {});}); break;
      case 160: Navigator.push(context, MaterialPageRoute(builder: (context) => Fizz(ChampIndex: index))).then((value){setState(() {});}); break;
      case 161: Navigator.push(context, MaterialPageRoute(builder: (context) => Heimerdinger(ChampIndex: index))).then((value){setState(() {});}); break;
      case 162: Navigator.push(context, MaterialPageRoute(builder: (context) => Hecarim(ChampIndex: index))).then((value){setState(() {});}); break;
    }
  }

  void InitChampImg() 
  {
    for (int i = 0; i < 163; i++) ChampionImgLink[i] = "assets/" + ChampionName[i] + ".webp";
  }

  Widget MakeCircleAvatar(BuildContext context, int index, double circleSize)
  {
    return GestureDetector(
      onTap: () {
        MoveOneChamp(context, index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: CircleAvatar(
          radius: circleSize,
          backgroundImage: ExactAssetImage(ChampionImgLink[index]),
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
                                MakeCircleAvatar_Favorite(context,0,30,IsFavorite[0]),
                                MakeCircleAvatar_Favorite(context,1,30,IsFavorite[1]),
                                MakeCircleAvatar_Favorite(context,2,30,IsFavorite[2]),
                                MakeCircleAvatar_Favorite(context,3,30,IsFavorite[3]),
                                MakeCircleAvatar_Favorite(context,4,30,IsFavorite[4]),
                                MakeCircleAvatar_Favorite(context,5,30,IsFavorite[5]),
                                MakeCircleAvatar_Favorite(context,6,30,IsFavorite[6]),
                                MakeCircleAvatar_Favorite(context,7,30,IsFavorite[7]),
                                MakeCircleAvatar_Favorite(context,8,30,IsFavorite[8]),
                                MakeCircleAvatar_Favorite(context,9,30,IsFavorite[9]),
                                MakeCircleAvatar_Favorite(context,10,30,IsFavorite[10]),
                                MakeCircleAvatar_Favorite(context,11,30,IsFavorite[11]),
                                MakeCircleAvatar_Favorite(context,12,30,IsFavorite[12]),
                                MakeCircleAvatar_Favorite(context,13,30,IsFavorite[13]),
                                MakeCircleAvatar_Favorite(context,14,30,IsFavorite[14]),
                                MakeCircleAvatar_Favorite(context,15,30,IsFavorite[15]),
                                MakeCircleAvatar_Favorite(context,16,30,IsFavorite[16]),
                                MakeCircleAvatar_Favorite(context,17,30,IsFavorite[17]),
                                MakeCircleAvatar_Favorite(context,18,30,IsFavorite[18]),
                                MakeCircleAvatar_Favorite(context,19,30,IsFavorite[19]),
                                MakeCircleAvatar_Favorite(context,20,30,IsFavorite[20]),
                                MakeCircleAvatar_Favorite(context,21,30,IsFavorite[21]),
                                MakeCircleAvatar_Favorite(context,22,30,IsFavorite[22]),
                                MakeCircleAvatar_Favorite(context,23,30,IsFavorite[23]),
                                MakeCircleAvatar_Favorite(context,24,30,IsFavorite[24]),
                                MakeCircleAvatar_Favorite(context,25,30,IsFavorite[25]),
                                MakeCircleAvatar_Favorite(context,26,30,IsFavorite[26]),
                                MakeCircleAvatar_Favorite(context,27,30,IsFavorite[27]),
                                MakeCircleAvatar_Favorite(context,28,30,IsFavorite[28]),
                                MakeCircleAvatar_Favorite(context,29,30,IsFavorite[29]),
                                MakeCircleAvatar_Favorite(context,30,30,IsFavorite[30]),
                                MakeCircleAvatar_Favorite(context,31,30,IsFavorite[31]),
                                MakeCircleAvatar_Favorite(context,32,30,IsFavorite[32]),
                                MakeCircleAvatar_Favorite(context,33,30,IsFavorite[33]),
                                MakeCircleAvatar_Favorite(context,34,30,IsFavorite[34]),
                                MakeCircleAvatar_Favorite(context,35,30,IsFavorite[35]),
                                MakeCircleAvatar_Favorite(context,36,30,IsFavorite[36]),
                                MakeCircleAvatar_Favorite(context,37,30,IsFavorite[37]),
                                MakeCircleAvatar_Favorite(context,38,30,IsFavorite[38]),
                                MakeCircleAvatar_Favorite(context,39,30,IsFavorite[39]),
                                MakeCircleAvatar_Favorite(context,40,30,IsFavorite[40]),
                                MakeCircleAvatar_Favorite(context,41,30,IsFavorite[41]),
                                MakeCircleAvatar_Favorite(context,42,30,IsFavorite[42]),
                                MakeCircleAvatar_Favorite(context,43,30,IsFavorite[43]),
                                MakeCircleAvatar_Favorite(context,44,30,IsFavorite[44]),
                                MakeCircleAvatar_Favorite(context,45,30,IsFavorite[45]),
                                MakeCircleAvatar_Favorite(context,46,30,IsFavorite[46]),
                                MakeCircleAvatar_Favorite(context,47,30,IsFavorite[47]),
                                MakeCircleAvatar_Favorite(context,48,30,IsFavorite[48]),
                                MakeCircleAvatar_Favorite(context,49,30,IsFavorite[49]),
                                MakeCircleAvatar_Favorite(context,50,30,IsFavorite[50]),
                                MakeCircleAvatar_Favorite(context,51,30,IsFavorite[51]),
                                MakeCircleAvatar_Favorite(context,52,30,IsFavorite[52]),
                                MakeCircleAvatar_Favorite(context,53,30,IsFavorite[53]),
                                MakeCircleAvatar_Favorite(context,54,30,IsFavorite[54]),
                                MakeCircleAvatar_Favorite(context,55,30,IsFavorite[55]),
                                MakeCircleAvatar_Favorite(context,56,30,IsFavorite[56]),
                                MakeCircleAvatar_Favorite(context,57,30,IsFavorite[57]),
                                MakeCircleAvatar_Favorite(context,58,30,IsFavorite[58]),
                                MakeCircleAvatar_Favorite(context,59,30,IsFavorite[59]),
                                MakeCircleAvatar_Favorite(context,60,30,IsFavorite[60]),
                                MakeCircleAvatar_Favorite(context,61,30,IsFavorite[61]),
                                MakeCircleAvatar_Favorite(context,62,30,IsFavorite[62]),
                                MakeCircleAvatar_Favorite(context,63,30,IsFavorite[63]),
                                MakeCircleAvatar_Favorite(context,64,30,IsFavorite[64]),
                                MakeCircleAvatar_Favorite(context,65,30,IsFavorite[65]),
                                MakeCircleAvatar_Favorite(context,66,30,IsFavorite[66]),
                                MakeCircleAvatar_Favorite(context,67,30,IsFavorite[67]),
                                MakeCircleAvatar_Favorite(context,68,30,IsFavorite[68]),
                                MakeCircleAvatar_Favorite(context,69,30,IsFavorite[69]),
                                MakeCircleAvatar_Favorite(context,70,30,IsFavorite[70]),
                                MakeCircleAvatar_Favorite(context,71,30,IsFavorite[71]),
                                MakeCircleAvatar_Favorite(context,72,30,IsFavorite[72]),
                                MakeCircleAvatar_Favorite(context,73,30,IsFavorite[73]),
                                MakeCircleAvatar_Favorite(context,74,30,IsFavorite[74]),
                                MakeCircleAvatar_Favorite(context,75,30,IsFavorite[75]),
                                MakeCircleAvatar_Favorite(context,76,30,IsFavorite[76]),
                                MakeCircleAvatar_Favorite(context,77,30,IsFavorite[77]),
                                MakeCircleAvatar_Favorite(context,78,30,IsFavorite[78]),
                                MakeCircleAvatar_Favorite(context,79,30,IsFavorite[79]),
                                MakeCircleAvatar_Favorite(context,80,30,IsFavorite[80]),
                                MakeCircleAvatar_Favorite(context,81,30,IsFavorite[81]),
                                MakeCircleAvatar_Favorite(context,82,30,IsFavorite[82]),
                                MakeCircleAvatar_Favorite(context,83,30,IsFavorite[83]),
                                MakeCircleAvatar_Favorite(context,84,30,IsFavorite[84]),
                                MakeCircleAvatar_Favorite(context,85,30,IsFavorite[85]),
                                MakeCircleAvatar_Favorite(context,86,30,IsFavorite[86]),
                                MakeCircleAvatar_Favorite(context,87,30,IsFavorite[87]),
                                MakeCircleAvatar_Favorite(context,88,30,IsFavorite[88]),
                                MakeCircleAvatar_Favorite(context,89,30,IsFavorite[89]),
                                MakeCircleAvatar_Favorite(context,90,30,IsFavorite[90]),
                                MakeCircleAvatar_Favorite(context,91,30,IsFavorite[91]),
                                MakeCircleAvatar_Favorite(context,92,30,IsFavorite[92]),
                                MakeCircleAvatar_Favorite(context,93,30,IsFavorite[93]),
                                MakeCircleAvatar_Favorite(context,94,30,IsFavorite[94]),
                                MakeCircleAvatar_Favorite(context,95,30,IsFavorite[95]),
                                MakeCircleAvatar_Favorite(context,96,30,IsFavorite[96]),
                                MakeCircleAvatar_Favorite(context,97,30,IsFavorite[97]),
                                MakeCircleAvatar_Favorite(context,98,30,IsFavorite[98]),
                                MakeCircleAvatar_Favorite(context,99,30,IsFavorite[99]),
                                MakeCircleAvatar_Favorite(context,100,30,IsFavorite[100]),
                                MakeCircleAvatar_Favorite(context,101,30,IsFavorite[101]),
                                MakeCircleAvatar_Favorite(context,102,30,IsFavorite[102]),
                                MakeCircleAvatar_Favorite(context,103,30,IsFavorite[103]),
                                MakeCircleAvatar_Favorite(context,104,30,IsFavorite[104]),
                                MakeCircleAvatar_Favorite(context,105,30,IsFavorite[105]),
                                MakeCircleAvatar_Favorite(context,106,30,IsFavorite[106]),
                                MakeCircleAvatar_Favorite(context,107,30,IsFavorite[107]),
                                MakeCircleAvatar_Favorite(context,108,30,IsFavorite[108]),
                                MakeCircleAvatar_Favorite(context,109,30,IsFavorite[109]),
                                MakeCircleAvatar_Favorite(context,110,30,IsFavorite[110]),
                                MakeCircleAvatar_Favorite(context,111,30,IsFavorite[111]),
                                MakeCircleAvatar_Favorite(context,112,30,IsFavorite[112]),
                                MakeCircleAvatar_Favorite(context,113,30,IsFavorite[113]),
                                MakeCircleAvatar_Favorite(context,114,30,IsFavorite[114]),
                                MakeCircleAvatar_Favorite(context,115,30,IsFavorite[115]),
                                MakeCircleAvatar_Favorite(context,116,30,IsFavorite[116]),
                                MakeCircleAvatar_Favorite(context,117,30,IsFavorite[117]),
                                MakeCircleAvatar_Favorite(context,118,30,IsFavorite[118]),
                                MakeCircleAvatar_Favorite(context,119,30,IsFavorite[119]),
                                MakeCircleAvatar_Favorite(context,120,30,IsFavorite[120]),
                                MakeCircleAvatar_Favorite(context,121,30,IsFavorite[121]),
                                MakeCircleAvatar_Favorite(context,122,30,IsFavorite[122]),
                                MakeCircleAvatar_Favorite(context,123,30,IsFavorite[123]),
                                MakeCircleAvatar_Favorite(context,124,30,IsFavorite[124]),
                                MakeCircleAvatar_Favorite(context,125,30,IsFavorite[125]),
                                MakeCircleAvatar_Favorite(context,126,30,IsFavorite[126]),
                                MakeCircleAvatar_Favorite(context,127,30,IsFavorite[127]),
                                MakeCircleAvatar_Favorite(context,128,30,IsFavorite[128]),
                                MakeCircleAvatar_Favorite(context,129,30,IsFavorite[129]),
                                MakeCircleAvatar_Favorite(context,130,30,IsFavorite[130]),
                                MakeCircleAvatar_Favorite(context,131,30,IsFavorite[131]),
                                MakeCircleAvatar_Favorite(context,132,30,IsFavorite[132]),
                                MakeCircleAvatar_Favorite(context,133,30,IsFavorite[133]),
                                MakeCircleAvatar_Favorite(context,134,30,IsFavorite[134]),
                                MakeCircleAvatar_Favorite(context,135,30,IsFavorite[135]),
                                MakeCircleAvatar_Favorite(context,136,30,IsFavorite[136]),
                                MakeCircleAvatar_Favorite(context,137,30,IsFavorite[137]),
                                MakeCircleAvatar_Favorite(context,138,30,IsFavorite[138]),
                                MakeCircleAvatar_Favorite(context,139,30,IsFavorite[139]),
                                MakeCircleAvatar_Favorite(context,140,30,IsFavorite[140]),
                                MakeCircleAvatar_Favorite(context,141,30,IsFavorite[141]),
                                MakeCircleAvatar_Favorite(context,142,30,IsFavorite[142]),
                                MakeCircleAvatar_Favorite(context,143,30,IsFavorite[143]),
                                MakeCircleAvatar_Favorite(context,144,30,IsFavorite[144]),
                                MakeCircleAvatar_Favorite(context,145,30,IsFavorite[145]),
                                MakeCircleAvatar_Favorite(context,146,30,IsFavorite[146]),
                                MakeCircleAvatar_Favorite(context,147,30,IsFavorite[147]),
                                MakeCircleAvatar_Favorite(context,148,30,IsFavorite[148]),
                                MakeCircleAvatar_Favorite(context,149,30,IsFavorite[149]),
                                MakeCircleAvatar_Favorite(context,150,30,IsFavorite[150]),
                                MakeCircleAvatar_Favorite(context,151,30,IsFavorite[151]),
                                MakeCircleAvatar_Favorite(context,152,30,IsFavorite[152]),
                                MakeCircleAvatar_Favorite(context,153,30,IsFavorite[153]),
                                MakeCircleAvatar_Favorite(context,154,30,IsFavorite[154]),
                                MakeCircleAvatar_Favorite(context,155,30,IsFavorite[155]),
                                MakeCircleAvatar_Favorite(context,156,30,IsFavorite[156]),
                                MakeCircleAvatar_Favorite(context,157,30,IsFavorite[157]),
                                MakeCircleAvatar_Favorite(context,158,30,IsFavorite[158]),
                                MakeCircleAvatar_Favorite(context,159,30,IsFavorite[159]),
                                MakeCircleAvatar_Favorite(context,160,30,IsFavorite[160]),
                                MakeCircleAvatar_Favorite(context,161,30,IsFavorite[161]),
                                MakeCircleAvatar_Favorite(context,162,30,IsFavorite[162]),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 0,25),
                                MakeCircleAvatar(context, 1,25),
                                MakeCircleAvatar(context, 2,25),
                                MakeCircleAvatar(context, 3,25),
                                MakeCircleAvatar(context, 4,25),
                                MakeCircleAvatar(context, 5,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 6,25),
                                MakeCircleAvatar(context, 7,25),
                                MakeCircleAvatar(context, 8,25),
                                MakeCircleAvatar(context, 9,25),
                                MakeCircleAvatar(context, 10,25),
                                MakeCircleAvatar(context, 11,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 12,25),
                                MakeCircleAvatar(context, 13,25),
                                MakeCircleAvatar(context, 14,25),
                                MakeCircleAvatar(context, 15,25),
                                MakeCircleAvatar(context, 16,25),
                                MakeCircleAvatar(context, 17,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 18,25),
                                MakeCircleAvatar(context, 19,25),
                                MakeCircleAvatar(context, 20,25),
                                MakeCircleAvatar(context, 21,25),
                                MakeCircleAvatar(context, 22,25),
                                MakeCircleAvatar(context, 23,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 24,25),
                                MakeCircleAvatar(context, 25,25),
                                MakeCircleAvatar(context, 26,25),
                                MakeCircleAvatar(context, 27,25),
                                MakeCircleAvatar(context, 28,25),
                                MakeCircleAvatar(context, 29,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 30,25),
                                MakeCircleAvatar(context, 31,25),
                                MakeCircleAvatar(context, 32,25),
                                MakeCircleAvatar(context, 33,25),
                                MakeCircleAvatar(context, 34,25),
                                MakeCircleAvatar(context, 35,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 36,25),
                                MakeCircleAvatar(context, 37,25),
                                MakeCircleAvatar(context, 38,25),
                                MakeCircleAvatar(context, 39,25),
                                MakeCircleAvatar(context, 40,25),
                                MakeCircleAvatar(context, 41,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 42,25),
                                MakeCircleAvatar(context, 43,25),
                                MakeCircleAvatar(context, 44,25),
                                MakeCircleAvatar(context, 45,25),
                                MakeCircleAvatar(context, 46,25),
                                MakeCircleAvatar(context, 47,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 48,25),
                                MakeCircleAvatar(context, 49,25),
                                MakeCircleAvatar(context, 50,25),
                                MakeCircleAvatar(context, 51,25),
                                MakeCircleAvatar(context, 52,25),
                                MakeCircleAvatar(context, 53,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 54,25),
                                MakeCircleAvatar(context, 55,25),
                                MakeCircleAvatar(context, 56,25),
                                MakeCircleAvatar(context, 57,25),
                                MakeCircleAvatar(context, 58,25),
                                MakeCircleAvatar(context, 59,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 60,25),
                                MakeCircleAvatar(context, 61,25),
                                MakeCircleAvatar(context, 62,25),
                                MakeCircleAvatar(context, 63,25),
                                MakeCircleAvatar(context, 64,25),
                                MakeCircleAvatar(context, 65,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 66,25),
                                MakeCircleAvatar(context, 67,25),
                                MakeCircleAvatar(context, 68,25),
                                MakeCircleAvatar(context, 69,25),
                                MakeCircleAvatar(context, 70,25),
                                MakeCircleAvatar(context, 71,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 72,25),
                                MakeCircleAvatar(context, 73,25),
                                MakeCircleAvatar(context, 74,25),
                                MakeCircleAvatar(context, 75,25),
                                MakeCircleAvatar(context, 76,25),
                                MakeCircleAvatar(context, 77,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 78,25),
                                MakeCircleAvatar(context, 79,25),
                                MakeCircleAvatar(context, 80,25),
                                MakeCircleAvatar(context, 81,25),
                                MakeCircleAvatar(context, 82,25),
                                MakeCircleAvatar(context, 83,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 84,25),
                                MakeCircleAvatar(context, 85,25),
                                MakeCircleAvatar(context, 86,25),
                                MakeCircleAvatar(context, 87,25),
                                MakeCircleAvatar(context, 88,25),
                                MakeCircleAvatar(context, 89,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 90,25),
                                MakeCircleAvatar(context, 91,25),
                                MakeCircleAvatar(context, 92,25),
                                MakeCircleAvatar(context, 93,25),
                                MakeCircleAvatar(context, 94,25),
                                MakeCircleAvatar(context, 95,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 96,25),
                                MakeCircleAvatar(context, 97,25),
                                MakeCircleAvatar(context, 98,25),
                                MakeCircleAvatar(context, 99,25),
                                MakeCircleAvatar(context, 100,25),
                                MakeCircleAvatar(context, 101,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 102,25),
                                MakeCircleAvatar(context, 103,25),
                                MakeCircleAvatar(context, 104,25),
                                MakeCircleAvatar(context, 105,25),
                                MakeCircleAvatar(context, 106,25),
                                MakeCircleAvatar(context, 107,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 108,25),
                                MakeCircleAvatar(context, 109,25),
                                MakeCircleAvatar(context, 110,25),
                                MakeCircleAvatar(context, 111,25),
                                MakeCircleAvatar(context, 112,25),
                                MakeCircleAvatar(context, 113,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 114,25),
                                MakeCircleAvatar(context, 115,25),
                                MakeCircleAvatar(context, 116,25),
                                MakeCircleAvatar(context, 117,25),
                                MakeCircleAvatar(context, 118,25),
                                MakeCircleAvatar(context, 119,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 120,25),
                                MakeCircleAvatar(context, 121,25),
                                MakeCircleAvatar(context, 122,25),
                                MakeCircleAvatar(context, 123,25),
                                MakeCircleAvatar(context, 124,25),
                                MakeCircleAvatar(context, 125,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 126,25),
                                MakeCircleAvatar(context, 127,25),
                                MakeCircleAvatar(context, 128,25),
                                MakeCircleAvatar(context, 129,25),
                                MakeCircleAvatar(context, 130,25),
                                MakeCircleAvatar(context, 131,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 132,25),
                                MakeCircleAvatar(context, 133,25),
                                MakeCircleAvatar(context, 134,25),
                                MakeCircleAvatar(context, 135,25),
                                MakeCircleAvatar(context, 136,25),
                                MakeCircleAvatar(context, 137,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 138,25),
                                MakeCircleAvatar(context, 139,25),
                                MakeCircleAvatar(context, 140,25),
                                MakeCircleAvatar(context, 141,25),
                                MakeCircleAvatar(context, 142,25),
                                MakeCircleAvatar(context, 143,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 144,25),
                                MakeCircleAvatar(context, 145,25),
                                MakeCircleAvatar(context, 146,25),
                                MakeCircleAvatar(context, 147,25),
                                MakeCircleAvatar(context, 148,25),
                                MakeCircleAvatar(context, 149,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 150,25),
                                MakeCircleAvatar(context, 151,25),
                                MakeCircleAvatar(context, 152,25),
                                MakeCircleAvatar(context, 153,25),
                                MakeCircleAvatar(context, 154,25),
                                MakeCircleAvatar(context, 155,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 156,25),
                                MakeCircleAvatar(context, 157,25),
                                MakeCircleAvatar(context, 158,25),
                                MakeCircleAvatar(context, 159,25),
                                MakeCircleAvatar(context, 160,25),
                                MakeCircleAvatar(context, 161,25),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MakeCircleAvatar(context, 162,25)
                              ],
                            ),
                          ),
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
