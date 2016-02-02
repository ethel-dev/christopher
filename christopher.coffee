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
						console.log "spacing for #{items}"


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

			inputArray = input.split("")
			outputString = ""

			for item, i in inputArray
				outputString += if morse[item] then morse[item] else throw new Error("Character not translatable to Morse: #{item}")

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
				" ": "/"
			}

			inputArray = input.split("")
			outputString = ""

			for item, i in inputArray
				outputString += if nato[item] then nato[item] else throw new Error("Character not translatable to NATO language: #{item}")

				if i != inputArray.length - 1 then outputString += " "

			return outputString

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
				inputString += if morse[item] then morse[item] else throw new Error("Character/phrase not translatable from Morse: #{item}")

			return inputString

		nato: (input) ->
			nato = {
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
			    "Zulu":"z"
			    "/": " "
			}

			outputArray = input.split(" ")
			inputString = ""

			for item in outputArray
				inputString += if nato[item] then nato[item] else throw new Error("Character/phrase not translatable from NATO: #{item}")

			return inputString
