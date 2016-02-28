//
//  InformationLinker.h
//  Restaurant
//
//  Created by Vladislav on 18.11.15.
//  Copyright © 2015 domik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InformationLinker : NSObject
{
    NSMutableDictionary *_linkerDict;
}

@property (nonatomic) NSUInteger offersCount;
@property (nonatomic) NSUInteger offerCount;
@property (nonatomic, copy) NSString *linkerName;
@property (nonatomic, copy) NSString *identificator;
@property (nonatomic, copy) NSString *productName;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *productDescription;
@property (nonatomic, copy) NSString *imageURL;
@property (nonatomic, copy) NSString *categoryID;
@property (nonatomic, copy) NSMutableArray *paramsArray;
//diametr ves colorinost giri yglevodi


- (void)addObjectsToDictionary;
- (void)addToUserDefaults;


@end
