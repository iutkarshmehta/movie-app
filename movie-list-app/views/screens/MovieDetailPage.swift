//
//  MovieDetailPage.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 28/10/24.
//

import SwiftUI

struct MovieDetailPage: View {
    var movieType : [String] = ["Adventure","Fantasy","Comedy","Horror","Drama"]
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView{
                    VStack(alignment: .leading, spacing: 20){
                        Image("banner")
                            .resizable()
                            .scaledToFit()
                        VStack(alignment: .leading, spacing: 20){
                            Text("Pushpa the Rise (2021)")
                                .font(.system(size: 26,weight: .bold))
                                .foregroundStyle(.white)
                            RatingView(rating: 2.3,fromMovieDetail: true)
                                .padding(.bottom,12)
                            ScrollView(.horizontal,showsIndicators: false){
                                HStack(alignment: .top){
                                    ForEach(movieType, id : \.self){type in
                                        MovieStatusButton(
                                            buttonTitle: type.description,
                                            isButttonClicked: false
                                        )
                                    }
                                }
                            }
                            Text("Storyline")
                                .font(.system(size: 26))
                                .foregroundStyle(.white)
                            Text("Pushpa Raj is a self respecting young man who takes pride in his work. He works at a mill, but leaves it when his owner doesn't like his attitude outside of work. Pushpa goes for Red sanders cutting in the forest. Pushpa lives in a village with his mother Parvatamma, and is the illegitimate son of a local rich man.Pushpa Raj is a self respecting young man who takes pride in his work. He works at a mill, but leaves it when his owner doesn't like his attitude outside of work. Pushpa goes for Red sanders cutting in the forest. Pushpa lives in a village with his mother Parvatamma, and is the illegitimate son of a local rich man.Pushpa Raj is a self respecting young man who takes pride in his work. He works at a mill, but leaves it when his owner doesn't like his attitude outside of work. Pushpa goes for Red sanders cutting in the forest. Pushpa lives in a village with his mother Parvatamma, and is the illegitimate son of a local rich man.")
                                .font(.system(size: 20))
                                .foregroundStyle(.white)
                        }
                        .padding([.leading,.trailing],16)
                        
                    }
                    .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                    
                    
                }
                .ignoresSafeArea(edges: .top)
                .background(Color.black)
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button(action: {
                        
                    }){
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16,weight: .bold))
                            .foregroundStyle(Color.white)
                            .ignoresSafeArea()
                    }
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: {
                        
                    }){
                        Image(systemName: "bookmark.fill")
                            .font(.system(size: 16,weight: .bold))
                            .foregroundStyle(Color.white)
                    }
                }

            }
        }
    }
}

#Preview {
    MovieDetailPage()
}
