//
//  CDVAdfurikun.h
//  MovieRewardSample
//
//  Created by Junhua Li on 2018/06/03.
//

#import <Cordova/CDV.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <ADFMovieReward/ADFmyMovieReward.h>
#import <ADFMovieReward/ADFmyMovieInterstitial.h>
#import <ADFMovieReward/ADFmyMovieNative.h>
#import <ADFMovieReward/ADFmyMovieNativeAdView.h>
#import <ADFMovieReward/ADFMovieOptions.h>
#import <ADFMovieReward/ADFmyMovieNativeAdFlex.h>

@interface CDVAdfurikun: CDVPlugin
- (void)sayHello:(CDVInvokedUrlCommand *)command;
- (void)initWithAppID:(CDVInvokedUrlCommand *)command;
- (void)showReward:(CDVInvokedUrlCommand *)command;

// weird
- (void)resetInitCallbackId:(CDVInvokedUrlCommand *)command;

@end
