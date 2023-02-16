//
//  LaunchSvreen.swift
//  AppcentProje
//
//  Created by BZ on 10.02.2023.
//

import SwiftUI

struct LaunchScreenView: View {

    @State  var isActive = false
    @State  var size = 0.8
    @State  var opacity = 0.5
    var body: some View {
        if isActive{
            MainView()
        }else{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                VStack{
                    VStack{
                        Image("appcentlogo")
                            .resizable().aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                        Text("Appcent NEWS")
                            .font(.title)
                            .foregroundColor(.white.opacity((0.80)))
                        
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}

