//
//  TestView.swift
//  SicBo Casino
//
//  Created by Huy Bui Thanh on 26/08/2022.
//

import SwiftUI

struct TestView: View {
    
    
    @State var count = 0 // Set this as a global variable in ViewController.swift
    @State var myString = "1"
    var body: some View{
        
        Button(action: {
            count+=1
            switch (count){
            case 1:
                myString = "1"
                
            case 2:
                myString = "2"
                count = 0
            default: myString = "Press me"
            }
            
        }) {
            Text("\(count)")
            Text(myString)
        }
    }
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
