//
//  LeaderBoardView.swift
//  SicBo Casino
//
//  Created by Huy Bui Thanh on 22/08/2022.
//

import SwiftUI

struct LeaderBoardView: View {
    @Environment(\.presentationMode) var presentationMode:
    Binding <PresentationMode>
    
    var BackButton: some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack{
            Image(systemName: "arrowshape.backward.fill")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
            Text("Back")
                .foregroundColor(.white)
                .font(Font.headline.weight(.bold))
        }
    }
    }
    
    @ObservedObject var userData: UserProgress
//    var leaderboard: LeaderBoard
    
    func addLeaderboards(){
        userData.leaderboards.append(LeaderBoard(id: 1, name: "User", highscore: 355.5))
    }
    var body: some View {
        
        NavigationView {
            ZStack {
                Image("leaderboardimage")
                    .resizable()
                    .frame(width: 450, height: 1085)
                VStack{
                    HStack (alignment: .center, spacing: 0){
                        Image("leaderboard")
                            .resizable()
                            .frame(width: 450, height: 150, alignment: .top)
                    }
                    HStack (alignment: .center, spacing: 0){
                        ZStack{
                            Rectangle()
                                .fill(Color(red: 120/255, green: 28/255, blue: 104/255))
                                .frame(width: 120, height: 50)
                            Text("Rank")
                        }
                        ZStack{
                            Rectangle()
                                .fill(Color(red: 120/255, green: 28/255, blue: 104/255))
                                .frame(width: 150, height: 50)
                            Text("Name")
                        }
                        ZStack{
                            Rectangle()
                                .fill(Color(red: 120/255, green: 28/255, blue: 104/255))
                                .frame(width: 140, height: 50)
                            Text("Score")
                        }
                    }
                    ScrollView {
                        VStack(spacing:20){
                                                    HStack(alignment: .center, spacing: 0) {
                                                        Button{
                            
                                                        } label: {
                                                            Button(action: {
                                                                addLeaderboards()
                            
                                                            }) {
                                                                HStack{
                                                                    Image(systemName: "plus")
                                                                        .resizable()
                                                                        .frame(width: 20, height: 20, alignment: .center)
                                                                        .foregroundColor(.black)
                                                                    Text("My List")
                                                                        .font(.title2)
                                                                        .fontWeight(.semibold)
                                                                        .foregroundColor(.black)
                                                                }
                                                            }
                                                        }
                                                        .frame(width: 300, height:40)
                                                        .background(Color.white)
                                                    }
                            
//                            ForEach(prevLeaderboards) { prevLeaderboard in
//                                NavigationLink {
//                                    
//                                } label: {
//                                    VStack(alignment: .center) {
//                                        LeaderBoardRow(userData: userData, leaderboard: prevLeaderboard)
//                                    }
//                                }
//                            }
                            LazyVGrid(columns: [
                                GridItem(.flexible(minimum: 100, maximum: 200)),
                                GridItem(.flexible(minimum: 100, maximum: 200)),
                                GridItem(.flexible(minimum: 100, maximum: 200))
                            ], spacing: 0, content: {
                                ForEach(userData.leaderboards) { leaderboard in
                                    VStack(spacing: -5){
//                                        HStack(alignment: .center) {
                                            LeaderBoardRow(userData: userData, leaderboard: leaderboard)
                                        //}
                                    }
                                    
                                }
                            })
                            //                            Text("center")
                            //                            NavigationLink {
                            //
                            //                            } label: {
                            //                                VStack(alignment: .center) {
                            //
                            //                                    LeaderBoardRow(userData: userData, leaderboard: leaderboard)
                            //                                }
                            //                            }
                        }
                        
                    }
                }
                
                
            }
        }      .navigationTitle("").foregroundColor(.white)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton)
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    
    static var previews: some View {
//        LeaderBoardView(userData: UserProgress(), leaderboard: prevLeaderboards[0])
        LeaderBoardView(userData: UserProgress())
    }
}
