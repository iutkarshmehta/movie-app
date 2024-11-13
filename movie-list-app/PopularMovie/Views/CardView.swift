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
        ZStack(alignment: .bottom) {
            imageView
            VStack(alignment: .leading, spacing: 4) {
                titleView
                RatingView(rating: movie.rating, fromMovieDetail: false)
                movieOverviewView
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
    
    @ViewBuilder var imageView: some View {
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
    }
    
    @ViewBuilder var titleView: some View {
        Text(movie.originalTitle)
            .font(.system(size: 14, weight: .bold))
            .foregroundStyle(Color.white)
            .multilineTextAlignment(.leading)
        Text(movie.releaseDate)
            .font(.system(size: 14, weight: .bold))
            .foregroundStyle(Color.white)
            .multilineTextAlignment(.leading)
    }
    
    @ViewBuilder var movieOverviewView: some View {
        Text(movie.overview)
            .lineLimit(3)
            .truncationMode(.tail)
            .font(.system(size: 12))
            .foregroundStyle(Color.gray)
            .multilineTextAlignment(.leading)
    }
}

#Preview {
    CardView(
        movie: PopularMovie(
            originalTitle: "The Batman",
            overview: "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.",
            voteAverage: 1.2,
            posterPath: "/z6t3v6G9Rb1bK7G9v5l8qZj2jya.jpg",
            releaseDate: "2022-03-02",
            backDropPath: "7.9",
            id: 121
        )
    )
}
