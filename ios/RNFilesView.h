
#import <UIKit/UIKit.h>
#if __has_include("RCTComponent.h")
#import "RCTComponent.h"
#else
#import <React/RCTComponent.h>
#endif

@interface RNFilesView : UIView {
    NSArray* _urls;
    UIColor* _previewBackgroundColor;
    NSInteger _initialIndex;
}

@property (nonatomic, copy) RCTBubblingEventBlock onFileChange;

@end
  
