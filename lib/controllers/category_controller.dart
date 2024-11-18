import 'dart:convert';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:onlinestoreweb/global_variable.dart';
import 'package:onlinestoreweb/models/category_model.dart';
import 'package:http/http.dart' as http;
import 'package:onlinestoreweb/services/manage_http_response.dart';

//This class use for upload photoes
//https://console.cloudinary.com/pm/c-a1c5dd7864cebae7ac5c8a3493efe3/developer-dashboard
//Login/Get Started/Dashboard/"Cloud name" is for first parameter : 'dohf5fjw0'
//Go to APi Keys/Upload Presets/Add Upload Preset/Go to legacy/
//signing mode => unsigned
//"Upload preset name" is for second parameter : 'hwftxi6k'
//Save
//After running code you can see your photoes in sidebar/assets/assets
//https://git.ir/udemy-flutter-nodejs-express-mongodb-build-multi-store-app/
//Video 88-89
//Package : cloudinary_public: ^0.23.1
class CategoryController {
  uploadCategory(
      {required dynamic pickedImage,
      required dynamic pickedBanner,
      required String name,
      required context}) async {
    try {
      final cloudinary = CloudinaryPublic('dohf5fjw0', 'hwftxi6k');

      //Upload the images
      CloudinaryResponse imageResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(pickedImage,
            identifier: 'pickedImage', folder: 'categoryImages'),
      );
      String image = imageResponse.secureUrl;

      //Upload the banners
      CloudinaryResponse bannerResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(pickedBanner,
            identifier: 'pickedBanner', folder: 'categoryImages'),
      );

      String banner = bannerResponse.secureUrl;

      CategoryModel categoryModel =
          CategoryModel(id: "", name: name, image: image, banner: banner);

      http.Response response = await http.post(Uri.parse("$uri/api/category"),
          body: categoryModel.toJson(),
          headers: <String, String>{
            "Content-Type": 'application/json; charset=UTF-8'
          });

      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Uploaded Category');
          });
    } catch (e) {
      print('Error uploading to cloudinary: $e');
    }
  }

  //Get Categories
  Future<List<CategoryModel>> loadCategories() async {
    try {
      http.Response response = await http.get(Uri.parse('$uri/api/category'),
          headers: <String, String>{
            "Content-Type": 'application/json; charset=UTF-8'
          });

      //print(response.body);
      if (response.statusCode == 200) {
        //Ok
        //Get data from model constructor
        final List<dynamic> data = jsonDecode(response.body);
        List<CategoryModel> categories =
            data.map((category) => CategoryModel.fromJson(category)).toList();
        return categories;
      }else{
        //Throw an exception if the server responded with an error status code
        throw Exception('Failed to load Categories');
      }
    } catch (e) {
      throw Exception('Error loading Categories: $e');
    }
  }
}
