import 'package:dark_mode_flutter/core/bloc/bloc/theme_bloc.dart';
import 'package:dark_mode_flutter/core/constants/hive_stuff.dart';
import 'package:dark_mode_flutter/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveStuff.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc()..add(InitialThemeSetEvent()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: state,
            home: const HomeView(),
          );
        },
      ),
    );
  }
}
