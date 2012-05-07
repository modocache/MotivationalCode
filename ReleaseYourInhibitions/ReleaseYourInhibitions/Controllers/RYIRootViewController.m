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


#import "RYIRootViewController.h"
#import "Inhibition.h"

@interface RYIRootViewController ()
- (void)updateInhibitionsCounterLabel;
@end

@implementation RYIRootViewController

#pragma mark - Object Lifecycle

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        NSUInteger inhibitionCount = 10;
        inhibitions_ = [[NSMutableArray arrayWithCapacity:inhibitionCount] retain];
        
        for (int i = 0; i < inhibitionCount; ++i) {
            Inhibition *inhibition = [[[Inhibition alloc] init] autorelease];
            [inhibitions_ addObject:inhibition];
        }
    }
    return self;
}

- (void)dealloc
{
    [inhibitions_ release];
    [super dealloc];
}

#pragma mark - UIViewController Overrides

- (void)viewDidLoad
{
    [self updateInhibitionsCounterLabel];
}

- (void)viewDidUnload
{
    [inhibitionsCounterLabel_ release];
    [inhibitionsStepper_ release];
    
    inhibitionsCounterLabel_ = nil;
    inhibitionsStepper_ = nil;
}

#pragma mark - Public Interface

- (IBAction)stepperValueDidChange:(UIStepper *)stepper
{
    double value = stepper.value;
    
    if (value > inhibitions_.count) {
        for (int i = 0; i <= value - inhibitions_.count; ++i) {
            Inhibition *inhibition = [[[Inhibition alloc] init] autorelease];
            [inhibitions_ addObject:inhibition];
        }
    } else {
        for (int i = 0; i <= inhibitions_.count - value; ++i) {
            Inhibition *inhibition = [[inhibitions_ lastObject] retain];
            [inhibitions_ removeLastObject];
            [inhibition release]; // Fuck yeah!
        }
    }
    
    [self updateInhibitionsCounterLabel];
}

#pragma mark - Internal Methods

- (void)updateInhibitionsCounterLabel
{
    inhibitionsCounterLabel_.text = [NSString stringWithFormat:@"%d", inhibitions_.count];
    
    if ([inhibitionsCounterLabel_.text isEqualToString:@"0"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Inhibitions released!"
                                                        message:@"FUCK YEEEEEAAHH!!"
                                                       delegate:nil
                                              cancelButtonTitle:@"Word."
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}


@end
