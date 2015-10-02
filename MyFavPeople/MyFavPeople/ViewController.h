//
//  ViewController.h
//  MyFavPeople
//
//  Created by Oscar on 10/1/15.
//  Copyright © 2015 Mike Henry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSManagedObjectContext   *managedObjectContext;
@property (nonatomic, strong) NSArray                  *personArray;
@property (nonatomic, weak)   IBOutlet UITableView     *personsTableView;

@end