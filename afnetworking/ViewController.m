//
//  ViewController.m
//  afnetworking
//
//  Created by 王玉翠 on 16/8/3.
//  Copyright © 2016年 王玉翠. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "ClearnMyApp.h"
#import "Cookie.h"
#import "Carousel.h"
#pragma mark ---获取设备的IP地址
#import "SecondViewController.h"
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <net/if.h>
#define CachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]


#define IOS_CELLUlAR   @"pdp_ip0"
#define IOS_WIFI       @"en0"
#define IOS_VPN        @"utun0"
#define IP_ADDR_IPv4   @"ipv4"
#define IP_ADDR_IPv6   @"ipv6"


@interface ViewController ()
@property (nonatomic, assign) NSInteger totalSize;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self detectionOfNetworkState];
    
    [self huancun];
    //IP地址
    NSString *string = [ViewController getIPAddress:YES];
    NSLog(@"========= %@",string);
    
    //身份证号返回性别
    NSString *sex=[self sexStrFromIdentityCard:@"139876456767892345"];
    NSLog(@"--sex--%@",sex);
    
    
    
    
    _textView.textContainer.lineFragmentPadding = 0;
    _textView.textContainerInset = UIEdgeInsetsZero;
//    // Do any additional setup after loading the view, typically from a nib.
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"mobile"] = @"1566899000";
    params[@"password"] = @"111";

    [session POST:@"http://baidu.com" parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
      //cart/shopCart_shopcartlist?
        
        [Cookie saveCookie];
        
//        NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
//        for (NSHTTPCookie *cookie in [cookieJar cookies]) {
//            NSLog(@"%@", cookie);
//        }
        AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    //CF217D15679DC2BD3EE223597B23A363
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"userId"] = @"388";
       [session POST:@"http://baidu.com" parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
           
       } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           NSLog(@"%@",responseObject);
           NSLog(@"sssss成功");
           
           AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
      [session POST:@"http://baidu.com" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
          
      } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
          NSLog(@"kkkkkkkss成功");

      } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          NSLog(@"kkkkkkkss失败");

      }];
           
           
           
       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           NSLog(@"sssss失败");

       }];
        

        //NSLog(@"成功");

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        NSLog(@"失败");

    }];

    


    NSArray *array = @[@"1.png",@"2.png",@"3.png",@"4.png"];
    Carousel *carous = [[Carousel alloc] initWithFrame:CGRectMake(0, 0, 300, 300)andArray:array];
//    carous.images = @[@"1.png",@"2.png",@"3.png",@"4.png"];
    carous.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:carous];
    
}


-(void)huancun{
    
   _totalSize =   [ClearnMyApp getFileSize: CachePath];
    
 
        
       // _totalSize = totolsize;
        [self xianshi];

  
    
}

// 获取缓存尺寸字符串
- (NSString *)sizeStr
{
    NSInteger totalSize = _totalSize;
    NSString *sizeStr = @"清除缓存";
    // MB KB B
    if (totalSize > 1000 * 1000) {
        // MB
        CGFloat sizeF = totalSize / 1000.0 / 1000.0;
        sizeStr = [NSString stringWithFormat:@"%@(%.1fMB)",sizeStr,sizeF];
    } else if (totalSize > 1000) {
        // KB
        CGFloat sizeF = totalSize / 1000.0;
        sizeStr = [NSString stringWithFormat:@"%@(%.1fKB)",sizeStr,sizeF];
    } else if (totalSize > 0) {
        // B
        sizeStr = [NSString stringWithFormat:@"%@(%.ldB)",sizeStr,totalSize];
    }
    
    return sizeStr;
}


-(void)xianshi{
    
    UIButton *lable = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 300, 300)];
    [lable setTitle:[self sizeStr] forState:UIControlStateNormal];
    lable.backgroundColor = [UIColor orangeColor];
    [lable addTarget:self action:@selector(qingchu) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lable];
}

-(void)qingchu{
    
    [ClearnMyApp removeDirctoryPaty:CachePath];
    // 删除缓存之后,文件大小显示为0
    _totalSize = 0;
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [Cookie takeOutCookie];
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    //CF217D15679DC2BD3EE223597B23A363
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"userId"] = @"388";
    [session POST:@"http://10.10.50.69:8080/popLife-web/member/coupon_getCouponList" parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        NSLog(@"sssss成功");
        
        
        
            
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"kkkkkkkss失败");
            
        }];
    
//    SecondViewController *second = [[SecondViewController alloc] init];
//    [self.navigationController pushViewController:second animated:YES];
    
    
}


//检测网络状态
-(void)detectionOfNetworkState{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
       
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
                break ;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WiFi");
                break ;
            case  AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"手机自带网络");
                break ;
        }
        
        
    }];
    //开始监控
    [manager startMonitoring];
    
}


#pragma mark ---获取当前网络IP地址

+(NSString *)getIPAddress:(BOOL)preferIPv4{
    
    NSArray *searchArray = preferIPv4 ? @[IOS_VPN @"/" IP_ADDR_IPv4, IOS_VPN @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_WIFI @"/"IP_ADDR_IPv6,IOS_CELLUlAR @"/"IP_ADDR_IPv4,IOS_CELLUlAR @"/" IP_ADDR_IPv6]:@[ IOS_VPN @"/" IP_ADDR_IPv6, IOS_VPN @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_CELLUlAR @"/" IP_ADDR_IPv6, IOS_CELLUlAR @"/" IP_ADDR_IPv4] ;
    NSDictionary *addresses = [self getIPAddresses];
    NSLog(@"addresses: %@", addresses);
    
    __block NSString *address;
    [searchArray enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop)
     {
         address = addresses[key];
         //筛选出IP地址格式
         if([self isValidatIP:address]) *stop = YES;
     } ];
    return address ? address : @"0.0.0.0";
    
    
    
    
    
}
+ (BOOL)isValidatIP:(NSString *)ipAddress {
    if (ipAddress.length == 0) {
        return NO;
    }
    NSString *urlRegEx = @"^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])$";
    
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:urlRegEx options:0 error:&error];
    
    if (regex != nil) {
        NSTextCheckingResult *firstMatch=[regex firstMatchInString:ipAddress options:0 range:NSMakeRange(0, [ipAddress length])];
        
        if (firstMatch) {
            NSRange resultRange = [firstMatch rangeAtIndex:0];
           [ipAddress substringWithRange:resultRange];
            //输出结果
           // NSLog(@"%@",result);
            return YES;
        }
    }
    return NO;
}

+ (NSDictionary *)getIPAddresses
{
    NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];
    
    // retrieve the current interfaces - returns 0 on success
    struct ifaddrs *interfaces;
    if(!getifaddrs(&interfaces)) {
        // Loop through linked list of interfaces
        struct ifaddrs *interface;
        for(interface=interfaces; interface; interface=interface->ifa_next) {
            if(!(interface->ifa_flags & IFF_UP) /* || (interface->ifa_flags & IFF_LOOPBACK) */ ) {
                continue; // deeply nested code harder to read
            }
            const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
            char addrBuf[ MAX(INET_ADDRSTRLEN, INET6_ADDRSTRLEN) ];
            if(addr && (addr->sin_family==AF_INET || addr->sin_family==AF_INET6)) {
                NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
                NSString *type;
                if(addr->sin_family == AF_INET) {
                    if(inet_ntop(AF_INET, &addr->sin_addr, addrBuf, INET_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv4;
                    }
                } else {
                    const struct sockaddr_in6 *addr6 = (const struct sockaddr_in6*)interface->ifa_addr;
                    if(inet_ntop(AF_INET6, &addr6->sin6_addr, addrBuf, INET6_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv6;
                    }
                }
                if(type) {
                    NSString *key = [NSString stringWithFormat:@"%@/%@", name, type];
                    addresses[key] = [NSString stringWithUTF8String:addrBuf];
                }
            }
        }
        // Free memory
        freeifaddrs(interfaces);
    }
    return [addresses count] ? addresses : nil;
}


#pragma mark ----由身份证号返回性别
//由身份证号返回为性别
-(NSString *)sexStrFromIdentityCard:(NSString *)numberStr{
    NSString *result = nil;
    
    BOOL isAllNumber = YES;
    
    if([numberStr length]<17)
        return result;
    
    //**截取第17为性别识别符
    NSString *fontNumer = [numberStr substringWithRange:NSMakeRange(16, 1)];
    NSLog(@"fontNumer ====  %@",fontNumer);
    
    //**检测是否是数字;
    const char *str = [fontNumer UTF8String];
    const char *p = str;
    while (*p!='\0') {
        if(!(*p>='0'&&*p<='9'))
            isAllNumber = NO;
        p++;
    }
    
    if(!isAllNumber)
        return result;
    
    int sexNumber = [fontNumer intValue];
    if(sexNumber % 2==1)
        result = @"男";
    ///result = @"M";
    else if (sexNumber%2==0)
        result = @"女";
    //result = @"F";
    
    return result;
    
    
}
//carousel效果




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
