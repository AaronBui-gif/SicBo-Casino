//
//  BettingTableView.swift
//  SicBo Casino
//
//  Created by Huy Bui Thanh on 15/08/2022.
//

import SwiftUI

struct BettingTableView: View {
    @State private var chooseBet20 = false
    
    // MARK: - BODY
    var body: some View {
        
        //@State private var chooseBet10 = true
        ZStack (alignment: .top){
            Rectangle()
                //.fill(.black)
                .frame(width: 400, height: 400, alignment: .top)
                .cornerRadius(10)
            
        VStack (spacing: -20) {
            
            HStack(alignment: .center, spacing: 5){
                ZStack{
                Rectangle()
                    .fill(.brown)
                    .frame(width: 150, height: 100, alignment: .center)
                    .cornerRadius(10)
                Text("1:1 DOUBLE IF ANY TRIPLE")
                        .lineLimit(2)
                        .frame(width: 150, height: 100, alignment: .center)
                }
                ZStack{
                Rectangle()
                    .fill(.brown)
                    .frame(width: 225, height: 100, alignment: .center)
                    .cornerRadius(10)
                Text("8:1 EACH DOUBLE")
                        .lineLimit(2)
                        .frame(width: 150, height: 100, alignment: .center)
                }
//                Text("150:1")
//                Text("30:1")
//                Text("150:1")
//                Text("8:1")
//                Text("1:1 ")
            }
            HStack (spacing: 2){
                // MARK: - SMALL 4-10
                Button {
                    //self.chooseBet20()
                } label: {
                    ZStack{
                        Rectangle()
                            .fill(.red)
                            .frame(width: 100, height: 100, alignment: .center)
                            .cornerRadius(10)
                        Text("SMALL 4-10")
                            .foregroundColor(chooseBet20 ? Color("ColorBlueRMIT") : Color.black)
                            
                        
                        Image("casino-chips")
                            .resizable()
                            .offset(x: -50)
                        
                            .opacity(chooseBet20 ? 1 : 0 )
                            .modifier(CasinoChipModifier())
                            .animation(.default, value: chooseBet20)
                    }
                    .padding(.horizontal, 20)
                    .frame(width: 100, height: 150, alignment: .center)
                }
                
                // MARK: - ODD
                Button {
                    
                } label: {
                    ZStack{
                        Rectangle()
                            .fill(.red)
                            .frame(width: 50, height: 100, alignment: .center)
                            .cornerRadius(10)
                        Text("Odd")
                            .foregroundColor(chooseBet20 ? Color("ColorBlueRMIT") : Color.white)
                            .rotationEffect(.degrees(-90))
                        Image("casino-chips")
                            .resizable()
                            .offset(x: -50)
                            .opacity(chooseBet20 ? 1 : 0 )
                            .modifier(CasinoChipModifier())
                            .animation(.default, value: chooseBet20)
                    }
                    
                    // MARK: - Dice 1 Bet
                    Button {
                        
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 50, height: 100, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("1dice")
                                .resizable()
                                .offset(y:-10)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("1dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                        }
                    }
                    
                    // MARK: - Dice 2 Bet
                    Button {
                        
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 50, height: 100, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("2dice")
                                .resizable()
                                .offset(y:-10)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("2dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                        }
                    }
                    
                    // MARK: - Dice 3 Bet
                    Button {
                        
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 50, height: 100, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("3dice")
                                .resizable()
                                .offset(y:-10)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("3dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                        }
                    }
                    
                    // MARK: - Any Triple Bet
                    Button {
                        
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 50, height: 100, alignment: .center)
                                .cornerRadius(10)
                            
                           Text("Any Triple")
                                .lineLimit(2)
                                .foregroundColor(Color.white)
                        }
                    }
                }
                
            }
            HStack{
                // MARK: - SMALL 4-10
                Button {
                    //self.chooseBet20()
                } label: {
                    ZStack{
                        Rectangle()
                            .fill(.red)
                            .frame(width: 100, height: 100, alignment: .center)
                            .cornerRadius(10)
                        Text("SMALL 4-10")
                            .foregroundColor(chooseBet20 ? Color("ColorBlueRMIT") : Color.black)
                            
                        
                        Image("casino-chips")
                            .resizable()
                            .offset(x: -50)
                        
                            .opacity(chooseBet20 ? 1 : 0 )
                            .modifier(CasinoChipModifier())
                            .animation(.default, value: chooseBet20)
                    }
                    .padding(.horizontal, 20)
                    .frame(width: 100, height: 150, alignment: .center)
                }
            }
        }
        .frame(width: 350)
        .offset(y: 10)
        }
    }
}

struct BettingTableView_Previews: PreviewProvider {
    static var previews: some View {
        BettingTableView()
    }
}
