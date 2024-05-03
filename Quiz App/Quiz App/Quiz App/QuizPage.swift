//
//  QuizPage.swift
//  Quiz App
//
//  Created by StudentAM on 4/17/24.
//

import SwiftUI
struct Question{
    var text: String
    var options: [String]
    var correctAns: String
}
struct QuizPage: View {
    @State private var questions: [Question] = [
        Question(text: "Were you breathing BEFORE this question?", options: ["Yes", "No", "Maybe", "I'm not, now"], correctAns:"Yes"),
        Question(text: "Are you using a screen right now?", options: ["Yes", "No", "Maybe", "I'm a caveman"], correctAns:"Yes"),
        Question(text: "Were you wearing clothes BEFORE this question?", options: ["Yes", "No", "Maybe", "I came out of a shower"], correctAns:"Yes"),
        Question(text: "What do you drink water out of?", options: ["The lake", "A cup", "A plate", "A saucer"], correctAns:"A cup"),
        Question(text: "Which Spider-Man movie came out in 2002?", options: ["Spider-Man: Homecoming", "The Amazing Spider-Man", "Spider-Man: Into the Spider-Verse", "Spider-Man(2002)"], correctAns:"Spider-Man(2002)"),
        Question(text: "What colors are correct?", options: ["Question: Blue, Answers: Red", "Question: Red, Answers: Indigo", "Question: Crimson, Answers: Azure", "None"], correctAns:"Question: Crimson, Answers: Azure"),
        Question(text: "What question number is this?", options: ["6", "7", "8", "9"], correctAns:"7"),
        Question(text: "What's the closest whole number answer to 420/69?", options: ["196/28", "794/130", "468/78", "657/93"], correctAns:"468/78"),
        Question(text: "What order were the last question's options in?", options: ["794/130, 196/28, 468/78, 657/93", "196/28, 794/130, 657/93, 468/78", "39/756, 87/864, 031/497, 82/691", "196/28, 468/78, 794/130, 657/93"], correctAns:"39/756, 87/864, 031/497, 82/691"),
        Question(text: "With what answer would you not pick if you didn't want to not take this test never again?", options: ["I'd never want to not take this test ever again", "I'd never want to not take this test never again", "I'd always want to never take this test again", "No?"], correctAns:"I'd never want to not take this test ever again"),
        Question(text: "Last, LAST, one, I swear. Which day exists?", options: ["September 31", "June 31", "November 31", "March 31"], correctAns:"March 31"),
    ]
    @State private var currentQuestion = 0
    @State private var optionsPicked = false
    @State private var score = 0
    @State private var quizFinished:Bool = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("HD-wallpaper-question-mark-mark-question")
                    .resizable()
                //.aspectRatio(contentMode: .fit)//
                    .foregroundStyle(.tint)
                    .frame(width: 395, height: 1015)
                VStack {
                    //question struct thing//
                    Text("Score: \(score)")
                        .foregroundColor(.white)
                        .padding()
                    Text(questions[currentQuestion].text)
                        .frame(width: 350, height: 200)
                        .foregroundColor(.red)
                        .background(Color.black.opacity(0.6875))
                        .cornerRadius(15)
                    ForEach(questions[currentQuestion].options, id: \.self) {option in
                        Button(action:{checkAnswer(clickedAnswer: option)},label:{
                            Text(option)
                                .padding()
                                .frame(width: 350, height: 75)
                                .disabled(optionsPicked)
                                .background(Color.black.opacity(0.6875))
                                .cornerRadius(15)
                        })
                    }
                    Button(action: {
                        goToNextQuestion()
                    }) {
                        Text("Next question")
                            .padding()
                            .frame(width: 350, height: 50)
                            .background(Color.black.opacity(0.6875))
                            .cornerRadius(15)
                    }
                    .disabled(!optionsPicked)
                    
                    if currentQuestion == 10{
                        NavigationLink(destination: {
                            ScorePage(score: score)
                        }, label: {
                            Text("View score")
                                .padding()
                                .frame(width: 350, height: 50)
                                .background(Color.black.opacity(0.6875))
                                .cornerRadius(15)
                        })
                    }
                    
                    //                NavigationLink()
                    //                }
                   
                    /* frame(width: 680)*/
//                    Spacer()
                    /*.frame(width: 340, height: 1)*/
                }
            }
        }
      
    }
    
    func checkAnswer(clickedAnswer: String){
        if !optionsPicked {
            optionsPicked = true
            if clickedAnswer == questions[currentQuestion].correctAns {
                score += 1
            }
        }
    }
    func goToNextQuestion() {
        if currentQuestion == 10{
            quizFinished = true
        }
        
        currentQuestion += 1
        optionsPicked = false
    }
}
#Preview {
    QuizPage()
}
