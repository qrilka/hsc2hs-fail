# hsc2hs-fail

This is a repro to show 2 problems

## hsc2hs shipped with GHC 8.8.x reports wrong version

Set lts-15.5 as a resolver in stack.yaml this will give you

``` 
$ stack exec -- hsc2hs --version
hsc2hs version 0.68.5
```

At the same time `stack build` will finish with success while it should fail
because only 0.68.6 includes the fix for quotes in *.hsc files

And uncommenting the lines

``` 
#build-tools:
#- hsc2hs >= 0.68.6
```

in `package.yaml` results in `stack build` ending up in an error from Cabal
saying that `0.68.5` doesn't match the constraint `>= 0.68.6`.

## Stack doesn't manage build-tools constraints

It appears that [lts-14.27](https://www.stackage.org/lts-14.27) includes hsc2hs-0.68.6
and with the lines

```
#build-tools:
#- hsc2hs >= 0.68.6
```

commented  out we get a build failure because the version 0.68.5 from GHC-8.6.5
gets used. Uncommeting the constraint above gives a unsatisfied version failure
from Cabal.

One could build `hsc2hs` manually with `stack build hsc2hs` and that adds the
verion 0.68.6 in to the Stack's path:

```
$ stack exec -- hsc2hs --version
hsc2hs version 0.68.6
```

But it appears that `stack build` could only use `hsc2hs` shipped with GHC.
