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
#import "TextTableViewCell.h"

@interface DetailViewController ()

@property (nonatomic, strong)          AppDelegate              *appDelegate;
@property (nonatomic, strong)          NSManagedObjectContext   *managedObjectContext;

@property (nonatomic, strong)          NSArray             *defaultCellTypeArray;
@property (nonatomic, strong)          NSMutableArray      *cellTypeArray;
@property (nonatomic, strong)          NSArray             *defaultCellLabelArray;
@property (nonatomic, strong)          NSMutableArray      *cellLabelArray;
@property (nonatomic, strong)          NSArray             *personArray;

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

#pragma mark - Table View Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cellTypeArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TextTableViewCell *textCell = (TextTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"textCell"];
    textCell.cellTextLabel.text = _cellLabelArray[indexPath.row];
    if (indexPath.row == 0) {
        textCell.cellTextField.text = _currentPerson.personFirstName;
    } else if (indexPath.row == 1) {
        textCell.cellTextField.text = _currentPerson.personLastName;
    } else if (indexPath.row == 2) {
        textCell.cellTextField.text = _currentPerson.personRole;
    } else if (indexPath.row == 3) {
        textCell.cellTextField.text = _currentPerson.personAddressStreet;
    } else if (indexPath.row == 4) {
        textCell.cellTextField.text = _currentPerson.personAddressCity;
    } else if (indexPath.row == 5) {
        textCell.cellTextField.text = _currentPerson.personAddressState;
    } else if (indexPath.row == 6) {
        textCell.cellTextField.text = _currentPerson.personAddressZip;
    } else if (indexPath.row == 7) {
        textCell.cellTextField.text = _currentPerson.personPhone;
    }
    return textCell;
}

#pragma mark - Interactivity Methods

- (void)saveAndPop {
    [_appDelegate saveContext];
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)saveButtonPressed:(id)sender {
    NSLog(@"SAVE");
    NSIndexPath *indexPath0 = [NSIndexPath indexPathForRow:0 inSection:0];
    TextTableViewCell *textCell0 = [_personView cellForRowAtIndexPath:indexPath0];
    _currentPerson.personFirstName = textCell0.cellTextField.text;
    
    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:1 inSection:0];
    TextTableViewCell *textCell1 = [_personView cellForRowAtIndexPath:indexPath1];
    _currentPerson.personLastName = textCell1.cellTextField.text;
    
    NSIndexPath *indexPath2 = [NSIndexPath indexPathForRow:2 inSection:0];
    TextTableViewCell *textCell2 = [_personView cellForRowAtIndexPath:indexPath2];
    _currentPerson.personRole = textCell2.cellTextField.text;
    
    NSIndexPath *indexPath3 = [NSIndexPath indexPathForRow:3 inSection:0];
    TextTableViewCell *textCell3 = [_personView cellForRowAtIndexPath:indexPath3];
    _currentPerson.personAddressStreet = textCell3.cellTextField.text;
    
    NSIndexPath *indexPath4 = [NSIndexPath indexPathForRow:4 inSection:0];
    TextTableViewCell *textCell4 = [_personView cellForRowAtIndexPath:indexPath4];
    _currentPerson.personAddressCity = textCell4.cellTextField.text;
    
    NSIndexPath *indexPath5 = [NSIndexPath indexPathForRow:5 inSection:0];
    TextTableViewCell *textCell5 = [_personView cellForRowAtIndexPath:indexPath5];
    _currentPerson.personAddressState = textCell5.cellTextField.text;
    
    NSIndexPath *indexPath6 = [NSIndexPath indexPathForRow:6 inSection:0];
    TextTableViewCell *textCell6 = [_personView cellForRowAtIndexPath:indexPath6];
    _currentPerson.personAddressZip = textCell6.cellTextField.text;
    
    NSIndexPath *indexPath7 = [NSIndexPath indexPathForRow:7 inSection:0];
    TextTableViewCell *textCell7 = [_personView cellForRowAtIndexPath:indexPath7];
    _currentPerson.personPhone = textCell7.cellTextField.text;
    
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
    _defaultCellTypeArray = @[@"text",@"text",@"text",@"text",@"text",@"text",@"text",@"text"];
    _defaultCellLabelArray = @[@"First",@"Last",@"Role",@"Street",@"City",@"State",@"Zip",@"Phone"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _cellLabelArray = [NSMutableArray arrayWithArray:_defaultCellLabelArray];
    _cellTypeArray = [NSMutableArray arrayWithArray:_defaultCellTypeArray];
//    if (_currentPerson !=nil) {
//        NSLog(@"EDIT");
//        _firstNameTextField.text = _currentPerson.personFirstName;
//        _lastNameTextField.text = _currentPerson.personLastName;
//        _roleField.text = _currentPerson.personRole;
//        _addressStreetTextField.text = _currentPerson.personAddressStreet;
//        _addressCityTextField.text = _currentPerson.personAddressCity;
//        _addressStateTextField.text = _currentPerson.personAddressState;
//        _addressZipTextField.text = _currentPerson.personAddressZip;
//        _phoneTextField.text = _currentPerson.personPhone;
//    }
//    else {
//        NSLog(@"ADD");
//        Persons *addNewPerson = (Persons *)[NSEntityDescription insertNewObjectForEntityForName:@"Persons" inManagedObjectContext:_managedObjectContext];
//        _currentPerson.dateEntered = [NSDate date];
//        _currentPerson = addNewPerson;
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
