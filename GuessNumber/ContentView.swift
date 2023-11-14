//
//  ContentView.swift
//  GuessNumber
//
//  Created by 謝于瑄 on 2023/11/14.
//

import SwiftUI

struct ContentView: View {
    @State var num: Int = 0
    @State var ans = Int.random(in: 0...9)
    @State var isPress = false
    @State var count = 0
    @State var check_reset = false
    
    var body: some View {
        VStack{
            VStack {
                Text("Guess the Number")
                    .font(.title)
                Text("My ID:410921379")
                    .padding()
            }
            .padding(50)
            VStack{
                TextField("Enter the number:", value: $num, format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                //confirm
                Button{
                    isPress = true
                    count += 1
                }label: {
                    Text("Confirm")
                        .frame(width: 100, height: 25)
                        .padding()
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(20)
                }//Button 1
                
                if isPress{
                    if(num == ans){
                        Text("Correct(fails = \(count))")
                            .foregroundColor(.red)
                            .font(.title)
                    }
                    else if(num < ans){
                        Text("Too small(fails = \(count))")
                            .foregroundColor(.red)
                            .font(.title)
                    }
                    else if(num > ans){
                        Text("Too large(fails = \(count))")
                            .foregroundColor(.red)
                            .font(.title)
                    }
                    else if(count >= 5){
                        Text("Fail(fails = \(count))")
                            .foregroundColor(.red)
                            .font(.title)
                    }
                }
                
                if count >= 5 || num == ans{
                    //Reset
                    Button{
                        ans = Int.random(in: 0...9)
                        isPress = false
                        count = 0
                        num = 0
                    }label: {
                        Text("Restart")
                            .frame(width: 100, height: 25)
                            .padding()
                            .font(.title2)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(20)
                    }//Button 2
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
