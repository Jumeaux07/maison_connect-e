import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maison_connecte/components/box_appareil.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final paddinHorizontal = 19.0;

  final paddinVertial = 15.0;

  List mesAppareils = [
    ["Porte", "asset/images/porte.png", false],
    ["Lumière", "asset/images/ampoule.png", true],
    ["Smart Tv", "asset/images/smart-tv.png", false],
    ["Ventillation", "asset/images/ventilation.png", false],
  ];

  void changeStatut(index, bool value){
    setState(() {
      mesAppareils[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Appbar personnalisé
            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddinHorizontal),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset("asset/icons/menu.svg"),
                  SvgPicture.asset("asset/icons/user.svg")
                ],
              ),
            ),

            const SizedBox(height: 20),

            //Mot de bienvenu
            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddinHorizontal),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25,),
                      Text(
                        "Bienvenue à la",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        "Maison connectée",
                        style: GoogleFonts.bebasNeue(
                          fontSize: 60,
                          color: Colors.grey[700]
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 35,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddinHorizontal),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 15,),
            //Dashboard
            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddinHorizontal),
              child: Text(
                "Appareils",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[800]),
              ),
            ),
            SizedBox(height: 25,),
            Expanded(
                child: GridView.builder(
                    itemCount: mesAppareils.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      
                      childAspectRatio: 1/1.3,
                        crossAxisCount: 2
                      ),
                    itemBuilder: (context, index) {
                      return BoxAppareil(
                        iconAppareil: mesAppareils[index][1],
                        nomAppareil: mesAppareils[index][0],
                        status: mesAppareils[index][2],
                        onChanged: (value)=> changeStatut(index,value),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
