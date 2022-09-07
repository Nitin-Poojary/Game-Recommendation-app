import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamesrecommendation/resources/models/home/category/categorymodel.dart';

import 'bloc/categorybloc_bloc.dart';

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
            return Padding(
              padding: const EdgeInsets.only(top: 23, left: 23, right: 23),
              child: ListView.builder(
                cacheExtent: 10,
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () =>
                        CategoryblocBloc().add(CategoryBlocSelected(id: i)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 60,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  categories[i].imageURL,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(categories[i].gameName),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return const Center(
            child: Text("Some Error Occured"),
          );
        }),
      ),
    );
  }
}
