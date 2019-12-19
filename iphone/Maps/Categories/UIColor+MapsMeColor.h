#import "UIColor+PartnerColor.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (MapsMeColor)

+ (UIColor *)blackPrimaryText; //SEARCH
+ (UIColor *)blackSecondaryText; //SEARCH
+ (UIColor *)blackHintText; //SEARCH
+ (UIColor *)red; //SEARCH
+ (UIColor *)white; //SEARCH
+ (UIColor *)primary;
+ (UIColor *)pressBackground; // One dep
+ (UIColor *)linkBlue;
+ (UIColor *)linkBlueHighlighted;
+ (UIColor *)buttonRed;
+ (UIColor *)blackDividers;
+ (UIColor *)whitePrimaryText;
+ (UIColor *)whitePrimaryTextHighlighted;
+ (UIColor *)whiteHintText;
+ (UIColor *)buttonDisabledBlueText;
+ (UIColor *)blackOpaque;
+ (UIColor *)bookingBackground;
+ (UIColor *)opentableBackground;
+ (UIColor *)bannerBackground;
+ (UIColor *)transparentGreen;
+ (UIColor *)ratingRed;
+ (UIColor *)ratingOrange;
+ (UIColor *)ratingYellow;
+ (UIColor *)ratingLightGreen;
+ (UIColor *)ratingGreen;
+ (UIColor *)speedLimitRed;
+ (UIColor *)speedLimitGeen;
+ (UIColor *)speedLimitWhite;
+ (UIColor *)speedLimitLightGray;
+ (UIColor *)speedLimitDarkGray;

+ (UIColor *)colorWithName:(NSString *)colorName;
+ (UIColor *)colorFromHexString:(NSString *)hexString;

+ (void)setNightMode:(BOOL)mode;
+ (BOOL)isNightMode;

- (UIColor *)opposite;

@end

NS_ASSUME_NONNULL_END
