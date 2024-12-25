//
//  OnboardingView.swift
//  Cakeation
//
//  Created by Priyankshu Sheet on 16/12/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationView {
            ZStack {

                Color(.systemGreen)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    Image("welcome")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 360)
                        .shadow(radius: 10)
                    
                    
                    Spacer()
                    

                    Text("Our food delivery app brings your favourite dishes to you.")
                        .font(.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)
                    

                    Text("With our user-friendly food delivery app, you will enjoy the ultimate convenience.")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.horizontal, 40)
                        .padding(.top, 10)
                    
                    Spacer()
                    

                    HStack(spacing: 20) {
                        NavigationLink (destination: LoginView()) {
                            Text("Log in")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.white, lineWidth: 2)
                                )
                                .foregroundColor(.white)
                        }
                        
                        NavigationLink (destination: SignUpView()) {
                            Text("Sign up")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.black)
                                .cornerRadius(8)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal, 30)
                    
                    Spacer()
                    

                    HStack(spacing: 5) {
                        Circle().fill(Color.white.opacity(0.5)).frame(width: 8, height: 8)
                        Circle().fill(Color.white.opacity(0.5)).frame(width: 8, height: 8)
                        Circle().fill(Color.white).frame(width: 10, height: 10)
                    }
                    .padding(.bottom, 20)
                }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}


#Preview {
    OnboardingView()
}
