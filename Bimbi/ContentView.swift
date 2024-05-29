//
//  ContentView.swift
//  Bimbi
//
//  Created by Gabriele Esposito on 19/02/24.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                HStack{
                    VStack {
                        HStack{
                            VStack {
                                Text("Are you ready to learn??")
                                    .font(.system(size: 35))
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .bold()
                                    .padding(.leading, 20.0)
                                    .foregroundStyle(.white)
                            }
                            Spacer()
                            VStack {
                                Text("Your score:")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .bold()
                                    .padding(.leading, 20.0)
                                    .foregroundStyle(.white)
                                Image("Progress Bar")
                            }
                        }
                        Spacer()
                    }
            }
                VStack {
                    Image("tuttiInsieme")
                        .padding(.top)
                    Spacer()
                    
                    NavigationLink(destination: Domande()){
                        ZStack {
                            RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                .frame(width: 200, height: 80)
                                .foregroundStyle(.white)
                                .opacity(0.3)
                            Text("Confirm")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .bold()
                            .foregroundStyle(.white)
                        }
                    }
                    
//                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                        ZStack {
//                            RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
//                                .frame(width: 200, height: 80)
//                                .foregroundStyle(.white)
//                                .opacity(0.3)
//                            Text("Confirm")
//                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                                .bold()
//                            .foregroundStyle(.white)
//                        }
//                    })
                }
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                        RadialGradient(gradient: Gradient(colors: [.verde, .black]), center: .center, startRadius: 0, endRadius: 1300)
        )
        }
    }
}

#Preview {
    ContentView()
}
