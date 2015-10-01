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
    NSLog(@"EDIT");
    _firstNameTextField.text = _currentPerson.personFirstName;
    _lastNameTextField.text = _currentPerson.personLastName;
    _addressStreetTextField.text = _currentPerson.personAddressStreet;
    _addressCityTextField.text = _currentPerson.personAddressCity;
    _addressStateTextField.text = _currentPerson.personAddressState;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
