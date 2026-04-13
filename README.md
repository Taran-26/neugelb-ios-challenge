//
//  README.md
//  Neugelb-Challenge
//
//  Created by Taranjeet Kaur on 14/04/26.
//

# 🎬 Neugelb iOS Coding Challenge

## 📱 Overview
This project is a movie browsing application built using **SwiftUI** and **Clean Architecture principles**.
It integrates with The Movie Database (TMDB) API to display movies, search, and view details.

---

## 🚀 Features

### ✅ Required
- Browse latest movies with **infinite scrolling**
- View detailed movie information
- Built entirely with **SwiftUI**

### ⭐ Optional (Implemented)
- Movie search with **debounced input**
- **Auto-complete suggestions**
- Error handling & retry mechanism
- Network connectivity monitoring
- Reusable loading & error views

---

## 🏗 Architecture

The project follows **Clean Architecture + MVVM**:
Presentation (SwiftUI Views + ViewModels)
Domain (UseCases + Models)
Data (Repository + API Layer)
Core (Networking, Utils, Extensions)


### Key Principles:
- Separation of concerns
- Dependency injection
- Testability
- Scalability

---

## 🧩 Tech Stack

- SwiftUI
- Async/Await
- Combine (minimal usage)
- URLSession (networking)
- XCTest (unit testing)

## 🧪 Testing

Unit tests are included for:

- UseCases
- ViewModels
- Pagination logic
- Search functionality
                            
---
                            
## 📌 Notes

- Emphasis was placed on clean, maintainable, and testable code.
                            
