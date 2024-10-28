//
//  card-view.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 24/10/24.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack (alignment: .bottom){
            Image("movieimage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150)
                .cornerRadius(8)
                .clipped()
            VStack(alignment: .leading,spacing: 4){
                Text("Pushpa: the Rise Part 1")
                    .font(.system(size: 14,weight: .bold))
                    .foregroundStyle(Color.white)
                Text("(2021)")
                    .font(.system(size: 14,weight: .bold))
                    .foregroundStyle(Color.white)
                RatingView(rating: 3.8, fromMovieDetail: false)
                Text("A labourer rises through the ranks of a red sandalwood smuggling syndicate, making some powerful enemies in the process.")
                    .lineLimit(3)
                    .truncationMode(.tail)
                    .font(.system(size: 12))
                    .foregroundStyle(Color.gray)
            }
            .padding(.all,10)
            .frame(minWidth:150,alignment: .leading)
            .background(Color.black.opacity(0.9))
                        
        }
        .background(Color.blue)
        .cornerRadius(15)
        .frame(width: 150,height: 200)
        .shadow(radius: 8)
    }
}


#Preview {
    CardView()
}
