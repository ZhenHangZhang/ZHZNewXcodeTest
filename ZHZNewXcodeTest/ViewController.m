//
//  ViewController.m
//  ZHZNewXcodeTest
//
//  Created by zhanghangzhen on 16/9/19.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ViewController.h"

#import <YYKit.h>


#import "Student+CoreDataProperties.h"

#import <MagicalRecord/MagicalRecord.h>



@interface ViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{

    NSInteger _age;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property(nonatomic,copy)NSDictionary *dic;

@property(nonatomic,strong)NSMutableArray *dateArr;
@property(nonatomic,strong)NSMutableArray *dArr;

@property (weak, nonatomic) IBOutlet UILabel *titlelabel;

@property(nonatomic,strong)NSTimer *timer;

/** moxing */
@property (nonatomic,strong)Student * oneStu;

@end

@implementation ViewController
- (IBAction)delet:(id)sender {
    //删除
    for (Student *o in [Student MR_findByAttribute:@"name" withValue:@"1"]) {
        [o MR_deleteEntity];
    }
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

- (IBAction)jump1:(id)sender {
    _age ++;
    __weak typeof(self)weakSelf = self;
   [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
       //判断当前数据中有没有这一条数据
       weakSelf.oneStu = [Student MR_findFirstByAttribute:@"name" withValue:@"0" inContext:localContext];
       if (weakSelf.oneStu == nil) {
           weakSelf.oneStu = [Student MR_createEntityInContext:localContext];
       }
       weakSelf.oneStu.name = [NSString stringWithFormat:@"%d",1];
       weakSelf.oneStu.age = _age;
       weakSelf.oneStu.score = 85.9;
   } completion:^(BOOL contextDidSave, NSError * _Nullable error) {
       NSLog(@"%d === %@",contextDidSave,error);
   }];
}
- (IBAction)jump3:(id)sender {
    //查询全部
    for (Student *stu in [Student MR_findAll]) {
        NSLog(@"%@ %d %f",stu.name,stu.age,stu.score);
    }
    //谓词查询：scroe > 90;

    for (Student *s in [Student MR_findAllWithPredicate:[NSPredicate predicateWithFormat:@"score>90"]]) {
        NSLog(@"%@ %d %f",s.name,s.age,s.score);

    }
}
- (IBAction)jump2:(id)sender {
    //修改，其实和插入差不多，还可以理解为插入的位置是原先改变的位置
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
        Student *stu = [Student MR_findFirstByAttribute:@"age" withValue:@3 inContext:localContext];
        NSLog(@"%hd",stu.age);
        stu.score = 200;
    } completion:^(BOOL contextDidSave, NSError * _Nullable error) {
        NSLog(@"%d",contextDidSave);
    }];
}
- (IBAction)openPickView:(id)sender {
    
    // 1.判断相册是否可以打开
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) return;
    // 2. 创建图片选择控制器
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    /**
     typedef NS_ENUM(NSInteger, UIImagePickerControllerSourceType) {
     UIImagePickerControllerSourceTypePhotoLibrary, // 相册
     UIImagePickerControllerSourceTypeCamera, // 用相机拍摄获取
     UIImagePickerControllerSourceTypeSavedPhotosAlbum // 相簿
     }
     */
    // 3. 设置打开照片相册类型(显示所有相簿)
    ipc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    // ipc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    // 照相机
    // ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    // 4.设置代理
    ipc.delegate = self;
    // 5.modal出这个控制器
    [self presentViewController:ipc animated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _age = 0;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(add) userInfo:nil repeats:YES];
    [_timer setFireDate:[NSDate distantPast]];
}
-(void)add{
    static NSInteger Count = 0;
    self.titlelabel.text = [NSString stringWithFormat:@"%ld",(long)Count];
    Count ++;
}
#pragma mark -- <UIImagePickerControllerDelegate>--
// 获取图片后的操作
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    // 销毁控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
    // 设置图片
    self.imageView.image = info[UIImagePickerControllerOriginalImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
