//
//  RedVelvetCupcakeView.swift
//  Cakeation
//
//  Created by Priyankshu Sheet on 13/12/24.
//

import SwiftUI

struct RedVelvetCupcakeView: View {
    @State private var quantity = 1
    @State private var selectedTopping: String = ""
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.red, Color.pink]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 20) {
                Image("red_velvet") // Replace with your asset name
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .cornerRadius(20)
                    .shadow(radius: 10)

                Text("RED VELVET")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("A rich and moist red velvet cupcake with cream cheese frosting.")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.bottom, 10)

                HStack {
                    Text("Amount")
                        .font(.headline)
                        .foregroundColor(.white)

                    Spacer()

                    Button(action: { if quantity > 1 { quantity -= 1 } }) {
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

                HStack {
                    Spacer()
                    Text("₹120")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }

                Text("Topping")
                    .font(.headline)
                    .foregroundColor(.white)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(["Cream Cheese", "Berries", "Sprinkles"], id: \.self) { topping in
                            Button(action: { selectedTopping = topping }) {
                                Text(topping)
                                    .font(.caption)
                                    .padding()
                                    .frame(width: 100, height: 40)
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

                VStack(spacing: 10) {
                    Button(action: { /* Add your action here */ }) {
                        Text("BUY NOW")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    Button(action: { cartManager.addToCart(name: "Chocolate Cupcake", price: 120)}) {
                        Text("ADD TO CART")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
    }
}

struct RedVelvetCupcakeView_Previews: PreviewProvider {
    static var previews: some View {
        RedVelvetCupcakeView()
            .environmentObject(CartManager())

    }
}


#Preview {
    RedVelvetCupcakeView()
}
