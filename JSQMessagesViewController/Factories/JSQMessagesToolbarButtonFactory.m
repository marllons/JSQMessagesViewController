//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSQMessagesViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQMessagesViewController
//
//
//  License
//  Copyright (c) 2014 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import "JSQMessagesToolbarButtonFactory.h"

#import "UIColor+JSQMessages.h"
#import "UIImage+JSQMessages.h"
#import "NSBundle+JSQMessages.h"


@implementation JSQMessagesToolbarButtonFactory

+ (UIButton *)defaultAccessoryButtonItem
{
    UIImage *accessoryImage = [UIImage jsq_defaultAccessoryImage];
    UIImage *normalImage = [accessoryImage jsq_imageMaskedWithColor:[UIColor lightGrayColor]];
    UIImage *highlightedImage = [accessoryImage jsq_imageMaskedWithColor:[UIColor darkGrayColor]];

    UIButton *accessoryButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, accessoryImage.size.width, 32.0f)];
    [accessoryButton setImage:normalImage forState:UIControlStateNormal];
    [accessoryButton setImage:highlightedImage forState:UIControlStateHighlighted];

    accessoryButton.contentMode = UIViewContentModeScaleAspectFit;
    accessoryButton.backgroundColor = [UIColor clearColor];
    accessoryButton.tintColor = [UIColor lightGrayColor];
    
    accessoryButton.accessibilityLabel = [NSBundle jsq_localizedStringForKey:@"accessory_button_accessibility_label"];

    return accessoryButton;
}

+ (UIButton *)defaultSendButtonItem
{
    NSString *sendTitle = [NSBundle jsq_localizedStringForKey:@""];
    UIImage *btnImage = [UIImage imageNamed:@"Sent-25.png"];

    UIButton *sendButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [sendButton setTitle:sendTitle forState:UIControlStateNormal];
    [sendButton setTitleColor:[UIColor jsq_messageBubbleBlueColor] forState:UIControlStateNormal];
    [sendButton setTitleColor:[[UIColor jsq_messageBubbleBlueColor] jsq_colorByDarkeningColorWithValue:0.1f] forState:UIControlStateHighlighted];
    [sendButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [sendButton setImage:btnImage forState:UIControlStateNormal];

    sendButton.titleLabel.font = [UIFont boldSystemFontOfSize:17.0f];
    sendButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    sendButton.titleLabel.minimumScaleFactor = 0.85f;
    sendButton.contentMode = UIViewContentModeCenter;
    sendButton.backgroundColor = [UIColor clearColor];
    sendButton.tintColor = [UIColor jsq_messageBubbleBlueColor];

    CGFloat maxHeight = 32.0f;

//    CGRect sendTitleRect = [sendTitle boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, maxHeight)
//                                                   options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
//                                                attributes:@{ NSFontAttributeName : sendButton.titleLabel.font }
//                                                   context:nil];
    
    CGRect buttonImageRect = CGRectMake(0.0f, 40.0f, btnImage.size.width, btnImage.size.height);

    sendButton.frame = CGRectMake(0.0f,
                                  0.0f,
                                  CGRectGetWidth(CGRectIntegral(buttonImageRect)),
                                  maxHeight);

    return sendButton;
}

@end
