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
                        InfoView()
                        
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
