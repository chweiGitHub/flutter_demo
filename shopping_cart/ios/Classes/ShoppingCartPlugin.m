#import "ShoppingCartPlugin.h"
#import <shopping_cart/shopping_cart-Swift.h>

@implementation ShoppingCartPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftShoppingCartPlugin registerWithRegistrar:registrar];
}
@end
