#import "RNFilesViewManager.h"
#import "RNFilesViewView.h"

#import <QuickLook/QuickLook.h>

@implementation RNFilesViewManager

RCT_EXPORT_MODULE()

- (UIView *) view  {
    return [[RNFilesViewView alloc] init];
}

RCT_EXPORT_VIEW_PROPERTY(urls, NSArray)
RCT_EXPORT_VIEW_PROPERTY(onFileChange, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(previewBackgroundColor, UIColor)
RCT_EXPORT_VIEW_PROPERTY(initialIndex, NSInteger)


@end
