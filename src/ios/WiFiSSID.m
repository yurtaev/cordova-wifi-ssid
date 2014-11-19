#import "WiFiSSID.h"
#import <Cordova/CDV.h>
#import "SystemConfiguration/CaptiveNetwork.h"

@implementation WiFiSSID

- (void)getSSID:(CDVInvokedUrlCommand*)command
{
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    NSLog(@"Supported interfaces: %@", ifs);
    NSDictionary *info = nil;
    NSDictionary *data = nil;
    NSString *ifnam = @"";
    for (ifnam in ifs) {
        info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        NSLog(@"%@", [info valueForKey:@"SSID"]);
        if ([info allKeys] != nil) {
            data = @{
                @"SSID" : info[@"SSID"],
                @"BSSID" : info[@"BSSID"]
            };
        }
    }

    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:data];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
