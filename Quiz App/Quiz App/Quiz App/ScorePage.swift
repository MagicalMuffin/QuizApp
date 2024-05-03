//
//  ScorePage.swift
//  Quiz App
//
//  Created by StudentAM on 5/3/24.
//

import SwiftUI

struct ScorePage: View {
    @State  var score: Int
    var body: some View {
        NavigationView {
            ZStack{
                
                Image("HD-wallpaper-question-mark-mark-question")
                    .resizable()
                //.aspectRatio(contentMode: .fit)//
                    .foregroundStyle(.tint)
                    .frame(width: 395, height: 1015)
                Text("Your final score: \(score)")
                    .foregroundColor(.white)
            }
        }
    }
}
#Preview {
    ScorePage(score:1)
}
