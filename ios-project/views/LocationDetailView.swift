//
//  LocationDetailView.swift
//  ios-project
//
//  Created by Kaining Xin on 31/03/2021.
//

import SwiftUI

import SwiftUI

struct LocationDetailView: View {
    let location: Record<LocationField>
    var body: some View {
        List{
            Section(header: Text("Location")){
                HStack{
                    Label("Space name", systemImage: "mappin")
                    Spacer()
                    Text("\(location.fields.spaceName)").font(.body)
                }
                HStack{
                    Label("Description", systemImage: "mappin")
                    Spacer()
                    Text("\(location.fields.description)").font(.body)
                }
                HStack{
                    Label("Building Location", systemImage: "mappin")
                    Spacer()
                    Text("\(location.fields.buildingLocation)").font(.body)
                }
                HStack{
                    Label("Max capability", systemImage: "mappin")
                    Spacer()
                    Text("\(location.fields.maxCapacity)").font(.body)
                }
            }.foregroundColor(.pink)
        }.listStyle(InsetGroupedListStyle())
    }
}

//struct LocationDetailView_Previews: PreviewProvider {
//    let location: Record<LocationField>
//    static var previews: some View {
//        LocationDetail()
//    }
//}
