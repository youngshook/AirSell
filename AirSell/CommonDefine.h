//
//  CommonDefine.h
//  AirSell
//
//  Created by YoungShook on 14-4-28.
//  Copyright (c) 2014年 qfpay. All rights reserved.
//

#ifndef AirSell_CommonDefine_h
#define AirSell_CommonDefine_h

#pragma Printf C type

#define lg(value)  DLog(@"%@",[@(value) description]);

#pragma mark -
#pragma mark Umeng and weixin setting

#define UmengCrashEnable 1
#define UmengLogEnable 0
#define UmengChannelId  @"FirEnt"
#define UmengAppKey  @"5279e7eb56240b826501cf50"
#define WXAppKey @"wx8fa0f7931d181217"

#define QiNiuAK @"vdc6zqJGZLdU2z_lXXBJ_NLXK-M18XQ2Y7E5cyjb"
#define QiNiuSK @"iANjdgatLuHhmXVTE5ibQ5OnIfg8AqKbWzYI-HXr"

#define ShareSDKKey @"10cb8869fcf0"

#define SinaWeiboKey @"3490416051"
#define SinaWeiboSecret @"938532be903f67849869929dfca8d277"

#define QQSpaceKey @"101004970"
#define QQSpaceSecret @"eac2b4760fc4c2a18b77f1bf16c95cb9"

#define TencentWeiBoKey @"801481004"
#define TencentWeiBoSecret @"0e59ab8600ca86422d9f36ca1eb1280e"

#define FONT(x) [UIFont systemFontOfSize:x]

//documents structure of application
#define APP_DOCUMENT                [NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define APP_LIBRARY                 [NSSearchPathForDirectoriesInDomains (NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define APP_CACHES_PATH             [NSSearchPathForDirectoriesInDomains (NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define APP_USERINFO_PATH           userInfoPath()


#pragma mark -
#pragma mark Common Define

#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

#define AppVersionShort [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define AppVersionBuild [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define AppVersion      [NSString stringWithFormat:@"%@.%@",AppVersionShort,AppVersionBuild]

#define Deveice  (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)?@"iPad":@"iPhone"

#define iPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define USER_DEFAULTS [NSUserDefaults standardUserDefaults]

#define ImageFromRAM(_pointer) [UIImage imageNamed:_pointer]
#define ImageFromFile(_pointer) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:_pointer ofType:nil]]

#define VIEWWITHTAG(_OBJECT, _TAG) [_OBJECT viewWithTag : _TAG]

#define degreesToRadian(x) (M_PI * (x) / 180.0)
#define radianToDegrees(radian) (radian*180.0)/(M_PI)

#define NSStringFromValue(value) [@(value) description]

#define CLEARCOLOR [UIColor clearColor]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGBLOG(RGBValue) NSLog(@"%f %f %f",((float)((RGBValue & 0xFF0000) >> 16)),((float)((RGBValue & 0xFF00) >> 8)),((float)(RGBValue & 0xFF)))

//粉色
#define kColorPink  UIColorFromRGB(0xf8949a)
//桃红
#define kColorPeach UIColorFromRGB(0xed6160)
//棕色
#define kColorBrown RGBACOLOR(60,35,19,1)


#define BBlockWeakObject(o) __weak __typeof__((__typeof__(o))o)
#define BBlockWeakSelf BBlockWeakObject(self)

#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;

#define GCDBACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define GCDMAIN(block) dispatch_async(dispatch_get_main_queue(),block)

//国际化
#define LOCALIZE_STRING(key) NSLocalizedString(key, @"");

//判断字符串是否为空
#define IS_NULL_STRING(__POINTER) \
(__POINTER == nil || \
__POINTER == (NSString *)[NSNull null] || \
![__POINTER isKindOfClass:[NSString class]] || \
![__POINTER length])

#pragma mark - Version  functions

#define SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#pragma mark -
#pragma mark - Devices functions

#define iOS7_OR_HIGHER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)

#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define isSimulator (NSNotFound != [[[UIDevice currentDevice] model] rangeOfString:@"Simulator"].location)

#define iOS_Version [UIDevice currentDevice].systemVersion
#define isFisrtLaunch [[NSUserDefaults standardUserDefaults] boolForKey:@"alreadyFirstLaunch"]
#define isQPOSUser !IS_NULL_STRING([QFUser shared].session)

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

#define saveValue(value,key) if(value && value.length > 0) [USER_DEFAULTS setValue:value forKey:key]

#pragma mark -
#pragma mark - Based compiler

#if TARGET_OS_IPHONE
//iPhone Device
#endif

#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif

//ARC
#if __has_feature(objc_arc)
//compiling with ARC
#else
// compiling without ARC
#endif

#endif
