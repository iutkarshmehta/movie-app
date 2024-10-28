//
//  movielist-view.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 25/10/24.
//

import SwiftUI

struct MovieListView: View {
    let movieType : [String] = ["Popular","Coming Soon","Top Rated"]
    let columns = [GridItem(.adaptive(minimum: 150))]
    var body: some View {
        NavigationView {
            VStack(spacing: 0){
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing: 16){
                        ForEach(movieType,id: \.self){ type in
                            MovieStatusButton(
                                buttonTitle: type.description,
                                isButttonClicked: false
                            )
                        }
                    }
                }
                .padding()
                .background(Color.black.opacity(0.85))
                .frame(alignment: .leading)
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20){
                        ForEach(0..<30){index in
                            CardView()
                                .padding(.bottom,16)
                        }
                    }
                    .padding(.top,40)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            HStack {
                                Text("Watch Now")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 35, weight: .bold))
                                    .padding(.vertical, 40)
                            }
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold))
                                .padding(.vertical, 40)
                        }
                    }
                    .toolbarBackground(.black.opacity(0.8), for: .navigationBar)
                    .toolbarBackgroundVisibility(
                        .visible,
                        for: .navigationBar
                    )
                }
                .background(Color.black)
            }
        }
    }
}

#Preview {
    MovieListView()
}
