//
//  Viewer.swift
//  Gallery
//
//  Created by Michael Campbell on 1/19/26.
//

/*
import SwiftUI
import PhotosUI
import OSLog

struct Viewer: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var photosPickerItems: [PhotosPickerItem] = []
    @State var images: [UIImage] = []
    @State var photos: [Photo] = []
    
    
    var body: some View {
        NavigationStack {
            VStack {
                PhotosPicker("Select photos", selection: $photosPickerItems)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        //PhotosPicker("Select photos", selection: $photosPickerItems)
                        Logger.viewCycle.info("Camera button tapped")
                    } label: {
                        Image(systemName: "camera")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .tint(.accentColor)
                            //.modifier(ToolBarItemStyleModifier())
                    }
                }
            }
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
                    
                    Logger.viewCycle.info("Photos.count: \(photos.count)")
                    
                    photosPickerItems.removeAll()
                }
            }
        }
    }
}

#Preview {
    Viewer()
}
*/
