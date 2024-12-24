//
//  LoginVIew.swift
//  Cakeation
//
//  Created by Priyankshu Sheet on 16/12/24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            // Background Color
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                

                HStack {
                    Button(action: {

                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                    }
                    .padding(.leading, 20)
                    Spacer()
                }
                

                Text("Let’s get started\nsaving food!")
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                

                Image("onboard")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .shadow(radius: 10)
                    .padding(.top, 20)
                
                Spacer()
                

                VStack(spacing: 15) {

                    Button(action: {

                    }) {
                        HStack {
                            Image(systemName: "applelogo")
                                .foregroundColor(.white)
                            Text("Continue with Apple")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.black)
                        .cornerRadius(10)
                    }
                    

                    Button(action: {

                    }) {
                        HStack {
                            Image(systemName: "f.circle.fill")
                                .foregroundColor(.white)
                            Text("Continue with Facebook")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.red)
                        .cornerRadius(10)
                    }
                    

                    Button(action: {

                    }) {
                        HStack {
                            Image(systemName: "envelope.fill")
                                .foregroundColor(.white)
                            Text("Continue with Email")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 20)
                

                Text("Other")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .padding(.top, 10)
                    .padding(.bottom, 30)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
