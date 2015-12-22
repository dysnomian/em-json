# TODO: Basically, I'm aping zkat's mona library in hopes of mapping it to Emily
#   concepts and learning a bit about parsers in the process.

debugOn = true

# testPrototype = [
#     name = ""
#     test = ""
#     printt ^string = "  > " + string
#     run ^ = print this.name ln (do: test)
#     bar ^ = this.name.char.each ^c( return -)
#         bar ^ =
#     ]
# ]

# Includes
parseError = directory.errors.parseError

# Parser state object
# state = [
#     value
#     input        # the entire input string
#     offset
#     position     # Position Object
#     userState
#     failed       # null or true
#     error        # Error Object
# ]

# Position object
# [ line = 0; column = 0 ]

# Error object
# [
#     position = Position Object
#     message = "error message"
#     type    = .expectation
#     eof?     = false
# ]


# Primitive Parsers
value ^val ^parserState = {
  parserState.value = val
  return parserState
}

failure ^ = {
    return [
        failed = true
        error  = "Parser error"
    ]
}

token ^parserState ^count = {
    oldOffset = parserState.offset
    parserState.offset = oldOffset + count
    # tern (token) ^{value token} failure
}

parse ^parser ^string = {
    return parser string
}

# Test parsers
if (debugOn) (
    println: "Test parsers:"
    println: "-------------"
    println: ""
    println: parse ^(value "zorrrp") ""
    println: parse failure ""
    println: parse consume "a"
    println: parse consume ""
)
