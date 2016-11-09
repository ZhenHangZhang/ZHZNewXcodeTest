//
//  Student+CoreDataProperties.h
//  
//
//  Created by zhanghangzhen on 2016/11/9.
//
//

#import "Student+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest;

@property (nonatomic) int16_t age;
@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) float score;

@end

NS_ASSUME_NONNULL_END
