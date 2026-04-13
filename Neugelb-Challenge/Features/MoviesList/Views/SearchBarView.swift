//
//  SearchBarView.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import SwiftUI

struct SearchBarView: View {
  
  @Binding var text: String
  var onChange: (String) -> Void
  
  var body: some View {
    HStack(spacing: 8) {
      
      Image(systemName: "magnifyingglass")
        .foregroundStyle(.secondary)
      
      TextField("Search movies...", text: $text)
        .textFieldStyle(.plain)
        .onChange(of: text) { _, newValue in
          onChange(newValue)
        }
      
      if !text.isEmpty {
        Button {
          text = ""
          onChange("")
        } label: {
          Image(systemName: "xmark.circle.fill")
            .foregroundStyle(.secondary)
        }
        .buttonStyle(.plain)
      }
    }
    .padding(10)
    .background(Color.gray.opacity(0.1))
    .clipShape(RoundedRectangle(cornerRadius: 10))
  }
}
