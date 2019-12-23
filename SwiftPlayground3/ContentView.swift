//
//  ContentView.swift
//  SwiftPlayground3
//
//  Created by ramil on 23.12.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI
import CoreMotion
import Foundation

struct ContentView: View {
    let manager = CMMotionManager()
    
    var body: some View {
        VStack {
            Text("Rotate Me")
        }.onAppear() {
            self.repeatEvery(0.5) {
                guard let acceleration = self.manager.accelerometerData?.acceleration else { return }
                print(acceleration.x)
                print(acceleration.y)
                print(acceleration.z)
            }
        }
    }
    
    func doIt() {
        manager.startAccelerometerUpdates()
        sleep(1)
        print(manager.accelerometerData?.acceleration.x)
    }
    
    func repeatEvery(_ seconds: TimeInterval, _ work: @escaping () -> ()) {
        work()
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.repeatEvery(seconds, work)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
