//
//  ContentView.swift
//  GuessNumber
//
//  Created by 謝于瑄 on 2023/11/14.
//

import SwiftUI

struct ContentView: View {
    @State private var num: Int = 0
    @State private var ans = Int.random(in: 0...9)
    @State private var isPress = false
    @State private var count = 0
    @State private var resultText = ""
    
    var body: some View {
        VStack {
            VStack {
                Text("Guess the Number")
                    .font(.title)
                Text("My ID:410921379")
                    .padding()
            }
            .padding(80)
            VStack {
                TextField("Enter the number:", value: $num, format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // Confirm button
                Button {
                    // Check the number when the button is pressed
                    isPress = true
                    checkNumber()
                } label: {
                    Text("Confirm")
                        .frame(width: 100, height: 25)
                        .padding()
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(20)
                }
                
                // Display the result text
                Text(resultText)
                    .foregroundColor(.red)
                    .font(.title)
                
                // Reset button
                if count >= 5 || resultText.contains("Correct") {
                    Button {
                        resetGame()
                    } label: {
                        Text("Restart")
                            .frame(width: 100, height: 25)
                            .padding()
                            .font(.title2)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(20)
                    }
                }
            }
        }
    }
    
    //check the number
    func checkNumber() {
        if num == ans {
            resultText = "Correct(fails = \(count))"
        }
        else if num < ans {
            resultText = "Too small(fails = \(count))"
            count += 1
        }
        else if num > ans {
            resultText = "Too large(fails = \(count))"
            count += 1
        }
        else if count >= 5 {
            resultText = "Fail(fails = \(count))"
            count += 1
        }
    }
    
    //Reset
    func resetGame() {
        ans = Int.random(in: 0...9)
        isPress = false
        count = 0
        num = 0
        resultText = ""
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
