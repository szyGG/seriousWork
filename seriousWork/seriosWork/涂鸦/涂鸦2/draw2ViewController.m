//
//  draw2ViewController.m
//  seriousWork
//
//  Created by 史宗运 on 2021/4/18.
//

#import "draw2ViewController.h"
#import "UIImage+MJ.h"

@interface draw2ViewController ()

@end

@implementation draw2ViewController

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
- (IBAction)redcolor:(id)sender {
    [self.paintView changeColor:UIColor.redColor];
    
}
- (IBAction)blueColor:(id)sender {
    
    [self.paintView changeColor:TOPCAIL_COLOR];
}
- (IBAction)orangeColor:(id)sender {
    [self.paintView changeColor:UIColor.orangeColor];
    
}
- (IBAction)greenColor:(id)sender {
    [self.paintView changeColor:UIColor.greenColor];
    
}
- (IBAction)sliderChange:(UISlider *)sender {
    [self.paintView changeLineWidth:sender.value];
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
