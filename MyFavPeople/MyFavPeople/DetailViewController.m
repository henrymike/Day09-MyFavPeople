//
//  DetailViewController.m
//  MyFavPeople
//
//  Created by Oscar on 10/1/15.
//  Copyright © 2015 Mike Henry. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (nonatomic, weak)   IBOutlet UITextField         *firstNameTextField;
@property (nonatomic, weak)   IBOutlet UITextField         *lastNameTextField;
@property (nonatomic, weak)   IBOutlet UITextField         *addressStreetTextField;
@property (nonatomic, weak)   IBOutlet UITextField         *addressCityTextField;
@property (nonatomic, weak)   IBOutlet UITextField         *addressStateTextField;
@property (nonatomic, weak)   IBOutlet UITextField         *addressZipTextField;
@property (nonatomic, weak)   IBOutlet UITextField         *phoneTextField;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
