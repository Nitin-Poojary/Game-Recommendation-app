import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamesrecommendation/routes.dart';
import 'resources/ui/screens/home/widgets/category widget/bloc/categorybloc_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryblocBloc()..add(GetAllCategories()),
        ),
      ],
      child: const MaterialApp(
        title: 'Material App',
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
