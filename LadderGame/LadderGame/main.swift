//
//  main.swift
//  LadderGame
//
//  Created by Hyejeong Park on 2022/11/07.
//

import Foundation

func getNumberOfPlayers(between lowerBound: Int, and upperBound: Int) -> Int {
  var numberOfPlayers: Int
  repeat {
    print("알맞은 사다리게임 플레이어 수를 입력하세요 (\(lowerBound)~\(upperBound)명):", terminator: " ")
    let input = readLine() ?? ""
    numberOfPlayers = Int(input.trimmingCharacters(in: .whitespacesAndNewlines)) ?? 0
  } while numberOfPlayers < lowerBound || numberOfPlayers > upperBound
  return numberOfPlayers
}

func randomizeSteps(ladderHeight: Int, numberOfPlayers: Int) -> [[Int]] {
  var rows: [[Int]] = Array(repeating: Array(repeating: 0, count: numberOfPlayers - 1),
                            count: ladderHeight)
  
  for col in 0 ..< numberOfPlayers - 1 {
    var column = Array(repeating: 0, count: ladderHeight)
    repeat {
      for row in 0 ..< column.count {
        if col > 0 && rows[row][col - 1] == 1 { column[row] = 0 }
        else { column[row] = Int.random(in: 0 ... 1) }
      }
    } while column.filter { $0 == 1 }.count == 0
    
    for (row, hasStep) in column.enumerated() {
      rows[row][col] = hasStep
    }
  }
  
  return rows
}

/// 주어진 발판 배열에 따라 사다리를 출력합니다.
/// - Parameter rows: 행별 발판 정보
func printLadderSteps(with rowsOfSteps: [[Int]]) {
  rowsOfSteps.forEach { row in
    print("|", terminator: "")
    row.forEach { step in print(step == 1 ? "-": " ", terminator: "|") }
    print()
  }
}

let numberOfPlayers = getNumberOfPlayers(between: 2, and: 8)
let stepArray = randomizeSteps(ladderHeight: 4, numberOfPlayers: numberOfPlayers)
printLadderSteps(with: stepArray)
