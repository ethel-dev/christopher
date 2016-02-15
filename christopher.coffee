# christopher
# license: MIT
# (c) ethan arterberry 2016

christopher =
	to:
		base: (input, base, opts) ->
			if isNaN(input) != true
				if typeof input == "string"
					if opts?.startBase then parseInt(input, opts.startBase).toString(base) else parseInt(input, 10).toString(base)
				else
					return input.toString base
			else
				inputArray = input.split ""
				outputString = ""

				for items, i in inputArray
					outputString += items.charCodeAt(0).toString(base)

					if i != inputArray.length - 1 and opts?.spacing isnt false
						outputString += " "

				return outputString

		morse: (input) ->
			morse = {
				"a": ".-",
				"b": "-...",
				"c": "-.-.",
				"d": "-..",
				"e": ".",
				"f": "..-.",
				"g": "--.",
				"h": "....",
				"i": "..",
				"j": ".---",
				"k": "-.-",
				"l": ".-..",
				"m": "--",
				"n": "-.",
				"o": "---",
				"p": ".--.",
				"q": "--.-",
				"r": ".-.",
				"s": "...",
				"t": "-",
				"u": "..-",
				"v": "...-",
				"w": ".--",
				"x": "-..-",
				"y": "-.--",
				"z": "--..",
				"0": "-----",
				"1": ".----",
				"2": "..---",
				"3": "...--",
				"4": "....-",
				"5": ".....",
				"6": "-....",
				"7": "--...",
				"8": "---..",
				"9": "----.",
				".": ".-.-.-",
				",": "--..--",
				":": "---...",
				"?": "..--..",
				"'": ".----.",
				"-": "-....-",
				"/": "-..-.",
				"\"": ".-..-.",
				"@": ".--.-.",
				"=": "-...-",
				" ": "/"
			}

			inputArray = input.toLowerCase().split("")
			outputString = ""

			for item, i in inputArray
				outputString += if morse[item] then morse[item] else throw new Error("Character not translatable to Morse code: #{item}")

				if i != inputArray.length - 1 then outputString += " "

			return outputString

		nato: (input) ->
			nato = {
				"a": "Alpha",
				"b": "Bravo",
				"c": "Charlie",
				"d": "Delta",
				"e": "Echo",
				"f": "Foxtrot",
				"g": "Golf",
				"h": "Hotel",
				"i": "India",
				"j": "Juliet",
				"k": "Kilo",
				"l": "Lima",
				"m": "Mike",
				"n": "November",
				"o": "Oscar",
				"p": "Papa",
				"q": "Quebec",
				"r": "Romeo",
				"s": "Sierra",
				"t": "Tango",
				"u": "Uniform",
				"v": "Victor",
				"w": "Whiskey",
				"x": "X-ray",
				"y": "Yankee",
				"z": "Zulu",
				"1": "One",
				"2": "Two",
				"3": "Three",
				"4": "Four",
				"5": "Five",
				"6": "Six",
				"7": "Seven",
				"8": "Eight",
				"9": "Nine",
				"0": "Zero",
				" ": "/"
			}

			inputArray = input.toLowerCase().split("")
			outputString = ""

			for item, i in inputArray
				outputString += if nato[item] then nato[item] else item

				if i != inputArray.length - 1 and /^[\x00-\x7F]*$/.test(item) == true then outputString += " "

			return outputString

		caesar: (input, shift) ->
			return input.replace /([a-z|A-Z])/g, ($1) ->
			    char = $1.charCodeAt(0)
			    String.fromCharCode \
			      if char >= 97
			      then (char + shift + 26 - 97) % 26 + 97
			      else (char + shift + 26 - 65) % 26 + 65

		atbash: (input) ->
			atbash = {
			    "a": "z",
			    "b": "y",
			    "c": "x",
			    "d": "w",
			    "e": "v",
			    "f": "u",
			    "g": "t",
			    "h": "s",
			    "i": "r",
			    "j": "q",
			    "k": "p",
			    "l": "o",
			    "m": "n",
			    "n": "m",
			    "o": "l",
			    "p": "k",
			    "q": "j",
			    "r": "i",
			    "s": "h",
			    "t": "g",
			    "u": "f",
			    "v": "e",
			    "w": "d",
			    "x": "c",
			    "y": "b",
			    "z": "a",
			    "A": "Z",
			    "B": "Y",
			    "C": "X",
			    "D": "W",
			    "E": "V",
			    "F": "U",
			    "G": "T",
			    "H": "S",
			    "I": "R",
			    "J": "Q",
			    "K": "P",
			    "L": "O",
			    "M": "N",
			    "N": "M",
			    "O": "L",
			    "P": "K",
			    "Q": "J",
			    "R": "I",
			    "S": "H",
			    "T": "G",
			    "U": "F",
			    "V": "E",
			    "W": "D",
			    "X": "C",
			    "Y": "B",
			    "Z": "A"
			}

			inputArray = input.split("")
			outputString = ""

			for item, i in inputArray
				outputString += if atbash[item] then atbash[item] else item

			return outputString

		letternumbers: (input) ->
			alphabet = ["this space is intentionally left blank for the sake of this script", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

			inputArray = input.toLowerCase().split("")
			outputString = ""

			for item, i in inputArray
				if alphabet.indexOf(item) != -1 
					outputString += alphabet.indexOf(item) 
				else if item == " "
					if i != inputArray.length - 1 then outputString += " / "

				if i != inputArray.length - 1 and item != " " and alphabet.indexOf(inputArray[i + 1]) > -1 then outputString += "-"

			return outputString.toUpperCase()


	from:
		base: (input, base) ->
			if /\s/g.test(input) != true
				console.log("Currently, spacing should be enabled/included to translate strings of encoded text. Your decode probably won't work without spacing. Unless, of course, you're only translating one character or something.")
				outputArray = String.fromCharCode(parseInt(input, base))
			else if isNaN(input) != true or typeof input != "string"
				return input.toString base
			else
				outputArray = input.split(" ")

				inputString = ""

				for items in outputArray
					inputString += String.fromCharCode(parseInt(items, base))

				return inputString

		morse: (input) ->
			morse = {
			    "-----": "0",
			    ".----": "1",
			    "..---": "2",
			    "...--": "3",
			    "....-": "4",
			    ".....": "5",
			    "-....": "6",
			    "--...": "7",
			    "---..": "8",
			    "----.": "9",
			    ".-": "a",
			    "-...": "b",
			    "-.-.": "c",
			    "-..": "d",
			    ".": "e",
			    "..-.": "f",
			    "--.": "g",
			    "....": "h",
			    "..": "i",
			    ".---": "j",
			    "-.-": "k",
			    ".-..": "l",
			    "--": "m",
			    "-.": "n",
			    "---": "o",
			    ".--.": "p",
			    "--.-": "q",
			    ".-.": "r",
			    "...": "s",
			    "-": "t",
			    "..-": "u",
			    "...-": "v",
			    ".--": "w",
			    "-..-": "x",
			    "-.--": "y",
			    "--..": "z",
			    ".-.-.-": ".",
			    "--..--": ",",
			    "---...": ":",
			    "..--..": "?",
			    ".----.": "'",
			    "-....-": "-",
			    "-..-.": "/",
			    ".-..-.": "\"",
			    ".--.-.": "@",
			    "-...-": "=",
			    "/": " "
			}

			outputArray = input.split(" ")
			inputString = ""

			for item in outputArray
				inputString += if morse[item] then morse[item] else throw new Error("Character not translatable from Morse code: #{item}")

			return inputString.toUpperCase()

		nato: (input) ->
			nato = {
			    "Zero":"0",
			    "One":"1",
			    "Two":"2",
			    "Three":"3",
			    "Four":"4",
			    "Five":"5",
			    "Six":"6",
			    "Seven":"7",
			    "Eight":"8",
			    "Nine":"9",
			    "Alpha":"a",
			    "Bravo":"b",
			    "Charlie":"c",
			    "Delta":"d",
			    "Echo":"e",
			    "Foxtrot":"f",
			    "Golf":"g",
			    "Hotel":"h",
			    "India":"i",
			    "Juliet":"j",
			    "Kilo":"k",
			    "Lima":"l",
			    "Mike":"m",
			    "November":"n",
			    "Oscar":"o",
			    "Papa":"p",
			    "Quebec":"q",
			    "Romeo":"r",
			    "Sierra":"s",
			    "Tango":"t",
			    "Uniform":"u",
			    "Victor":"v",
			    "Whiskey":"w",
			    "X-ray":"x",
			    "Yankee":"y",
			    "Zulu":"z",
			    "/": " "
			}

			outputArray = input.split(" ")
			inputString = ""

			for item in outputArray
				inputString += if nato[item] then nato[item] else item

			return inputString.toUpperCase()

		caesar: (input, shift) ->
			if Math.sign(shift) == 1
				rot = Math.abs(shift) * -1
			else if Math.sign(shift) == -1
				rot = Math.abs shift
			else
				rot = shift

			return input.replace /([a-z|A-Z])/g, ($1) ->
			    char = $1.charCodeAt(0)
			    String.fromCharCode \
			      if char >= 97
			      then (char + rot + 26 - 97) % 26 + 97
			      else (char + rot + 26 - 65) % 26 + 65

		atbash: (input) ->
			atbash = {
			    "z": "a",
			    "y": "b",
			    "x": "c",
			    "w": "d",
			    "v": "e",
			    "u": "f",
			    "t": "g",
			    "s": "h",
			    "r": "i",
			    "q": "j",
			    "p": "k",
			    "o": "l",
			    "n": "m",
			    "m": "n",
			    "l": "o",
			    "k": "p",
			    "j": "q",
			    "i": "r",
			    "h": "s",
			    "g": "t",
			    "f": "u",
			    "e": "v",
			    "d": "w",
			    "c": "x",
			    "b": "y",
			    "a": "z",
			    "Z": "A",
			    "Y": "B",
			    "X": "C",
			    "W": "D",
			    "V": "E",
			    "U": "F",
			    "T": "G",
			    "S": "H",
			    "R": "I",
			    "Q": "J",
			    "P": "K",
			    "O": "L",
			    "N": "M",
			    "M": "N",
			    "L": "O",
			    "K": "P",
			    "J": "Q",
			    "I": "R",
			    "H": "S",
			    "G": "T",
			    "F": "U",
			    "E": "V",
			    "D": "W",
			    "C": "X",
			    "B": "Y",
			    "A": "Z"
			}

			outputArray = input.split("")
			inputString = ""

			for item, i in outputArray
				inputString += if atbash[item] then atbash[item] else item

			return inputString

		letternumbers: (input) ->
			alphabet = ["this space is intentionally left blank for the sake of this script", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

			outputArray = input.split(/[ -]+/)
			inputString = ""

			for item, i in outputArray
				if alphabet[item] 
					inputString += alphabet[item]
				else if item == "/"
					inputString += " "

			return inputString.toUpperCase()
