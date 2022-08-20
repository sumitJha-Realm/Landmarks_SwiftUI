//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Sumit Jha on 19/08/22.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    
    var filteredLandmarks: [Landmark]{
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)

        }
    }
    
    var body: some View {
        NavigationView {
            List{
            Toggle(isOn: $showFavoritesOnly ) {
                Text("Favorites only")
            }
            ForEach(filteredLandmarks ) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)

                }
            }
            .navigationTitle("Landmarks")
        }
        }
        
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
        /*  ForEach(["iPhone SE (2nd generation)", "iPhone 12"], id: \.self){ devicename in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: devicename))
                .previewDisplayName(devicename)
        }

         */
    }
}
