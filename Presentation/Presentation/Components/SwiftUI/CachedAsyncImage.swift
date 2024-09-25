//
//  CachedAsyncImage.swift
//  Presentation
//
//  Created by Christos Kaktsis on 25/9/24.
//

import SwiftUI

class ImageCache {
    static let shared = NSCache<NSURL, UIImage>()
}

struct CachedAsyncImage: View {
    let url: URL

    @State private var image: UIImage?

    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            ProgressView()
                .onAppear {
                    loadImage(from: url)
                }
        }
    }

    private func loadImage(from url: URL) {
        if let cachedImage = ImageCache.shared.object(forKey: url as NSURL) {
            self.image = cachedImage
        } else {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data, let uiImage = UIImage(data: data) {
                    ImageCache.shared.setObject(uiImage, forKey: url as NSURL)
                    DispatchQueue.main.async {
                        self.image = uiImage
                    }
                }
            }.resume()
        }
    }
}
