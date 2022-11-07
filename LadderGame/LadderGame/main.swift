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
