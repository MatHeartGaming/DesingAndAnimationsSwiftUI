//
//  GridView.swift
//  DesingAndAnimationsScreens
//
//  Created by Matteo Buompastore on 17/05/23.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        Grid(alignment: .leading, horizontalSpacing: 12, verticalSpacing: 12) {
            GridRow {
                Text("Votes")
                    .gridColumnAlignment(.trailing)
                    .gridCellColumns(2)
                    
                Text("Rating")
                    .gridColumnAlignment(.trailing)
            }
            .font(.footnote)
            .foregroundColor(.secondary)
            
            Divider()
                .gridCellUnsizedAxes(.horizontal)
            
            CustomGridRow()
                .frame(width: 30, alignment: .trailing)
            CustomGridRow(text: "21", rating: 3, progress: 0.2)
            CustomGridRow(text: "52", rating: 1, progress: 0.55)
            CustomGridRow(text: "25", rating: 5, progress: 0.2)
            CustomGridRow(text: "33", rating: 2, progress: 0.8)
            
        }
        .padding(20)
    }
    
    func CustomGridRow(text: String = "1", rating : Int = 4, progress : Double = 0.1) -> some View {
        GridRow {
            Text(text)
            ProgressView(value: progress)
                .frame(maxWidth: 250)
            RatingView(rating: rating)
        }
    }
    
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}

struct RatingView : View {
    
    var rating = 3
    var list = [1, 2, 3, 4, 5]
    
    var body : some View {
        HStack(spacing: 0) {
            ForEach(list, id: \.self) {item in
                //Image(systemName: rating >= item ? "star.fill" : "star")
                Image(systemName: rating >= item ? "star.fill" : "star")
            }
        }
        
    }
    
}
