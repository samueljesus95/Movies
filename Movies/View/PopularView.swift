//
//  ContentView.swift
//  Movies
//
//  Created by Samuel Nascimento de Jesus on 04/08/22.
//

import SwiftUI

struct PopularView: View {
    
    @StateObject
    var popularViewModel = PopularViewModel()
    
    var body: some View {
        VStack {
            Text("Popular")
                .padding()
            Spacer()
            List {
                ForEach(popularViewModel.popular, id: \.self) { movie in
                    Text(movie.title ?? "")
                        .padding()
                }
            }
        }
        .onAppear() {
            popularViewModel.fetch()
        }
    }
}

struct PopularView_Previews: PreviewProvider {
    static var previews: some View {
        PopularView()
    }
}
