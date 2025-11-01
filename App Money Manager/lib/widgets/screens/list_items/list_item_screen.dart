import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/enum/drawer_item.dart';

import '../../../common/enum/load_satatus.dart';
import '../../../common/enum/screen_size.dart';
import '../../../common/enum/utils.dart';
import '../../../main_cubit.dart';
import '../../../repository/api.dart';
import '../../common_widgets/noti_bar.dart';
import '../add_edit/add_edit_screen.dart';
import '../details/detail_screen.dart';
import '../menu/menu_screen.dart';
import '../setting/setting_screen.dart';
import 'list_item_cubit.dart';

class ListItemScreen extends StatelessWidget {
  static const String route = "ListItemScreen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListItemCubit(context.read<Api>())..loadData(0),
      child: Page(),
    );
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListItemCubit, ListItemState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("Money Manager")),
          body: Body(),
          drawer: state.screenSize == ScreenSize.Large
              ? null
              : Drawer(child: MenuScreen()),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              var cubit = context.read<ListItemCubit>();
              Navigator.of(context).pushNamed(
                AddEditScreen.route,
                arguments: {'cubit': cubit, "isAddMode": true},
              );
            },
          ),
        );
      },
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (contextMain, stateMain) {
        return BlocConsumer<ListItemCubit, ListItemState>(
          listener: (context, state) {
            if (state.loadStatus == LoadStatus.Error) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(notiBar("Error", true));
            } else if (state.loadStatus == LoadStatus.Done) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar((notiSuccessBar("Success", true)));
            }
          },
          builder: (context, state) {
            var screenSize = calculateScreenSize(
              MediaQuery.sizeOf(context).width,
            );
            context.read<ListItemCubit>().setScreenSize(screenSize);
            return state.loadStatus == LoadStatus.Loading
                ? Center(child: CircularProgressIndicator())
                : stateMain.selected == DrawerItem.Setting &&
                      state.screenSize != ScreenSize.Large
                ? SettingScreen()
                : switch (state.screenSize) {
                    ScreenSize.Small => ListItemPage(),
                    ScreenSize.Medium => ListItemEditPage(),
                    _ => ListItemEditMenuPage(),
                  };
          },
        );
      },
    );
  }
}

class ListItemPage extends StatelessWidget {
  const ListItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListItemCubit, ListItemState>(
      builder: (context, state) {
        var cubit = context.read<ListItemCubit>();
        return Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Row(
                  children: [
                    Expanded(child: Text("${state.total}")),
                    state.listMonths.isNotEmpty &&
                            state.selectedMonth == 0 &&
                            state.selectedMonth < state.listMonths.length
                        ? Container()
                        : IconButton(
                            onPressed: () {
                              cubit.loadData(state.selectedMonth - 1);
                            },
                            icon: Icon(Icons.navigate_before),
                          ),
                    state.listMonths.isNotEmpty &&
                            state.selectedMonth >= 0 &&
                            state.selectedMonth < state.listMonths.length
                        ? Text(
                            state.listMonths[state.selectedMonth].substring(
                              0,
                              7,
                            ),
                          )
                        : Container(),
                    state.listMonths.isNotEmpty &&
                            state.selectedMonth >= 0 &&
                            state.selectedMonth == state.listMonths.length - 1
                        ? Container()
                        : IconButton(
                            onPressed: () {
                              cubit.loadData(state.selectedMonth + 1);
                            },
                            icon: Icon(Icons.navigate_next),
                          ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    var item = state.listTransaction[index];
                    return Card(
                      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: ListTile(
                        leading: item.amount >= 0
                            ? Icon(Icons.add, color: Colors.blue)
                            : Icon(Icons.remove, color: Colors.red),
                        title: Row(
                          children: [
                            Expanded(child: Text(item.title)),
                            Text("${item.amount}"),
                          ],
                        ),
                        subtitle: Text(item.content),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            cubit.deleteItem(item.dateTime);
                          },
                        ),
                        onTap: () {
                          cubit.setSelectedIdx(index);
                          if (state.screenSize == ScreenSize.Small) {
                            Navigator.of(context).pushNamed(
                              DetailScreen.route,
                              arguments: {'cubit': cubit},
                            );
                          }
                        },
                      ),
                    );
                  },
                  itemCount: state.listTransaction.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ListItemEditPage extends StatelessWidget {
  const ListItemEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: ListItemPage()),
        Expanded(child: DetailScreen()),
      ],
    );
  }
}

class ListItemEditMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return state.selected == DrawerItem.Home
            ? Row(
                children: [
                  Expanded(child: MenuScreen()),
                  Expanded(child: ListItemPage()),
                  Expanded(child: DetailScreen()),
                ],
              )
            : Row(
                children: [
                  Expanded(child: MenuScreen()),
                  Expanded(child: SettingScreen(), flex: 2),
                ],
              );
      },
    );
  }
}
