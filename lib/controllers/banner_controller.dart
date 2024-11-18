import 'dart:convert';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:onlinestoreweb/global_variable.dart';
import 'package:onlinestoreweb/models/bannr_model.dart';
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
class BannerController {
  uploadCategory({required dynamic pickedImage, required context}) async {
    try {
      final cloudinary = CloudinaryPublic('dohf5fjw0', 'hwftxi6k');

      //Upload the images
      CloudinaryResponse imageResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(pickedImage,
            identifier: 'pickedImage', folder: 'bannerImages'),
      );
      String image = imageResponse.secureUrl;

      BannerModel bannerModel = BannerModel(
        id: "",
        image: image,
      );

      http.Response response = await http.post(Uri.parse("$uri/api/banner"),
          body: bannerModel.toJson(),
          headers: <String, String>{
            "Content-Type": 'application/json; charset=UTF-8'
          });

      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Uploaded Banner');
          });
    } catch (e) {
      print('Error uploading to cloudinary: $e');
    }
  }

  //Get Banners
  Future<List<BannerModel>> loadBanners() async {
    try {
      http.Response response = await http.get(Uri.parse("$uri/api/banner"),
          headers: <String, String>{
            "Content-Type": 'application/json; charset=UTF-8'
          });

      print(response.body);
      if (response.statusCode == 200) {
        //Ok
        //Get data from model constructor
        List<dynamic> data = jsonDecode(response.body);
        List<BannerModel> banners =
            data.map((banner) => BannerModel.fromJson(banner)).toList();
        return banners;
      }else{
        //Throw an exception if the server responded with an error status code
        throw Exception('Failed to load Banners');
      }
    } catch (e) {
      throw Exception('Error loading Banners: $e');
    }
  }
}
