//
//  UserProgress.swift
//  SicBo Casino
//
//  Created by Huy Bui Thanh on 19/08/2022.
//

import Foundation

class UserProgress: ObservableObject {
    
    @Published var isChooseBetOdd: Bool = false
    @Published var isChooseBetEven = false
    @Published var isChooseBetSmall = false
    @Published var isChooseBetBig = false
    @Published var isChooseBetDoubleOne = false
    @Published var isChooseBetDoubleTwo = false
    @Published var isChooseBetDoubleThree = false
    @Published var isChooseBetDoubleFour = false
    @Published var isChooseBetDoubleFive = false
    @Published var isChooseBetDoubleSix = false
    @Published var isChooseBetAnyTriple = false
    @Published var isChooseBetOne = false
    @Published var isChooseBetTwo = false
    @Published var isChooseBetThree = false
    @Published var isChooseBetFour = false
    @Published var isChooseBetFive = false
    @Published var isChooseBetSix = false
    @Published var isChooseBetOneTwo = false
    @Published var isChooseBetOneThree = false
    @Published var isChooseBetOneFour = false
    @Published var isChooseBetOneFive = false
    @Published var isChooseBetOneSix = false
    @Published var isChooseBetTwoThree = false
    @Published var isChooseBetTwoFour = false
    @Published var isChooseBetTwoFive = false
    @Published var isChooseBetTwoSix = false
    @Published var isChooseBetThreeFour = false
    @Published var isChooseBetThreeFive = false
    @Published var isChooseBetThreeSix = false
    @Published var isChooseBetFourFive = false
    @Published var isChooseBetFourSix = false
    @Published var isChooseBetFiveSix = false
    @Published var easyMode = false
    @Published var hardMode = false
    @Published var easyBetRatioDouble: Float = 5
    @Published var hardBetRatioDouble: Float = 4
    @Published var easyBetRatioOneDice: Float = 1.6
    @Published var hardBetRatioOneDice: Float = 1.5
    @Published var leader_score: Float = 0

    // MARK: - BET Odd LOGIC
    func chooseBetOdd() {
        
        isChooseBetOdd.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Even LOGIC
    func chooseBetEven() {
        
        isChooseBetEven.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Small LOGIC
    func chooseBetSmall() {
        
        isChooseBetSmall.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Big LOGIC
    func chooseBetBig() {
        
        isChooseBetBig.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Double One LOGIC
    func chooseBetDoubleOne() {
        
        isChooseBetDoubleOne.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Double Two LOGIC
    func chooseBetDoubleTwo() {
        
        isChooseBetDoubleTwo.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Double Three LOGIC
    func chooseBetDoubleThree() {
        
        isChooseBetDoubleThree.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Double Four LOGIC
    func chooseBetDoubleFour() {
        
        isChooseBetDoubleFour.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Double Five LOGIC
    func chooseBetDoubleFive() {
        
        isChooseBetDoubleFive.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Double Six LOGIC
    func chooseBetDoubleSix() {
        
        isChooseBetDoubleSix.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Double Any Triple LOGIC
    func chooseBetAnyTriple() {
        
        isChooseBetAnyTriple.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET One LOGIC
    func chooseBetOne() {
        
        isChooseBetOne.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Two LOGIC
    func chooseBetTwo() {
        
        isChooseBetTwo.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Three LOGIC
    func chooseBetThree() {
        
        isChooseBetThree.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Four LOGIC
    func chooseBetFour() {
        
        isChooseBetFour.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Five LOGIC
    func chooseBetFive() {
        
        isChooseBetFive.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Three LOGIC
    func chooseBetSix() {
        
        isChooseBetSix.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET One Two LOGIC
    func chooseBetOneTwo() {
        
        isChooseBetOneTwo.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET One Three LOGIC
    func chooseBetOneThree() {
        
        isChooseBetOneThree.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET One Four LOGIC
    func chooseBetOneFour() {
        
        isChooseBetOneFour.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET One Five LOGIC
    func chooseBetOneFive() {
        
        isChooseBetOneFive.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET One Six LOGIC
    func chooseBetOneSix() {
        
        isChooseBetOneSix.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Two Three LOGIC
    func chooseBetTwoThree() {
        
        isChooseBetTwoThree.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Two Four LOGIC
    func chooseBetTwoFour() {
        
        isChooseBetTwoFour.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Two Five LOGIC
    func chooseBetTwoFive() {
        
        isChooseBetTwoFive.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Two Six LOGIC
    func chooseBetTwoSix() {
        
        isChooseBetTwoSix.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Three Four LOGIC
    func chooseBetThreeFour() {
        
        isChooseBetThreeFour.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Three Five LOGIC
    func chooseBetThreeFive() {
        
        isChooseBetThreeFive.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Three SixLOGIC
    func chooseBetThreeSix() {
        
        isChooseBetThreeSix.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Four Five LOGIC
    func chooseBetFourFive() {
        
        isChooseBetFourFive.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Four Six LOGIC
    func chooseBetFourSix() {
        
        isChooseBetFourSix.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
    
    // MARK: - BET Five Six LOGIC
    func chooseBetFiveSix() {
        
        isChooseBetFiveSix.toggle()
        playSound(sound: "input-chip", type: "mp3")
    }
}
