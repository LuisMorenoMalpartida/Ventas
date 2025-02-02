import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/home_screen.dart';
import '../screens/product_list_screen.dart';
import '../screens/product_detail_screen.dart';
import '../screens/sell_product_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/welcome.dart';
import '../screens/buyer_home.dart';
import '../screens/buyer_profile.dart';
import '../screens/buyer_orders.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    '/login': (context) => LoginScreen(),
    '/register': (context) => RegisterScreen(),
    '/home': (context) => HomeScreen(),
    '/products': (context) => ProductListScreen(),
    '/product-detail': (context) => ProductDetailScreen(),
    '/sell-product': (context) => SellProductScreen(),
    '/profile': (context) => ProfileScreen(),
    '/welcome': (context) => WelcomeScreen(),
    '/buyer_home': (context) => BuyerHomeScreen(),
    '/buyer_profile': (context) => BuyerProfileScreen(),
    '/buyer_orders': (context) => BuyerOrdersScreen(),
  };
}