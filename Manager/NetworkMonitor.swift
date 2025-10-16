//
//  NetworkMonitor.swift
//  Weather App
//
//  Created by Student17 on 09/10/2025.
//

import Foundation
import Network

protocol NetworkMonitorDelegate {
    func didChangeConnectionStatus(isConnected: Bool)
}

class NetworkMonitor {
    private let monitor = NWPathMonitor()
    private var isConnected = false
    var delegate: NetworkMonitorDelegate?
    private let queue = DispatchQueue(label: "Monitor")
    
    init() {
      
        
        
    }
    
    func startMonitoring() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("Connection Works well")
                self.isConnected = true
            } else {
                print("No Internet Connection")
                self.isConnected = false
            }
            self.delegate?.didChangeConnectionStatus(isConnected: self.isConnected)
            
        }
        // Tread - Monitor - to check the internet connection continuosly while the app running
        monitor.start(queue: queue)
    }
    
    deinit {
        monitor.cancel()
    }
    
}

