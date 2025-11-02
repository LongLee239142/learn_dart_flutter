import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main_cubit.dart';

class LogoutScreen extends StatefulWidget {
  static const String route = "LogoutScreen";

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        var isLightTheme = state.isLightTheme;
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
            Text("LogOut")
            ],
          ),
        );
      },
    );
  }
}