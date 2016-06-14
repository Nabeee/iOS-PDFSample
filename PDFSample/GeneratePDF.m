#import "GeneratePDF.h"
#import <QuartzCore/QuartzCore.h>

@implementation GeneratePDF

#define margin 0
CGFloat pdfHeight;
CGFloat pdfWidth;

+ (void)pdfDataOfView:(UIView *)view pdfSize:(CGSize)pdfSize pdfName:(NSString *)pdfName  {
    pdfHeight = pdfSize.height;
    pdfWidth = pdfSize.width;
    
    CGRect origFrame = view.frame;
    CGFloat maxHeight = pdfHeight - 2 * margin;
    CGFloat maxWidth = pdfWidth - 2 * margin;
    [view setFrame:CGRectMake(0.f, 0.f, maxWidth, maxHeight)];
    
    NSString *pdfFileFullPath = [self getDownloadFullPath:pdfName];
    UIGraphicsBeginPDFContextToFile(pdfFileFullPath, CGRectZero, nil);
    
    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, pdfWidth, pdfHeight), nil);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    [view.layer renderInContext:currentContext];
    
    UIGraphicsEndPDFContext();
    [view setFrame:origFrame];
}

+ (void)pdfDataOfScreenShot:(UIImage *)screenShot pdfSize:(CGSize)pdfSize pdfName:(NSString *)pdfName {
    pdfHeight = pdfSize.height;
    pdfWidth = pdfSize.width;
    
    NSString *pdfFileFullPath = [self getDownloadFullPath:pdfName];
    UIGraphicsBeginPDFContextToFile(pdfFileFullPath, CGRectZero, nil);
    
    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, pdfWidth, pdfHeight), nil);
    
    [screenShot drawAtPoint:CGPointZero];
    
    UIGraphicsEndPDFContext();
}

+ (NSString *)getDownloadFullPath:(NSString *)pdfName {
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    NSString *pdfFileFullPath = [documentDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.pdf", pdfName]];
    
    return pdfFileFullPath;
}

@end
