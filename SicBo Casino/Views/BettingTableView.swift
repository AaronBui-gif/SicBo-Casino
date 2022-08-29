//
//  BettingTableView.swift
//  SicBo Casino
//
//  Created by Huy Bui Thanh on 15/08/2022.
//

import SwiftUI

struct BettingTableView: View {
    // MARK: - PROPERTIES
    @ObservedObject var userData: UserProgress
    
    // MARK: - BODY
    var body: some View {
        ZStack (alignment: .top){
            VStack (spacing: -20) {
                HStack ( spacing: 6){
                    // MARK: - ODD
                    Button {
                        userData.chooseBetOdd()
                        
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 47, height: 100, alignment: .center)
                                .cornerRadius(10)
                            Text("ODD")
                                .foregroundColor(userData.isChooseBetOdd ? Color("ColorBlueRMIT") : Color.white)
                                .rotationEffect(.degrees(-90))
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetOdd ? 0 : -20)
                                .opacity(userData.isChooseBetOdd ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetOdd)
                        }
                    }
                    
                    // MARK: - SMALL 4-10
                    Button {
                        userData.chooseBetSmall()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 109, height: 100, alignment: .center)
                                .cornerRadius(10)
                            Text("SMALL 4-10")
                                .foregroundColor(userData.isChooseBetSmall ? Color("ColorBlueRMIT") : Color.white)
                            
                            
                            Image("casino-chip")
                                .resizable()
                                .foregroundColor(userData.isChooseBetSmall ? Color("ColorBlueRMIT") : Color.white)
                            
                                .opacity(userData.isChooseBetSmall ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetSmall)
                        }
                    }
                    .offset(x:-2, y:16)
                    
                    // MARK: - Dice double 1 Bet
                    Button {
                        userData.chooseBetDoubleOne()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 52, height: 100, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("1dice")
                                .resizable()
                                .offset(y:-10)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("1dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .foregroundColor(userData.isChooseBetDoubleOne ? Color("ColorBlueRMIT") : Color.white)
                            
                                .opacity(userData.isChooseBetDoubleOne ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetDoubleOne)
                        }
                    }
                    .offset(x:-3)
                    
                    // MARK: - Dice double 2 Bet
                    Button {
                        userData.chooseBetDoubleTwo()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 52, height: 100, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("2dice")
                                .resizable()
                                .offset(y:-10)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("2dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .foregroundColor(userData.isChooseBetDoubleTwo ? Color("ColorBlueRMIT") : Color.white)
                            
                                .opacity(userData.isChooseBetDoubleTwo ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetDoubleTwo)
                        }
                    }
                    
                    // MARK: - Dice double 3 Bet
                    Button {
                        userData.chooseBetDoubleThree()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 52, height: 100, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("3dice")
                                .resizable()
                                .offset(y:-10)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("3dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .foregroundColor(userData.isChooseBetDoubleThree ? Color("ColorBlueRMIT") : Color.white)
                            
                                .opacity(userData.isChooseBetDoubleThree ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetDoubleThree)
                        }
                    }
                    
                    // MARK: - Any Triple Bet
                    Button {
                        userData.chooseBetAnyTriple()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 50, height: 100, alignment: .center)
                                .cornerRadius(10)
                            
                            Text("Any Triple")
                                .lineLimit(2)
                                .foregroundColor(Color.white)
                            Image("casino-chip")
                                .resizable()
                                .foregroundColor(userData.isChooseBetAnyTriple ? Color("ColorBlueRMIT") : Color.white)
                            
                                .opacity(userData.isChooseBetAnyTriple ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetAnyTriple)
                        }
                    }
                }.frame(width: 100, height: 150, alignment: .center)
                    .offset(y: -10)
                HStack(spacing:4){
                    // MARK: - EVEN
                    Button {
                        userData.chooseBetEven()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 47, height: 100, alignment: .center)
                                .cornerRadius(10)
                            Text("EVEN")
                                .foregroundColor(userData.isChooseBetEven ? Color("ColorBlueRMIT") : Color.white)
                                .rotationEffect(.degrees(-90))
                            Image("casino-chip")
                                .resizable()
                                .foregroundColor(userData.isChooseBetEven ? Color("ColorBlueRMIT") : Color.white)
                            
                                .opacity(userData.isChooseBetEven ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetEven)
                        }
                    }
                    
                    // MARK: - BIG 11-17
                    Button {
                        userData.chooseBetBig()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 108, height: 100, alignment: .center)
                                .cornerRadius(10)
                            Text("BIG 11-17")
                                .foregroundColor(userData.isChooseBetBig ? Color("ColorBlueRMIT") : Color.white)
                            
                            
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetBig ? 0 : -20)
                            
                                .opacity(userData.isChooseBetBig ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetBig)
                        }
                    }
                    // MARK: - Dice double 4 Bet
                    Button {
                        userData.chooseBetDoubleFour()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 55, height: 100, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("4dice")
                                .resizable()
                                .offset(y:-10)
                                .foregroundColor(userData.isChooseBetDoubleFour ? Color("ColorBlueRMIT") : Color.white)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("4dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetDoubleFour ? 0 : -20)
                            
                                .opacity(userData.isChooseBetDoubleFour ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetDoubleFour)
                        }
                    }
                    
                    // MARK: - Dice double 5 Bet
                    Button {
                        userData.chooseBetDoubleFive()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 55, height: 100, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("5dice")
                                .resizable()
                                .offset(y:-10)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("5dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetDoubleFive ? 0 : -20)
                            
                                .opacity(userData.isChooseBetDoubleFive ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetDoubleFive)
                        }
                    }
                    
                    // MARK: - Dice 6 Bet
                    Button {
                        userData.chooseBetDoubleSix()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 55, height: 100, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("6dice")
                                .resizable()
                                .offset(y:-10)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("6dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetDoubleSix ? 0 : -20)
                            
                                .opacity(userData.isChooseBetDoubleSix ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetDoubleSix)
                        }
                    }
                    
                    // MARK: - Any Triple Bet
                    Button {
                        userData.chooseBetAnyTriple()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 50, height: 100, alignment: .center)
                                .cornerRadius(10)
                            
                            Text("Any Triple")
                                .lineLimit(2)
                                .foregroundColor(Color.white)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetAnyTriple ? 0 : -20)
                                .opacity(userData.isChooseBetAnyTriple ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetAnyTriple)
                        }
                    }
                }.frame(width: 100, height: 100, alignment: .center)
                    .offset(y: -10)
                // MARK: - Third line
                // MARK: - Bet Dice 1
                HStack(spacing: 4){
                    Button {
                        userData.chooseBetOne()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 62, height: 50, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("1dice")
                                .resizable()
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetOne ? 0 : -20)
                            
                                .opacity(userData.isChooseBetOne ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetOne)
                        }
                    }
                    
                    // MARK: - Bet Dice 2 Bet
                    Button {
                        userData.chooseBetTwo()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 62, height: 50, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("2dice")
                                .resizable()
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetTwo ? 0 : -20)
                            
                                .opacity(userData.isChooseBetTwo ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetOne)
                        }
                    }
                    
                    // MARK: - Bet Dice 3 Bet
                    Button {
                        userData.chooseBetThree()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 62, height: 50, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("3dice")
                                .resizable()
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetThree ? 0 : -20)
                            
                                .opacity(userData.isChooseBetThree ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetThree)
                        }
                    }
                    
                    // MARK: - Bet Dice 4 Bet
                    Button {
                        userData.chooseBetFour()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 62, height: 50, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("4dice")
                                .resizable()
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetFour ? 0 : -20)
                            
                                .opacity(userData.isChooseBetFour ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetFour)
                        }
                    }
                    
                    // MARK: - Bet Dice 5 Bet
                    Button {
                        userData.chooseBetFive()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 62, height: 50, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("5dice")
                                .resizable()
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetFive ? 0 : -20)
                            
                                .opacity(userData.isChooseBetFive ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetFive)
                        }
                    }
                    
                    // MARK: - Bet Dice 6 Bet
                    Button {
                        userData.chooseBetSix()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 62, height: 50, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("6dice")
                                .resizable()
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetSix ? 0 : -20)
                            
                                .opacity(userData.isChooseBetSix ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetSix)
                        }
                    }
                }.frame(width: 100, height: 100, alignment: .center)
                    .offset(y: -10)
                
                // MARK: - Fourth Line
                
                // MARK: - Bet Dice 1 and 2
                HStack(spacing: 4){
                    Button {
                        userData.chooseBetOneTwo()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 62, height: 70, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("1dice")
                                .resizable()
                                .offset(y:-10)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("2dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetOneTwo ? 0 : -20)
                            
                                .opacity(userData.isChooseBetOneTwo ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetOneTwo)
                        }
                    }
                    
                    // MARK: - Bet Dice 1 and 3
                    Button {
                        userData.chooseBetOneThree()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 62, height: 70, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("1dice")
                                .resizable()
                                .offset(y:-10)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("3dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetOneThree ? 0 : -20)
                            
                                .opacity(userData.isChooseBetOneThree ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetOneThree)
                        }
                    }
                    
                    // MARK: - Bet Dice 1 and 4
                    Button {
                        userData.chooseBetOneFour()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 62, height: 70, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("1dice")
                                .resizable()
                                .offset(y:-10)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("4dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetOneFour ? 0 : -20)
                            
                                .opacity(userData.isChooseBetOneFour ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetOneFour)
                        }
                    }
                    // MARK: - Bet Dice 1 and 5
                    Button {
                        userData.chooseBetOneFive()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 62, height: 70, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("1dice")
                                .resizable()
                                .offset(y:-10)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("5dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetOneFive ? 0 : -20)
                            
                                .opacity(userData.isChooseBetOneFive ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetOneFive)
                        }
                    }
                    
                    // MARK: - Bet Dice 1 and 6
                    Button {
                        userData.chooseBetOneSix()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 62, height: 70, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("1dice")
                                .resizable()
                                .offset(y:-10)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("6dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetOneSix ? 0 : -20)
                            
                                .opacity(userData.isChooseBetOneSix ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetOneSix)
                        }
                    }
                    Button {
                        userData.chooseBetTwoThree()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 62, height: 70, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("2dice")
                                .resizable()
                                .offset(y:-10)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("3dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetTwoThree ? 0 : -20)
                            
                                .opacity(userData.isChooseBetTwoThree ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetTwoThree)
                        }
                    }
                }.frame(width: 100, height: 70, alignment: .center)
                    .offset(y: -10)
                // MARK: - Fifth Line
                
                // MARK: - Bet Two Four
                HStack(spacing: 4){
                    Button {
                        userData.chooseBetTwoFour()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 62, height: 70, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("2dice")
                                .resizable()
                                .offset(y:-10)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("4dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetTwoFour ? 0 : -20)
                            
                                .opacity(userData.isChooseBetTwoFour ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetTwoFour)
                        }
                    }
                    
                    // MARK: - BET Two Five
                    Button {
                        userData.chooseBetTwoFive()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 62, height: 70, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("2dice")
                                .resizable()
                                .offset(y:-10)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("5dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetTwoFive ? 0 : -20)
                            
                                .opacity(userData.isChooseBetTwoFive ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetTwoFive)
                        }
                    }
                    
                    // MARK: - Bet Two Six
                    Button {
                        userData.chooseBetTwoSix()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 62, height: 70, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("2dice")
                                .resizable()
                                .offset(y:-10)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("6dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetTwoSix ? 0 : -20)
                            
                                .opacity(userData.isChooseBetTwoSix ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetTwoSix)
                        }
                    }
                    
                    // MARK: - Bet Three Four Dice
                    Button {
                        userData.chooseBetThreeFour()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 62, height: 70, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("3dice")
                                .resizable()
                                .offset(y:-10)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("4dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetThreeFour ? 0 : -20)
                            
                                .opacity(userData.isChooseBetThreeFour ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetThreeFour)
                        }
                    }
                    
                    // MARK: - Bet Three Five Dice
                    Button {
                        userData.chooseBetThreeFive()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 62, height: 70, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("3dice")
                                .resizable()
                                .offset(y:-10)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("5dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetThreeFive ? 0 : -20)
                            
                                .opacity(userData.isChooseBetThreeFive ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetThreeFive)
                        }
                    }
                    
                    // MARK: - Bet Three Six
                    Button {
                        userData.chooseBetThreeSix()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 62, height: 70, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("3dice")
                                .resizable()
                                .offset(y:-10)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("6dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetThreeSix ? 0 : -20)
                            
                                .opacity(userData.isChooseBetThreeSix ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetThreeSix)
                        }
                    }
                }.frame(width: 100, height: 120, alignment: .center)
                    .offset(y: -10)
                
                // MARK: - Fifth Line
                HStack(spacing: 4){
                    
                    // MARK: - Bet Dice Four Five
                    Button {
                        userData.chooseBetFourFive()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 62, height: 70, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("4dice")
                                .resizable()
                                .offset(y:-10)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("5dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetFourFive ? 0 : -20)
                            
                                .opacity(userData.isChooseBetFourFive ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetFourFive)
                        }
                    }
                    
                    // MARK: - Bet Dice Four Six
                    Button {
                        userData.chooseBetFourSix()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 62, height: 70, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("4dice")
                                .resizable()
                                .offset(y:-10)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("6dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetFourSix ? 0 : -20)
                            
                                .opacity(userData.isChooseBetFourSix ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetFourSix)
                        }
                    }
                    
                    // MARK: - Bet Dice Five Six
                    Button {
                        userData.chooseBetFiveSix()
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                .frame(width: 62, height: 70, alignment: .center)
                                .cornerRadius(10)
                            
                            Image("5dice")
                                .resizable()
                                .offset(y:-10)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("6dice")
                                .resizable()
                                .offset(y:20)
                                .frame(width:20, height: 20, alignment: .center)
                            Image("casino-chip")
                                .resizable()
                                .offset(x: userData.isChooseBetFiveSix ? 0 : -20)
                                .opacity(userData.isChooseBetFiveSix ? 1 : 0 )
                                .modifier(CasinoChipModifier())
                                .animation(.default, value: userData.isChooseBetFiveSix)
                        }
                    }
                }.frame(width: 100, height: 70, alignment: .center)
                    .offset(y: -10)
            }
            .frame(width: 600)
            
        }
        
    }
}

struct BettingTableView_Previews: PreviewProvider {
    static var previews: some View {
        BettingTableView(userData: UserProgress())

    }
}
