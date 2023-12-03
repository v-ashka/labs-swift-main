//
//  CardView.swift
//  lab3
//
//  Created by vashka on 16/10/2023.
//

import Foundation
import SwiftUI


struct ButtonTheme: View {
//    @State changeTheme: Bool = false
    let colors =  [".blue", ".red", ".orange"]
    var iconImage: String
    var iconText: String
    var btnColor: Color
    
    var body: some View{
            VStack{
                Label(iconText, systemImage: iconImage).font(.title)
                Label(iconText, systemImage: iconImage).font(.title3)
            }.foregroundColor(btnColor)
    }
}

struct ButtonTheme_Previews: PreviewProvider {
    static var previews: some View{
        ButtonTheme(iconImage: "smiley", iconText: "Motyw 1", btnColor: .blue)
    }
}
