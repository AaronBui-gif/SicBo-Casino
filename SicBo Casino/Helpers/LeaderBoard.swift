//
//  LeaderBoard.swift
//  SicBo Casino
//
//  Created by Huy Bui Thanh on 22/08/2022.
//

import Foundation
import SwiftUI

struct LeaderBoard: Hashable, Codable, Identifiable{
    let id: Int
    let name: String

    var highscore: Float
    
    init(id: Int, name: String, highscore: Float) {
        self.id = id
          self.name = name
          self.highscore = highscore
      }
}
