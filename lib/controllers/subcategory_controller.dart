import 'dart:convert';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:onlinestoreweb/global_variable.dart';
import 'package:http/http.dart' as http;
import 'package:onlinestoreweb/models/subcategory_model.dart';
import 'package:onlinestoreweb/services/manage_http_response.dart';

class SubCategoryController {
  uploadSubCategory(
      {required String categoryId,
      required String categoryName,
      required String subCategoryName,
      required dynamic pickedImage,
      required context}) async {
    try {
      final cloudinary = CloudinaryPublic('dohf5fjw0', 'hwftxi6k');

      //Upload the images
      CloudinaryResponse imageResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(pickedImage,
            identifier: 'pickedImage', folder: 'categoryImages'),
      );
      String image = imageResponse.secureUrl;

      SubCategoryModel categoryModel = SubCategoryModel(
          id: '',
          categoryId: categoryId,
          categoryName: categoryName,
          subCategoryName: subCategoryName,
          image: image);

      http.Response response = await http.post(
          Uri.parse("$uri/api/subcategory"),
          body: categoryModel.toJson(),
          headers: <String, String>{
            "Content-Type": 'application/json; charset=UTF-8'
          });

      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Uploaded subcategory');
          });
    } catch (e) {
      print('Error uploading to cloudinary: $e');
    }
  }

  //Get Categories
  Future<List<SubCategoryModel>> loadSubCategories() async {
    try {
      http.Response response = await http.get(Uri.parse('$uri/api/subcategory'),
          headers: <String, String>{
            "Content-Type": 'application/json; charset=UTF-8'
          });

      //print(response.body);
      if (response.statusCode == 200) {
        //Ok
        //Get data from model constructor
        final List<dynamic> data = jsonDecode(response.body);
        List<SubCategoryModel> categories = data
            .map((subcategory) => SubCategoryModel.fromJson(subcategory))
            .toList();
        return categories;
      } else {
        //Throw an exception if the server responded with an error status code
        throw Exception('Failed to load Categories');
      }
    } catch (e) {
      throw Exception('Error loading Categories: $e');
    }
  }
}
