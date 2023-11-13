//
//  ThemeButton.swift
//  lab3
//
//  Created by vashka on 13/11/2023.
//

//import Foundation
import SwiftUI

struct ThemeButton: View {
    @ObservedObject var viewModel: MemoGameViewModel
    var imageName: String
    var content: String
    var ownColor: Color
    var emojis: [String]
    var body: some View{
        Button(action: {
            viewModel.changeApplicationTheme(color: ownColor, newEmojis: emojis)
            
        }, label: {
            VStack{
                Image(systemName: imageName).font(.title)
                Text(content)
            }
        })
    }
}
