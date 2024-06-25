//
//  Home.swift
//  Sustainify
//
//  Created by Ravia Bhullar on 6/24/24.
//

import SwiftUI

struct Home: View {
    
    let facts=["Diets high in meat and dairy products are typically more resource-intensive and have a larger environmental footprint than plant-based diets.",
    "40% of all food in the United States is wasted/each year, 1.6 billion tons of food, worth $1.2 trillion, are lost or wasted.",
    "78% of marine mammals are at risk of choking on plastic.",
    "We Can Get Energy From The Ocean.",
    "Recycling even just one aluminum can saves enough energy to power a television for three hours as it can be recycled indefinitely without losing its quality",
    "Our landfills are full of textile waste but clothing and textiles are almost 100% recyclable.",
    "The clothing industry is the second largest polluter of clean water after agriculture.",
    "LED light bulbs use at least 75% less energy and last 25 times longer than incandescent lighting",
    "Around 20% of industrial wastewater pollution worldwide originates from the fashion industry",
     "Greenhouse gas emissions from transportation account for about 28% of total U.S. greenhouse gas emissions/largest contributor of U.S. GHG emission"]

   

    @State  private var fact = "Fact Will Appear Here..."

    var body: some View {
        
            NavigationStack {
                VStack(spacing: 20.0){
                    Image("title")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)

                    
                    ZStack{
                        
                        Color(.sRGB, red: 0.827, green: 0.824, blue: 0.827)
                            .ignoresSafeArea()
                            .cornerRadius(10.0)
                            .padding()
                        
                        
                       
                        Text(fact)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 300.0, height: 200.0)
                    }
                Button("Generate Random Fact") {
                    fact=facts[ Int.random(in: 0..<10)]
                    
                }
                . buttonStyle(.borderedProminent)
                .tint(Color(.sRGB, red: 0.2039, green: 0.3059, blue: 0.2549))

                NavigationLink(destination: Suggestions()) {
                    Text("Sustainify Suggestions")
                    
                }
                . buttonStyle(.borderedProminent)
                .tint(Color(.sRGB, red: 0.2039, green: 0.3059, blue: 0.2549))

                    NavigationLink(destination: Calendar()) {
                        Text("Enviromental Calendar")
                    }

                . buttonStyle(.borderedProminent)
                .tint(Color(.sRGB, red: 0.2039, green: 0.3059, blue: 0.2549))
            }
        }
           }
}

#Preview {
    Home()
}
