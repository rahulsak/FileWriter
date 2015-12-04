//
//  FileWriter.m
//  CustomPlugin
//
//  Created by appMobi Mac Dev Machine on 12/4/15.
//
//

#import "FileWriter.h"

@implementation FileWriter

-(void)cordovaGetFileContents:(CDVInvokedUrlCommand *)command
{
    NSString *dateStr = [self getFileContents];
    
    NSDictionary *jsonObj = [[NSDictionary alloc] initWithObjectsAndKeys:
                             dateStr,@"dateStr",
                             @"true", @"success",nil];
    
    
    
    CDVPluginResult *pluginResult = [CDVPluginResult
                                     resultWithStatus: CDVCommandStatus_OK
                                    messageAsDictionary:jsonObj];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void) cordovaSetFileContents:(CDVInvokedUrlCommand *)command {

    NSString *dateStr = [command.arguments objectAtIndex:0];
    
    
    [self setFileContents: dateStr];
    
    // Create an object with a simple success property.
    NSDictionary *jsonObj = [ [NSDictionary alloc]
                             initWithObjectsAndKeys :
                             @"true", @"success",
                             nil
                             ];
    
    CDVPluginResult *pluginResult = [ CDVPluginResult
                                     resultWithStatus    : CDVCommandStatus_OK
                                     messageAsDictionary : jsonObj
                                     ];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

#pragma mark - Util_Methods

- (void) setFileContents:(NSString *)fileContents {
    

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fileName = [NSString stringWithFormat:@"%@/myTextFile.txt", documentsDirectory];
    
    [fileContents writeToFile : fileName
                  atomically  : NO
                  encoding    : NSStringEncodingConversionAllowLossy
                  error       : nil];
}


- (NSString *) getFileContents{
    

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fileName = [NSString stringWithFormat:@"%@/myTextFile.txt", documentsDirectory];
    

    NSString *fileContents = [[NSString alloc]
                              initWithContentsOfFile : fileName
                              usedEncoding           : nil
                              error                  : nil
                              ];
    return fileContents;
}



@end
