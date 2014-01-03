//
//  ViewController.m
//  TextFieldTest
//
//  Created by SDT1 on 2014. 1. 3..
//  Copyright (c) 2014년 SDT1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.textField becomeFirstResponder];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, 0, 0)];
    label1.text = @"Return";
    label1.textColor = [UIColor greenColor];
    label1.backgroundColor = [UIColor clearColor];
    [label1 sizeToFit];
    
    [self.view addSubview:label1];
    
    
    UITextField *textFild = [[UITextField alloc] initWithFrame:CGRectMake(130, 45, 171, 31)];
    textFild.borderStyle = UITextBorderStyleRoundedRect;
    textFild.delegate = self;
    textFild.tag = 1;
    
    [self.view addSubview:textFild];
    
    // ........
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 0, 0)];
    label2.text = @"편집 불가";
    label2.textColor = [UIColor redColor];
    label2.backgroundColor = [UIColor clearColor];
    [label2 sizeToFit];
    
    [self.view addSubview:label2];
    
    
    UITextField *textFild2 = [[UITextField alloc] initWithFrame:CGRectMake(130, 95, 171, 31)];
    textFild2.borderStyle = UITextBorderStyleRoundedRect;
    textFild2.delegate = self;
    textFild2.tag = 2;
    
    [self.view addSubview:textFild2];
    
    // ........
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(20, 155, 0, 0)];
    label3.text = @"Z입력금지";
    label3.textColor = [UIColor blackColor];
    label3.backgroundColor = [UIColor clearColor];
    [label3 sizeToFit];
    
    [self.view addSubview:label3];
    
    
    UITextField *textFild3 = [[UITextField alloc] initWithFrame:CGRectMake(130, 150, 171, 31)];
    textFild3.borderStyle = UITextBorderStyleRoundedRect;
    textFild3.delegate = self;
    textFild3.tag = 3;
    
    [self.view addSubview:textFild3];
    
    
}


- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    if(textField.tag == 2)
    {
        return NO;
    }
    return YES;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    if(textField.tag == 1)
    {
        NSLog(@"INPUT: %@", textField.text);
    }
    
    [textField resignFirstResponder];
    
    return YES;
}

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.tag && NSOrderedSame == [string compare:@"z" options:NSCaseInsensitiveSearch])
    {
        return NO;
    }
    
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
