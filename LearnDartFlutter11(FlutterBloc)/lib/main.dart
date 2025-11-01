import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CounterCubit(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(context) => CounterCubit(),
        child: Scaffold(
          appBar: AppBar(

            backgroundColor: Theme
                .of(context)
                .colorScheme
                .inversePrimary,
            title: Text(widget.title),
          ),
          body: Center(),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              context.read<CounterCubit>().increment();
            },
            child: const Icon(Icons.access_alarm_sharp),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
