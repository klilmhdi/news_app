import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/generated/assets.dart';
import 'package:news_app/share/cubit/news_cubit/news_cubit.dart';

import 'cubit/app_cubit/app_cubit.dart';

//Variables
String formattedString = "";
DateTime dateTime = DateTime.parse(formattedString);

// navigate and finish pervious screen
navAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => Widget), (route) {
      return false;
    });

// just navigate for screen
navTo(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));

// appbar for application
AppBar buildAppBar(AppCubit cubit) => AppBar(
      leading: Icon(cubit.screenIcon[cubit.navBarCurrentIndex]),
      title: Text(cubit.screenTitle[cubit.navBarCurrentIndex]),
    );

// structure for news list
Widget buildNewsCard(context, articles) {
  return Card(
    child: InkWell(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(12.0),
        bottomRight: Radius.circular(12.0),
        topLeft: Radius.circular(18.0),
        topRight: Radius.circular(18.0),
      ),
      onTap: () => navTo(context, WebPage(url: articles['url'])),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
            topLeft: Radius.circular(18.0),
            topRight: Radius.circular(18.0),
          ),
        ),
        height: 300.0,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  height: 300.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                      topLeft: Radius.circular(2.0),
                      topRight: Radius.circular(2.0),
                    ),
                  ),
                  child: articles['urlToImage'] != null
                      ? Image.network("${articles['urlToImage']}",
                          fit: BoxFit.fill)
                      : Lottie.asset(Assets.emptyViewImage),
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 5.0),
                      child: articles['title'] != null
                          ? AutoSizeText(
                              "${articles['title']}",
                              maxLines: 3,
                              style: GoogleFonts.roboto(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            )
                          : Text(
                              "Khaleel Mahdi",
                              style: GoogleFonts.roboto(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                              textDirection: TextDirection.ltr,
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: articles['author'] != null
                                ? AutoSizeText(
                                    "${articles['author']}",
                                    maxLines: 3,
                                    style: GoogleFonts.roboto(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text(
                                    "Khaleel Mahdi",
                                    style: GoogleFonts.roboto(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple),
                                    textDirection: TextDirection.ltr,
                                  ),
                          ),
                          AutoSizeText(
                            articles['publishedAt'].toString(),
                            maxLines: 3,
                            style: GoogleFonts.roboto(
                                fontSize: 12.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Read more!",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue),
                    )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Row(
                        children: [
                          LikeButton(
                            isLiked: false,
                            onTap: (value) async {
                              value = value;
                              if(value){ // here if i removed from favourite
                                Fluttertoast.showToast(
                                  msg: "Removed from favourite ❌",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.SNACKBAR,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.deepOrangeAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                              }else{ // here if i add to favourite
                                Fluttertoast.showToast(
                                    msg: "Added to favourite ✅",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.SNACKBAR,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.deepPurpleAccent,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                              // print("the id is: ${articles['author']}");
                              return !value;
                            },
                            size: 25.0,
                            circleColor: CircleColor(
                                start: Color(0xff00ddff),
                                end: Color(0xff0099cc)),
                            bubblesColor: BubblesColor(
                              dotPrimaryColor: Color(0xff33b5e5),
                              dotSecondaryColor: Color(0xff0099cc),
                            ),
                            likeBuilder: (bool isLiked) => Icon(
                              Icons.favorite,
                              color: isLiked
                                  ? Colors.red
                                  : Colors.deepPurpleAccent,
                              size: 23.0,
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Icon(
                            Icons.share,
                            color: Colors.deepPurpleAccent,
                            size: 23.0,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// build Tab Bar for home news
Widget buildTabBar(AppCubit cubit) => SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: cubit.tabBarItems.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () => cubit.changeTabBar(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.all(5),
                        width: 130,
                        height: 40,
                        decoration: BoxDecoration(
                          color: cubit.tabBatCurrentIndex == index
                              ? Colors.deepPurpleAccent
                              : Colors.white,
                          borderRadius: cubit.tabBatCurrentIndex == index
                              ? BorderRadius.circular(20)
                              : BorderRadius.circular(15),
                          border: cubit.tabBatCurrentIndex == index
                              ? Border.all(color: Colors.deepPurple, width: 1)
                              : null,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AutoSizeText(
                              cubit.tabBarItems[index],
                              style: GoogleFonts.laila(
                                  fontWeight: FontWeight.w500,
                                  color: cubit.tabBatCurrentIndex == index
                                      ? Colors.white
                                      : Colors.black87),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                        visible: cubit.tabBatCurrentIndex == index,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              shape: BoxShape.circle),
                        ))
                  ],
                );
              }),
        ),
      ),
    );

// build web view for news
class WebPage extends StatelessWidget {
  final String url;

  const WebPage({super.key, required this.url});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Breaking News')),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(url)),
      ),
    );
  }
}

Widget buildDialog(function) => Center(
      child: Dialog(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20.0)),
          width: 200.0,
          height: 250.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 130.0,
                      color: Colors.indigo,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.wifi_off_rounded, size: 50.0),
                        SizedBox(height: 12.0),
                        Text(
                          "Your Internet Connection is weak",
                          style: GoogleFonts.roboto(
                              fontSize: 17.0, fontWeight: FontWeight.bold),
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
                      "Please, check your internet connection and try again",
                      style: GoogleFonts.roboto(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  // onTap: () => cubit.getBusinessNews(),
                  onTap: function,
                  child: Container(
                    width: 60.0,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text("Retry")),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          ),
        ),
      ),
    );
