# Flutter E-Commerce App

A **production-ready e-commerce mobile application** built with **Flutter**, following **Clean Architecture** principles and using **Bloc (Cubit)** for scalable state management.

The app provides a complete shopping experience including authentication, product browsing, cart management, checkout, and PayPal payment integration.

---

## Overview

**For more details go to doc_app file**

This project demonstrates how to build a **scalable, maintainable, and testable Flutter application** using modern best practices:

- Feature-based architecture
- Clean separation of concerns
- Firebase backend integration
- Robust state management
- Reusable UI components

---

## Key Features

### Authentication
- Email & password login
- Google Sign-In
- User registration
- Forgot password
- Firebase Authentication integration

### Products & Home
- Product listing (grid & list)
- Best-selling products
- Offers & featured items
- Product ratings & reviews

### Cart
- Add/remove items
- Update quantities
- Real-time cart updates
- Persistent cart state

### Checkout & Payments
- Multi-step checkout flow:
  - Address
  - Shipping
  - Payment
  - Review
- PayPal payment integration
- Order confirmation & submission

### Onboarding & Splash
- First-time onboarding experience
- Splash screen with routing logic

---

## Architecture

The app follows **Clean Architecture** with **Feature-First Structure**.

lib/
├── core/
│ ├── services/
│ ├── repos/
│ ├── utils/
│ ├── widgets/
│ └── errors/
│
├── features/
│ ├── auth/
│ ├── home/
│ ├── checkout/
│ ├── onboarding/
│ └── splash/
│
└── main.dart


### Layers
- **Presentation:** UI, Cubits, States
- **Domain:** Entities & Repository contracts
- **Data:** Models & Firebase implementations

---

## State Management

- Bloc / Cubit
- BlocBuilder & BlocConsumer
- Centralized error & loading handling
- Predictable and testable states

---

## Backend & Services

- Firebase Authentication
- Cloud Firestore
- SharedPreferences
- PayPal REST API
