import 'package:flutter/material.dart';
import 'package:onlinestoreweb/controllers/category_controller.dart';
import 'package:onlinestoreweb/models/category_model.dart';
import 'package:onlinestoreweb/theme.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  //A future that will hold list of banners once loaded from API
  late Future<List<CategoryModel>> futureCategory;

  @override
  void initState() {
    super.initState();
    futureCategory = CategoryController().loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureCategory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No Categories'),
            );
          } else {
            final categories = snapshot.data!;
            return GridView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.network(
                          category.image,
                          width: 100,
                          height: 100,
                        ),
                        Text(category.name,
                        style: const TextStyle(
                                      color: AppTheme.mcDarkGreyColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),)
                      ],
                    ),
                  );
                });
          }
        });
  }
}
