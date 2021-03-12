//
//  ContentView.swift
//  ThinksSchool2
//
//  Created by HoangCuong on 12/03/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var size: CGFloat = 0.95
    
    var repeatingCloudBounce: Animation {
        Animation
            .easeOut(duration: 0.5)
            .repeatForever()
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(#colorLiteral(red: 0.9777191281, green: 0.7951946259, blue: 0.1993733943, alpha: 1))
            Image("logo")
                .resizable()
                .frame(width: 120, height: 120)
                .padding(.top, 77)
            HStack {
                Spacer()
                Image("cloud1")
                    .resizable()
                    .frame(width: 94, height: 59)
                    .padding(.top, 67)
                    .scaleEffect(y: size, anchor: .center)
                    .onAppear(perform: {
                        withAnimation(self.repeatingCloudBounce) { self.size = 1 }
                    })
            }
            HStack {
                Image("cloud2")
                    .resizable()
                    .frame(width: 101, height: 72)
                    .padding(.top, 117)
                    .scaleEffect(y: size, anchor: .center)
                    .onAppear(perform: {
                        withAnimation(self.repeatingCloudBounce) { self.size = 1 }
                    })
                Spacer()
            }
            HStack {
                Spacer()
                Image("cloud3")
                    .resizable()
                    .frame(width: 99, height: 40)
                    .padding(.top, 199)
                    .scaleEffect(y: size, anchor: .center)
                    .onAppear(perform: {
                        withAnimation(self.repeatingCloudBounce) { self.size = 1 }
                    })
                Spacer()
                    .frame(width: 40)
            }
            
        }.edgesIgnoringSafeArea(.all)
    }
}
