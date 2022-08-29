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
                        InfoView().navigationBarTitle("Back")
                            .navigationBarHidden(true)
                        .navigationBarTitleDisplayMode(.inline)
                        
                    } label: {
                        ZStack{
                            Image("button")
                                .resizable()
                                .frame(width:200, height: 200, alignment: .center)
                            Text("How to Play")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.title)
                        }

                        }

                        .frame(width: 400, height: 50, alignment: .center)
                }.onAppear(perform: {
                    playSound(sound: "On_My_Way", type: "mp3")
                })
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
