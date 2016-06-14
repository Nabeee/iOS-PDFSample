#import "ViewController.h"
#import "GeneratePDF.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)generatePDFOfView:(id)sender {
    CGSize pdfSize = [[UIScreen mainScreen] bounds].size;
    NSString *pdfName = @"pdfFromUIView";
    [GeneratePDF pdfDataOfView:self.view pdfSize:pdfSize pdfName:pdfName];
}

- (IBAction)generatePDFOfScreenShot:(id)sender {
    UIImage *screenshot = [self screenCapture:self.view];
    CGSize pdfSize = screenshot.size;
    NSString *pdfName = @"pdfFromUIImage";
    [GeneratePDF pdfDataOfScreenShot:screenshot pdfSize:pdfSize pdfName:pdfName];
}

- (UIImage *)screenCapture:(UIView *)view {
    UIImage *capture;
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, [UIScreen mainScreen].scale);
    
    if ([view respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    } else {
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    
    capture = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return capture;
}


@end
