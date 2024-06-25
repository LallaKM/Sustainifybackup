//
//  Suggestions.swift
//  Sustainify
//
//  Created by Ravia Bhullar on 6/24/24.
//

import SwiftUI

struct Suggestions: View {
    @State private var suggestions = "Sugggestions will appear here..."
    @State  private var topic = ""

    var body: some View {
       
        VStack(spacing: 25.0) {
            
            Text("Suggestions")
                .fontWeight(.heavy)
                .foregroundColor(Color.gray)
                .font(.custom("Verdana",  fixedSize: 30))
            
            
            HStack{
                VStack{
                    
                    Button {
                        suggestions="1. Thrift shopping instead of buying new clothing\n\n2. Donating clothing to clothing drives or businesses such as GoodWill or Plato's Closet\n\n3. Researching fast fashion brands and avoiding them, such as Shien, Zara, or Fashion Nova\n\n4. Don’t give into microtrends and avoid buying excessive clothing\n\n5. Repair and alter your own clothing"
                        topic="Fashion"
                        } label: {
                            Image("fashion")
                        }
                    
                   
                    .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                    .font(.custom("Verdana",  fixedSize: 15))
                    
                    
                }
                
                VStack{
                    Button {
                        suggestions="1. Eating a completely plant-based diet is the optimal diet for the environment\n\n2. Try to grow your own produce\n\n3. Pay Attention to What You Eat.\n\n4. Don’t waste food only take what you are going to eat\n\n5. Using a reusable water bottle as oppose to a plastic water bottle"
                        topic="Diet"
                    } label: {
                        Image( "diet")
                        
                    }
                    
                  
                    .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                    .font(.custom("Verdana",  fixedSize: 15))
                    
                }
                
                VStack{
                    Button {
                        suggestions="1. Opt for public transportation: buses, trains, or subways\n\n2. Carpooling and ridesharing\n\n3. Planning efficient routes\n\n4. Walking and biking\n\n5. Fuel-efficient/hybrid/electrical vehicles\n\n6. Avoid rapid acceleration and heavy braking, maintain a steady speed, and reduce idling time"
                        topic="Transportation"
                        } label: {
                            Image("transportation")
                        }
                    
                    
                   
                    .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                    .font(.custom("Verdana",  fixedSize: 15))
                }
                
                
                
                
                
                
            }
            
            ZStack{
                
                Color(.sRGB, red: 0.827, green: 0.824, blue: 0.827)
                    .ignoresSafeArea()
                    .cornerRadius(10.0)
                
                VStack{
                    Text(topic)
                        .fontWeight(.bold)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                        .font(.custom("Verdana",  fixedSize: 15))
                    Text(suggestions)
                    
                        .padding(.all)
                        .foregroundColor(.gray)
                        .font(.custom("Verdana",  fixedSize: 15))
                }
            }
        }
                
            .padding()
        }
    }


#Preview {
    Suggestions()
}
