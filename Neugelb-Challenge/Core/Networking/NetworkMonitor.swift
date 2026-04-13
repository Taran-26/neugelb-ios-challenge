//
//  NetworkMonitor.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import Network
import Combine

@MainActor
final class NetworkMonitor: ObservableObject {
  
  static let shared = NetworkMonitor()
  
  private let monitor = NWPathMonitor()
  private let queue = DispatchQueue(label: "NetworkMonitorQueue")
  
  @Published private(set) var isConnected: Bool = true
  @Published private(set) var connectionType: ConnectionType = .unknown
  
  enum ConnectionType {
    case wifi
    case cellular
    case ethernet
    case unknown
  }
  
  private init() {
    monitor.pathUpdateHandler = { [weak self] path in
      DispatchQueue.main.async {
        self?.isConnected = (path.status == .satisfied)
        
        self?.connectionType = {
          if path.usesInterfaceType(.wifi) { return .wifi }
          if path.usesInterfaceType(.cellular) { return .cellular }
          if path.usesInterfaceType(.wiredEthernet) { return .ethernet }
          return .unknown
        }()
      }
    }
    
    monitor.start(queue: queue)
  }
  
  deinit {
    monitor.cancel()
  }
}
