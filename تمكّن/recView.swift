//
//  recView.swift
//  تمكّن
//
//  Created by shahad khaled on 28/05/1447 AH.
//




//
//  ContentView.swift
//  تمكّن
//
//  Created by shahad khaled on 27/05/1447 AH.
//

import SwiftUI

struct recView: View {
    var body: some View {
        
        ZStack{
            
            VStack(spacing: 50){
                Spacer()
                // Top image positioned to the top-right and partly out of frame
                Image("effect")
                    .alignmentGuide(.leading) { d in d[.trailing] }
                    .offset(x: 150, y: -40)
                
                Spacer()
                Image("effect")
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding()
            VStack(spacing: 60) {
                HStack(spacing: 150){
                    Button("Cancel") {
                        
                    }
                    .buttonStyle(.glass)
                    .padding()
                    Button("add text") {
                        
                    }
                    .buttonStyle(.glass)
                    .padding()
                }
                VStack(alignment: .leading){
                    Text("Hello i'm a student at apple")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    Text("and it's challenge three")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                
                ZStack{
                    Image("Aud1")
                    Image("Aud2")
                    Image("Aud3")
                    Image("Aud4")
                    Image("Aud5")
                    Image("Aud6")
                    Button {
                      
                    } label: {
                        Image("Mic")
                    }
                }
                // Place this ZStack just above the time label with a tight gap
                .offset(x: 0, y: 90)
                .padding(.bottom, 8)
                
                Text("0:12")
                    .offset(x: 0, y: 25)
                ZStack{
                    Text("Take a Breath")
                        .bold()
                        .padding()
                        .frame(minWidth: 350, minHeight: 180, alignment: .topLeading)
                        .glassEffect(.clear, in: .rect(cornerRadius: 35))
                    
                    Button("Skip") {
                        
                    }
                    .buttonStyle(.glass)
                    .offset(x: 120, y: 50)
                }
            }
            .ignoresSafeArea() // allow content to extend beyond the screen edges
        }
    }
}

#Preview {
    recView()
}
