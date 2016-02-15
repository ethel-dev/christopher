christopher
===========

code and cipher transcribing JS library by Ethan Arterberry

supported "codes"
----------------

- morse code
- base conversion
- nato
- caesarian shift

usage
-----

just like, include `christopher.js` somehow or install with `npm install christopher` 

example code:

```javascript
// to base
christopher.to.base("christopher", 2, {
	spacing: true // puts spaces between converted letters, only important when translating words
				  // required for translating words back to words
})

christopher.to.base("10", 16, {
	startBase: 10 // radix, only useful when translating a number in a string
				  // other than that, no
})

// from base
christopher.from.base("a", 16) // "a" in hexadecimal is 10
christopher.from.base("1100011 1101000 1110010 1101001 1110011 1110100 1101111 1110000 1101000 1100101 1110010", 2) // "christopher"

// morse code
christopher.to.morse("hello") // ".... . .-.. .-.. ---"
christopher.from.morse(".... . .-.. .-.. ---") // "hello"

// nato
christopher.to.nato("hello") // "Hotel Echo Lima Lima Oscar"
christopher.from.nato("Hotel Echo Lima Lima Oscar") // hello

// caesarian shift
// second argument is the shift, or basically the amount of letters in the alphabet each letter in the string should move over
// negative shift is backwards in the alphabet, positive shift is forwards
christopher.to.caesar("hello", 5) // shifts each character in "hello" 5 letters over to make "mjqqt"
christopher.from.caesar("mjqqt", 5) // shifts each character in "mjqqt" back 5 letters to make "hello"
```

why the name "christopher"?
---------------------------
The name "Christopher" comes from the name of Alan Turing's first love, Christopher Morcom, who tragically died of bovine tuberculosis just weeks before Alan could confess his love to him. Alan Turing later personally named his legendary Enigma-breaking computer "Christopher" after his childhood love, hence why this cipher library is named Christopher.