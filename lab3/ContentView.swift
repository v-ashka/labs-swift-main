//
//  ContentView.swift
//  lab3
//
//  Created by vashka on 16/10/2023.
//

import SwiftUI

struct ContentView: View {
//    obserwowanie obiektu, bo moze sie zmienic
    @ObservedObject var viewModel: MemoGameViewModel
    typealias Card = MemoGameModel<String>.Card
    var body: some View {
        VStack{
            ScrollView{
                Text("Memo b").font(.largeTitle)
                cardDisplay(elems: viewModel, minWidthSize: 80).animation(.default, value: viewModel.cards)
            }
            HStack{
                Text("Wynik: \(viewModel.points)").font(.title)
                
                Spacer()
                Button("SHUFFLE"){
                    viewModel.shuffle()
                }.padding()
                .foregroundColor(viewModel.themeColor)
            }
            BtnList
            
            
        }.padding()
        
    }
    
    var BtnList: some View {
        HStack{
            ThemeButton(viewModel: viewModel, imageName: "smiley", content: "Motyw 1", ownColor: .blue, themeNum: 1).foregroundColor(viewModel.themeColor)
            Spacer()
            ThemeButton(viewModel: viewModel, imageName: "smiley", content: "Motyw 2", ownColor: .red,  themeNum: 2).foregroundColor(viewModel.themeColor)
            Spacer()
            ThemeButton(viewModel: viewModel, imageName: "smiley", content: "Motyw 3", ownColor: .green,  themeNum: 3 ).foregroundColor(viewModel.themeColor)
        }
    }
    
    
    func cardDisplay(elems: MemoGameViewModel, minWidthSize: CGFloat) -> some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: minWidthSize ), spacing: 0)], spacing: 0){
            ForEach(elems.cards){
                card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                    .zIndex(scoreChange(causedBy: card) != 0 ? 1 : 0)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 2)){
                            let scoreBeforeChoosing = elems.points
                            elems.choose(card)
                            let scoreChange = elems.points - scoreBeforeChoosing
                            lastScoreChange = (scoreChange, causedByCardId: card.id)
                        }
                    }
            }
        }
        .foregroundColor(viewModel.themeColor)
        
    }
    
    @State private var lastScoreChange: (amount: Int, causedByCardId: Card.ID) = (amount: 0, causedByCardId: "")
    
    private func scoreChange(causedBy card: Card) -> Int {
        let (amount, id) = lastScoreChange
        return card.id == id ? amount : 0
//        return lastScoreChange.1 == card.id ? lastScoreChange.0 : 0
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: MemoGameViewModel.init())
    }
}
