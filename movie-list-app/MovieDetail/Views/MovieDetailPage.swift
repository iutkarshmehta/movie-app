//
//  MovieDetailPage.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 28/10/24.
//

import SwiftUI

enum MovieType: String, CaseIterable {
    case adventure = "Adventure"
    case fantasy = "Fantasy"
    case comedy = "Comedy"
    case horror = "Horror"
    case drama = "Drama"
}

struct MovieDetailPage: View {
    let movieTypes: [MovieType] = MovieType.allCases
    @Environment(\.presentationMode)
    var presentationMode
    @State var movie: PopularMovie
    
    var body: some View {
        
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        imageView
                        VStack(alignment: .leading, spacing: 20) {
                            movieTitleView
                            RatingView(
                                rating: movie.rating,
                                fromMovieDetail: true
                            )
                            .padding(.bottom, 12)
                            buttonScrollView
                            movieOverviewView
                        }
                        .padding([.leading, .trailing], 16)
                    }
                    .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                }
                .background(Color.black)
            }
        }
    }
    
    @ViewBuilder var movieTitleView: some View {
         Text("\(movie.originalTitle) ( \(movie.year) )" )
            .font(.system(size: 26, weight: .bold))
            .foregroundStyle(.white)
    }
    
    @ViewBuilder var movieOverviewView: some View {
        Text("Storyline")
            .font(.system(size: 26))
            .foregroundStyle(.white)
        Text(movie.overview)
            .font(.system(size: 20))
            .foregroundStyle(.white)
    }
    
    @ViewBuilder var imageView: some View {
        ZStack(alignment: .topLeading) {
            AsyncImage(url: movie.backDropURL) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
                    .frame(alignment: .center)
            }
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(Color.white)
                        .ignoresSafeArea()
                })
                Spacer()
                Button(action: {
                }, label: {
                    Image(systemName: "bookmark.fill")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(Color.white)
                        .ignoresSafeArea()
                })
            }
            .padding([.top], 15)
            .padding(.leading, 16)
            .padding(.trailing, 16)
        }
    }
    
    @ViewBuilder var buttonScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top) {
                ForEach(movieTypes, id: \.self) {type in
                    MovieStatusButton(
                        buttonTitle: type.rawValue,
                        isButttonClicked: false
                    )
                }
            }
        }
    }
}

#Preview {
    MovieDetailPage(
        movie: PopularMovie(
            originalTitle: "The Batman",
            overview: "",
            voteAverage: 1.2,
            posterPath: "",
            releaseDate: "",
            id: 121
        )
    )
}
