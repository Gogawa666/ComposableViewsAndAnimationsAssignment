//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI

struct CustomComposableView: View {
    
    @State private var phrase: String = ""
    
    var message: String
    
    @State private var scaleFactor: CGFloat = 1.0
    
    @State private var opacityText = 0.0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        Text("\(message)")
            .font(Font.custom("Chalkduster", size: 24.0, relativeTo: .largeTitle))
            .opacity(opacityText)       // Applies only to views above
            .foregroundColor(.white)
            .padding()
            .background(Color.red)
            .cornerRadius(25.0)
            .onReceive(timer) { input in
        withAnimation(Animation.easeIn(duration: 0.5).delay(2.0)) {
            opacityText = 1.0
            withAnimation(Animation.interpolatingSpring(mass: 0.75, stiffness: 0.9, damping: 0.75, initialVelocity: 8).delay(10.0)) {
                scaleFactor = 1.25
            }
            
            timer.upstream.connect().cancel()
        }
        
    }
}
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView(message: "Super!")
    }
}
