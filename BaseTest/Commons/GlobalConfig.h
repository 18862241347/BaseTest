
//
//  GlobalConfig.h
//  OrderPhone
//
//  Created by 蒋玉顺 on 15-11-8.
//  Copyright (c) 2015年 蒋玉顺. All rights reserved.
//


#ifndef OrderPhone_Global_h
#define OrderPhone_Global_h



#define SCREEN_SIZE   [[UIScreen mainScreen] bounds].size             //屏幕宽度
#define SCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width             //屏幕宽度
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height           //屏幕高度
#define SCREEN_BOUNDS [[UIScreen mainScreen] bounds]                       //屏幕尺寸
#define STATUSBAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height                       // 状态栏高度


#define  Ratio_4S SCREEN_WIDTH /320.0   //当前屏幕以4s位标准的比例
#define  Ratio_6  SCREEN_WIDTH /375.0   //当前屏幕以6位标准的比例
#define  Ratio_X  ((SCREEN_HEIGHT == 812)?88:64)


#define NavTopHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?88:64) // 导航高度







#ifdef DEBUG
#  define DLog(fmt, ...) do { NSString* file = [[NSString alloc] initWithFormat:@"%s", __FILE__]; NSLog((@"%@(%d) " fmt), [file lastPathComponent], __LINE__, ##__VA_ARGS__);  } while(0)
#  define DLog_METHOD NSLog(@"%s", __func__)
#  define DLog_CMETHOD NSLog(@"%@/%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd))
#  define COUNT(p) NSLog(@"%s(%d): count = %d/n", __func__, __LINE__, [p retainCount]);
#  define DLog_TRACE(x) do {printf x; putchar('/n'); fflush(stdout);} while (0)
#else
#  define DLog(...)
#  define DLog_METHOD
#  define DLog_CMETHOD
#  define COUNT(p)
#  define DLog_TRACE(x)
#endif



#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self




//  颜色
#define  UICOLOR_HEX(hexColor) \
[UIColor colorWithRed: (((hexColor >> 16) & 0xFF)) / 255.0f green: (((hexColor >> 8) & 0xFF)) / 255.0f blue: ((hexColor & 0xFF)) / 255.0f alpha:1.0f]


#define kAppRedColor             UICOLOR_HEX(0xFF0000)
#define kAppGrayColor            UICOLOR_HEX(0x909090)
#define kAppBlueColor            UICOLOR_HEX(0x0690D8)
#define kAppBlackColor           UICOLOR_HEX(0x323232)
#define kAppWhiteColor           UICOLOR_HEX(0xFFFFFF)
#define kAppYellowColor          UICOLOR_HEX(0xCE6E0F)
#define AppBackGroundColor       UICOLOR_HEX(0xF0F0F0)
#define kAppLineBackgroundColor1 UICOLOR_HEX(0xE1E1E1) //内分割线常规色值
#define kAppLineBackgroundColor2 UICOLOR_HEX(0xD6D7DC) //外分割线常规色值







//真实地址
//#define APP_BASE_URL @"http://192.168.188.93/"
//#define APP_SERVICE_BASE_URL @"http://192.168.188.93/qishi/shop/mobile/index.php?"


//测试地址
#define APP_BASE_URL @"http://115.28.189.247/"
#define APP_SERVICE_BASE_URL @"http://115.28.189.247/qishi/shop/mobile/index.php?"


#define SECRET_KEY @"sm_app2016_en"

#define server_return_Data @"data"
#define server_return_Code @"code"
#define server_return_SusseccCode 0
#define server_return_UnLogIn 510
#define server_return_Message @"msg"
#define server_return_Result @"result"
#define server_return_error  -100

#define server_state @"server_state"







#define goodsMinCount 1      //每一种商品一次最少件数
#define goodsMaxCount 1000   //每一种商品一次最多件数
#define DefaultValue   9999  // 默认值
#define kAppLineHEIGHT @0.5  //分割线高度




#define USER_LOGIN_INFO @"userLoginInfo"
#define SelectCityName  @"XZSelectCityName"
#define PAGE_MAX_NUM  10












/*******支付宝********/
#define AliPay_partner @"2088021653838091"
#define AliPay_seller @"13402182225@163.com"
#define AliPay_notifyURL @"http://118.178.233.219/app/shopPay/alipay/notify_url.php"
#define AliPay_privateKey @"MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAL9RtftZwdAESJeKdurz7NXvdTvRFJjP4P8IftvJ1CLR8IM/CD37kpvCG3loeT5uT6HcUwaKyfpaggDAEhWIzW8orxLdNjDCuoVTx1GKMgGpv6aptyfxF6mcDU5L/92ld8t5pMwVECVjpN3D1K7yvTwqlPajOiv3NAk9v9nnAbCnAgMBAAECgYAN54ddVCGk15rbAKIx4zZ0OeoARerETF9iyaBGov165l0ffMZBkvYNweazRSeCpQu+jL+v+whA3LEUEuF9lSqw6EvbsKsbA+851mqNmAv7mrqKdx85x5QdS7ZVXGnR4/kk0Rq/MIS9MP4amQXkuJ2l2XHMS791cKxpMXytDN6CKQJBAOJQKTBbmcawe2pESZAbW109000IQ0RwUadGFTEG2Tv8QcAFxpHnzykCqbZ93FyDtShusnF6kEtFL9rw2pbEoZ0CQQDYampfXFqEK0Ra5friTQ+bIdJppyis+1uezUro0QM9n2YhfC1g+lgtqiBR5Q13g9XZ6VScnKl6RzeqMUXa0toTAkAKxUPgkEt2QEnvWcaifBrSCjI3NVB2Pl40dsplZe0KxMugRuYXZY/fZMgM7lqBcKc7gGEvs2SQoH9RjSrqB/ulAkEAgEpFGJakyejkMoZWvUQ1Vh8snpkLEdBHtdG48F7G7wbJAlycgfqlvxw04JdJ7mlmojEhiV2NUgFZzDg9UsTfpQJBAMbNdMG0DlempDPAZk2ENykUDPr4gfb5U6a2gS538/TSZcwZvvnqy4naDauG5tPFYDf1qeZ17z+GZMcMm8hYh5U="





/*******微信********/

//微信AppID
#define weixin_AppId @"wxdd1d48de897ef316"














#endif

