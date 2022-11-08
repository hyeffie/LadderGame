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

// [[가로], [가로], [가로], ...] 2차원 배열
// 모두 0에서 값을 변경하는 방식
var rows: [[Int]] = Array(repeating: Array(repeating: 0, count: numberOfPlayers - 1), count: ladderHeight)

// 열 기준으로 돌림
for col in 0 ..< numberOfPlayers - 1 {
  // [세로] 하나의 열을 생성하고 -> 각 열에 대입
  var column = Array(repeating: 0, count: ladderHeight)
  repeat {
    for row in 0 ..< rows.count {
      // 두 번째 열부터는 왼쪽에 발판이 이미 있다면 오른쪽은 없어야
      if col > 0 && rows[row][col - 1] == 1 { column[row] = 0 }
      // 아니면 랜덤
      else { column[row] = Int.random(in: 0 ... 1) }
    }
  } while column.filter { $0 == 1 }.count == 0 // 열에 발판이 없으면 다시 반복
  
  for (row, hasStep) in column.enumerated() {
    rows[row][col] = hasStep
  }
}

// 출력
rows.forEach {
  print("|", terminator: "")
  $0.forEach { print($0 == 0 ? " ": "-", terminator: "|") }
  print()
}
