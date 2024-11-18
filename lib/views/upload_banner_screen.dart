import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:onlinestoreweb/controllers/banner_controller.dart';
import 'package:onlinestoreweb/theme.dart';
import 'package:onlinestoreweb/views/widgets/custom_widgets/banner_widget.dart';

class UploadBannerScreen extends StatefulWidget {
    static const String id = 'bannerScreen';

  const UploadBannerScreen({super.key});

  @override
  State<UploadBannerScreen> createState() => _UploadBannerScreenState();
}

class _UploadBannerScreenState extends State<UploadBannerScreen> {
  //For Validation EditTexts
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final BannerController _bannerController = BannerController();
  dynamic  _bannerImage;
  
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
              'Banners',
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
                          child: _bannerImage != null
                              ? Image.memory(_bannerImage)
                              : const Text('Banners Image',
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
                            pickImageBanner();
                          },
                          child: Text(
                            'Pic Image',
                            style: Theme.of(context).textTheme.labelLarge,
                          )),
                    ),
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8),
                //   child: SizedBox(
                //     width: 200,
                //     child: TextFormField(
                //         onChanged: (value) {
                //           categoryName = value;
                //         },
                //         validator: (value) {
                //           if (value!.isNotEmpty) {
                //             return null;
                //           } else {
                //             return 'Please Enter Banners Name';
                //           }
                //         },
                //         decoration: InputDecoration(
                //           //fillColor: AppTheme.mcTextFormFieldBackColor,
                //           //filled: true,
                //           //border: OutlineInputBorder(
                //           //borderRadius: BorderRadius.circular(20)),
                //           //focusedBorder: InputBorder.none,
                //           //enabledBorder: InputBorder.none,
                //           labelText: 'Enter Banners Name',
                //           labelStyle: Theme.of(context).textTheme.bodySmall,
                //         )),
                //   ),
                // ),
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
                        _bannerController.uploadCategory(
                            pickedImage: _bannerImage,
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
            const BannerWidget()
          ],
        ),
      ),
    );
  }
}
