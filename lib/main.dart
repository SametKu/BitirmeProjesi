import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foods_app/ui/cubit/sepetim_sayfa_cubit.dart';
import 'package:foods_app/ui/cubit/yemekler_sayfa_cubit.dart';
import 'package:foods_app/ui/views/reklam.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => YemeklerSayfaCubit()),
        BlocProvider(
          create: (context) => SepetSayfaCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ReklamView(),
      ),
    );
  }
}
