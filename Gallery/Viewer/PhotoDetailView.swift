//
//  PhotoDetailView.swift
//  Gallery
//
//  Created by Michael Campbell on 1/20/26.
//

import SwiftUI
import PhotosUI

struct PhotoDetailView: View {
    @State private var photosPickerItems: [PhotosPickerItem] = []
    @State private var images: [UIImage] = []
    @State private var photos: [Photo] = []
    @State private var isPresentingPicker: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(images, id: \.self) { photo in
                        Image(uiImage: photo)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipped()
                            .cornerRadius(10)
                    }
                }
                .padding()
                .navigationTitle("Photo Details...")
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button {
                            isPresentingPicker = true
                        } label: {
                            Image(systemName: "camera")
                        }
                        .accessibilityLabel("Pick Photos")
                    }
                }
                .photosPicker(isPresented: $isPresentingPicker, selection: $photosPickerItems, maxSelectionCount: 0, matching: .images)
                .onChange(of: photosPickerItems) { oldValue, newValue in
                    Task {
                        var photo: Photo
                        
                        for item in photosPickerItems {
                            if let data = try? await item.loadTransferable(type: Data.self) {
                                photo = Photo(data: data)
                                if let uiImage = UIImage(data: data) {
                                    images.append(uiImage)
                                    photos.append(photo)
                                    //context.insert(photo)
                                }
                                
                                //let _ = PhotoGallery(photos: self.images)
                            }
                        }
                        
                        photosPickerItems.removeAll()
                    }
                }
            }
        }
    }
}

#Preview {
    PhotoDetailView()
}
