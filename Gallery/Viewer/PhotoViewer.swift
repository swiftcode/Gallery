import SwiftUI
import PhotosUI

struct PhotoViewer: View {
    @State private var photosPickerItems: [PhotosPickerItem] = []
    @State private var images: [UIImage] = []
    @State private var photos: [Photo] = []
    @State private var isPresentingPicker: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                if images.isEmpty {
                    ContentUnavailableView("No Photos", systemImage: "photo", description: Text("Tap the camera to pick photos."))
                } else {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 12)], spacing: 12) {
                            ForEach(Array(images.enumerated()), id: \.offset) { _, uiImage in
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipped()
                                    .cornerRadius(8)
                            }
                        }
                        .padding()

                        NavigationLink("Open Detail") {
                            PhotoDetailView(images: images, photos: photos)
                        }
                        .padding(.bottom)
                    }
                }
            }
            .navigationTitle("Photo Viewer")
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
                loadImages(from: newValue)
            }
        }
    }

    private func loadImages(from items: [PhotosPickerItem]) {
        Task {
            for item in items {
                if let data = try? await item.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    images.append(uiImage)
                    let p = Photo(data: data)
                    photos.append(p)
                    
                }
            }
        }
    }
}

#Preview {
    PhotoViewer()
}
