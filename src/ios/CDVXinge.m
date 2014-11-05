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

#import "CDVXinge.h"
#import "XGPush.h"
#import "StaticVariables.h"
#import <Cordova/CDV.h>

@implementation CDVXinge

-(void) registerDevice: (CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    [XGPush registerDevice: [StaticVariables staticInstance].deviceToken];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void) startApp: (CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;    
    uint32_t appId = [[command.arguments objectAtIndex:0] intValue];
    NSString* appKey = [command.arguments objectAtIndex:1];
    
    if (appId != 0 && appKey != nil) {
        @try {

            [XGPush startApp:appId appKey:appKey];

            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:exception.userInfo.description];
        }
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"appId or appKey is tempty."];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];}

-(void) setAccount:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    @try {
        NSString* account = [command.arguments objectAtIndex: 0];

        [XGPush setAccount: account];

        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString: exception.userInfo.description];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void) getToken:(CDVInvokedUrlCommand *)command{
    CDVPluginResult* pluginResult = nil;
    @try {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: [StaticVariables staticInstance].deviceTokenStr];
    }
    @catch (NSException *exception) {
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString: exception.userInfo.description];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void) unregister:(CDVInvokedUrlCommand *)command{
    CDVPluginResult* pluginResult = nil;
    [XGPush unRegisterDevice];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}

-(void) setBadge:(CDVInvokedUrlCommand *)command{
    
    CDVPluginResult* pluginResult = nil;
    @try {
        
        int badge = [[command.arguments objectAtIndex:0] intValue];
        [UIApplication sharedApplication].applicationIconBadgeNumber = badge;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    @catch (NSException *exception) {
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString: exception.userInfo.description];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
