//
//  CDVAdfurikun.m
//  MovieRewardSample
//
//  Created by Junhua Li on 2018/06/03.
//

#import "CDVAdfurikun.h"

@interface CDVAdfurikun ()<ADFmyMovieRewardDelegate>
@property (nonatomic, strong)ADFmyMovieReward *MovieReward;
@property (nonatomic, copy)NSString * callbackIdForInit;
@property (nonatomic, copy)NSString * callbackIdForAd;
@end

@implementation CDVAdfurikun

- (void)sayHello:(CDVInvokedUrlCommand *)command {
    NSLog(@" == hello ===");
}
    
- (void)initWithAppID:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult = nil;
    NSString* appId = [command.arguments objectAtIndex:0];
    _callbackIdForInit = [NSString stringWithString:command.callbackId];
    
    if (appId != nil && [appId length] > 0) {
        _MovieReward = nil;
        UIViewController *uiViewController = super.viewController;
        [ADFmyMovieReward initWithAppID:appId viewController:uiViewController];
        _MovieReward = [ADFmyMovieReward getInstance:appId delegate:self];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)showReward:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult = nil;
    NSString* appId = [command.arguments objectAtIndex:0];
    _callbackIdForAd = [NSString stringWithString:command.callbackId];
    
    if (appId != nil && [appId length] > 0) {
        if (self.MovieReward && [self.MovieReward isPrepared]) {
            UIViewController *uiViewController = super.viewController;
            [self.MovieReward playWithPresentingViewController:uiViewController];
        }
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)resetInitCallbackId:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult = nil;
    NSString* appId = [command.arguments objectAtIndex:0];
    _callbackIdForInit = [NSString stringWithString:command.callbackId];
    
    if (appId != nil && [appId length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"reset OK"];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

#pragma mark - ADFmyMovieRewardDelegate
/**< 広告の表示準備が終わった時のイベント */
- (void)AdsFetchCompleted:(NSString *)appID isTestMode:(BOOL)isTestMode_inApp {
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"init OK"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackIdForInit];
}

/**< 広告の表示が開始した時のイベント */
- (void)AdsDidShow:(NSString *)appID adNetworkKey:(NSString *)adNetworkKey {
    
}

/**< 広告の表示が最後まで終わった時のイベント */
- (void)AdsDidCompleteShow:(NSString *)appID {
}

/**< 動画広告再生エラー時のイベント */
- (void)AdsPlayFailed:(NSString *)appID {
    
}

/**< 広告を閉じた時のイベント */
- (void)AdsDidHide:(NSString *)appID {
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"reward OK"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackIdForAd];
}


@end
