#import "with-idris.typ": with-idris

#show: with-idris.with(set-console: true)

#let idrisCode = raw(read("example-code.idr"), lang: "idris")

= Haskell

#show: with-idris.with(set-syntax: false, lang: "hs")

```hs
-- some code in Haskell
import Data.List

data X = A | B

f :: Int -> Int
f x | x > 0     = x
    | otherwise = 0
```

= Idris (light theme)

#idrisCode

Also, we can have some inline code: ```idris data X = A | B```, for example.

= Idris (dark theme)

#show: with-idris.with(dark-theme: true)

#idrisCode

= Console

```console
     ____    __     _         ___
    /  _/___/ /____(_)____   |__ \
    / // __  / ___/ / ___/   __/ /     Version 0.7.0-fc3d2a04d
  _/ // /_/ / /  / (__  )   / __/      https://www.idris-lang.org
 /___/\__,_/_/  /_/____/   /____/      Type :? for help
Welcome to Idris 2.  Enjoy yourself!
#text(green)[Main>] [1, 2, 3] >>= pure
[#text(red)[1], #text(red)[2], #text(red)[3]]
#text(green)[Main>] -- \# <- we can print this sign using quotation (\\#)
#text(green)[Main>]
```
