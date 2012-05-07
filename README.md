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
