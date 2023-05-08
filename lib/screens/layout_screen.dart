import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/share/components.dart';
import 'package:news_app/share/cubit/app_cubit/app_cubit.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: buildAppBar(cubit),
            body: cubit.screens[cubit.navBarCurrentIndex],
            bottomNavigationBar: BottomNavigationBar(
                items: cubit.navBarItems,
                selectedItemColor: Colors.deepPurple,
                currentIndex: cubit.navBarCurrentIndex,
                showUnselectedLabels: false,
                onTap: (index) => cubit.changeBottomNavBar(index)),
          );
        },
      ),
    );
  }
}
