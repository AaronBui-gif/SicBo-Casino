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

import SwiftUI

struct LeaderBoardView: View {
    // MARK: - PROPERTIES
    @Binding var scoreboard: [LeaderBoard]
    
    // Configuring Back button
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
    
    // MARK: - BODY
    var body: some View {
        
        NavigationView {
            // MARK: - Background Image
            ZStack {
                Image("leaderboardimage")
                    .resizable()
                    .frame(width: 450, height: 1085, alignment: .top)
                   
                // MARK: - Displaying UI
                VStack{
                    HStack (alignment: .center, spacing: 0){
                        Image("leaderboard")
                            .resizable()
                            .frame(width: 450, height: 150, alignment: .top)
                    }.offset(y: -200)
                    HStack (alignment: .center, spacing: 0){
                        ZStack{
                            Rectangle()
                                .fill(Color(red: 120/255, green: 28/255, blue: 104/255))
                                .frame(width: 120, height: 50)
                            Text("Id")
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
                    }.offset(y: -200)
                    
                    // MARK: - Displaying User Information
                    ScrollView {

                        VStack(spacing:20){
                            ForEach(scoreboard, id:\.self) {leader in
                            HStack (alignment: .top, spacing: 0){
                                ZStack{
                                    Rectangle()
                                        .fill(Color(red: 120/255, green: 28/255, blue: 104/255))
                                        .frame(width: 120, height: 100)
                                    Text("\(leader.id)")
                                        .foregroundColor(Color.white)
                                }
                                ZStack{
                                    Rectangle()
                                        .fill(Color(red: 120/255, green: 28/255, blue: 104/255))
                                        .frame(width: 150, height: 100)
                                    Text("\(leader.name)")
                                        .foregroundColor(Color.white)
                                }
                                ZStack{
                                    Rectangle()
                                        .fill(Color(red: 120/255, green: 28/255, blue: 104/255))
                                        .frame(width: 140, height: 100)
                                    Text("\(leader.highscore)")
                                        .foregroundColor(Color.white)
                                }
                            }
                            }
                        }
                    }.frame(width: 450, height: 450) // Scroll View
                        .offset(y: -200)
                }.onAppear(perform: {
                    playSound(sound: "On_My_Way", type: "mp3")
                })
                
                
            }
        }      .navigationTitle("").foregroundColor(.white)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton)
    }
}
