//
//  DetailViewController.m
//  MyFavPeople
//
//  Created by Oscar on 10/1/15.
//  Copyright © 2015 Mike Henry. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "Persons.h"
#import "AppDelegate.h"

@interface DetailViewController ()

@property (nonatomic, strong)          AppDelegate              *appDelegate;
@property (nonatomic, strong)          NSManagedObjectContext   *managedObjectContext;

@property (nonatomic, weak)   IBOutlet UITextField         *firstNameTextField;
@property (nonatomic, weak)   IBOutlet UITextField         *lastNameTextField;
@property (nonatomic, weak)   IBOutlet UITextField         *roleField;
@property (nonatomic, weak)   IBOutlet UITextField         *addressStreetTextField;
@property (nonatomic, weak)   IBOutlet UITextField         *addressCityTextField;
@property (nonatomic, weak)   IBOutlet UITextField         *addressStateTextField;
@property (nonatomic, weak)   IBOutlet UITextField         *addressZipTextField;
@property (nonatomic, weak)   IBOutlet UITextField         *phoneTextField;

@end

@implementation DetailViewController

#pragma mark - Interactivity Methods

- (void)saveAndPop {
    [_appDelegate saveContext];
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)saveButtonPressed:(id)sender {
    NSLog(@"SAVE");
    _currentPerson.personFirstName = _firstNameTextField.text;
    _currentPerson.personLastName = _lastNameTextField.text;
    _currentPerson.personRole = _roleField.text;
    _currentPerson.personAddressStreet = _addressStreetTextField.text;
    _currentPerson.personAddressCity = _addressCityTextField.text;
    _currentPerson.personAddressState = _addressStateTextField.text;
    _currentPerson.personAddressZip = _addressZipTextField.text;
    _currentPerson.personPhone = _phoneTextField.text;
    _currentPerson.dateUpdated = [NSDate date];
    _currentPerson.userID = @"System";
    [self saveAndPop];
}

- (IBAction)deleteButtonPressed:(id)sender {
    NSLog(@"DELETE");
    [_managedObjectContext deleteObject:_currentPerson];
    [self saveAndPop];
}

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _managedObjectContext = _appDelegate.managedObjectContext;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (_currentPerson !=nil) {
        NSLog(@"EDIT");
        _firstNameTextField.text = _currentPerson.personFirstName;
        _lastNameTextField.text = _currentPerson.personLastName;
        _roleField.text = _currentPerson.personRole;
        _addressStreetTextField.text = _currentPerson.personAddressStreet;
        _addressCityTextField.text = _currentPerson.personAddressCity;
        _addressStateTextField.text = _currentPerson.personAddressState;
        _addressZipTextField.text = _currentPerson.personAddressZip;
        _phoneTextField.text = _currentPerson.personPhone;
    }
    else {
        NSLog(@"ADD");
        Persons *addNewPerson = (Persons *)[NSEntityDescription insertNewObjectForEntityForName:@"Persons" inManagedObjectContext:_managedObjectContext];
        _currentPerson.dateEntered = [NSDate date];
        _currentPerson = addNewPerson;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
