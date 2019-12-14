//import 'package:flutter/services.dart';
//import 'package:flutter_test/flutter_test.dart';
//import 'package:shopping_cart/shopping_cart.dart';
//
//void main() {
//  const MethodChannel channel = MethodChannel('shopping_cart');
//
//  setUp(() {
//    channel.setMockMethodCallHandler((MethodCall methodCall) async {
//      return '42';
//    });
//  });
//
//  tearDown(() {
//    channel.setMockMethodCallHandler(null);
//  });
//
//  test('getPlatformVersion', () async {
//    expect(await ShoppingCart.platformVersion, '42');
//  });
//}
