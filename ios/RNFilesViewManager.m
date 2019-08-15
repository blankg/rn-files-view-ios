#import "RNFilesViewManager.h"
#import "RNFilesView.h"

#import <QuickLook/QuickLook.h>

@implementation RNFilesViewManager

RCT_EXPORT_MODULE()

- (UIView *) view  {
    return [[RNFilesView alloc] init];
}

RCT_EXPORT_VIEW_PROPERTY(urls, NSArray)
RCT_EXPORT_VIEW_PROPERTY(onFileChange, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(previewBackgroundColor, UIColor)
RCT_EXPORT_VIEW_PROPERTY(initialIndex, NSInteger)
RCT_EXPORT_VIEW_PROPERTY(onPreviewFailed, RCTBubblingEventBlock)

@end
