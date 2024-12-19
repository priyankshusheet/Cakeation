import SwiftUI

struct ContentView: View {
    @State private var currentIndex: Int = 0
    @State private var rotation: Double = 0
    let images = ["assorted_box", "assorted_box_1", "assorted_box_2"]

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.yellow, Color.orange.opacity(0.7)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)

                VStack {
                    // Carousel of Images with Dots for Navigation
                    TabView(selection: $currentIndex) {
                        ForEach(0..<images.count, id: \.self) { index in
                            Image(images[index])
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                                .padding(.bottom, 10)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .frame(height: 200)
                    .onAppear {
                        startRotating()
                    }

                    Text("Assorted Box")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top, 10)

                    // Flavors Grid
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                            NavigationLink(destination: ChocolateCupcakeView()) {
                                FlavorCard(imageName: "chocolate", flavorName: "Chocolate", backgroundColor: .black)
                            }
                            NavigationLink(destination: StrawberryCupcakeView()) {
                                FlavorCard(imageName: "strawberry", flavorName: "Strawberry", backgroundColor: .red)
                            }
                            NavigationLink(destination: ButterscotchCupcakeView()) {
                                FlavorCard(imageName: "butterscotch", flavorName: "Butterscotch", backgroundColor: .yellow)
                            }
                            NavigationLink(destination: RedVelvetCupcakeView()) {
                                FlavorCard(imageName: "red_velvet", flavorName: "Red Velvet", backgroundColor: .pink)
                            }
                            NavigationLink(destination: CookiesAndCreamCupcakeView()) {
                                FlavorCard(imageName: "cookies_cream", flavorName: "Cookies & Cream", backgroundColor: .gray)
                            }
                            NavigationLink(destination: BlueberryCupcakeView()) {
                                FlavorCard(imageName: "blueberry", flavorName: "Blueberry", backgroundColor: .blue)
                            }
                            NavigationLink(destination: MangoCupcakeView()) {
                                FlavorCard(imageName: "mango", flavorName: "Mango", backgroundColor: .yellow)
                            }
                            NavigationLink(destination: HazelnutCupcakeView()) {
                                FlavorCard(imageName: "hazelnut", flavorName: "Hazelnut", backgroundColor: .brown)
                            }
                            NavigationLink(destination: RaspberryCupcakeView()) {
                                FlavorCard(imageName: "raspberry", flavorName: "Raspberry", backgroundColor: .pink)
                            }
                            NavigationLink(destination: LemonCupcakeView()) {
                                FlavorCard(imageName: "lemon", flavorName: "Lemon", backgroundColor: .yellow)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Cakeations")
        }
    }

    // Function to start rotating and switch images
    func startRotating() {
        // Timer to rotate every 2 seconds
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % images.count // Cycle through images
            }
        }
    }
}

// Reusable Flavor Card Component
struct FlavorCard: View {
    let imageName: String
    let flavorName: String
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            backgroundColor
                .cornerRadius(15)
                .shadow(radius: 5)
            
            VStack {
                Image(imageName) // Replace with your asset names
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .padding(.top, 10)
                
                Spacer()
                
                Text(flavorName)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
            }
        }
        .frame(height: 150)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CartManager())

    }
}
