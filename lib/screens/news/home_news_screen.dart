import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/share/components.dart';
import 'package:news_app/share/cubit/app_cubit/app_cubit.dart';

class NewsHomePage extends StatelessWidget {
  const NewsHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Column(
            children: [
              Expanded(flex: 1, child: buildTabBar(cubit)),
              Expanded(
                  flex: 10,
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15.0),
                      child: cubit.tabBarView[cubit.tabBatCurrentIndex]))
            ],
          );
        },
      ),
    );
  }
}
