//
//  Manager.m
//  CathyInterviewProject
//
//  Created by 陳冠華 on 2017/5/24.
//  Copyright © 2017年 my app. All rights reserved.
//

#import "Manager.h"



@interface Manager()


@end


@implementation Manager

+ (instancetype)sharedInstance {

    static id sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Manager alloc] init];
    });

    return sharedInstance;
}


-(id) init {

    self = [super init];

    self.detailArray = [[NSMutableArray alloc] init];

    return self;
}


- (void) getParkDetailDataWithOffset: (NSUInteger) offset {


    NSString *offsetString = [NSString stringWithFormat:@"&offset=%lu", offset] ;

    NSURL *url = [[NSURL alloc] initWithString: [NSString stringWithFormat:@"http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=bf073841-c734-49bf-a97f-3757a6013812&limit=30%@", offsetString]];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url
                                                           cachePolicy: NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval: 10.0];
    [request setHTTPMethod: @"GET"];



    NSURLSession *session = [NSURLSession sharedSession];



    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest: request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    if (error) {

                                                        NSLog(@"%@", error);

                                                    } else {

                                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;

                                                        NSLog(@"%@", httpResponse);

                                                        NSDictionary * jsonData = [NSJSONSerialization JSONObjectWithData: data options:NSJSONReadingMutableContainers error: &error];


                                                        if (jsonData == nil) {

                                                            NSLog(@"JSON Data is nil");


                                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                                [self.delegate manager:self didFailWith:error];
                                                            });


                                                            return;

                                                        } else {

                                                            NSDictionary *result = [jsonData objectForKey: @"result"];

                                                            NSArray *results = [result objectForKey: @"results"];


                                                            for (NSDictionary * detail in results) {

                                                                NSString * name = [detail objectForKey: @"Name"];
                                                                NSString * parkName = [detail objectForKey: @"ParkName"];
                                                                NSString * idLabel = [detail objectForKey: @"_id"];
                                                                NSString * imageURLString = [detail objectForKey: @"Image"];
                                                                NSString * introduction = [detail objectForKey: @"Introduction"];

                                                                NSURL *imageURL = [NSURL URLWithString: imageURLString];

//                                                                NSData *imageData = [NSData dataWithContentsOfURL:imageURL];

                                                                ParkDetail *partDetail = [[ParkDetail alloc]initName:name parkName:parkName idLabel:idLabel introduction:introduction image: imageURL];

                                                                [self.detailArray addObject:partDetail];

                                                                NSLog(@"print name %@", idLabel);

                                                            }

                                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                                [self.delegate manager: self didGet: self.detailArray];
                                                            });

                                                        }
                                                    }
                                                }];
    [dataTask resume];

}

@end
