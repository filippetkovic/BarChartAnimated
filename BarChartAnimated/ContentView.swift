//
//  ContentView.swift
//  BarChartAnimated
//
//  Created by Filip Petkovic on 10/10/19.
//  Copyright © 2019 Filip Petkovic. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var pickerSelectedItem = 0
    @State var dataPoints: [[CGFloat]] = [
        [50, 100, 150, 54, 67, 21, 90],
        [150, 100, 50, 11, 22, 58, 54],
        [10, 20, 30, 10, 12, 18, 10]
    ]
    
    var body: some View {
        ZStack {
            
            Color("appBackground").edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Calory Intake").font(.system(size: 34)).fontWeight(.heavy).foregroundColor(Color("title"))
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal, 24)
                
                HStack {
                    BarView(value: dataPoints[pickerSelectedItem][0])
                    BarView(value: dataPoints[pickerSelectedItem][1])
                    BarView(value: dataPoints[pickerSelectedItem][2])
                    BarView(value: dataPoints[pickerSelectedItem][0])
                    BarView(value: dataPoints[pickerSelectedItem][1])
                    BarView(value: dataPoints[pickerSelectedItem][2])
                    BarView(value: dataPoints[pickerSelectedItem][2])
                }.padding(.top, 12).animation(.default)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BarView: View {
    
    var value: CGFloat
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                Capsule().frame(width: 30, height: 200).foregroundColor(Color(#colorLiteral(red: 0.3590369821, green: 0.8053343296, blue: 0.7036101222, alpha: 1)))
                Capsule().frame(width: 30, height: value).foregroundColor(.white)
            }
            Text("D").padding(.top, 8)
        }
    }
}
