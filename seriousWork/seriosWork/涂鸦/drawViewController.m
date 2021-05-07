//
//  drawViewController.m
//  seriousWork
//
//  Created by 史宗运 on 2021/4/18.
//

#import "drawViewController.h"
#import "UIImage+MJ.h"

@interface drawViewController ()

@end

@implementation drawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)clean:(id)sender {
    [self.paintView clean];
}


- (IBAction)back:(id)sender {
    [self.paintView back];
}


- (IBAction)save:(id)sender {
    UIImage *image = [UIImage captureWithView:self.paintView];
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error) { //保存失败
        NSLog(@"保存失败");
    } else { //保存成功
        NSLog(@"保存成功");
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
