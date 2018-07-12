
#import "RNFilesView.h"
#import <QuickLook/QuickLook.h>

@interface RNQLPreviewController : QLPreviewController

@property (nonatomic, strong) UIColor * previewBackgroundColor;

@end

@implementation RNQLPreviewController

@synthesize previewBackgroundColor;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.previewBackgroundColor != nil) {
        [self.view setBackgroundColor:self.previewBackgroundColor];
    }
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    if (self.previewBackgroundColor != nil) {
        [self.view.subviews enumerateObjectsUsingBlock:^(UIView* view, NSUInteger idx, BOOL *stop) {
            [view setBackgroundColor:self.previewBackgroundColor];
        }];
    }
}
@end

@interface RNFilesView () <QLPreviewControllerDataSource, QLPreviewControllerDelegate>

@property UIView* previewView;
@property RNQLPreviewController* previewCtrl;

@end

@implementation RNFilesView

static void *changePageContext = &changePageContext;

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
    
}

- (void)initialize {
    _initialIndex = 0;
    self.previewCtrl = [[RNQLPreviewController alloc] init];
    self.previewCtrl.delegate = self;
    self.previewCtrl.dataSource = self;
    self.previewView = self.previewCtrl.view;
    self.clipsToBounds = YES;
    [self addSubview:self.previewCtrl.view];
    [self.previewCtrl addObserver:self forKeyPath:@"currentPreviewItemIndex" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:changePageContext];
    [self addObserver:self forKeyPath:@"onFileChange" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:changePageContext];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                       change:(NSDictionary *)change context:(void *)context
{
    if (context == changePageContext)
    {
        NSLog(@"[RNFilesView] newValue:%ld",(long)self.previewCtrl.currentPreviewItemIndex);
        if (self.onFileChange && self.previewCtrl.currentPreviewItemIndex != NSIntegerMax) {
            self.onFileChange(@{@"index": @(self.previewCtrl.currentPreviewItemIndex)});
        }
    }
    else
    {
        // Any unrecognized context must belong to super
        [super observeValueForKeyPath:keyPath
                             ofObject:object
                               change:change
                              context:context];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.previewView setFrame:self.frame];
}

- (void)removeFromSuperview {
    [super removeFromSuperview];
    [self.previewCtrl removeObserver:self forKeyPath:@"currentPreviewItemIndex"];
    [self removeObserver:self forKeyPath:@"onFileChange"];
}

- (void)setUrls:(NSArray *)urls {
    BOOL shouldRefresh = NO;
    if (urls.count != _urls.count || ![_urls isEqualToArray:urls]) {
        shouldRefresh = YES;
    }
    
    _urls = urls;
    
    if (shouldRefresh) {
        [self.previewCtrl refreshCurrentPreviewItem];
    }
}

- (void)setInitialIndex:(NSInteger)index {
    _initialIndex = index;
    self.previewCtrl.currentPreviewItemIndex = index;
}

- (void)setPreviewBackgroundColor:(UIColor *)color {
    _previewBackgroundColor = color;
    self.previewCtrl.previewBackgroundColor = _previewBackgroundColor;
}

#pragma mark - QLPreviewControllerDataSource

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller {
    return _urls.count;
}

- (id <QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index {
    return [NSURL URLWithString:_urls[index]];
}

#pragma mark - QLPreviewControllerDelegate

- (BOOL)previewController:(QLPreviewController *)controller shouldOpenURL:(NSURL *)url forPreviewItem:(id <QLPreviewItem>)item {
    return YES;
}

@end
  
