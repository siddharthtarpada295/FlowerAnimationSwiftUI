//
//  ContentView.swift
//  Drawing
//
//  Created by Siddharth Tarpada on 08/05/20.
//  Copyright © 2020 Siddharth Tarpada. All rights reserved.
//

import SwiftUI
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}
struct ContentView: View {
    var body: some View {
        NavigationView {
                VStack {
                        Triangle()
                        .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                        .frame(width: 300, height: 300)
                }
            .navigationBarTitle("Triangle", displayMode: .inline)
                .navigationBarItems(trailing: NavigationLink(destination: Flower()) {
                    Text("Next")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
