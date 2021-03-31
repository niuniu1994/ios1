//
//  CardView.swift
//  ios-project
//
//  Created by Kaining Xin on 30/03/2021.
//

import SwiftUI

struct CardView: View {
    let record: Record<Field>
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(record.fields.activity )
                        .font(.headline)
                    Spacer()
                    HStack {
                        Label("\(record.fields.type)", systemImage: "flag.fill").font(.footnote)
                        Spacer()
                        Label("\(record.fields.speakers.count)", systemImage: "person.3.fill").font(.footnote)

                    }
                Label("\(TimeFormatConverter.convert(date:record.fields.start) )", systemImage: "clock.fill")
                .padding(.trailing, 20)
                    .font(.caption)
                }
                .padding()
        .foregroundColor(Color.pink)
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var record = Record.data
//    static var previews: some View {
//        CardView(record: record)
//            .previewLayout(.fixed(width: 400, height: 60))
//    }
//}
