#import "RNInstagramShare.h"
#import <QuartzCore/QuartzCore.h>

@interface RNInstagramShare ()

@property (nonatomic, strong) RCTResponseSenderBlock callback;
@property (nonatomic, strong) NSDictionary *defaultOptions;
@property (nonatomic, retain) NSMutableDictionary *options, *response;
@property (nonatomic, retain) UIDocumentInteractionController *documentController;


@end

@implementation RNInstagramShare

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(createPost:(NSDictionary *)options callback:(RCTResponseSenderBlock)callback)
{
    callback(@[@([self instaGramWallPostWithURL:[options objectForKey:@"url"]])]);
}

-(BOOL)instaGramWallPostWithURL: (NSString*) url
{
    NSURL *myURL = [NSURL URLWithString:url];
    NSData * imageData = [[NSData alloc] initWithContentsOfURL:myURL];
    UIImage *imgShare = [[UIImage alloc] initWithData:imageData];
    
    NSURL *instagramURL = [NSURL URLWithString:@"instagram://app"];
    
    if([[UIApplication sharedApplication] canOpenURL:instagramURL]) //check for App is install or not
    {
        UIImage *imageToUse = imgShare;
        NSString *documentDirectory=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        NSString *saveImagePath=[documentDirectory stringByAppendingPathComponent:@"Image.igo"];
        NSData *imageData=UIImagePNGRepresentation(imageToUse);
        [imageData writeToFile:saveImagePath atomically:YES];
        NSURL *imageURL=[NSURL fileURLWithPath:saveImagePath];
        self.documentController=[[UIDocumentInteractionController alloc]init];
        self.documentController = [UIDocumentInteractionController interactionControllerWithURL:imageURL];
        self.documentController.delegate = self;
        self.documentController.annotation = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"Testing"], @"InstagramCaption", nil];
        self.documentController.UTI = @"com.instagram.exclusivegram";
        UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
        [self.documentController presentOpenInMenuFromRect:CGRectMake(1, 1, 1, 1) inView:vc.view animated:YES];
        return YES;
    } else {
        return NO;
    }
}

@end


