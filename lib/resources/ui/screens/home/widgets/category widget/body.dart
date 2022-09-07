import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamesrecommendation/resources/models/home/category/categorymodel.dart';

import 'bloc/categorybloc_bloc.dart';
import 'helper widgets/listcategories.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [];

    return BlocListener<CategoryblocBloc, CategoryblocState>(
      listener: (context, state) {
        if (state is CategoryBlocLoaded && state.results.isNotEmpty) {
          for (var i in state.results) {
            categories.add(CategoryModel(
                imageURL: i.imageBackground.toString(),
                gameName: i.name.toString()));
          }
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BlocBuilder<CategoryblocBloc, CategoryblocState>(
            builder: (context, state) {
          if (state is CategoryblocLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoryBlocLoaded) {
            return CategoryListWidget(categories: categories);
          }
          return const Center(
            child: Text("Some Error Occured"),
          );
        }),
      ),
    );
  }
}
