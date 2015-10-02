//
//  ViewController.m
//  MyFavPeople
//
//  Created by Oscar on 10/1/15.
//  Copyright © 2015 Mike Henry. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Persons.h"
#import "DetailViewController.h"

@interface ViewController ()

@property (nonatomic, strong) AppDelegate              *appDelegate;

@end

@implementation ViewController

#pragma mark - Interactivity Methods


#pragma mark - Table View Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _personArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *basicCell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"basicCell"];
    Persons *currentPerson = _personArray[indexPath.row];
    basicCell.textLabel.text = [currentPerson personFirstName];
    basicCell.textLabel.text = [NSString stringWithFormat:@"%@ %@",currentPerson.personFirstName,currentPerson.personLastName];
    return basicCell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailViewController *destController = [segue destinationViewController];
    if ([[segue identifier] isEqualToString:@"segueEditPerson"]) {
        NSIndexPath *indexPath = [_personsTableView indexPathForSelectedRow];
        Persons *currentPerson = _personArray[indexPath.row];
        destController.currentPerson = currentPerson;
    }
    else if ([[segue identifier] isEqualToString:@"segueAddPerson"]) {
        destController.currentPerson = nil;
    }
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"Going to delete %li",indexPath.row);
        Persons *personToDelete = _personArray[indexPath.row];
        [_managedObjectContext deleteObject:personToDelete];
        [_appDelegate saveContext];
        _personArray = [self fetchPersons];
        [_personsTableView reloadData];
    }
}

#pragma mark - Core Data Methods

- (void)tempAddRecords {
    Persons *newPerson = (Persons *)[NSEntityDescription insertNewObjectForEntityForName:@"Persons" inManagedObjectContext:_managedObjectContext];
    newPerson.personFirstName = @"First";
    newPerson.personLastName = @"Last";
    newPerson.personAddressStreet = @"123 Main Street";
    newPerson.personAddressCity = @"City";
    newPerson.personAddressState = @"ST";
    newPerson.personAddressZip = @"00000";
    newPerson.personPhone = @"555-123-4567";
    newPerson.dateEntered = [NSDate date];
    newPerson.userID = @"System";
    [_appDelegate saveContext];
}

- (NSArray *)fetchPersons {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Persons" inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
    NSArray *fetchResults = [_managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return fetchResults;
}

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _managedObjectContext = _appDelegate.managedObjectContext;
    _personArray = [[NSArray alloc] init];
//        [self tempAddRecords];
//        _personArray = [self fetchPersons];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _personArray = [self fetchPersons];
    [_personsTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end