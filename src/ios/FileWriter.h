//
//  FileWriter.h
//  CustomPlugin
//
//  Created by Mac Dev Machine on 12/4/15.
//
//

#import <Cordova/CDV.h>

@interface FileWriter : CDVPlugin

// returns the file content in a JSON object 
- (void) cordovaGetFileContents:(CDVInvokedUrlCommand *)command;

- (void) cordovaSetFileContents:(CDVInvokedUrlCommand *)command;

#pragma mark - Methods

// code to persist data
- (void) setFileContents:(NSString *)str;

// code to load data from disk and return the String.
- (NSString *) getFileContents;


@end
