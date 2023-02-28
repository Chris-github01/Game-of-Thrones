//
//  InfoCardView.swift
//  Game of Thrones Chris
//
//  Created by Christopher Knight on 2023/02/16.
//

import SwiftUI

struct InfoCardView: View {
    
    var character : Character
    var body: some View {
        
        VStack{
            Text("Title: " + (character.title ?? ""))
            Text("First name: " + (character.firstName ?? ""))
            Text("Last name: " + (character.lastName ?? ""))
            Text("Full name: " + (character.fullName ?? ""))
            Text("Family: " + (character.family ?? ""))
         
        }
        .foregroundColor(Color.gray)
        .font(.system(size: 22, weight: .regular, design: .rounded))
        }
}
