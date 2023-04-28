import 'package:dark_mode_flutter/core/bloc/bloc/theme_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<ThemeBloc, ThemeData>(
            builder: (context, state) {
              return CupertinoSwitch(
                value: state == ThemeData.dark(),
                onChanged: (value) =>
                    BlocProvider.of<ThemeBloc>(context).add(ThemeSwitchEvent()),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('DarkMode Example'),
      ),
    );
  }
}
