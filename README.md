# Morsey

A package for encoding and decoding Morse code in Gleam.

[![Package Version](https://img.shields.io/hexpm/v/morsey)](https://hex.pm/packages/morsey)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/morsey/)


## Usage

### Encode

```gleam
import gleam/io
import morsey

let text = "Hello world!"
case morsey.encode(text) {
  Ok(symbols) ->
    io.println("Morse code for " <> text <> " is " <> morsey.to_string(symbols))
  Error(morsey.InvalidCharacter(char)) ->
    io.println_error("Invalid character: " <> char)
}
```

### Decode

```gleam
import gleam/io
import morsey

".... . .-.. .-.. --- / .-- --- .-. .-.. -.. -.-.--"
|> morsey.from_string
|> morsey.decode
|> io.println
```

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
```
