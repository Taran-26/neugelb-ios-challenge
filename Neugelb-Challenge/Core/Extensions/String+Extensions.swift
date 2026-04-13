//
//  String+Extensions.swift
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 13/04/26.
//

import Foundation

extension String {
  var isBlank: Bool {
    trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
  }
  
  func toFormattedDate() -> String {
    let input = DateFormatter.cachedInput
    let output = DateFormatter.cachedOutput
    
    guard let date = input.date(from: self) else { return "—" }
    return output.string(from: date)
  }
}
