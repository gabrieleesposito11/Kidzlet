//
//  SecondQuestion.swift
//  Bimbi
//
//  Created by Giorgio Caiazzo on 20/02/24.
//

import Foundation
import SwiftUI

struct SecondQuestion : View {
    @State private var remainingSeconds = 30
    @State private var timerIsRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    
    var body: some View {
        
        GeometryReader { geometry in
                VStack {
                    HStack{
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "house.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width/20)
                                .foregroundStyle(.white)
                                .offset(x: -geometry.frame(in: .local).width/7)
                                
                        })
                        
                        Text("9 times 3 is?")
                            .font(.system(size: geometry.size.width/10))
                            .fontDesign(.rounded)
                            .bold()
                            .foregroundStyle(.white)
                            .offset(x: -geometry.frame(in: .local).width/50)
                            
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
                                ZStack {
                                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                                        .frame(width: 400, height: 80)
                                        .foregroundStyle(.white)
                                        .opacity(0.3)
                                    Text("27")
                                        .font(.system(size: 40))
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                        .bold()
                                        .foregroundStyle(.white)
                                    
                                }
                                ZStack {
                                    RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/)
                                        .frame(width: 400, height: 80)
                                        .foregroundStyle(.white)
                                        .opacity(0.3)
                                    Text("27")
                                        .font(.system(size: 40))
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                        .bold()
                                        .foregroundStyle(.white)
                                }
                                ZStack {
                                    RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/)
                                        .frame(width: 400, height: 80)
                                        .foregroundStyle(.white)
                                        .opacity(0.3)
                                    Text("27")
                                        .font(.system(size: 40))
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                        .bold()
                                        .foregroundStyle(.white)
                                }
                                ZStack {
                                    RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/)
                                        .frame(width: 400, height: 80)
                                        .foregroundStyle(.white)
                                        .opacity(0.3)
                                    Text("27")
                                        .font(.system(size: 40))
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                        .bold()
                                        .foregroundStyle(.white)
                                }
                                
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "arrowshape.right.circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width/20)
                                        .foregroundStyle(.white)
                                        .offset(x: geometry.frame(in: .local).width/7, y: geometry.frame(in: .local).height/10)
                                })
                                
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
    func startTimer() {
            remainingSeconds = 30
            timerIsRunning = true
        }

        func stopTimer() {
            timerIsRunning = false
        }
    }

#Preview {
    SecondQuestion()
}
