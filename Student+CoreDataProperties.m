//
//  Student+CoreDataProperties.m
//  
//
//  Created by zhanghangzhen on 2016/11/9.
//
//

#import "Student+CoreDataProperties.h"

@implementation Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Student"];
}

@dynamic age;
@dynamic name;
@dynamic score;

@end
