import SwiftUI
import Combine


struct CartItem: Identifiable {
    let id = UUID()
    let name: String
    var quantity: Int
    let price: Double


    var total: Double {
        price * Double(quantity)
    }
}


class CartManager: ObservableObject {
    @Published var cartItems: [CartItem] = []

    // Add item to cart
    func addToCart(name: String, price: Double) {
        if let index = cartItems.firstIndex(where: { $0.name == name }) {

            cartItems[index].quantity += 1
        } else {

            let newItem = CartItem(name: name, quantity: 1, price: price)
            cartItems.append(newItem)
        }
    }


    func removeFromCart(item: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            cartItems.remove(at: index)
        }
    }


    func updateQuantity(item: CartItem, newQuantity: Int) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            cartItems[index].quantity = max(newQuantity, 0)
            if newQuantity == 0 {
                cartItems.remove(at: index) 
            }
        }
    }


    var totalPrice: Double {
        cartItems.reduce(0) { $0 + $1.total }
    }


    var isCartEmpty: Bool {
        cartItems.isEmpty
    }
}
