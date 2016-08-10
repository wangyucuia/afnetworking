//
//  ClearnMyApp.h
//  afnetworking
//
//  Created by 王玉翠 on 16/8/8.
//  Copyright © 2016年 王玉翠. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClearnMyApp : NSObject

//获取文件夹尺寸
+(NSInteger)getFileSize:(NSString *)directortPath;


//删除文件夹所有文件
+(void)removeDirctoryPaty:(NSString *)directoryPah;



@end
