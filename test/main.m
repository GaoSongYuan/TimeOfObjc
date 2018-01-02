//
//  main.m
//  test
//
//  Created by Song on 2017/12/5.
//  Copyright © 2017年 Song. All rights reserved.
//

#import <Foundation/Foundation.h>

// C语言函数 声明：
void string2date();
void string2date2();
void string2date3();
void string2date4();
void date2string();
void getComponentsOfDate();

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        getComponentsOfDate();
        
    }
    return 0;
}

// 获取日期元素 ： 年月日时分秒
void getComponentsOfDate() {
    // 时间字符串
    NSString *str = @"2017-12-28 14:30:19";
    
//    NSString *month = [str substringWithRange:NSMakeRange(5, 2)]; // 截串
//    NSDateFormatter *dfm = [[NSDateFormatter alloc] init];
//    dfm.dateFormat = @"MM";
//    NSDate *monthDate = [dfm dateFromString:month];
//    NSLog(@"%@",month);
//    NSLog(@"%@",monthDate);

    // 先转成 NSDate
    NSDateFormatter *dfm = [[NSDateFormatter alloc] init];
    dfm.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [dfm dateFromString:str];
    NSLog(@"%@",date); // Thu Dec 28 14:30:19 2017
    
    // 利用 NSCalendar 处理日期
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 只取出一个 月份
    NSInteger month = [calendar component:NSCalendarUnitMonth fromDate:date];
    NSLog(@"%zd",month);
    
    // 取出 年月日
    NSDateComponents *cmps = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    NSLog(@"%zd - %zd - %zd",cmps.year,cmps.month,cmps.day);
    NSLog(@"%@",cmps);
}

// 日期转成字符串
void date2string() {
    NSDate *date = [NSDate date]; // 直接获取到程序运行时的时间
    NSLog(@"%@",date);
    
    NSDateFormatter *dfm = [[NSDateFormatter alloc] init];
    
    // 设置格式
    dfm.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSString *str = [dfm stringFromDate:date];
    
    NSLog(@" == %@ == ",str);
}

// 时间戳
// 从1970年1月1号 00:00:00开始走过的毫秒数
void string2date4() {
    // 时间字符串
    NSString *string = @"784341699999";
    NSTimeInterval second = string.longLongValue / 1000.0; // 准换成 秒
    
    // 时间戳 -> NSDate
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:second];
    NSLog(@"%@",date); // Wed Nov  9 08:41:39 1994
}

// 欧美格式的时间
void string2date3() {
    NSString *createdTimeString = @"Wed Dec 27 20:10:34 +0000 2017"; // 欧美格式的时间
    
    NSDateFormatter *dfm = [[NSDateFormatter alloc] init];
    dfm.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    dfm.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]; // 设置语言区域
    NSDate *createdTimeDate = [dfm dateFromString:createdTimeString];
    
    NSLog(@"%@",createdTimeDate);
}

// 混乱格式的时间
void string2date2() {
    // 发帖时间
    NSString *createdTimeString = @"12月/27日/2017年 20-10:34秒"; // 混乱格式的时间
    
    NSDateFormatter *dfm = [[NSDateFormatter alloc] init];
    dfm.dateFormat = @"MM月/dd日/yyyy年 HH-mm:ss秒";
    NSDate *createdTimeDate = [dfm dateFromString:createdTimeString];
    
    NSLog(@"%@",createdTimeDate);
}

// 字符串转成日期
void string2date() {
    // 发帖时间
    NSString *createdTimeString = @"2017-12-27 20:10:34";
    
    /*
     NSDateFormatter的作用：
         1.NSString -> NSDate
         2.NSDate -> NSString
     */
    NSDateFormatter *dfm = [[NSDateFormatter alloc] init];
    
    // 设置日期格式（为了转换成功）
    dfm.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    // 传入一个string ，将string转为date类型
    NSDate *createdTimeDate = [dfm dateFromString:createdTimeString];
    
    // 手机当前时间
    NSDate *nowTimeDate = [NSDate date];
    
    NSLog(@"\n %@ \n %@",createdTimeDate,nowTimeDate);
    
}

