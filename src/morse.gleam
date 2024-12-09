import gleam/io
import gleam/list
import gleam/string

// International Morse Code
// 1. The length of a dot is one unit.
// 2. A dash is three units.
// 3. The space between parts of the same letter is one unit.
// 4. The space between letters is three units.
// 5. The space between words is seven units.
//
// Translator - https://salif.github.io/morse-code-translator/

pub type Char {
  Dot
  Comma
  Space
}

pub fn encode(text: String) -> List(Char) {
  let encoded =
    string.to_graphemes(text)
    |> list.map(encode_char)
    |> list.map(fn(x) { list.append(x, [Space]) })
    |> list.flatten
  list.take(encoded, list.length(encoded) - 1)
}

pub fn encode_char(char: String) -> List(Char) {
  case char {
    "0" -> [Comma, Comma, Comma, Comma, Comma]
    "1" -> [Dot, Comma, Comma, Comma, Comma]
    "2" -> [Dot, Dot, Comma, Comma, Comma]
    "3" -> [Dot, Dot, Dot, Comma, Comma]
    "4" -> [Dot, Dot, Dot, Dot, Comma]
    "5" -> [Dot, Dot, Dot, Dot, Dot]
    "6" -> [Comma, Dot, Dot, Dot, Dot]
    "7" -> [Comma, Comma, Dot, Dot, Dot]
    "8" -> [Comma, Comma, Comma, Dot, Dot]
    "9" -> [Comma, Comma, Comma, Comma, Dot]
    "A" -> [Dot, Comma, Comma]
    "B" -> [Comma, Dot, Dot, Dot]
    "C" -> [Comma, Dot, Comma, Dot]
    "D" -> [Comma, Dot, Dot]
    "E" -> [Dot]
    "F" -> [Dot, Dot, Comma, Dot]
    "G" -> [Comma, Comma, Dot]
    "H" -> [Dot, Dot, Dot, Dot]
    "I" -> [Dot, Dot]
    "J" -> [Dot, Comma, Comma, Comma]
    "K" -> [Comma, Dot, Comma]
    "L" -> [Dot, Comma, Dot, Dot]
    "M" -> [Comma, Comma]
    "N" -> [Comma, Dot]
    "O" -> [Comma, Comma, Comma]
    "P" -> [Dot, Comma, Comma, Dot]
    "Q" -> [Comma, Comma, Dot, Comma]
    "R" -> [Dot, Comma, Dot]
    "S" -> [Dot, Dot, Dot]
    "T" -> [Comma]
    "U" -> [Dot, Dot, Comma]
    "V" -> [Dot, Dot, Dot, Comma]
    "W" -> [Dot, Comma, Comma]
    "X" -> [Comma, Dot, Dot, Comma]
    "Y" -> [Comma, Dot, Comma, Comma]
    "Z" -> [Comma, Comma, Dot, Dot]
    _ -> []
    // TODO
  }
}

pub fn to_string(encoded: List(Char)) -> String {
  encoded
  |> list.map(fn(symbol) {
    case symbol {
      Dot -> "."
      Comma -> "-"
      Space -> " "
    }
  })
  |> string.join("")
}

pub fn main() {
  let text =
    "SOS"
    |> encode
    |> to_string
  io.println("Hello from morse!" <> text)
}
