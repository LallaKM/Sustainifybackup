//
//  ContentView.swift
//  Sustainify
//
//  Created by Ravia Bhullar on 6/24/24.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        
            
            NavigationStack {
                VStack(spacing: 20.0){
                    Image("title")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                    Image("slogan")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                    Image("logo")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    
                    
                    NavigationLink(destination: Home()) {
                        Text("Start")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray)
                    }
                    .navigationBarBackButtonHidden(true)

                    .navigationTitle("Home")
                   // .navigationTitleColor(.gray)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
                    


                    
                }
           
        }
    }
   
}

#Preview {
    ContentView()
}
