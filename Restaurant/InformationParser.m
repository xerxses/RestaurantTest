//
//  InformationParser.m
//  Restaurant
//
//  Created by Vladislav on 17.11.15.
//  Copyright © 2015 domik. All rights reserved.
//

#import "InformationParser.h"
#import "InformationLinker.h"
#import "AFNetworking.h"



NSString static *queryForRestaurantData = @"http://ufa.farfor.ru/getyml/?key=ukAXxeJYZN";


@implementation InformationParser


- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _informationLinker = [[InformationLinker alloc] init];
        _paramArray = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void)downloadAndParse
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    NSURL *url = [NSURL URLWithString:queryForRestaurantData];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    // Make sure to set the responseSerializer correctly
    operation.responseSerializer = [AFXMLParserResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        
        NSXMLParser *XMLParser = (NSXMLParser *)responseObject;
        [XMLParser setShouldProcessNamespaces:YES];
        
        XMLParser.delegate = self;
        [XMLParser parse];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        [self.delegate loadingIsFinish:NO];
    }];
    
    [operation start];
}


#pragma mark NSXMLParserDelegate

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"categories"];
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ( [qName isEqualToString:@"category"] )
    {
        _informationLinker.linkerName = qName;
        _informationLinker.identificator = [attributeDict objectForKey:@"id"];
    } else
    {
        _informationLinker.linkerName = qName;
    }

    if ( [qName isEqualToString:@"offers"] )
    {
        [_informationLinker addToUserDefaults];
    }
    
    if ( [qName isEqualToString:@"offer"] )
    {
        _informationLinker.offerCount++;
    }
    if ( _informationLinker.offerCount == 1)
    {
        _informationLinker.linkerName = qName;
    }
    if ( _informationLinker.offerCount == 2 )
    {
        _informationLinker.paramsArray = _paramArray;
        [_informationLinker addObjectsToDictionary];
        [_paramArray removeAllObjects];
    }
    
    if ( [qName isEqualToString:@"param"] )
    {
        _informationLinker.linkerName = qName;
        [_paramArray addObject:[attributeDict objectForKey:@"name"]];
    }
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ( [_informationLinker.linkerName isEqualToString:@"category"] )
    {
        _informationLinker.productName = string;
        [_informationLinker addObjectsToDictionary];
    }

    void (^selectedCase)() =
    @{
      @"name" : ^{
          _informationLinker.productName = (_informationLinker.productName != nil) ? [NSString stringWithFormat:@"%@ %@", _informationLinker.productName, string] : string;
      },
      @"price" : ^{
          _informationLinker.price = string;
      },
      @"description" : ^{
          _informationLinker.productDescription = (_informationLinker.productDescription != nil) ? [NSString stringWithFormat:@"%@ %@", _informationLinker.productDescription, string] : string;;
      },
      @"picture" : ^{
          _informationLinker.imageURL = string;
      },
      @"categoryId" : ^{
          _informationLinker.categoryID = string;
      },
      @"param" : ^{
          [_paramArray addObject:string];
      },
      }[_informationLinker.linkerName];
    
    if ( (selectedCase != nil) && ([self checkToAdd:string]))
         selectedCase();
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
}


- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    [self.delegate loadingIsFinish:YES];;
}


- (BOOL)checkToAdd:(NSString *)inputStr
{
    if ( inputStr.length == 1)
    {
        return YES;
    } else if ([[inputStr substringToIndex:2] containsString:[NSString stringWithFormat:@"\n"]])
    {
        return NO;
    }
    return YES;
}


@end
