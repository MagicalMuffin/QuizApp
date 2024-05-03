//
//  HomePage.swift
//  Quiz App
//
//  Created by StudentAM on 4/17/24.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("HD-wallpaper-question-mark-mark-question")
                    .resizable()
                //.aspectRatio(contentMode: .fit)//
                    .foregroundStyle(.tint)
                    .frame(width: 395, height: 1015)
                VStack {
                    Text("Quiz Time")
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Button(action: {
                    }, label:{
                        NavigationLink(destination: QuizPage()){
                            Text("Begin")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }
                    })
                }
                
            }
        }
    }
}
#Preview {
    HomePage()
}
