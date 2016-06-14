#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GeneratePDF : NSObject

+ (void)pdfDataOfView:(UIView *)view pdfSize:(CGSize)pdfSize pdfName:(NSString *)pdfName;
+ (void)pdfDataOfScreenShot:(UIImage *)screenShot pdfSize:(CGSize)pdfSize pdfName:(NSString *)pdfName;

@end
