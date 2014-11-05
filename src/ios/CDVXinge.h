/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>
#import <Cordova/CDVPlugin.h>

@interface CDVXinge:CDVPlugin{}

//设备编码，由AppDelegete反向设置。
@property (nonatomic) NSString* deviceToken;
//注册设备信息
//+(NSString*)registerDevice:(NSData *)deviceToken;
- (void)registerDevice:(CDVInvokedUrlCommand*)command;
//初始化push信息
- (void)startApp:(CDVInvokedUrlCommand*)command;
//设置别名（帐号）
- (void)setAccount:(CDVInvokedUrlCommand*)command;
//获取设备识别码字符串
- (NSString*)getToken:(CDVInvokedUrlCommand*)command;
//注销设备
- (void)unregister:(CDVInvokedUrlCommand*)command;

@end
