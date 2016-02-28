//
//  InformationParser.h
//  Restaurant
//
//  Created by Vladislav on 17.11.15.
//  Copyright © 2015 domik. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol InformationParserDelegate <NSObject>

@required
- (void)loadingIsFinish:(BOOL)isFinish;

@end


@class InformationLinker;


@interface InformationParser : NSObject <NSXMLParserDelegate>
{
    InformationLinker *_informationLinker;
    NSMutableArray *_paramArray;
}


@property (nonatomic, weak) id<InformationParserDelegate> delegate;


- (void)downloadAndParse;


@end
