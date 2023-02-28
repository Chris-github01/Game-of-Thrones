//
//  SwiftUIView.swift
//  Game of Thrones Chris
//
//  Created by Christopher Knight on 2023/02/14.
//

import SwiftUI

struct ImageCardView: View {
    
    var character : Character
    var body: some View {
        AsyncImage(url: URL(string: character.imageURL!),
                   content: { image in
            
            image.resizable()
                .scaledToFill()
            
        },
                   placeholder:  { Color.black})
        .frame(width: 115, height: 115)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}
