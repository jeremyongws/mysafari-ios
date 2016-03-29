//
//  ViewController.m
//  MySafari
//
//  Created by Jeremy Ong on 29/03/2016.
//  Copyright © 2016 Jeremy Ong. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController () <UIWebViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityLoader;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIWebView *variableWebView;

@end

@implementation RootViewController
- (IBAction)onBackButtonPress:(id)sender {
    [self.variableWebView goBack];
}


- (void)viewDidLoad {
	[super viewDidLoad];
    
    self.variableWebView.delegate = self;
    self.urlTextField.delegate = self;
    NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.variableWebView loadRequest:request];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSURL *url = [NSURL URLWithString:self.urlTextField.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.variableWebView loadRequest:request];
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.activityLoader startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.activityLoader stopAnimating];
}

@end
