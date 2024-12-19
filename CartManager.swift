import SwiftUI
import Combine

// MARK: - Model for Cart Items
struct CartItem: Identifiable {
    let id = UUID()
    let name: String
    var quantity: Int
    let price: Double

    // Computed property for item total
    var total: Double {
        price * Double(quantity)
    }
}

// MARK: - Cart Manager for Global State
class CartManager: ObservableObject {
    @Published var cartItems: [CartItem] = []

    // Add item to cart
    func addToCart(name: String, price: Double) {
        if let index = cartItems.firstIndex(where: { $0.name == name }) {
            // Update quantity if the item already exists
            cartItems[index].quantity += 1
        } else {
            // Add new item to the cart
            let newItem = CartItem(name: name, quantity: 1, price: price)
            cartItems.append(newItem)
        }
    }

    // Remove item from cart
    func removeFromCart(item: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            cartItems.remove(at: index)
        }
    }

    // Update quantity of an item
    func updateQuantity(item: CartItem, newQuantity: Int) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            cartItems[index].quantity = max(newQuantity, 0) // Prevent negative quantities
            if newQuantity == 0 {
                cartItems.remove(at: index) // Remove item if quantity is zero
            }
        }
    }

    // Total price of all items in the cart
    var totalPrice: Double {
        cartItems.reduce(0) { $0 + $1.total }
    }

    // Check if the cart is empty
    var isCartEmpty: Bool {
        cartItems.isEmpty
    }
}
