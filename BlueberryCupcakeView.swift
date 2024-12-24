//
//  BlueberryCupcakeView.swift
//  Cakeation
//
//  Created by Priyankshu Sheet on 13/12/24.
//

import SwiftUI

struct BlueberryCupcakeView: View {
    @State private var quantity = 3
    @State private var selectedTopping: String = "Cookies"
    @EnvironmentObject var cartManager: CartManager

    let toppings = ["Cookies", "Strawberries", "Cherry", "Waffle"]

    var body: some View {
            ZStack {
                // Background Gradient
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.4), Color.purple.opacity(0.6)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)

                VStack(alignment: .leading, spacing: 20) {
                    // Cupcake Image
                    Image("blueberry") 
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .cornerRadius(20)
                        .shadow(radius: 10)

                    // Cupcake Title
                    Text("BLUEBERRY")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 10)

                    // Description
                    Text("Savor the luscious burst of blueberries in every bite!")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.bottom, 10)

                    HStack {
                        Text("Amount")
                            .font(.headline)
                            .foregroundColor(.white)

                        Spacer()

                        Button(action: {
                            if quantity > 1 { quantity -= 1 }
                        }) {
                            Image(systemName: "minus.circle")
                                .font(.title2)
                                .foregroundColor(.white)
                        }

                        Text("\(quantity)")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        Button(action: { quantity += 1 }) {
                            Image(systemName: "plus.circle")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                    }

                    // Price
                    HStack {
                        Spacer()
                        Text("₹70")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }

                    // Toppings
                    Text("Topping")
                        .font(.headline)
                        .foregroundColor(.white)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(toppings, id: \.self) { topping in
                                Button(action: {
                                    selectedTopping = topping
                                }) {
                                    Text(topping)
                                        .font(.caption)
                                        .padding()
                                        .frame(width: 80, height: 40)
                                        .background(
                                            selectedTopping == topping ? Color.white : Color.clear
                                        )
                                        .foregroundColor(selectedTopping == topping ? .black : .white)
                                        .clipShape(Capsule())
                                        .overlay(
                                            Capsule()
                                                .stroke(Color.white, lineWidth: 1)
                                        )
                                }
                            }
                        }
                    }

                    // Order Button
                    Button(action: {
                        print("Order placed for Blueberry Cupcake!")
                    }) {
                        Text("ORDER NOW")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.purple)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    Button(action: {
                        cartManager.addToCart(name: "Blueberry Cupcake", price: 70)
                    }) {
                        Text("ADD TO CART")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        .navigationBarTitle("Blueberry", displayMode: .inline)
    }
}

struct BlueberryCupcakeView_Previews: PreviewProvider {
    static var previews: some View {
        BlueberryCupcakeView()
            .environmentObject(CartManager())

    }
}


#Preview {
    BlueberryCupcakeView()
}
