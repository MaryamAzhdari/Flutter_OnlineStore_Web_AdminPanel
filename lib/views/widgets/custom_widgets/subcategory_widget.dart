import 'package:flutter/material.dart';
import 'package:onlinestoreweb/controllers/subcategory_controller.dart';
import 'package:onlinestoreweb/models/subcategory_model.dart';
import 'package:onlinestoreweb/theme.dart';

class SubCategoryWidget extends StatefulWidget {
  const SubCategoryWidget({super.key});

  @override
  State<SubCategoryWidget> createState() => _SubCategoryWidgetState();
}

class _SubCategoryWidgetState extends State<SubCategoryWidget> {
  //A future that will hold list of banners once loaded from API
  late Future<List<SubCategoryModel>> futureSubCategory;

  @override
  void initState() {
    super.initState();
    futureSubCategory = SubCategoryController().loadSubCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureSubCategory,
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
                  final subCategory = categories[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.network(
                          subCategory.image,
                          width: 100,
                          height: 100,
                        ),
                        Text(subCategory.subCategoryName,
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
