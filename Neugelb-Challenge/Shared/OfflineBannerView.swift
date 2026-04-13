//
//  OfflineBannerView.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import SwiftUI

struct OfflineBannerView: View {
  
  let isConnected: Bool
  
  var body: some View {
    if !isConnected {
      HStack {
        Image(systemName: "wifi.slash")
        Text("No Internet Connection")
          .font(.caption)
      }
      .padding(8)
      .frame(maxWidth: .infinity)
      .background(Color.red.opacity(0.9))
      .foregroundStyle(.white)
    }
  }
}
