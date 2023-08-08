//
//  ContentView.swift
//  coinsApp
//
//  Created by Ecc on 08.08.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @State private var showAlert = false
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.coins){coin in
                    CoinRowView(coin: coin)
                        .onAppear{
                            if coin.id == viewModel.coins.last?.id{
                                viewModel.loadData()
                            }
                        }
                }
            }
            .refreshable {
                viewModel.handleRefresh()
            }
            .onReceive(viewModel.$error, perform: { error in
                if error != nil {
                    showAlert.toggle()
                }
            })
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Error"),message: Text(viewModel.error?.localizedDescription ?? "")

                )
            })
            .navigationTitle("Coins")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
