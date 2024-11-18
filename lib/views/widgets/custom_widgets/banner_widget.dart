import 'package:flutter/material.dart';
import 'package:onlinestoreweb/controllers/banner_controller.dart';
import 'package:onlinestoreweb/models/bannr_model.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  //A future that will hold list of banners once loaded from API
  late Future<List<BannerModel>> futuresBanner;

  @override
  void initState() {
    super.initState();
    futuresBanner = BannerController().loadBanners();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futuresBanner,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No Banners'),
            );
          } else {
            final banners = snapshot.data!;
            return GridView.builder(
                shrinkWrap: true,
                itemCount: banners.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                itemBuilder: (context, index) {
                  final banner = banners[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      banner.image,
                      width: 100,
                      height: 100,
                    ),
                  );
                });
          }
        });
  }
}
