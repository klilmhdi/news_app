import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/generated/assets.dart';
import 'package:news_app/share/components.dart';
import 'package:news_app/share/cubit/news_cubit/news_cubit.dart';

class ScienceNewsPage extends StatelessWidget {
  const ScienceNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getScienceNews(),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          if (state is ScienceNewsLoading) {
            print("Is loading now!!");
            return Center(
              child: LoadingAnimationWidget.flickr(
                leftDotColor: Colors.deepPurple,
                rightDotColor: Colors.deepOrange,
                size: 90.0,
              ),
            );
          } else if (state is GetScienceNewsSuccess) {
            print("Successful loading");
            return RefreshIndicator(
              onRefresh: () async => cubit.getScienceNews(),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  width: double.infinity,
                  child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: 15.0,
                        ),
                        itemCount: 15,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, int index) =>
                            buildNewsCard(context, cubit.science[index]),
                      )),
                ),
              ),
            );
          } else {
            print("Failed");
            return Center(
              child: Dialog(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20.0)),
                  width: 200.0,
                  height: 250.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 200.0,
                              color: Colors.indigo,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Lottie.asset(Assets.noInternet,
                                    height: 110.0, width: 180.0),
                                SizedBox(height: 22.0),
                                Text(
                                  "Your Didn't have Internet Connection",
                                  style: GoogleFonts.roboto(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold, color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () => cubit.getScienceNews(),
                          child: Container(
                            width: 60.0,
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Center(child: Text("Retry", style: TextStyle(color: Colors.white),)),
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
          }
        },
      ),
    );
  }
}
