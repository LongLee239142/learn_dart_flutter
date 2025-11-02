import 'package:appmoneymanager/common/enum/drawer_item.dart';
import 'package:appmoneymanager/main_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuScreen extends StatelessWidget {
  static const String route = "MenuScreen";

  @override
  Widget build(BuildContext context) {
    return Page();
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              trailing: state.selected != DrawerItem.Home
                  ? Icon(Icons.navigate_next)
                  : null,
              onTap: () {
                context.read<MainCubit>().setSelected(DrawerItem.Home);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              trailing: state.selected != DrawerItem.Setting
                  ? Icon(Icons.navigate_next)
                  : null,
              onTap: () {
                context.read<MainCubit>().setSelected(DrawerItem.Setting);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Log out"),
              onTap: () {
                context.read<MainCubit>().setSelected(DrawerItem.LogOut);
              },
            ),
          ],
        );
      },
    );
  }
}
