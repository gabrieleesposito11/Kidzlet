//
//  Timer.swift
//  Bimbi
//
//  Created by Giorgio Caiazzo on 20/02/24.
//

import Foundation
import SwiftUI

struct TimerView: View {
    
    @State private var remainingSeconds = 10 * 60 // 10 minutes
    @State private var timerIsRunning = false
//    @State private var oneMinutePassed = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                HStack{
                    Text("Are you ready to learn?")
                        .font(.system(size: 35))
                        .fontDesign(.rounded)
                        .bold()
                        .foregroundStyle(.white)
                        .offset(x: -200)
                    
                    VStack {
                        Text("Your score:")
                            .font(.system(size: 35))
                            .fontDesign(.rounded)
                            .bold()
                            .foregroundStyle(.white)
                        Image("Progress Bar")
                    } .offset(x:200)
                    
                } .offset(y: 60)
                
                HStack {
                    Image("scorpione")
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/)
                            .frame(width: 520, height: 300)
                            .foregroundStyle(.white)
                            .opacity(0.5)
                        Text("\(formattedTime)")
                            .font(.system(size: 150))
                            .fontDesign(.rounded)
                            .bold()
                            .foregroundStyle(.white)
                    } .onReceive(timer) { _ in
                        if timerIsRunning {
                            if remainingSeconds > 0 {
                                remainingSeconds -= 1
//                                updateOneMinutePassed()
                            } else {
                                stopTimer()
                                
                            }
                        }
                    }
                    .onAppear {
                        startTimer()
                    }
                    
                    Spacer()
                }
                
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "chevron.right.square.fill")
                            .font(.system(size: 70))
                            .foregroundColor(.white)
                            .opacity(0.6)
                            .offset(x: 500, y: -100)
                        
                    })
                
                
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    RadialGradient(gradient: Gradient(colors: [.red, .black]), center: .center, startRadius: 0, endRadius: 1300))
        }
        
    }
    func startTimer() {
            remainingSeconds = 10 * 60
            timerIsRunning = true
        }

        func stopTimer() {
            timerIsRunning = false
        }
    
    var formattedTime: String {
            let minutes = remainingSeconds / 60
            let seconds = remainingSeconds % 60
            return String(format: "%02d:%02d", minutes, seconds)
        }
//    private func updateOneMinutePassed() {
//            if remainingSeconds <= (10 * 60 - 60) {
//                oneMinutePassed = true
//            }
//        }
    
}

#Preview {
    TimerView()
}
