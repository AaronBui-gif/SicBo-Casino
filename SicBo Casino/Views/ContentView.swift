//
//  ContentView.swift
//  Sicbo (Tai xiu)
//
//  Created by AaronBui on 8/1/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let icons = ["1dice", "2dice", "3dice", "4dice", "5dice", "6dice"]
    
    let haptics = UINotificationFeedbackGenerator()
    
    @State private var highscore: Float = UserDefaults.standard.float(forKey: "highscore")
    @State private var leaderboardScore: Float = UserDefaults.standard.float(forKey: "highscoreleader")
    @State private var coins: Float = 100
    @State private var betAmount: Float = 10
    @State private var reels = [0, 1, 2]
    @State private var isChooseBet10 = true
    @State private var isChooseBet20 = false
    @State private var showingInfoView = false
    @State private var showGameOverModal = false
    @State private var animatingIcon = false
    @State private var dice1 = 1;
    @State private var dice2 = 2;
    @State private var dice3 = 3;
    @State private var dice4 = 4;
    @State private var dice5 = 5;
    @State private var dice6 = 6;
    @State private var number1 = 0;
    @State private var number2 = 0;
    @State private var number3 = 0;
    @State private var sum = 0;
    @State private var myString1 = ""
    @State private var myString2 = ""
    @State private var myString3 = ""
    @State private var mySum = ""
    @State private var myBoolean = ""
    @StateObject var userData = UserProgress()
    @State var id = 0;
    @EnvironmentObject var userProgress : UserProgress
    @State private var myString = "Easy"
    @State private var count = 1
    @State private var modeDoubleRatio: Float = 5
    @State private var modeOneDice: Float = 2
    @State private var scoreBoard: [Float] = []
    @State private var scoreLeader: [LeaderBoard] = []
    func float2Digit(n: Float) -> String{
        let nf = NumberFormatter()
        nf.roundingMode = .down
        nf.maximumFractionDigits = 2
        let t = nf.string(for: n)
        return t!
    }
    
    // MARK: - FUNCTIONS (GAME LOGICS)
    
    // MARK: - SPIN LOGIC
    func spinReels(){
        // reels[0] = Int.random(in: 0...symbols.count - 1)
        reels = reels.map({ _ in
            Int.random(in: 0...icons.count - 1)
        })
        playSound(sound: "spin", type: "mp3")
        haptics.notificationOccurred(.success)
    }
    
    // MARK: - CHECK NUMBER IN REELS 0
    func checkNumberInReels0() -> Int{
        switch reels[0]{
        case 1: number1 = 1
        case 2: number1 = 2
        case 3: number1 = 3
        case 4: number1 = 4
        case 5: number1 = 5
        case 6: number1 = 6
        default: number1 = 0
        }
        
        return number1 + 1
    }
    
    // MARK: - CHECK NUMBER IN REELS 1
    func checkNumberInReels1()  -> Int{
        switch reels[1]{
        case 1: number2 = 1
        case 2: number2 = 2
        case 3: number2 = 3
        case 4: number2 = 4
        case 5: number2 = 5
        case 6: number2 = 6
        default: number2 = 0
        }
        
        return number2 + 1
    }
    
    // MARK: - CHECK NUMBER IN REELS 2
    func checkNumberInReels2()  -> Int{
        switch reels[2]{
        case 1: number3 = 1
        case 2: number3 = 2
        case 3: number3 = 3
        case 4: number3 = 4
        case 5: number3 = 5
        case 6: number3 = 6
        default: number3 = 0
        }
        print(icons[reels[2]])
        return number3 + 1
    }
    
    // MARK: - CHECK WINNING LOGIC
    func checkWinning(){
        number1 = checkNumberInReels0()
        number2 = checkNumberInReels1()
        number3 = checkNumberInReels2()
        sum = number1 + number2 + number3
        
        // MARK: - Bet Odd Condition
        if(userData.isChooseBetOdd == true){
            sum = number1 + number2 + number3
            
            if (sum % 2 == 1){
                coins += betAmount * modeOneDice
                checkHighScore()
            } else {
                playLoses()
            }
        }
        
        // MARK: - Bet Even Condition
        if (userData.isChooseBetEven == true) {
            
            sum = number1 + number2 + number3
            
            if (sum % 2 == 0){
                coins += betAmount * modeOneDice
                checkHighScore()
            } else {
                playLoses()
            }
        }
        
        // MARK: - Bet Double One Condition
        if (userData.isChooseBetDoubleOne == true) {
            
            if ((number1 == 1 && number2 == 1) || (number1 == 1 && number3 == 1) || (number2 == 1 && number3 == 1)) {
                coins += betAmount * modeDoubleRatio
                checkHighScore()
            } else {
                playLoses()
            }
        }
        
        // MARK: - Bet Double Two Condition
        if (userData.isChooseBetDoubleTwo == true) {
            
            if ((number1 == 2 && number2 == 2) || (number1 == 2 && number3 == 2) || (number2 == 2 && number3 == 2)) {
                coins += betAmount * modeDoubleRatio
                checkHighScore()
            } else {
                playLoses()
            }
        }
        
        // MARK: - Bet Double Three Condition
        if (userData.isChooseBetDoubleThree == true) {
            
            if ((number1 == 3 && number2 == 3) || (number1 == 3 && number3 == 3) || (number2 == 3 && number3 == 3)) {
                coins += betAmount * modeDoubleRatio
                checkHighScore()
            } else {
                playLoses()
            }
        }
        
        // MARK: - Bet Double Four Condition
        if (userData.isChooseBetDoubleFour == true) {
            if ((number1 == 4 && number2 == 4) || (number1 == 4 && number3 == 4) || (number2 == 4 && number3 == 4)) {
                coins += betAmount * modeDoubleRatio
                checkHighScore()
            } else {
                playLoses()
            }
        }
        
        // MARK: - Bet Double Five Condition
        if (userData.isChooseBetDoubleFive == true) {
            if ((number1 == 5 && number2 == 5) || (number1 == 5 && number3 == 5) || (number2 == 5 && number3 == 5)) {
                coins += betAmount * modeDoubleRatio
                checkHighScore()
            } else {
                playLoses()
            }
        }
        if (userData.isChooseBetDoubleSix == true) {
            if ((number1 == 6 && number2 == 6) || (number1 == 6 && number3 == 6) || (number2 == 6 && number3 == 6)) {
                coins += betAmount * modeDoubleRatio
                checkHighScore()
            } else {
                playLoses()
            }
        }
        
        // MARK: - Bet One Condition
        if (userData.isChooseBetOne == true) {
            if (number1 == 1 || number2 == 1 || number3 == 1) {
                coins += betAmount * modeOneDice
                checkHighScore()
            } else {
                playLoses()
            }
        }
        
        // MARK: - Bet Two Condition
        if (userData.isChooseBetTwo == true) {
            if (number1 == 2 || number2 == 2 || number3 == 2) {
                coins += betAmount * modeOneDice
                checkHighScore()
            } else {
                playLoses()
            }
        }
        
        // MARK: - Bet Even Condition
        if (userData.isChooseBetThree == true) {
            if (number1 == 3 || number2 == 3 || number3 == 3) {
                coins += betAmount * modeOneDice
                checkHighScore()
            } else {
                playLoses()
            }
        }
        
        // MARK: - Bet Four Condition
        if (userData.isChooseBetFour == true) {
            if (number1 == 4 || number2 == 4 || number3 == 4) {
                coins += betAmount * modeOneDice
                checkHighScore()
            } else {
                playLoses()
            }
        }
        
        // MARK: - Bet Five Condition
        if (userData.isChooseBetFive == true) {
            if (number1 == 5 || number2 == 5 || number3 == 5) {
                coins += betAmount * modeOneDice
                checkHighScore()
            } else {
                playLoses()
            }
        }
        
        // MARK: - Bet Even Condition
        if (userData.isChooseBetSix == true) {
            if (number1 == 6 || number2 == 6 || number3 == 6) {
                coins += betAmount * modeOneDice
                checkHighScore()
            } else {
                playLoses()
            }
        }
        if (userData.isChooseBetAnyTriple == true) {
            if reels[0] == reels[1] && reels[1] == reels[2] {
                coins += betAmount * 15
                checkHighScore()
            } else {
                playLoses()
            }
        }
        if (userData.isChooseBetSmall == true) {
            sum = number1 + number2 + number3
            
            if (sum >= 4 && sum <= 10){
                coins += betAmount * modeOneDice
                checkHighScore()
            } else {
                playLoses()
            }
        }
        if (userData.isChooseBetBig == true) {
            sum = number1 + number2 + number3
            
            if (sum >= 11 && sum <= 17){
                coins += betAmount * modeOneDice
                checkHighScore()
            } else {
                playLoses()
            }
        }
        if (userData.isChooseBetOneTwo == true) {
            if ((number1 == 1 && number2 == 2) || (number1 == 2 && number3 == 1) || (number2 == 1 && number3 == 2) || number2 == 2 && number3 == 1) {
                coins += betAmount * modeDoubleRatio
                checkHighScore()
            } else {
                playLoses()
            }
        }
        if (userData.isChooseBetOneThree == true) {
            if ((number1 == 1 && number2 == 3) || (number1 == 3 && number3 == 1) || (number2 == 1 && number3 == 3) || (number2 == 3 && number3 == 1)) {
                coins += betAmount * modeDoubleRatio
                checkHighScore()
            } else {
                playLoses()
            }
        }
        if (userData.isChooseBetOneFour == true) {
            if ((number1 == 1 && number2 == 4) || (number1 == 4 && number3 == 1) || (number2 == 1 && number3 == 4) || (number2 == 4 && number3 == 1)) {
                coins += betAmount * modeDoubleRatio
                checkHighScore()
            } else {
                playLoses()
            }
        }
        if (userData.isChooseBetOneFive == true) {
            if ((number1 == 1 && number2 == 5) || (number1 == 5 && number3 == 1) || (number2 == 1 && number3 == 5) || (number2 == 5 && number3 == 1)) {
                coins += betAmount * modeDoubleRatio
                checkHighScore()
            } else {
                playLoses()
            }
        }
        if (userData.isChooseBetOneSix == true) {
            if ((number1 == 1 && number2 == 6) || (number1 == 6 && number3 == 1) || (number2 == 1 && number3 == 6) || (number2 == 6 && number3 == 1)) {
                coins += betAmount * modeDoubleRatio
                checkHighScore()
            } else {
                playLoses()
            }
        }
        if (userData.isChooseBetTwoThree == true) {
            if ((number1 == 2 && number2 == 3) || (number1 == 3 && number3 == 2) || (number2 == 2 && number3 == 3) || (number2 == 3 && number3 == 2)) {
                coins += betAmount * modeDoubleRatio
                checkHighScore()
            } else {
                playLoses()
            }
        }
        if (userData.isChooseBetTwoFour == true) {
            if ((number1 == 2 && number2 == 4) || (number1 == 4 && number3 == 2) || (number2 == 2 && number3 == 4) || (number2 == 4 && number3 == 2)) {
                coins += betAmount * modeDoubleRatio
                checkHighScore()
            } else {
                playLoses()
            }
        }
        if (userData.isChooseBetTwoFive == true) {
            if ((number1 == 2 && number2 == 5) || (number1 == 5 && number3 == 2) || (number2 == 2 && number3 == 5) || (number2 == 5 && number3 == 2)) {
                coins += betAmount * modeDoubleRatio
                checkHighScore()
            } else {
                playLoses()
            }
        }
        if (userData.isChooseBetTwoSix == true) {
            if ((number1 == 2 && number2 == 6) || (number1 == 6 && number3 == 2) || (number2 == 2 && number3 == 6) || (number2 == 6 && number3 == 2)) {
                coins += betAmount * modeDoubleRatio
                checkHighScore()
            } else {
                playLoses()
            }
        }
        if (userData.isChooseBetThreeFour == true) {
            if ((number1 == 3 && number2 == 4) || (number1 == 4 && number3 == 3) || (number2 == 3 && number3 == 4) || (number2 == 4 && number3 == 3)) {
                coins += betAmount * modeDoubleRatio
                checkHighScore()
            } else {
                playLoses()
            }
        }
        if (userData.isChooseBetThreeFive == true) {
            if ((number1 == 3 && number2 == 5) || (number1 == 5 && number3 == 3) || (number2 == 3 && number3 == 5) || (number2 == 5 && number3 == 3)) {
                coins += betAmount * modeDoubleRatio
                checkHighScore()
            } else {
                playLoses()
            }
        }
        if (userData.isChooseBetThreeSix == true) {
            if ((number1 == 3 && number2 == 6) || (number1 == 6 && number3 == 3) || (number2 == 3 && number3 == 6) || (number2 == 6 && number3 == 3)) {
                coins += betAmount * modeDoubleRatio
                checkHighScore()
            } else {
                playLoses()
            }
        }
        if (userData.isChooseBetFourFive == true) {
            if ((number1 == 4 && number2 == 5) || (number1 == 5 && number3 == 4) || (number2 == 4 && number3 == 5) || (number2 == 5 && number3 == 4)) {
                coins += betAmount * modeDoubleRatio
                checkHighScore()
            } else {
                playLoses()
            }
        }
        if (userData.isChooseBetFourSix == true) {
            if ((number1 == 4 && number2 == 6) || (number1 == 6 && number3 == 4) || (number2 == 4 && number3 == 6) || (number2 == 6 && number3 == 4)) {
                coins += betAmount * modeDoubleRatio
                checkHighScore()
            } else {
                playLoses()
            }
        }
        if (userData.isChooseBetFiveSix == true) {
            if ((number1 == 5 && number2 == 6) || (number1 == 6 && number3 == 1) || (number2 == 1 && number3 == 4) || (number2 == 4 && number3 == 1)) {
                coins += betAmount * modeDoubleRatio
                checkHighScore()
            } else {
                playLoses()
            }
        }
    }
    
    // MARK: - Set Easy Mode
    func setEasy() {
        myString = "Easy"
        modeOneDice = userData.easyBetRatioOneDice
        modeDoubleRatio = userData.easyBetRatioDouble
    }
    
    // MARK: - Set Hard Mode
    func setHard() {
        myString = "Hard"
        modeOneDice = userData.hardBetRatioOneDice
        modeDoubleRatio = userData.hardBetRatioDouble
        count = 1
    }
    
    // MARK: - Check HIGHSCORE
    func checkHighScore(){
        if coins > highscore{
            newHighScore()
        } else {
            playSound(sound: "winning", type: "wav")
        }
    }
    
    // MARK: - PLAYER WIN LOGIC
    func playerWins() {
        coins += betAmount * 5
    }
    
    // MARK: - HIGHSCORE LOGIC
    func newHighScore(){
        highscore = coins
        UserDefaults.standard.set(highscore, forKey: "highscore")
        scoreBoard.append(highscore)
        scoreLeader.insert(LeaderBoard(id: 1, name: "User", highscore: highscore), at: 0)
        playSound(sound: "highscore", type: "wav")
    }
    
    // MARK: - PLAYER LOSE LOGIC
    func playLoses() {
        coins -= betAmount
    }
    
    // MARK: - BET 20 LOGIC
    func chooseBet20() {
        betAmount = 20
        isChooseBet20 = true
        isChooseBet10 = false
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET 10 LOGIC
    func chooseBet10() {
        betAmount = 10
        isChooseBet10 = true
        isChooseBet20 = false
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - GAME OVER LOGIC
    func isGameOver() {
        if coins <= 0 {
            // SHOW MODAL MESSAGE OF GAME OVER
            showGameOverModal = true
            playSound(sound: "gameover", type: "mp3")
        }
    }
    
    // MARK: - RESET GAME LOGIC
    func resetGame(){
        UserDefaults.standard.set(0, forKey: "highscore")
        highscore = 0
        coins = 100
        chooseBet10()
        playSound(sound: "ring-up", type: "mp3")
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationView{
            ZStack {
                // MARK: - BACKGROUND
                LinearGradient(gradient: Gradient(colors: [Color("ColorRedRMIT"), Color("ColorBrightPurpleRMIT")]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                // MARK: - GAME UI
                VStack (spacing: -5){
                    
                    // MARK: - Navigation Bar
                    HStack(spacing: 20){
                        NavigationLink{ MainMenu() } label: {
                            ZStack{
                                Rectangle()
                                    .fill(.red)
                                    .border(.white, width:4)
                                
                                    .frame(width: 60, height: 40, alignment: .center)
                                Text("Back")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 20))
                            }
                        }
                        NavigationLink{ LeaderBoardView(scoreboard: $scoreLeader, userData: UserProgress())} label: {
                                
                                ZStack{
                                    Rectangle()
                                        .fill(.red)
                                        .border(.white, width:4)
                                    
                                        .frame(width: 80, height: 40, alignment: .center)
                                    Text("Leader")
                                        .foregroundColor(.white)
                                        .fontWeight(.semibold)
                                        .font(.system(size: 20))
                                }
                            }
                    }.offset(x:0, y: 30)
                    // MARK: - SCORE
                    HStack{
                        HStack{
                            Text("Your\nMoney".uppercased())
                                .modifier(scoreLabelStyle())
                                .multilineTextAlignment(.trailing)
                            Text(self.float2Digit(n: coins))
                                .modifier(scoreNumberStyle())
                        }
                        .modifier(scoreCapsuleStyle()
                                  
                        )
                        Spacer()
                        HStack{
                            Text(self.float2Digit(n: highscore))
                                .modifier(scoreNumberStyle())
                                .multilineTextAlignment(.leading)
                            Text("High\nScore".uppercased())
                                .modifier(scoreLabelStyle())
                            
                        }
                        .modifier(scoreCapsuleStyle()
                        )
                    }
                    .offset(y:0)
                    // MARK: - SLOT MACHINE
                    VStack{
                        
                        // MARK: - FIRST REEL
                        HStack (spacing: 30){
                            ZStack{
                                ReelView().frame(width:100, height:100)
                                Image(icons[reels[0]])
                                    .resizable()
                                    .frame(width:50, height:50)
                                    .modifier(IconImageModifier())
                                    .opacity(animatingIcon ? 1 : 0)
                                    .offset(y: animatingIcon ? 0 : -50)
                                    .animation(.easeOut(duration: Double.random(in: 0.5...0.7)), value: animatingIcon)
                                    .onAppear(perform: {
                                        self.animatingIcon.toggle()
                                        playSound(sound: "former-102685", type: "mp3")
                                    })
                                
                            }
                            
                            // MARK: - SECOND REEL
                            ZStack{
                                ReelView().frame(width:100, height:100)
                                Image(icons[reels[1]])
                                    .resizable()
                                    .frame(width:50, height:50)
                                    .modifier(IconImageModifier())
                                    .opacity(animatingIcon ? 1 : 0)
                                    .offset(y: animatingIcon ? 0 : -50)
                                    .animation(.easeOut(duration: Double.random(in: 0.7...0.9)), value: animatingIcon)
                                    .onAppear(perform: {
                                        self.animatingIcon.toggle()
                                        playSound(sound: "former-102685", type: "mp3")
                                    })
                            }
                            
                            
                            
                            // MARK: - THIRD REEL
                            ZStack{
                                ReelView().frame(width:100, height:100)
                                Image(icons[reels[2]])
                                    .resizable()
                                    .frame(width:50, height:50)
                                    .modifier(IconImageModifier())
                                    .opacity(animatingIcon ? 1 : 0)
                                    .offset(y: animatingIcon ? 0 : -50)
                                    .animation(.easeOut(duration: Double.random(in: 0.9...1.1)), value: animatingIcon)
                                    .onAppear(perform: {
                                        self.animatingIcon.toggle()
                                        playSound(sound: "former-102685", type: "mp3")
                                    })
                            }
                        }
                        
                        
                        
                        // MARK: - SPIN BUTTON
                        Button {
                            // NO ANIMATION
                            withAnimation{
                                self.animatingIcon = false
                            }
                            
                            // SPIN THE REELS
                            self.spinReels()
                            
                            // TRIGGER ANIMATION
                            withAnimation{
                                self.animatingIcon = true
                            }
                            
                            // CHECK WINNING
                            self.checkWinning()
                            
                            
                            // GAME OVER
                            self.isGameOver()
                            
                            // Print out numbers
                            myString1 = String(number1)
                            myString2 = String(number2)
                            myString3 = String(number3)
                            mySum = String(sum)
                            print("info pressed")
                        } label: {
                            VStack{
                                Image("spin")
                                    .resizable()
                                    .frame(width:100, height:100)
                                    .modifier(ReelImageModifier())
                                HStack{
                                    Text(myString1)
                                        .foregroundColor(.white)
                                    Text(myString2)
                                        .foregroundColor(.white)
                                    Text(myString3)
                                        .foregroundColor(.white)
                                    Text("Total " + mySum)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        
                    }
                    .offset(y: 10)
                    
                    // MARK: - RESET GAME BUTTON
                    
                    Button(action: {
                        self.resetGame()
                    }) {
                        Image(systemName: "arrow.2.circlepath.circle")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width:30, height: 30)
                    }.offset(x:150 ,y:-110)
                    
                    // MARK: - Mode EASY/HARD
                    Button(action: {
                        count+=1
                        switch (count){
                        case 1:
                            myString = "Easy"
                            modeOneDice = userData.easyBetRatioOneDice
                            modeDoubleRatio = userData.easyBetRatioDouble
                        case 2:
                            myString = "Hard"
                            modeOneDice = userData.hardBetRatioOneDice
                            modeDoubleRatio = userData.hardBetRatioDouble
                            count = 0
                        default: myString = "Press me"
                        }
                    }) {
                        ZStack {
                            Rectangle()
                                .fill(.red)
                                .border(.white, width:4)
                                .frame(width: 50, height: 30)
                            Text(myString)
                        }
                        .foregroundColor(.white)
                    }.offset(x:150 ,y:-90)
                    ScrollView{
                        VStack{
                            ZStack(alignment: .leading){
                                BettingTableView(userData: userData)
                                    .frame(width:400, height:400, alignment: .top)
                            }
                        }
                        .offset(y:-10)
                    }
                    .frame(height: 490)
                    .offset(y:-25)
                    // MARK: - FOOTER
                    
                    Spacer()
                    HStack{
                        HStack{
                            
                            // MARK: - BET 20 BUTTON
                            Button {
                                self.chooseBet20()
                            } label: {
                                HStack(spacing: 30){
                                    Text("20")
                                        .foregroundColor(isChooseBet20 ? Color("ColorBlueRMIT") : Color.white)
                                        .modifier(BetCapsuleModifier())
                                    Image("casino-chips")
                                        .resizable()
                                        .offset(x: isChooseBet20 ? 0 : 20)
                                        .opacity(isChooseBet20 ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                        .animation(.default, value: isChooseBet20)
                                }
                                .padding(.horizontal, 20)
                            }
                            
                            Spacer()
                            
                            // MARK: - BET 10 BUTTON
                            Button {
                                self.chooseBet10()
                            } label: {
                                HStack(spacing: 30){
                                    Image("casino-chips")
                                        .resizable()
                                        .offset(x: isChooseBet10 ? 0 : -20)
                                        .opacity(isChooseBet10 ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                        .animation(.default, value: isChooseBet20)
                                    Text("10")
                                        .foregroundColor(isChooseBet10 ? Color("ColorBlueRMIT") : Color.white)
                                        .modifier(BetCapsuleModifier())
                                }
                                .padding(.horizontal, 20)
                            }
                        }
                    }
                }
                //
                .padding()
                .frame(maxWidth: 720)
                .blur(radius:  showGameOverModal ? 5 : 0 , opaque: false)
                .offset(y:-10)
                
                
                // MARK: - GAMEOVER MODAL
                if showGameOverModal{
                    ZStack{
                        Color("ColorBlackTransparent")
                            .edgesIgnoringSafeArea(.all)
                        VStack{
                            Text("GAME OVER")
                                .font(.system(.title, design: .rounded))
                                .fontWeight(.heavy)
                                .foregroundColor(Color.white)
                                .padding()
                                .frame(minWidth: 280, idealWidth: 280, maxWidth: 320)
                                .background(Color("ColorRedRMIT"))
                            
                            Spacer()
                            
                            VStack {
                                Image("Sicbo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxHeight: 150)
                                Text("You lost all money!")
                                    .font(.system(.body, design: .rounded))
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.center)
                                Button {
                                    self.showGameOverModal = false
                                    self.coins = 100
                                } label: {
                                    Text("New Game".uppercased())
                                }
                                .padding(.vertical,10)
                                .padding(.horizontal, 20)
                                .background(
                                    Capsule()
                                        .strokeBorder(lineWidth: 2)
                                        .foregroundColor(Color("ColorRedRMIT"))
                                )
                            }
                            Spacer()
                        }
                        .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 280, idealHeight: 300, maxHeight: 350, alignment: .center)
                        .background(Color("ColorBlueRMIT"))
                        .cornerRadius(20)
                    }.onAppear(perform: {
                        playSound(sound: "On_My_Way", type: "mp3")
                    })
                    
                } //ZStack
            }.navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarTitleDisplayMode(.inline)
                
        }
    }
}
// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


