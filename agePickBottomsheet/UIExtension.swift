//
//  UIExtension.swift
//  agePickBottomsheet
//
//  Created by ROHIT DAS on 23/04/24.
//

import SwiftUI

extension CGFloat {
    static var screenWidth: Double {
        return UIScreen.main.bounds.size.width
    }
    static var screenHeight: Double {
        return UIScreen.main.bounds.size.height
    }
    static func widthPar(per: Double) -> Double{
        return screenWidth * per;
    }
    static func heightPer(per: Double) -> Double{
        return screenHeight * per;
    }
    static var topInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.top
        }
        return 0.0
    }
    static var bottomInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.bottom
        }
        return 0.0
    }
    static var horizontalInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.left + keyWindow.safeAreaInsets.right
        }
        return 0.0
    }
    static var verticalInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.top + keyWindow.safeAreaInsets.bottom
        }
        return 0.0
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corner: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corner: corner))
    }
    func endEditing(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    
    
    var navHide: some View {
        return navigationTitle("")
            .navigationBarBackButtonHidden()
            .navigationBarHidden(true)
            .ignoresSafeArea()
    }
    
    var navHideWithout: some View {
        return navigationTitle("")
            .navigationBarBackButtonHidden()
            .navigationBarHidden(true)
    }
    var maxCenter: some View {
        return frame(maxWidth: .infinity,alignment: .center)
    }
    var maxLeft: some View {
        return frame(maxWidth: .infinity,alignment: .leading)
    }
    var maxRight: some View {
        return frame(maxWidth: .infinity,alignment: .trailing)
    }
    var top8: some View{
        return padding(.top, 8)
    }
    var bottom8: some View{
        return padding(.bottom, 8)
    }
    var top15: some View{
        return padding(.top, 15)
    }
    var bottom15: some View{
        return padding(.bottom, 15)
    }
    var vertical8: some View{
        return padding(.vertical, 8)
    }
    var horizontal8: some View{
        return padding(.horizontal, 8)
    }
    var vertical15: some View{
        return padding(.vertical, 15)
    }
    var horizontal15: some View{
        return padding(.horizontal, 15)
    }
    var horizontal20: some View{
        return padding(.horizontal, 15)
    }
    var all15: some View{
        return padding(15)
    }
    var all20: some View{
        return padding(20)
    }
    var topWithSafe: some View{
        return padding(.top, .topInsets + 2)
    }
    var bottomWithSafe: some View{
        return padding(.bottom, .bottomInsets + 8)
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corner: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
