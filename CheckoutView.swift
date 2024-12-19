//
//  CheckoutView.swift
//  Cakeation
//
//  Created by Priyankshu Sheet on 13/12/24.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var cart: CartManager
    @StateObject private var locationManager = LocationManager()
    @State private var manualAddress: String = ""

    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                // Header
                Text("Checkout")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.vertical)

                // Content
                ScrollView {
                    VStack(spacing: 16) {
                        // Cart Items Section
                        CartItemsView(cartItems: cart.cartItems, onRemove: cart.removeFromCart)
                        // Address Section
                        AddressSectionView(manualAddress: $manualAddress, location: locationManager)
                    }
                    .padding(.bottom, 80) // To prevent content behind bottom bar
                }

                // Bottom Total and Button
                BottomBarView(totalPrice: cart.totalPrice) {
                    // Place Order Action
                    print("Order Placed")
                }
            }
        }
    }
}

// MARK: - Subviews

// Cart Items View
struct CartItemsView: View {
    let cartItems: [CartItem]
    let onRemove: (CartItem) -> Void

    var body: some View {
        VStack(spacing: 8) {
            ForEach(cartItems) { item in
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(item.name)
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("₹\(item.price, specifier: "%.2f") x \(item.quantity)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text("₹\(item.total, specifier: "%.2f")")
                        .font(.headline)
                        .foregroundColor(.black)

                    Button(action: {
                        onRemove(item) // Remove item from cart
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                            .padding(.leading, 8)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.gray.opacity(0.3), radius: 4, x: 0, y: 2)
                .padding(.horizontal)
            }
        }
    }
}

// Address Section View
struct AddressSectionView: View {
    @Binding var manualAddress: String
    var location: LocationManager

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Delivery Address")
                .font(.headline)
                .foregroundColor(.white)

            TextField("Enter Address", text: $manualAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            HStack {
                Image(systemName: "location.fill")
                    .foregroundColor(.white)
                Text("Current Location: \(location.currentAddress)")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
    }
}

// Bottom Bar View
struct BottomBarView: View {
    let totalPrice: Double
    let onPlaceOrder: () -> Void
    
    var body: some View {
        VStack(spacing: 12) {
            Divider()
            HStack {
                Text("Total")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Text("₹\(totalPrice, specifier: "%.2f")")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            
            Button(action: onPlaceOrder) {
                Text("Place Order")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
            }
        }
        .background(Color.white.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.top, 8)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    CheckoutView()
        .environmentObject(CartManager()) // Pass environment object for preview
}
