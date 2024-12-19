//
//  SignUpView.swift
//  Cakeation
//
//  Created by Priyankshu Sheet on 16/12/24.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Background Color
                Color.yellow
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    // Pizza Image
                    Image("graphic") // Replace with the actual image asset name
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .shadow(radius: 10)
                    
                    Spacer()
                    
                    // Title Text
                    Text("Bringing happiness with delicious food is our goal. 😋")
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .padding(.horizontal, 30)
                    
                    Spacer()
                    
                    // Bottom Buttons
                    HStack {
                        // Skip Button
                        NavigationLink(destination: ContentView()){
                            Text("Skip")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(maxWidth: 80)
                                .frame(height: 50)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.yellow.opacity(0.3))
                                        .stroke(Color.black, lineWidth: 1)
                                )
                        }
                        
                        // Start Button
                        Button(action: {
                            // Start with email or phone action
                        }) {
                            Text("Start with email or phone")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(Color.black)
                                .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer()
                        .frame(height: 20)
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}


#Preview {
    SignUpView()
}
