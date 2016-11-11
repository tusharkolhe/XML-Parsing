//
//  ViewController.h
//  TKXMLParsing
//
//  Created by Felix ITs 04 on 10/11/16.
//  Copyright © 2016 Tushar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"


@interface ViewController : UIViewController<NSXMLParserDelegate>
{
    NSXMLParser *parser;
    Employee *dataModel;
    NSMutableArray *employee;
    NSMutableString *dataString;
    
}

@end

