//
//  Flower.swift
//  Drawing
//
//  Created by Siddharth Tarpada on 08/05/20.
//  Copyright © 2020 Siddharth Tarpada. All rights reserved.
//

import SwiftUI
struct FlowerShape: Shape {
    var petalOffset: Double = -20
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 8) {
            let rotation = CGAffineTransform(rotationAngle: number)
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y: 0, width: CGFloat(petalWidth), height: rect.width / 2))
            let rotatedPetal = originalPetal.applying(position)
            
            path.addPath(rotatedPetal)
            
        }
        return path
    }
}

struct Flower: View {
    @State private var petalOffset: Double = -20
    @State private var petalWidth: Double = 100.0
    
    var body: some View {
        NavigationView {
                VStack {
                    FlowerShape(petalOffset: petalOffset, petalWidth: petalWidth)
                        .fill(Color.red, style: FillStyle(eoFill: true))
//                        .stroke(Color.black, lineWidth: 1)

                    
                    Text("OffSet")
                    Slider(value: $petalOffset, in: -40...40)
                        .padding([.horizontal, .bottom])
                    
                    Text("Width")
                    Slider(value: $petalWidth, in: 0...100)
                        .padding(.horizontal)
                }
        }
        .navigationBarTitle("Flower Animation", displayMode: .inline)
        
        
    }
}

struct Flower_Previews: PreviewProvider {
    static var previews: some View {
        Flower()
    }
}
