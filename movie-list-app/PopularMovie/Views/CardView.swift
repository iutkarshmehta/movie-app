//
//  card-view.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 24/10/24.
//

import SwiftUI

struct CardView: View {
    @State var movie: PopularMovie
    var body: some View {
        let year = DateTimeHelper().convertToYear(dateString: movie.releaseDate)
            ZStack(alignment: .bottom) {
                AsyncImage(url: movie.posterURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150)
                        .cornerRadius(8)
                        .clipped()
                } placeholder: {
                    ProgressView()
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text(movie.originalTitle)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.leading)
                    Text("(\(year ?? ""))")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.leading)
                    RatingView(rating: movie.voteAverage / 2, fromMovieDetail: false)
                    Text(movie.overview)
                        .lineLimit(3)
                        .truncationMode(.tail)
                        .font(.system(size: 12))
                        .foregroundStyle(Color.gray)
                        .multilineTextAlignment(.leading)
                }
                .padding(.all, 10)
                .frame(minWidth: 150, alignment: .leading)
                .background(Color.black.opacity(0.9))
            }
            .background(Color.blue)
            .cornerRadius(15)
            .frame(width: 150, height: 200)
            .shadow(radius: 8)
        }
}

// #Preview {
//    CardView(cardData: [""])
// }
