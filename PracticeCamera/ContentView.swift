//
//  ContentView.swift
//  PracticeCamera
//
//  Created by Scholar on 7/30/24.
//

import SwiftUI

struct ContentView: View {
    @State var isImagePickerShowing = false
    @State var selectedImage: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    var body: some View {
        VStack {
            Image(uiImage: selectedImage ?? UIImage(named: "camera")!)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 200.0, height: 200.0)
            
            HStack{
                Button {
                    self.sourceType = .photoLibrary
                    isImagePickerShowing = true
                    
                }label: {
                    Text("Select a photo")
                }
                Button {
                    self.sourceType = .camera
                    isImagePickerShowing = true
                } label: {
                    Text("Take a photo")
                }

                .padding()
            }
            Button("Remove Background") {
//                let img = UIImage()
//                let imageRemoved = img.removeBackground()
            }
            
        }
        .sheet(isPresented: $isImagePickerShowing) {
            ImagePicker(selectedImage: $selectedImage, isImagePickerShowing: $isImagePickerShowing, sourceType: self.sourceType)
        }
    }
}

#Preview {
    ContentView()
}
