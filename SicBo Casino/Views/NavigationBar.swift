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

struct NavigationBar: View {
    var body: some View {
        VStack{
            HStack{
                NavigationLink{ MainMenu().navigationBarTitle("")
                        .navigationBarHidden(true)
                    .navigationBarTitleDisplayMode(.inline)} label: {
                        ZStack{
                            Rectangle()
                                .border(.white, width:4)
                                .frame(width: 60, height: 40, alignment: .center)
                            Text("Back")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .font(.system(size: 20))
                        }
                    }
                NavigationLink{ InfoView().navigationBarTitle("")
                        .navigationBarHidden(true)
                    .navigationBarTitleDisplayMode(.inline)} label: {
                        
                        ZStack{
                            Rectangle()
                                .border(.white, width:4)
                                .frame(width: 60, height: 40, alignment: .center)
                            Text("Info")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .font(.system(size: 20))
                        }
                    }
            }
        }
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar().preferredColorScheme(.dark)
    }
}
