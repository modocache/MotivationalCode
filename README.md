# Motivational Code [![endorse](http://api.coderwall.com/modocache/endorsecount.png)](http://coderwall.com/modocache)

This repository is a collection of motivational programs.
Each one is a fully working program that also delivers
an uplifting message.

---

### ReleaseYourInhibitions

![Release Your Inhibitions](http://f.cl.ly/items/3i0j3x031V2z3z0J013v/ReleaseYourInhibitions.png)

    for (int i = 0; i <= inhibitions_.count - value; ++i) {
        Inhibition *inhibition = [[inhibitions_ lastObject] retain];
        [inhibitions_ removeLastObject];
        [inhibition release];
    }

---

### Pour Some Sugar On Me

![Pour Some Sugar On Me](http://f.cl.ly/items/2Q3h431S3N1t341T1b39/Screen%20Shot%202012-11-06%20at%201.42.41%20AM.png)

    // PourSugarViewController.m
    - (IBAction)onPourSomeSugarOnMeButtonTap:(UIButton *)sender {
        [[NSDefLeppard defaultLeppard] pourSomeSugarOn:self.me];
    }
    
    // NSDefLeppard.m
    - (void)pourSomeSugarOn:(Person *)person {
        if ([person conformsToProtocol:@protocol(TakesSugar)]) { // Do you take sugar?
            [person prepareForSugar];
            switch (person.sugarPreference) {
                case SugarPreferenceOneLump: // One lump
                    [person takeSugar:1];
                    break;
                case SugarPreferenceTwoLumps: // or two?
                    [person takeSugar:2];
                    break;
                default:
                    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                                   reason:@"Do you take sugar? One lump or two?"
                                                 userInfo:nil];
                    break;
            }
        }
    }

---

### Contributing

Please fork and submit a pull request with your inspirational,
*working* code! You will be granted push rights to the repo
after your first commit is merged.

Some ground rules:

- The code must function. No psuedocode.
- Each program should be placed in its own folder in the root
  directory of the repository.
- Or add your uplifting project as a submodule. Those rock.
- Any language is acceptable.
- In addition to the code, add a screenshot or snippet to the README that
  showcases the key point of your stirring script.
