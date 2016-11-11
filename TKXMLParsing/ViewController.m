//
//  ViewController.m
//  TKXMLParsing
//
//  Created by Felix ITs 04 on 10/11/16.
//  Copyright © 2016 Tushar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [[NSBundle mainBundle]URLForResource:@"Employee" withExtension:@"xml"];
    
    parser = [[NSXMLParser alloc]initWithContentsOfURL:url];
    parser.delegate=self;
    [parser parse];
    NSLog(@"EEEEEE");
   // employee = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)showEmployeeOnConsole:(NSMutableArray *)array  {
    if (array.count > 0) {
        NSLog(@"Count  : %lu",(unsigned long)array.count);
        
        for (Employee *e in array) {
            NSLog(@"\nEMP_ID : %@\nNAME : %@\nDESIGNATION : %@\nCONTACT : %@\n",e.emp_id,e.name,e.designation,e.contact);
        }
    }
}

-(void)parser:(NSXMLParser *)parser didStartElement:(nonnull NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(nonnull NSDictionary<NSString *,NSString *> *)attributeDict
{
    if ([elementName isEqualToString:@"root"])
    {
        employee = [[NSMutableArray alloc]init];
    }
    else if ([elementName isEqualToString:@"Employee"])
    {
        dataModel = [[Employee alloc]init];
        dataModel.emp_id = [attributeDict valueForKey:@"id"];
    }
    else if ([elementName isEqualToString:@"Name"])
    {
        dataString = [[NSMutableString alloc]init];
    }
    else if ([elementName isEqualToString:@"Designation"])
    {
        dataString = [[NSMutableString alloc]init];
    }
    else if ([elementName isEqualToString:@"ContactNo"])
    {
        dataString = [[NSMutableString alloc]init];
    }



}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [dataString appendString:string];
    
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    if ([elementName isEqualToString:@"Name"])
    {
        
        dataModel.name = dataString;
        
    }else if ([elementName isEqualToString:@"Designation"])
        {
            dataModel.designation = dataString;
        }
        else if ([elementName isEqualToString:@"ContactNo"])
        {
            dataModel.contact = dataString;
        }else if ([elementName isEqualToString:@"Employee"])
        {
            [employee addObject:dataModel];
        }else if ([elementName isEqualToString:@"root"])
        {
            [self showEmployeeOnConsole:employee];
        }
    }
    
    
    




@end
