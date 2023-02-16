//
//  NetworkManager.swift
//  AppcentProje
//
//  Created by BZ on 27.01.2023.
//

import Foundation
import Network

class NetworkManager: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkManager")
    @Published var isConnected = false
    
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
           
        }
        monitor.start(queue: queue)
    }
}
