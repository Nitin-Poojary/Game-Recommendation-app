import 'package:flutter/material.dart';

import '../../../../../../models/home/category/categorymodel.dart';
import '../bloc/categorybloc_bloc.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key, required this.categories});

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 23, left: 23, right: 23),
      child: ListView.builder(
        cacheExtent: 10,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () => CategoryblocBloc().add(CategoryBlocSelected(id: i)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 60,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                        categories[i].imageURL,
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
}
