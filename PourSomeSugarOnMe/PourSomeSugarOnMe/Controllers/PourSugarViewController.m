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


@interface PourSugarViewController ()
@property (nonatomic, strong) Person *me;
@property (nonatomic, assign) NSUInteger numberOfLumps;
@property (nonatomic, weak) IBOutlet UILabel *numberOfLumpsLabel;
@property (nonatomic, weak) IBOutlet UISlider *slider;
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
    return self;
}


#pragma mark - Internal Methods

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
