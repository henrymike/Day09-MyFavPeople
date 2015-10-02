//
//  DetailViewController.h
//  MyFavPeople
//
//  Created by Oscar on 10/1/15.
//  Copyright © 2015 Mike Henry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Persons.h"

@interface DetailViewController : UIViewController <UITextViewDelegate>

@property (nonatomic, strong) Persons                *currentPerson;
@property (nonatomic, weak)   IBOutlet  UITableView  *personView;


@end
