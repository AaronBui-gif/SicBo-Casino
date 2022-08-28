//
//  MainMenu.swift
//  SicBo Casino
//
//  Created by Huy Bui Thanh on 21/08/2022.
//

import SwiftUI

struct MainMenu: View {
    @EnvironmentObject var userData: UserProgress
    var body: some View {
        NavigationView{
            ZStack{
                Color.red.ignoresSafeArea()
                VStack(spacing: 3){
                    Image("Sicbo")
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                    NavigationLink{
                        ContentView().navigationBarTitle("Back")
                            .navigationBarHidden(true)
                        .navigationBarTitleDisplayMode(.inline)

                    } label: {

                            Image("play_button")
                                .resizable()
                                .frame(width:200, height: 200, alignment: .center)

                        }
                    NavigationLink{                        
                        LeaderBoardView(userData: UserProgress())
                        
                    } label: {

                            Image("leaderboard_button")
                                .resizable()
                                .frame(width:150, height: 150, alignment: .center)

                        }

                        .frame(width: 400, height: 50, alignment: .center)
                }
            }
        }.navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
            .environmentObject(UserProgress())
    }
}
