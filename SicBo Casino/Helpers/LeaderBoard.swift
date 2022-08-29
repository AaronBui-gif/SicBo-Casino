/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Bui Thanh Huy
  ID: s3740934
  Created  date: Mon 29 Aug
  Last modified: Mon 29 Aug
  Acknowledgement: Tom Huynh RMIT_Casino
*/

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
