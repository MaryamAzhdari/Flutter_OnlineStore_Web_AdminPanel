import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:onlinestoreweb/views/buyers_screen.dart';
import 'package:onlinestoreweb/views/categories_screen.dart';
import 'package:onlinestoreweb/views/sub_category_screen.dart';
import 'package:onlinestoreweb/views/widgets/header_widget_sidebar.dart';
import 'package:onlinestoreweb/views/orders_screen.dart';
import 'package:onlinestoreweb/views/products_screen.dart';
import 'package:onlinestoreweb/views/upload_banner_screen.dart';
import 'package:onlinestoreweb/views/vendors_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedString = const SubCategoriesScreen();

  screenSelector(item) {
    switch (item.route) {
      case VendorsScreen.id:
        setState(() {
          _selectedString = const VendorsScreen();
        });
        break;

      case BuyersScreen.id:
        setState(() {
          _selectedString = const BuyersScreen();
        });
        break;

      case OrdersScreen.id:
        setState(() {
          _selectedString = const OrdersScreen();
        });
        break;

      case CategoriesScreen.id:
        setState(() {
          _selectedString = const CategoriesScreen();
        });
        break;

        case SubCategoriesScreen.id:
        setState(() {
          _selectedString = const SubCategoriesScreen();
        });
        break;

      case UploadBannerScreen.id:
        setState(() {
          _selectedString = const UploadBannerScreen();
        });
        break;

      case ProductsScreen.id:
        setState(() {
          _selectedString = const ProductsScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Management"),
      ),
      body: _selectedString,
      sideBar: SideBar(
        header: const HeaderWidgetSideBar(),
        items: const [
          AdminMenuItem(
              title: 'Vendors',
              route: VendorsScreen.id,
              icon: CupertinoIcons.person_3),
          AdminMenuItem(
              title: 'Buyers',
              route: BuyersScreen.id,
              icon: CupertinoIcons.person),
          AdminMenuItem(
              title: 'Orders',
              route: OrdersScreen.id,
              icon: Icons.shopping_cart),
          AdminMenuItem(
              title: 'Categories',
              route: CategoriesScreen.id,
              icon: Icons.category),
              AdminMenuItem(
              title: 'SubCategories',
              route: SubCategoriesScreen.id,
              icon: Icons.upload),
          AdminMenuItem(
              title: 'Upload Banners',
              route: UploadBannerScreen.id,
              icon: CupertinoIcons.upload_circle),
          AdminMenuItem(
              title: 'Products', route: ProductsScreen.id, icon: Icons.store),
        ],
        selectedRoute: VendorsScreen.id,
        onSelected: (item) {
          screenSelector(item);
        },
      ),
    );
  }
}
