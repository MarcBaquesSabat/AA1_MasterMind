//
//  StartView.swift
//  MasterMind
//
//  Created by Alumne on 18/3/21.
//

import SwiftUI

struct StartView: View {
    
    @ObservedObject var viewModel:ViewModel
    
    var body: some View {
        VStack{
            Text("MasterMind").font(.title)
                .padding()
                .background(Color.black)
                .border(Color.white, width: 4)
                .clipShape(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/))
                .foregroundColor(.white)
                
            Button("START",action: { viewModel.Start()})
                .font(.system(size: 20))
                .foregroundColor(.white)
                .padding(10)
                .background(Color.black)
                .border(Color.white, width: 4)
                .clipShape(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/))
        }.background(
            Image("StartingBG")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(viewModel: ViewModel())
    }
}
