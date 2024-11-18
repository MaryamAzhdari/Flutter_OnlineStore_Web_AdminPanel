import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:onlinestoreweb/controllers/category_controller.dart';
import 'package:onlinestoreweb/theme.dart';
import 'package:onlinestoreweb/views/widgets/custom_widgets/category_widget.dart';

class CategoriesScreen extends StatefulWidget {
  static const String id = 'categoriesScreen';
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  //For Validation EditTexts
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CategoryController _categoryController = CategoryController();
  late String categoryName;
  dynamic _image, _bannerImage;
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
              'Categories',
              style: Theme.of(context).textTheme.titleLarge,
            ),
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
                              : const Text('Category Image',
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
                          categoryName = value;
                        },
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return 'Please Enter Category Name';
                          }
                        },
                        decoration: InputDecoration(
                          //fillColor: AppTheme.mcTextFormFieldBackColor,
                          //filled: true,
                          //border: OutlineInputBorder(
                          //borderRadius: BorderRadius.circular(20)),
                          //focusedBorder: InputBorder.none,
                          //enabledBorder: InputBorder.none,
                          labelText: 'Enter Category Name',
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
                        _categoryController.uploadCategory(
                            pickedImage: _image,
                            pickedBanner: _bannerImage,
                            name: categoryName,
                            context: context);
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: AppTheme.mcDarkGreyColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: _bannerImage != null
                          ? Image.memory(_bannerImage)
                          : const Text('Category Banner',
                              style: TextStyle(
                                  color: AppTheme.mcWhiteColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500))),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.mcBackButtonColor),
                      onPressed: () {
                        pickImageBanner();
                      },
                      child: Text(
                        'Pic Banner',
                        style: Theme.of(context).textTheme.labelLarge,
                      )),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(4),
              child: Divider(
                color: AppTheme.mcDarkGreyColor,
              ),
            ),
            const CategoryWidget()
          ],
        ),
      ),
    );
  }
}
