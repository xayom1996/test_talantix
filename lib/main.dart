import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_talantix/app/di.dart';
import 'package:test_talantix/features/presentation/blocs/main/main_cubit.dart';
import 'package:test_talantix/features/presentation/pages/home_page.dart';

Future<void> main() async {
  await diInit();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainCubit>(
          create: (_) => di.get<MainCubit>()..getUsers(),
        ),
      ],
      child: MaterialApp(
        title: 'Test Talantix',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
