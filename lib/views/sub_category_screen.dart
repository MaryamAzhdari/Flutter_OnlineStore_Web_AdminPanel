import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:onlinestoreweb/controllers/category_controller.dart';
import 'package:onlinestoreweb/controllers/subcategory_controller.dart';
import 'package:onlinestoreweb/models/category_model.dart';
import 'package:onlinestoreweb/theme.dart';
import 'package:onlinestoreweb/views/widgets/custom_widgets/subcategory_widget.dart';

class SubCategoriesScreen extends StatefulWidget {
  static const String id = 'subCategoriesScreen';
  const SubCategoriesScreen({super.key});

  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  final SubCategoryController _subCategoryController = SubCategoryController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String subCategoryName;
  dynamic _image, _bannerImage;
  late Future<List<CategoryModel>> futureCategory;
  CategoryModel? selectedCategory;

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
      });
    }
  }

  pickImageBanner() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      setState(() {
        _bannerImage = result.files.first.bytes;
      });
    }
  }

  @override
  void initState() {
    futureCategory = CategoryController().loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      //For Validation EditTexts
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SubCategories',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Padding(
              padding: EdgeInsets.all(4),
              child: Divider(
                color: AppTheme.mcDarkGreyColor,
              ),
            ),
            FutureBuilder(
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
                    return DropdownButton<CategoryModel>(
                        value: selectedCategory,
                        hint: Text(
                          'Select Category',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        items:
                            snapshot.data!.map((CategoryModel categoryModel) {
                          return DropdownMenuItem(
                            value: categoryModel,
                            child: Text(categoryModel.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value;
                          });
                          print(selectedCategory!.name);
                        });
                  }
                }),
            const Padding(
              padding: EdgeInsets.all(4),
              child: Divider(
                color: AppTheme.mcDarkGreyColor,
              ),
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          color: AppTheme.mcLightGreyColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: _image != null
                              ? Image.memory(_image)
                              : const Text('SubCategory Image',
                                  style: TextStyle(
                                      color: AppTheme.mcDarkGreyColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600))),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.mcBackButtonColor),
                          onPressed: () {
                            pickImage();
                          },
                          child: Text(
                            'Pic Image',
                            style: Theme.of(context).textTheme.labelLarge,
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    width: 200,
                    child: TextFormField(
                        onChanged: (value) {
                          subCategoryName = value;
                        },
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return 'Please Enter SubCategory Name';
                          }
                        },
                        decoration: InputDecoration(
                          //fillColor: AppTheme.mcTextFormFieldBackColor,
                          //filled: true,
                          //border: OutlineInputBorder(
                          //borderRadius: BorderRadius.circular(20)),
                          //focusedBorder: InputBorder.none,
                          //enabledBorder: InputBorder.none,
                          labelText: 'Enter SubCategory Name',
                          labelStyle: Theme.of(context).textTheme.bodySmall,
                        )),
                  ),
                ),
                // CustomButtonSmall(
                //   title: "Cancel",
                //   isLoading: false,
                //   onTap: () {},
                // ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Cancel',
                      style: Theme.of(context).textTheme.bodySmall,
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.mcBackButtonColor),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await _subCategoryController.uploadSubCategory(
                            categoryId: selectedCategory!.id,
                            categoryName: selectedCategory!.name,
                            subCategoryName: subCategoryName,
                            pickedImage: _image,
                            context: context);

                        setState(() {
                          _formKey.currentState!.reset();
                          _image = null;
                        });
                      }
                    },
                    child: Text(
                      'Save',
                      style: Theme.of(context).textTheme.labelLarge,
                    )),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(4),
              child: Divider(
                color: AppTheme.mcDarkGreyColor,
              ),
            ),
            const SubCategoryWidget()
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       width: 150,
            //       height: 150,
            //       decoration: BoxDecoration(
            //           color: AppTheme.mcDarkGreyColor,
            //           borderRadius: BorderRadius.circular(5)),
            //       child: Center(
            //           child: _bannerImage != null
            //               ? Image.memory(_bannerImage)
            //               : const Text('Category Banner',
            //                   style: TextStyle(
            //                       color: AppTheme.mcWhiteColor,
            //                       fontSize: 14,
            //                       fontWeight: FontWeight.w500))),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(vertical: 8),
            //       child: ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //               backgroundColor: AppTheme.mcBackButtonColor),
            //           onPressed: () {
            //             pickImageBanner();
            //           },
            //           child: Text(
            //             'Pic Banner',
            //             style: Theme.of(context).textTheme.labelLarge,
            //           )),
            //     ),
            //   ],
            // ),
            // const Padding(
            //   padding: EdgeInsets.all(4),
            //   child: Divider(
            //     color: AppTheme.mcDarkGreyColor,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
