//
//  SheetView.swift
//  agePickBottomsheet
//
//  Created by ROHIT DAS on 23/04/24.
//

import SwiftUI

struct SheetView: View {
    @Binding var isSheetPresented: Bool
    @State private var selectedMinAge = 25
    @State private var selectedMaxAge = 35 // Initial max age selection
    
    // Closure to pass back selected age values
        var onDone: ((Int, Int)) -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Age Group")
                    .font(.title)
                    .bold()
                    .padding()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Min Age")
                        Picker("Min Age", selection: $selectedMinAge) {
                            ForEach(20 ..< 71) { age in
                                Text("\(age) years")
                                    .tag(age)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 100)
                    }
                    .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Max Age")
                        Picker("Max Age", selection: $selectedMaxAge) {
                            ForEach(selectedMinAge ..< 71) { age in
                                Text("\(age) years")
                                    .tag(age)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 100)
                    }
                    .padding()
                }
                
                Spacer()
            }
            .navigationBarItems(trailing: Button("Done") {
                isSheetPresented.toggle()
                onDone((selectedMinAge, selectedMaxAge))
            })
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
