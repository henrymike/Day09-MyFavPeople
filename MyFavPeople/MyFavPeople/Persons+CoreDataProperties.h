//
//  Persons+CoreDataProperties.h
//  MyFavPeople
//
//  Created by Oscar on 10/1/15.
//  Copyright © 2015 Mike Henry. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Persons.h"

NS_ASSUME_NONNULL_BEGIN

@interface Persons (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *dateEntered;
@property (nullable, nonatomic, retain) NSDate *dateUpdated;
@property (nullable, nonatomic, retain) NSString *userID;
@property (nullable, nonatomic, retain) NSString *personFirstName;
@property (nullable, nonatomic, retain) NSString *personLastName;
@property (nullable, nonatomic, retain) NSString *personRole;
@property (nullable, nonatomic, retain) NSString *personAddressStreet;
@property (nullable, nonatomic, retain) NSString *personAddressCity;
@property (nullable, nonatomic, retain) NSString *personAddressState;
@property (nullable, nonatomic, retain) NSString *personAddressZip;
@property (nullable, nonatomic, retain) NSString *personCategory;
@property (nullable, nonatomic, retain) NSString *personImage;
@property (nullable, nonatomic, retain) NSString *personPhone;
@property (nullable, nonatomic, retain) NSSet<PersonEmails *> *relationshipPersonsPersonEmail;

@end

@interface Persons (CoreDataGeneratedAccessors)

- (void)addRelationshipPersonsPersonEmailObject:(PersonEmails *)value;
- (void)removeRelationshipPersonsPersonEmailObject:(PersonEmails *)value;
- (void)addRelationshipPersonsPersonEmail:(NSSet<PersonEmails *> *)values;
- (void)removeRelationshipPersonsPersonEmail:(NSSet<PersonEmails *> *)values;

@end

NS_ASSUME_NONNULL_END
