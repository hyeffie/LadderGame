//
//  main.swift
//  LadderGame
//
//  Created by Hyejeong Park on 2022/11/07.
//

import Foundation

let input = readLine() ?? ""
let numberOfPlayers = Int(input.trimmingCharacters(in: .whitespacesAndNewlines)) ?? 0
if numberOfPlayers < 2 || numberOfPlayers > 8 { exit(1) }

let ladderHeight = 4
var spaces: [[Int]] = Array(repeating: Array(repeating: 0, count: numberOfPlayers - 1), count: ladderHeight)

for i in 0 ..< numberOfPlayers - 1 {
  var hSpaces = Array(repeating: 0, count: ladderHeight)
  repeat {
    for (index, _) in hSpaces.enumerated() {
      if i > 0 && spaces[index][i - 1] == 1 {
        hSpaces[index] = 0
      } else {
        hSpaces[index] = Int.random(in: 0 ... 1)
      }
    }
  } while hSpaces.filter { $0 == 1 }.count == 0
  
  for (index, number) in hSpaces.enumerated() {
    spaces[index][i] = number
  }
}

spaces.forEach {
  print("|", terminator: "")
  $0.forEach { print($0 == 0 ? " ": "-", terminator: "|") }
  print()
}
