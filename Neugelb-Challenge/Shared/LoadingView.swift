//
//  LoadingView.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import SwiftUI

struct LoadingView: View {
  
  var message: String? = nil
  
  var body: some View {
    VStack(spacing: 12) {
      ProgressView()
      
      if let message {
        Text(message)
          .font(.subheadline)
          .foregroundStyle(.secondary)
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}
