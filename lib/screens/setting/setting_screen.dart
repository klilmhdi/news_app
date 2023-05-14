import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/screens/setting/favorite_news_screen.dart';
import 'package:news_app/share/components.dart';
import 'package:news_app/share/cubit/app_cubit/app_cubit.dart';
import 'package:news_app/share/cubit/theme_cubit/theme_cubit.dart';
import 'package:news_app/share/cubit/theme_cubit/theme_cubit.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Container(
            child: Column(
              children: [
                ListTile(
                  leading:
                      Icon(Icons.invert_colors_on_rounded, color: Colors.grey),
                  title: Text("Change theme"),
                  trailing: BlocBuilder<ThemeCubit, ThemeState>(
                    bloc: context.read<ThemeCubit>(),
                    builder: (context, state) {
                      // return IconButton(
                      //   icon: Icon(
                      //       ? FontAwesomeIcons.moon
                      //       : FontAwesomeIcons.sun),
                      //   onPressed: () => ,
                      // );
                      return Switch.adaptive(
                          value: state.isDark,
                          onChanged: (value)=> context.read<ThemeCubit>().switchTheme());
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.favorite, color: Colors.grey),
                  title: Text("Favourite News"),
                  trailing: Icon(Icons.arrow_forward, color: Colors.grey),
                  onTap: () => navTo(context, FavouritePage()),
                ),
                ListTile(
                  leading: Icon(Icons.share_rounded, color: Colors.grey),
                  title: Text("Share this app"),
                  trailing: Icon(Icons.arrow_forward, color: Colors.grey),
                  onTap: () {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
