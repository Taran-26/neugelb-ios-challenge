//
//  ErrorView.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import SwiftUI

struct ErrorView: View {
  
  let message: String
  let onRetry: () -> Void
  
  var body: some View {
    
    VStack(spacing: 12) {
      
      Image(systemName: "exclamationmark.triangle")
        .font(.system(size: 40))
        .foregroundStyle(.orange)
      
      Text("Something went wrong")
        .font(.headline)
      
      Text(message)
        .font(.subheadline)
        .foregroundStyle(.secondary)
        .multilineTextAlignment(.center)
      
      Button(action: onRetry) {
        Text("Retry")
          .font(.subheadline.bold())
          .padding(.horizontal, 16)
          .padding(.vertical, 8)
          .background(Color.blue)
          .foregroundStyle(.white)
          .clipShape(Capsule())
      }
    }
    .padding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}
