#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

%hook UIViewController
- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
	if ([viewControllerToPresent isMemberOfClass:[UIAlertController class]]){
		UIAlertController * alert = (UIAlertController*)viewControllerToPresent;
		if([alert.message containsString:@"Jailbreak"]){
			return ;
		}
	}
	%orig;
}
%end