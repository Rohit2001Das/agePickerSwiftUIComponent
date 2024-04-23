//
//  ContentView.swift
//  agePickBottomsheet
//
//  Created by ROHIT DAS on 23/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isSheetPresented = false
    @State private var searchAge = ""
    var body: some View {
        VStack {
           Text("Lets find the one for you..")
                .font(.largeTitle)
                .fontWeight(.bold)
                .maxLeft
            
           
                Text("Age Group : 25 -35 years")
                    .font(.title2)
                    .maxLeft
                    .padding()
                
            TextField("Enter age range", text: $searchAge)
                           .font(.title2)
                           .tint(.gray)
                           .padding()
                           .onTapGesture {
                               isSheetPresented.toggle()
                           }
            
            .sheet(isPresented: $isSheetPresented){
                SheetView(isSheetPresented: $isSheetPresented){ (minAge, maxAge) in
                    
                    searchAge = "\(minAge) - \(maxAge) years"
        
                    
                }
                    .presentationDetents([.medium])
                
            }
            
        }
        .padding()
        Spacer()
        
    }
}


#Preview {
    ContentView()
}
