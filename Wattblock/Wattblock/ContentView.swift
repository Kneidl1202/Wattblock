//
//  ContentView.swift
//  Wattblock
//
//  Created by Andreas Auer on 15/08/22.
//

import SwiftUI

struct ContentView: View {
    @State private var winNumber = 15
    @State private var sumPointsPlayer1: Int = 0
    @State private var sumPointsPlayer2: Int = 0
    @State private var wonRounds1: Int = 0
    @State private var wonRounds2: Int = 0
    @State private var pointsPlayer1: Array<Int> = []
    @State private var pointsPlayer2: Array<Int> = []
    @State private var pointsPreview1: Array<String> = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    @State private var pointsPreview2: Array<String> = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    @State private var action: Array<Bool> = []
    @State private var gameWon = false
    @State private var changeGameMode = false
    @State private var winner = ""
    
    enum GameMode: String, CaseIterable, Identifiable {
        case five = "5", eight = "8"
        var id: String { self.rawValue }
    }
    @State private var selectedGameMode: GameMode = .five
     
    var body: some View {
    ZStack {
            Group {
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black)
                    .frame(width: 360)
            }
                
            Group{
                RoundedRectangle(cornerRadius: 1)
                    .foregroundColor(Color.white)
                    .frame(width: 150, height: 3)
                    .position(x: 380, y: 150)
                
                RoundedRectangle(cornerRadius: 1)
                    .foregroundColor(Color.white)
                    .frame(width: 3, height: 480)
                    .position(x: 380, y: 350)
                
                if self.sumPointsPlayer1 >= self.winNumber - 2{
                    RoundedRectangle(cornerRadius: 1)
                        .foregroundColor(Color.white)
                        .frame(width: 3, height: 400)
                        .position(x: 340, y: 365)
                }
                
                if self.sumPointsPlayer2 >= self.winNumber - 2{
                    RoundedRectangle(cornerRadius: 1)
                        .foregroundColor(Color.white)
                        .frame(width: 3, height: 400)
                        .position(x: 420, y: 365)
                }
            }
            
            Group{
                Text("1")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .position(x: 340, y: 125)
                
                Menu{
                    Picker("GameMode", selection: $selectedGameMode) {
                        Text("5").tag(GameMode.five)
                            .foregroundColor(Color.white)
                            .font(.largeTitle)
                        Text("8").tag(GameMode.eight)
                            .foregroundColor(Color.white)
                            .font(.largeTitle)
                    }
                    
                } label: {
                    Text(selectedGameMode.rawValue)
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                }
                .frame(width: 50, height: 50)
                .position(x: 420, y: 125)
            }
                
            Group{
                ScrollView {
                    Group {
                        Text("\(self.pointsPreview1[0])")
                        Text("\(self.pointsPreview1[1])")
                        Text("\(self.pointsPreview1[2])")
                        Text("\(self.pointsPreview1[3])")
                        Text("\(self.pointsPreview1[4])")
                        Text("\(self.pointsPreview1[5])")
                        Text("\(self.pointsPreview1[6])")
                        Text("\(self.pointsPreview1[7])")
                        Text("\(self.pointsPreview1[8])")
                        Text("\(self.pointsPreview1[9])")
                    }
                    Group {
                        Text("\(self.pointsPreview1[10])")
                        Text("\(self.pointsPreview1[11])")
                        Text("\(self.pointsPreview1[12])")
                        Text("\(self.pointsPreview1[13])")
                        Text("\(self.pointsPreview1[14])")
                        Text("\(self.pointsPreview1[15])")
                        Text("\(self.pointsPreview1[16])")
                        Text("\(self.pointsPreview1[17])")
                        Text("\(self.pointsPreview1[18])")
                        Text("\(self.pointsPreview1[19])")
                    }
                }
                .foregroundColor(Color.white)
                .frame(width: 50, height: 400)
                .position(x: 340, y: 360)
                .font(.largeTitle)
                
                ScrollView {
                    Group{
                        Text("\(self.pointsPreview2[0])")
                        Text("\(self.pointsPreview2[1])")
                        Text("\(self.pointsPreview2[2])")
                        Text("\(self.pointsPreview2[3])")
                        Text("\(self.pointsPreview2[4])")
                        Text("\(self.pointsPreview2[5])")
                        Text("\(self.pointsPreview2[6])")
                        Text("\(self.pointsPreview2[7])")
                        Text("\(self.pointsPreview2[8])")
                        Text("\(self.pointsPreview2[9])")
                    }
                    Group{
                        Text("\(self.pointsPreview2[10])")
                        Text("\(self.pointsPreview2[11])")
                        Text("\(self.pointsPreview2[12])")
                        Text("\(self.pointsPreview2[13])")
                        Text("\(self.pointsPreview2[14])")
                        Text("\(self.pointsPreview2[15])")
                        Text("\(self.pointsPreview2[16])")
                        Text("\(self.pointsPreview2[17])")
                        Text("\(self.pointsPreview2[18])")
                        Text("\(self.pointsPreview2[19])")
                    }
                }
                .foregroundColor(Color.white)
                .frame(width: 50, height: 400)
                .position(x: 420, y: 360)
                .font(.largeTitle)
            }
            
            Group{
                VStack{
                    Button(
                        action: {
                            addPoint(player: 1, point: 2)
                        },
                        label: {
                            Text("2")
                                .foregroundColor(Color.white)
                                .font(.largeTitle)
                                .frame(width: 40, height: 40)
                                .background(Color.yellow)
                                .cornerRadius(20)
                        })
                    
                    Button(
                        action: {
                            addPoint(player: 1, point: 3)
                        },
                        label: {
                            Text("3")
                                .foregroundColor(Color.white)
                                .font(.largeTitle)
                                .frame(width: 40, height: 40)
                                .background(Color.yellow)
                                .cornerRadius(20)
                        })
                    
                    Button(
                        action: {
                            addPoint(player: 1, point: 4)
                        },
                        label: {
                            Text("4")
                                .foregroundColor(Color.white)
                                .font(.largeTitle)
                                .frame(width: 40, height: 40)
                                .background(Color.yellow)
                                .cornerRadius(20)
                        })
                    
                    Button(
                        action: {
                            addPoint(player: 1, point: 5)
                        },
                        label: {
                            Text("5")
                                .foregroundColor(Color.white)
                                .font(.largeTitle)
                                .frame(width: 40, height: 40)
                                .background(Color.yellow)
                                .cornerRadius(20)
                        })
                    
                    Button(
                        action: {
                            addPoint(player: 1, point: 6)
                        },
                        label: {
                            Text("6")
                                .foregroundColor(Color.white)
                                .font(.largeTitle)
                                .frame(width: 40, height: 40)
                                .background(Color.yellow)
                                .cornerRadius(20)
                        })
                    
                    Button(
                            action: {
                                addPoint(player: 1, point: -2)
                            },
                            label: {
                                Text("-2")
                                    .foregroundColor(Color.white)
                                    .font(.title)
                                    .frame(width: 40, height: 40)
                                    .background(Color.red)
                                    .cornerRadius(20)
                            })
                }
                .position(x: 240, y: 300)
                
                
                VStack{
                    Button(
                        action: {
                            addPoint(player: 2, point: 2)
                        },
                        label: {
                            Text("2")
                                .foregroundColor(Color.white)
                                .font(.largeTitle)
                                .frame(width: 40, height: 40)
                                .background(Color.yellow)
                                .cornerRadius(20)
                        })
                    
                    Button(
                        action: {
                            addPoint(player: 2, point: 3)
                        },
                        label: {
                            Text("3")
                                .foregroundColor(Color.white)
                                .font(.largeTitle)
                                .frame(width: 40, height: 40)
                                .background(Color.yellow)
                                .cornerRadius(20)
                        })
                    
                    Button(
                        action: {
                            addPoint(player: 2, point: 4)
                        },
                        label: {
                            Text("4")
                                .foregroundColor(Color.white)
                                .font(.largeTitle)
                                .frame(width: 40, height: 40)
                                .background(Color.yellow)
                                .cornerRadius(20)
                        })
                    
                    Button(
                        action: {
                            addPoint(player: 2, point: 5)
                        },
                        label: {
                            Text("5")
                                .foregroundColor(Color.white)
                                .font(.largeTitle)
                                .frame(width: 40, height: 40)
                                .background(Color.yellow)
                                .cornerRadius(20)
                        })
                    
                    Button(
                        action: {
                            addPoint(player: 2, point: 6)
                        },
                        label: {
                            Text("6")
                                .foregroundColor(Color.white)
                                .font(.largeTitle)
                                .frame(width: 40, height: 40)
                                .background(Color.yellow)
                                .cornerRadius(20)
                        })
                    
                    Button(
                            action: {
                                addPoint(player: 2, point: -2)
                            },
                            label: {
                                Text("-2")
                                    .foregroundColor(Color.white)
                                    .font(.title)
                                    .frame(width: 40, height: 40)
                                    .background(Color.red)
                                    .cornerRadius(20)
                            })
                }
                .position(x: 525, y: 300)
            }
            
            Group{
                Text("\(self.sumPointsPlayer1)")
                    .position(x: 345, y: 600)
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                
                Text("\(self.sumPointsPlayer2)")
                    .position(x: 415, y: 600)
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
            }
            
            Group{
                Button(""){}
                    .alert(isPresented: $gameWon){
                        Alert(
                            title: Text("Spiel Ende"),
                            message: Text("Die Gewinner sind: \(winner)"))
                    }
                
                Button(""){}
                    .alert(isPresented: $changeGameMode){
                        Alert(
                            title: Text("Spiel neustarten"),
                            message: Text("Spiel neustarten um Änderung zu akzeptieren, oder Runde zu Ende spielen"))
                    }
                
                Button("Spiel neustarten"){
                    wonRounds1 = 0
                    wonRounds2 = 0
                    restartGame()
                }
                    .frame(width: 205, height: 30)
                    .background(Color.green)
                    .cornerRadius(10)
                    .position(x: 330, y: 50)
                    .font(.title)
                    .foregroundColor(Color.white)
                
                Button(action: { self.reverse() }) { Image(systemName: "backward") }
                    .frame(width: 50, height: 30)
                    .background(Color.green)
                    .cornerRadius(10)
                    .position(x: 500, y: 50)
                    .foregroundColor(Color.white)
                    .font(.title)
                
                Button(action: {
                          print("button pressed")

                        }) {
                            Image("marker")
                            .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                        }
            }
            
            Group{
                Text("Gewonnene Runden: ")
                    .foregroundColor(Color.white)
                    .font(.title)
                    .position(x: 350, y: 650)
                
                Text("es: \(wonRounds1)")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .position(x: 270, y: 700)
                
                Text("mir: \(wonRounds2)")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .position(x: 480, y: 700)
            }
            
        }
        .onChange(of: selectedGameMode){ newValue in changeGameMode = true }
    }
    
    private func restartGame(){
        for i in 0..<20{
            self.pointsPreview1[i] = ""
            self.pointsPreview2[i] = ""
        }
        self.pointsPlayer1 = []
        self.pointsPlayer2 = []
        calculateSum()
        
        self.winNumber = Int(selectedGameMode.rawValue) ?? 15
        self.winNumber += 10
    }
    
    private func wonGame(){
        if self.sumPointsPlayer1 >= self.winNumber{
            self.winner = "es"
            self.wonRounds1 += 1
        }
        else if self.sumPointsPlayer2 >= self.winNumber{
            self.winner = "mir"
            self.wonRounds2 += 1
        }
        
        self.gameWon = true
        
        restartGame()
    }
    
    private func addPoint(player: Int, point: Int){
        if player == 1{
            self.pointsPlayer1.append(point)
            self.pointsPreview1[self.pointsPlayer1.count - 1] = (String(point))
            self.action.append(true)
        }
        else{
            self.pointsPlayer2.append(point)
            self.pointsPreview2[self.pointsPlayer2.count - 1] = (String(point))
            self.action.append(false)
        }
        
        self.calculateSum()
        
        if self.sumPointsPlayer1 > self.winNumber - 1 || self.sumPointsPlayer2 > self.winNumber - 1{
            self.wonGame()
        }
    }
    
    private func reverse(){
        if(self.action.count > 0){
            let action = self.action.last
            
            if action ?? true{
                self.pointsPlayer1.removeLast()
                self.pointsPreview1[self.pointsPlayer1.count] = ""
            }
            else{
                self.pointsPlayer2.removeLast()
                self.pointsPreview2[self.pointsPlayer2.count] = ""
            }
            
            self.action.removeLast()
            
            calculateSum()
        }
    }
    
    private func calculateSum(){
        sumPointsPlayer1 = 0
        for item in self.pointsPlayer1{
            self.sumPointsPlayer1 += item
        }
        
        sumPointsPlayer2 = 0
        for item in self.pointsPlayer2{
            self.sumPointsPlayer2 += item
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
