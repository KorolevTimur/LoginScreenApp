//
//  ViewController.m
//  LoginScreenApp
//
//  Created by admin on 2.07.21.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *logo;
@property (nonatomic, strong) UITextField *loginTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIView *secureView;
@property (nonatomic, strong) UIButton *secureButton1;
@property (nonatomic, strong) UIButton *secureButton2;
@property (nonatomic, strong) UIButton *secureButton3;
@property (nonatomic, strong) UILabel *secureLabel;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setupElements];
    [self setupConstraints];
    
    [_loginTextField setDelegate:self];
    [_passwordTextField setDelegate:self];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

-(void)setupConstraints {
    [self.view addSubview:self.logo];
    self.logo.translatesAutoresizingMaskIntoConstraints = false;
    [self.logo.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.logo.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:80].active = YES;
   
    
    [self.view addSubview:self.loginTextField];
    self.loginTextField.translatesAutoresizingMaskIntoConstraints = false;
    [self.loginTextField.topAnchor constraintEqualToAnchor:self.logo.bottomAnchor constant:80].active = YES;
    [self.loginTextField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:36].active = YES;
    [self.loginTextField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-36].active = YES;
    [self.loginTextField.heightAnchor constraintEqualToConstant:35].active = YES;
    
    [self.view addSubview:self.passwordTextField];
    self.passwordTextField.translatesAutoresizingMaskIntoConstraints = false;
    [self.passwordTextField.topAnchor constraintEqualToAnchor:self.loginTextField.bottomAnchor constant:30].active = YES;
    [self.passwordTextField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:36].active = YES;
    [self.passwordTextField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-36].active = YES;
    [self.passwordTextField.heightAnchor constraintEqualToConstant:35].active = YES;
    
    [self.view addSubview:self.loginButton];
    self.loginButton.translatesAutoresizingMaskIntoConstraints = false;
    [self.loginButton.topAnchor constraintEqualToAnchor:self.passwordTextField.bottomAnchor constant:60].active = YES;
    [self.loginButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:110].active = YES;
    [self.loginButton.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-110].active = YES;
    [self.loginButton.heightAnchor constraintEqualToConstant:42].active = YES;
    
    [self.view addSubview:self.secureView];
    self.secureView.translatesAutoresizingMaskIntoConstraints = false;
    [self.secureView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.secureView.topAnchor constraintEqualToAnchor:self.loginButton.bottomAnchor constant:67].active = YES;
    [self.secureView.widthAnchor constraintEqualToConstant:236].active = YES;
    [self.secureView.heightAnchor constraintEqualToConstant:110].active = YES;
    
    [self.secureView addSubview:self.secureButton1];
    self.secureButton1.translatesAutoresizingMaskIntoConstraints = false;
    [self.secureButton1.leadingAnchor constraintEqualToAnchor:self.secureView.leadingAnchor constant:23].active = YES;
    [self.secureButton1.topAnchor constraintEqualToAnchor:self.secureView.topAnchor constant:45].active = YES;
    [self.secureButton1.widthAnchor constraintEqualToConstant:50].active = YES;
    [self.secureButton1.heightAnchor constraintEqualToConstant:50].active = YES;
    
    [self.secureView addSubview:self.secureButton2];
    self.secureButton2.translatesAutoresizingMaskIntoConstraints = false;
    [self.secureButton2.leadingAnchor constraintEqualToAnchor:self.secureButton1.trailingAnchor constant:20].active = YES;
    [self.secureButton2.topAnchor constraintEqualToAnchor:self.secureView.topAnchor constant:45].active = YES;
    [self.secureButton2.widthAnchor constraintEqualToConstant:50].active = YES;
    [self.secureButton2.heightAnchor constraintEqualToConstant:50].active = YES;
    
    [self.secureView addSubview:self.secureButton3];
    self.secureButton3.translatesAutoresizingMaskIntoConstraints = false;
    [self.secureButton3.leadingAnchor constraintEqualToAnchor:self.secureButton2.trailingAnchor constant:20].active = YES;
    [self.secureButton3.topAnchor constraintEqualToAnchor:self.secureView.topAnchor constant:45].active = YES;
    [self.secureButton3.widthAnchor constraintEqualToConstant:50].active = YES;
    [self.secureButton3.heightAnchor constraintEqualToConstant:50].active = YES;
    
    [self.secureView addSubview:self.secureLabel];
    self.secureLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.secureLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.secureLabel.topAnchor constraintEqualToAnchor:self.secureView.topAnchor constant:15].active = YES;
}

-(void)setupElements {
    self.logo = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.logo setText:@"RSSchool"];
    [self.logo setFont:[UIFont boldSystemFontOfSize:36]];
    
    
    
    self.loginTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    [self.loginTextField setPlaceholder:@"  Login"];
    UIColor *blackCoral = [[UIColor alloc] initWithRed:76/255.0 green:92/255.0 blue:104/255.0 alpha:1];
    self.loginTextField.layer.borderColor = blackCoral.CGColor;
    self.loginTextField.layer.cornerRadius = 5.0;
    self.loginTextField.layer.borderWidth = 1.5;
    self.loginTextField.keyboardType = UIKeyboardTypeASCIICapable;
    self.loginTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    

    self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    [self.passwordTextField setPlaceholder:@"  Password"];
    self.passwordTextField.layer.borderColor = blackCoral.CGColor;
    self.passwordTextField.layer.cornerRadius = 5.0;
    self.passwordTextField.layer.borderWidth = 1.5;
    self.passwordTextField.secureTextEntry = true;
    
    
    self.loginButton = [[UIButton alloc] initWithFrame:CGRectZero];
    UIColor *littleBoyBlue = [[UIColor alloc] initWithRed:128/255.0 green:164/255.0 blue:237/255.0 alpha:1];
    [self.loginButton setImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
    [self.loginButton setImage:[UIImage imageNamed:@"person_filled"] forState:UIControlStateHighlighted];
    [self.loginButton setTitle:@" Authorize" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:littleBoyBlue forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[littleBoyBlue colorWithAlphaComponent:0.4] forState:UIControlStateHighlighted];
    [self.loginButton setBackgroundImage:[self imageWithColor:[littleBoyBlue colorWithAlphaComponent:0.2]] forState:UIControlStateHighlighted];
    self.loginButton.contentEdgeInsets = UIEdgeInsetsMake(10, 15, 10, 15);
    self.loginButton.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightSemibold];
    self.loginButton.layer.borderColor = littleBoyBlue.CGColor;
    self.loginButton.layer.cornerRadius = 10.0;
    self.loginButton.layer.borderWidth = 2;
    [self.loginButton addTarget:self action:@selector(loginButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.secureView = [[UIView alloc] initWithFrame:CGRectZero];
    self.secureView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.secureView.layer.cornerRadius = 10.0;
    self.secureView.layer.borderWidth = 2;
    self.secureView.hidden = true;
    
    self.secureButton1 = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.secureButton1 setTitle:@"1" forState:UIControlStateNormal];
    [self.secureButton1 setTitleColor:littleBoyBlue forState:UIControlStateNormal];
    [self.secureButton1.titleLabel setTextAlignment:NSTextAlignmentCenter];
    self.secureButton1.titleLabel.font = [UIFont systemFontOfSize:24 weight:UIFontWeightSemibold];
    [self.secureButton1 setBackgroundImage:[self imageWithColor:[littleBoyBlue colorWithAlphaComponent:0.2]] forState:UIControlStateHighlighted];
    self.secureButton1.layer.borderColor = littleBoyBlue.CGColor;
    self.secureButton1.layer.cornerRadius = 25.0;
    self.secureButton1.layer.borderWidth = 1.5;
    [self.secureButton1 addTarget:self action:@selector(secureButton1Tapped) forControlEvents:UIControlEventTouchUpInside];
    
    self.secureButton2 = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.secureButton2 setTitle:@"2" forState:UIControlStateNormal];
    [self.secureButton2 setTitleColor:littleBoyBlue forState:UIControlStateNormal];
    [self.secureButton2.titleLabel setTextAlignment:NSTextAlignmentCenter];
    self.secureButton2.titleLabel.font = [UIFont systemFontOfSize:24 weight:UIFontWeightSemibold];
    [self.secureButton2 setBackgroundImage:[self imageWithColor:[littleBoyBlue colorWithAlphaComponent:0.2]] forState:UIControlStateHighlighted];
    self.secureButton2.layer.borderColor = littleBoyBlue.CGColor;
    self.secureButton2.layer.cornerRadius = 25.0;
    self.secureButton2.layer.borderWidth = 1.5;
    [self.secureButton2 addTarget:self action:@selector(secureButton2Tapped) forControlEvents:UIControlEventTouchUpInside];
    
    self.secureButton3 = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.secureButton3 setTitle:@"3" forState:UIControlStateNormal];
    [self.secureButton3 setTitleColor:littleBoyBlue forState:UIControlStateNormal];
    [self.secureButton3.titleLabel setTextAlignment:NSTextAlignmentCenter];
    self.secureButton3.titleLabel.font = [UIFont systemFontOfSize:24 weight:UIFontWeightSemibold];
    [self.secureButton3 setBackgroundImage:[self imageWithColor:[littleBoyBlue colorWithAlphaComponent:0.2]] forState:UIControlStateHighlighted];
    self.secureButton3.layer.borderColor = littleBoyBlue.CGColor;
    self.secureButton3.layer.cornerRadius = 25.0;
    self.secureButton3.layer.borderWidth = 1.5;
    [self.secureButton3 addTarget:self action:@selector(secureButton3Tapped) forControlEvents:UIControlEventTouchUpInside];
    
    self.secureLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.secureLabel setText:@"_"];
    [self.secureLabel setFont:[UIFont systemFontOfSize:18 weight:UIFontWeightSemibold]];
    [self.secureLabel setTextColor:[UIColor blackColor]];
}


-(void)loginButtonTapped {
    NSString *login = @"username";
    NSString *password = @"password";
    UIColor *turGreen = [[UIColor alloc] initWithRed:145/255.0f green:199/255.0 blue:177/255.0 alpha:1];
    UIColor *venRed = [[UIColor alloc] initWithRed:194/255.0f green:1/255.0 blue:20/255.0 alpha:1];
    if ([self.loginTextField.text isEqualToString:login] && [self.passwordTextField.text isEqualToString:password]) {
        self.loginTextField.layer.borderColor = turGreen.CGColor;
        self.passwordTextField.layer.borderColor = turGreen.CGColor;
        self.secureView.hidden = false;
        [self dismissKeyboard];
        self.loginButton.userInteractionEnabled = false;
        self.loginButton.alpha = 0.5;
        self.loginTextField.userInteractionEnabled = false;
        self.loginTextField.alpha = 0.5;
        self.passwordTextField.userInteractionEnabled = false;
        self.passwordTextField.alpha = 0.5;
    } else if ([self.loginTextField.text isEqualToString:login]) {
        self.loginTextField.layer.borderColor = turGreen.CGColor;
        self.passwordTextField.layer.borderColor = venRed.CGColor;
    } else if ([self.passwordTextField.text isEqualToString:password]) {
        self.loginTextField.layer.borderColor = venRed.CGColor;
        self.passwordTextField.layer.borderColor = turGreen.CGColor;
    } else {
        self.loginTextField.layer.borderColor = venRed.CGColor;
        self.passwordTextField.layer.borderColor = venRed.CGColor;
    }
}

-(void)secureButton1Tapped {
    NSString *pin = @"132";
    UIColor *turGreen = [[UIColor alloc] initWithRed:145/255.0f green:199/255.0 blue:177/255.0 alpha:1];
    UIColor *venRed = [[UIColor alloc] initWithRed:194/255.0f green:1/255.0 blue:20/255.0 alpha:1];
    if ([self.secureLabel.text isEqualToString:@"_"]) {
        self.secureLabel.text = @"1";
    } else if (self.secureLabel.text.length < 2) {
        [self.secureLabel setText:[self.secureLabel.text stringByAppendingString:@"1"]];
    } else if (self.secureLabel.text.length == 2) {
        [self.secureLabel setText:[self.secureLabel.text stringByAppendingString:@"1"]];
        if ([self.secureLabel.text isEqualToString:pin]) {
            self.secureView.layer.borderColor = turGreen.CGColor;
            [self showModalWindow];
        } else {
            self.secureView.layer.borderColor = venRed.CGColor;
            self.secureLabel.text = @"_";
        }
    }
}

-(void)secureButton2Tapped {
    NSString *pin = @"132";
    UIColor *turGreen = [[UIColor alloc] initWithRed:145/255.0f green:199/255.0 blue:177/255.0 alpha:1];
    UIColor *venRed = [[UIColor alloc] initWithRed:194/255.0f green:1/255.0 blue:20/255.0 alpha:1];
    if ([self.secureLabel.text isEqualToString:@"_"]) {
        self.secureLabel.text = @"2";
    } else if (self.secureLabel.text.length < 2) {
        [self.secureLabel setText:[self.secureLabel.text stringByAppendingString:@"2"]];
    } else if (self.secureLabel.text.length == 2) {
        [self.secureLabel setText:[self.secureLabel.text stringByAppendingString:@"2"]];
        if ([self.secureLabel.text isEqualToString:pin]) {
            self.secureView.layer.borderColor = turGreen.CGColor;
            [self showModalWindow];
        } else {
            self.secureView.layer.borderColor = venRed.CGColor;
            self.secureLabel.text = @"_";
        }
    }
}

-(void)secureButton3Tapped {
    NSString *pin = @"132";
    UIColor *turGreen = [[UIColor alloc] initWithRed:145/255.0f green:199/255.0 blue:177/255.0 alpha:1];
    UIColor *venRed = [[UIColor alloc] initWithRed:194/255.0f green:1/255.0 blue:20/255.0 alpha:1];
    if ([self.secureLabel.text isEqualToString:@"_"]) {
        self.secureLabel.text = @"3";
    } else if (self.secureLabel.text.length < 2) {
        [self.secureLabel setText:[self.secureLabel.text stringByAppendingString:@"3"]];
    } else if (self.secureLabel.text.length == 2) {
        [self.secureLabel setText:[self.secureLabel.text stringByAppendingString:@"3"]];
        if ([self.secureLabel.text isEqualToString:pin]) {
            self.secureView.layer.borderColor = turGreen.CGColor;
            [self showModalWindow];
        } else {
            self.secureView.layer.borderColor = venRed.CGColor;
            self.secureLabel.text = @"_";
        }
    }
}

- (void)showModalWindow {
    UIAlertController *successWindow = [UIAlertController alertControllerWithTitle: @"Welcome"
                                                                    message: @"You are successfuly authorized!"
                                                             preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *refreshButton = [UIAlertAction actionWithTitle: @"Refresh"
                                                            style: UIAlertActionStyleDestructive
                                                          handler:^(UIAlertAction * action) {
        self.loginTextField.text = @"";
        self.passwordTextField.text = @"";
        self.secureLabel.text = @"_";
        self.secureView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.secureView.hidden = true;
        UIColor *blackCoral = [[UIColor alloc] initWithRed:76/255.0 green:92/255.0 blue:104/255.0 alpha:1];
        self.loginButton.userInteractionEnabled = true;
        self.loginButton.alpha = 1;
        self.loginTextField.userInteractionEnabled = true;
        self.loginTextField.alpha = 1;
        self.loginTextField.layer.borderColor = blackCoral.CGColor;
        self.passwordTextField.userInteractionEnabled = true;
        self.passwordTextField.alpha = 1;
        self.passwordTextField.layer.borderColor = blackCoral.CGColor;
        
    }];
    
    [successWindow addAction:refreshButton];
    [self showViewController:successWindow sender:nil];
}

-(UIImage *)imageWithColor:(UIColor *)color {
   CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
   UIGraphicsBeginImageContext(rect.size);
   CGContextRef context = UIGraphicsGetCurrentContext();

   CGContextSetFillColorWithColor(context, [color CGColor]);
   CGContextFillRect(context, rect);

   UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
   UIGraphicsEndImageContext();

   return image;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)dismissKeyboard
{
    [_loginTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}



@end
