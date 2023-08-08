//
//  CoinRow.swift
//  coinsApp
//
//  Created by Ecc on 08.08.23.
//

import SwiftUI

struct CoinRowView: View {
    let coin: Coin
    var body: some View {
        HStack{
            Text("\(coin.marketCapRank)")
                .font(.caption)
                .foregroundColor(.gray)
            
            AsyncImage(url: coin.imageUrl){image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.orange)
            }placeholder: {
                Circle()
                    .frame(width: 32, height: 32)
                    .background(Color(.systemGray5))
            }
            
            VStack(alignment: .leading, spacing: 4){
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading,4)
                
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading,6)
            }
            .padding(.leading,2)
            Spacer()
            
            VStack(alignment: .trailing,spacing: 4) {
                Text("\(coin.currentPrice)")
                    .font(.subheadline)
            }
            

        }
    }
}

struct CoinRow_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: Coin.sample)
    }
}
