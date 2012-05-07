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


#import <stdlib.h>
#import "Inhibition.h"

@implementation Inhibition

#pragma mark - Object Lifecycle

- (void)dealloc
{
    int r = arc4random() % 6;
    
    switch (r) {
        case 0:
            NSLog(@"The question isn't \"what are we going to do,\" "
                  @"the question is \"what aren't we going to do?\"");
            break;
        case 1:
            NSLog(@"Life moves pretty fast. If you don't stop and look around once in a while, "
                  @"you could miss it.");
            break;
        case 2:
            NSLog(@"How can I possibly be expected to handle school on a day like this?");
            break;
        case 3:
            NSLog(@"Look, it's real simple. Whatever mileage we put on, we'll take off.");
            break;
        case 4:
            NSLog(@"If you had access to a car like this, would you take it back right away? "
                  @"Neither would I.");
            break;
        case 5:
            NSLog(@"What do you think Ferris is gonna do?");
            NSLog(@"He's gonna be a fry cook on Venus!");
            break;
        case 6:
            NSLog(@"The sportos, the motorheads, geeks, sluts, bloods, wastoids, dweebies, "
                  @"dickheads - they all adore him. They think he's a righteous dude.");
        default:
            break;
    }
    
    [super dealloc];
}

@end
