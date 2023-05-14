import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../generated/assets.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 5.0,
              ),
              Text("Favourite News",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold, fontSize: 22.0)),
              SizedBox(
                width: 15.0,
              ),
              Icon(Icons.favorite, color: Colors.red, size: 22.0),
            ],
          ),
        ),
        body: Dialog(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20.0)),
            width: 200.0,
            height: 280.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 6,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 180.0,
                        color: Colors.indigo,
                      ),
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        children: [
                          Lottie.asset(Assets.sadEmptyBox,
                              height: 140.0, width: 180.0),
                          Text(
                            "News Not Found !",
                            style: GoogleFonts.roboto(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        "Your didn't liked any news yet",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 50.0,
                      // height: 200.0,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                          child: Text("Retry",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, fontSize: 10.0))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ),
        )
    );
  }
}
