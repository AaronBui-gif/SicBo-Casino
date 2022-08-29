//
//  InfoView.swift
//  RMIT Casino
//
//  Created by Tom Huynh on 8/2/22.
//

import SwiftUI

struct InfoView: View {
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
      ZStack{
          Color.red.ignoresSafeArea()
          VStack(alignment: .center, spacing: 10) {
            LogoView(logoFileName: "Sicbo")
            
            Spacer()
            
            Form {
              Section(header: Text("How To Play")) {
                  Text("Inputting your money into the betting table ")
                  Text("Icons appear the same as you bet you win")
                  Text("The winning amount will be depends on different case as follow")
                  Text("Odd or Even bet win gives you 1.5x bet amount")
                  Text("Double Number bet win gives you 5x bet anount")
                  Text("Betting One Number gives you 1.5x bet amount")
                  Text("Betting 2 Dice correctly gives you 5x bet amount")
                  Text("You can reset the money and highscore by clicking on the button Reset.")
              }
                Section(header: Text("Application Information")) {
                    HStack {
                      Text("App Name")
                      Spacer()
                      Text("Sicbo (Tai Xiu)")
                    }
                    HStack {
                      Text("Year Published")
                      Spacer()
                      Text("2022")
                    }
              }
            }
            .font(.system(.body, design: .rounded))
          }
          .padding(.top, 40)
          .overlay(
            Button(action: {
              audioPlayer?.stop()
              self.presentationMode.wrappedValue.dismiss()
            }) {
              Image(systemName: "xmark.circle")
                .font(.title)
            }
            .foregroundColor(.white)
            .padding(.top, 30)
            .padding(.trailing, 20),
            alignment: .topTrailing
            )
            .onAppear(perform: {
              playSound(sound: "On_My_Way", type: "mp3")
            })
      }
    
  }
}


struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    InfoView()
  }
}
