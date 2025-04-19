#!/opt/homebrew/bin/bash
set -euo pipefail

input="yup"
case "$input" in
    [Yy]?? | [Ss]ure | [Oo][Kk]*) echo "We agree";;
    [Nn][Oo]) echo "Fine NO!";;
    *) echo "not recognized"
esac

# In our example, the construct [Yy] matches either uppercase Y or lowercase y. The
# construct [Nn][Oo]* matches either upper- or lowercase N, followed by either upper-
# or lowercase O, followed by any number of any other characters. The pattern matches
# the following words (and others, too): no, No, nO, NO, noway, Not Ever, and nope. It
# will not be a match if the value of $var is the word never.
# Can you guess some possible values for the affirmative case? The vertical bar sepa‐
# rates different patterns that would all lead to the same result. (Think “OR” but not
# the || or.) The words Yes, yes, YES, yEs, yES, yup, Sure, sure, OK, ok, and OKfine and
# “OK why not” would all work. But these words would not: ya, SURE, oook, and many
# more.