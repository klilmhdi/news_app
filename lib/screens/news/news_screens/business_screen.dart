import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/share/components.dart';
import 'package:news_app/share/cubit/news_cubit/news_cubit.dart';

class BusinessNewsPage extends StatelessWidget {
  const BusinessNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusinessNews(),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          if (state is BusinessNewsLoading) {
            print("Is loading now!!");
            return Center(
              child: LoadingAnimationWidget.flickr(
                leftDotColor: Colors.deepPurple,
                rightDotColor: Colors.deepOrange,
                size: 90.0,
              ),
            );
          } else if (state is GetBusinessNewsSuccess) {
            print("Successful loading");
            return RefreshIndicator(
              onRefresh: () async => cubit.getBusinessNews(),
              child: Container(
                width: double.infinity,
                child: Container(
                    margin:
                    EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 15.0,
                      ),
                      itemCount: 15,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, int index) =>
                          buildNewsCard(context, cubit.business[index]),
                    )),
              ),
            );
          } else {
            print("Failed");
            return Center(
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
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold),
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
                              "Please, check your internet connection and try again", style: GoogleFonts.roboto(fontSize: 15.0, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () => cubit.getBusinessNews(),
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
                      SizedBox(height: 10.0,)
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
