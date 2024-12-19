import SwiftUI

struct ButterscotchCupcakeView: View {
    @State private var quantity = 1
    @State private var selectedTopping: String = ""
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.yellow, Color.orange]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 20) {
                Image("butterscotch") // Replace with your asset name
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .cornerRadius(20)
                    .shadow(radius: 10)

                Text("BUTTERSCOTCH")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("A delicious butterscotch cupcake with caramel frosting.")
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
                    Text("₹70")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }

                Text("Topping")
                    .font(.headline)
                    .foregroundColor(.white)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(["Caramel", "Nuts", "Cream", "Nutella"], id: \.self) { topping in
                            Button(action: { selectedTopping = topping }) {
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

                VStack(spacing: 10) {
                    Button(action: { /* Add your action here */ }) {
                        Text("ORDER NOW")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)

                    }

                    Button(action: { cartManager.addToCart(name: "Butterscotch Cupcake", price: 70)}) {
                        Text("ADD TO CART")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .shadow(radius: 5)

                    }
                }
            }
            .padding()
        }
    }
}

struct ButterscotchCupcakeView_Previews: PreviewProvider {
    static var previews: some View {
        ButterscotchCupcakeView()
            .environmentObject(CartManager())

    }
}

#Preview {
    ButterscotchCupcakeView()
}
