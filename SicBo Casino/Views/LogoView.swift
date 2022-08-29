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

struct LogoView: View {
    var logoFileName: String
    
    var body: some View {
        Image(logoFileName)
            .resizable()
            .scaledToFit()
            .frame(minHeight: 100, idealHeight: 130, maxHeight: 150, alignment: .center)
            .modifier(ShadowModifier())
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView(logoFileName: "Sicbo")
    }
}
