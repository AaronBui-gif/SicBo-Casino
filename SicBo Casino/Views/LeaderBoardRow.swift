//
//  LeaderBoardRow.swift
//  SicBo Casino
//
//  Created by Huy Bui Thanh on 22/08/2022.
//

import SwiftUI

struct LeaderBoardRow: View {
    
    @ObservedObject var userData: UserProgress
    var leaderboard: LeaderBoard
    
    var body: some View {
        ForEach(userData.leaderboards) { leaderboarditem in
            VStack{
//            HStack {
//                Text(String(leaderboard.id))
//                Text("\(leaderboard.highscore)" as String)
//            }
           
        HStack (alignment: .top, spacing: 0){
            ZStack{
                Rectangle()
                    .fill(Color(red: 120/255, green: 28/255, blue: 104/255))
                    .frame(width: 120, height: 100)
                Text(String(leaderboarditem.id))
                    .foregroundColor(Color.white)
            }
            ZStack{
                Rectangle()
                    .fill(Color(red: 120/255, green: 28/255, blue: 104/255))
                    .frame(width: 150, height: 100)
                Text(leaderboarditem.name)
                    .foregroundColor(Color.white)
            }
            ZStack{
                Rectangle()
                    .fill(Color(red: 120/255, green: 28/255, blue: 104/255))
                    .frame(width: 140, height: 100)
                Text("\(leaderboarditem.highscore)" as String)
                    .foregroundColor(Color.white)
            }
        }
            }
        }
    }
}

struct LeaderBoardRow_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardRow(userData: UserProgress(), leaderboard: prevLeaderboards[0])
       
    }
}
