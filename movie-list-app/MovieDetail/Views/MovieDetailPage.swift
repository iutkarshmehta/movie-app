//
//  MovieDetailPage.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 28/10/24.
//

import SwiftUI

struct MovieDetailPage: View {
    var movieType: [String] = ["Adventure", "Fantasy", "Comedy", "Horror", "Drama"]
    @Environment(\.presentationMode)
    var presentationMode
    @State var movie: PopularMovie
    var body: some View {
        let year = DateTimeHelper().convertToYear(dateString: movie.releaseDate)
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        imageView
                        VStack(alignment: .leading, spacing: 20) {
                            Text("\(movie.originalTitle) ( \(year ?? "") )" )
                                .font(.system(size: 26, weight: .bold))
                                .foregroundStyle(.white)
                            RatingView(
                                rating: movie.voteAverage / 2,
                                fromMovieDetail: true
                            )
                                .padding(.bottom, 12)
                            buttonScrollView
                            Text("Storyline")
                                .font(.system(size: 26))
                                .foregroundStyle(.white)
                            Text(movie.overview)
                                .font(.system(size: 20))
                                .foregroundStyle(.white)
                        }
                        .padding([.leading, .trailing], 16)
                    }
                    .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                }
                .background(Color.black)
            }
        }
    }
    
    @ViewBuilder var imageView: some View {
        ZStack(alignment: .topLeading) {
            AsyncImage(url: movie.backDropURL) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
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
                ForEach(movieType, id: \.self) {type in
                    MovieStatusButton(
                        buttonTitle: type.description,
                        isButttonClicked: false
                    )
                }
            }
        }
    }
}

// #Preview {
//    MovieDetailPage(
//        movie: PopularMovie(
//            originalTitle: "",
//            overview: "",
//            voteAverage: 1.2,
//            posterPath: "",
//            releaseDate: "",
//            id: 121
//        )
//    )
// }
