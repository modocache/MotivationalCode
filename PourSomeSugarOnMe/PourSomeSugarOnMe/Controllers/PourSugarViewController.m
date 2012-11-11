//
//  Copyright (c) 2012 modocache
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//


#import "PourSugarViewController.h"
#import "NSDefLeppard.h"
#import "Person.h"


static NSString * const kPourSugarViewSliderValueStateKey = @"PourSugarViewSliderValueStateKey";


@interface PourSugarViewController () <UIViewControllerRestoration>
@property (nonatomic, strong) Person *me;
@property (nonatomic, assign) NSUInteger numberOfLumps;
@property (nonatomic, weak) IBOutlet UILabel *numberOfLumpsLabel;
@property (nonatomic, weak) IBOutlet UISlider *slider;
- (void)setupRestoration;
- (IBAction)onSliderValueChanged:(UISlider *)sender;
- (IBAction)onPourSomeSugarOnMeButtonTap:(UIButton *)sender;
@end


@implementation PourSugarViewController


#pragma mark - Object Lifecycle

- (id)init {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _me = [Person new];
    }

    [self setupRestoration];
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupRestoration];
}


#pragma mark - UIViewController Overrides

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    [coder encodeFloat:self.slider.value forKey:kPourSugarViewSliderValueStateKey];
    [super encodeRestorableStateWithCoder:coder];
}

- (void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    self.slider.value = [coder decodeFloatForKey:kPourSugarViewSliderValueStateKey];
    [self.slider sendActionsForControlEvents:UIControlEventValueChanged];
    [super decodeRestorableStateWithCoder:coder];
}


#pragma mark - UIViewControllerRestoration Protcol Methods

+ (UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents
                                                            coder:(NSCoder *)coder {
    PourSugarViewController *viewController = nil;
    float sliderValue = [coder decodeFloatForKey:kPourSugarViewSliderValueStateKey];
    if (sliderValue > 0.0f) {
        viewController = [PourSugarViewController new];
        viewController.slider.value = sliderValue;
    }
    return viewController;
}


#pragma mark - Internal Methods

- (void)setupRestoration {
    self.restorationIdentifier = NSStringFromClass([self class]);
    self.restorationClass = [self class];
}

- (void)setNumberOfLumps:(NSUInteger)numberOfLumps {
    _numberOfLumps = numberOfLumps;
    self.numberOfLumpsLabel.text = [NSString stringWithFormat:@"%u", numberOfLumps];
    switch (numberOfLumps) {
        case 1:
            self.me.sugarPreference = SugarPreferenceOneLump;
            break;
        case 2:
            self.me.sugarPreference = SugarPreferenceTwoLumps;
            break;
        case 3:
            self.me.sugarPreference = SugarPreferenceThreeLumps;
        default:
            break;
    }
}

- (IBAction)onSliderValueChanged:(UISlider *)sender {
    self.numberOfLumps = (NSUInteger)sender.value;
}

- (IBAction)onPourSomeSugarOnMeButtonTap:(UIButton *)sender {
    [[NSDefLeppard defaultLeppard] pourSomeSugarOn:self.me];
}

@end
