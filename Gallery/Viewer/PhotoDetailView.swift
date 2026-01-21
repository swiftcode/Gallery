//
//  PhotoDetailView.swift
//  Gallery
//
//  Created by Michael Campbell on 1/20/26.
//

import SwiftUI
import PhotosUI

struct PhotoDetailView: View {
    let images: [UIImage]
    let photos: [Photo]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120), spacing: 12)], spacing: 12) {
                    ForEach(Array(images.enumerated()), id: \.offset) { _, uiImage in
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipped()
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            .navigationTitle("Photo Details")
        }
    }
}

#Preview {
    PhotoDetailView(images: [], photos: [])
}
