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
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *forwardButton;

@end

@implementation RootViewController
- (IBAction)onBackButtonPress:(id)sender {
    [self.variableWebView goBack];
}

- (IBAction)onForwardButtonPress:(id)sender {
	[self.variableWebView goForward];
}

- (IBAction)onStopLoadingButtonPress:(id)sender {
	[self.variableWebView stopLoading];
}

- (IBAction)onReloadButtonPress:(id)sender {
	[self.variableWebView reload];
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
		NSString *http = @"http://";
	if ([self.urlTextField.text containsString:@"http://"]){
    NSURL *url = [NSURL URLWithString:self.urlTextField.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.variableWebView loadRequest:request];
    return YES;
	} else {
		NSURL *url = [NSURL URLWithString:[http stringByAppendingString:self.urlTextField.text]];
		NSURLRequest *request = [NSURLRequest requestWithURL:url];
		[self.variableWebView loadRequest:request];
		return YES;
	}
}


- (IBAction)comingSoon:(id)sender {
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Coming soon!" message:@"Coming soon!" preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok tq" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
					[alert dismissViewControllerAnimated:YES completion:nil];
			}];;
	[alert addAction:ok];
	[self presentViewController:alert animated:true completion:nil];
}


- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.activityLoader startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.activityLoader stopAnimating];
	[self.backButton setEnabled:[self.variableWebView canGoBack]];
	[self.forwardButton setEnabled:[self.variableWebView canGoForward]];
}

@end
