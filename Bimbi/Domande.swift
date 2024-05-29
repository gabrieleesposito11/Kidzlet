//
//  Domande.swift
//  Bimbi
//
//  Created by Giorgio Caiazzo on 20/02/24.
//

import SwiftUI
import Foundation

struct Domande: View {
    @State private var remainingSeconds = 30
    @State private var timerIsRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @Environment (ListaDomande.self) var listaDomande
    @State private var selectedAnswerIndex: Int?
    
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                if let primaDomanda = listaDomande.question.first {
                    VStack {
                            ZStack {
                                HStack{
                                    
                                    NavigationLink(destination: TimerView()){
                                        Image(systemName: "house.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: geometry.size.width/20)
                                            .foregroundStyle(.white)
                                            .offset(x: -geometry.frame(in: .local).width/7)
                                    }
                                    
                                    Text(primaDomanda.text)
                                        .font(.system(size: geometry.size.width/10))
                                        .fontDesign(.rounded)
                                        .bold()
                                        .foregroundStyle(.white)
                                        .offset(x: -geometry.frame(in: .local).width/50)
                                        
                                }
                            }
                            
                            HStack {
                                VStack {
                                    Image("scorpione")
                                  
                                        Text("\(remainingSeconds)")
                                            .font(.system(size: 120))
                                            .fontDesign(.rounded)
                                            .bold()
                                            .foregroundStyle(.white)
                                            .padding(.vertical)
                                            .position(x: 350,y: -70)
                                    }
                                    
                                    VStack{
                                        ForEach(primaDomanda.answer.indices, id: \.self) { index in
                                            Button(action: {
                                                selectedAnswerIndex = index
                                            }) {
                                                ZStack {
                                                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                                                        .frame(width: 400, height: 80)
                                                        .foregroundStyle(selectedAnswerIndex == index ? (primaDomanda.answer[index].isCorrect ? Color.green : Color.red) : Color.white)
                                                        .opacity(0.3)
                                                    Text(primaDomanda.answer[index].text)
                                                        .font(.system(size: 40))
                                                        .bold()
                                                        .foregroundStyle(.white)
                                                }
                                            }
                                        }
                                        
                                        NavigationLink(destination: ContentView()){
                                            Image(systemName: "arrowshape.right.circle.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: geometry.size.width/20)
                                                .foregroundStyle(.white)
                                                .offset(x: geometry.frame(in: .local).width/7, y: geometry.frame(in: .local).height/10)
                                        }
                                    } .padding(.trailing, 100)
                                } .offset(y: -geometry.frame(in: .local).height/7)
                                
                            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(
                                RadialGradient(gradient: Gradient(colors: [.red, .black]), center: .center, startRadius: 0, endRadius: 1300))
                        
                        .onReceive(timer) { _ in
                                if timerIsRunning {
                                    if remainingSeconds > 0 {
                                        remainingSeconds -= 1
                                    } else {
                                        stopTimer()
                                    }
                                }
                            }
                            .onAppear {
                        startTimer()
                    }
                }
            }
        }
    }
    
    func startTimer() {
        remainingSeconds = 30
        timerIsRunning = true
    }

    func stopTimer() {
            timerIsRunning = false
    }
}

#Preview {
    Domande().environment(ListaDomande())
}

