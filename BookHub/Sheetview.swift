//
//  Sheetview.swift
//  BookHub
//
//  Created by mac on 2024-11-22.
//

import SwiftUI
import MapKit

struct Sheetview: View {
    
    @State private var search: String = ""
    @State private var locationService = LocationService(completer: .init())
    @Binding var searchResults: [SearchResult]
    
    @State private var selectedLocation: SearchResult?
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // Default to San Francisco
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search for a book shop", text: $search)
                    .autocorrectionDisabled()
                    .onSubmit {
                        Task {
                            searchResults = (try? await locationService.search(with: search)) ?? []
                        }
                    }
                    .modifier(TextFieldGrayBackgroundColor())
                    .padding()
            }
            
            // Map view to show search results
            Map(coordinateRegion: $region, annotationItems: searchResults) { result in
                MapPin(coordinate: result.location, tint: .blue)
            }
            .frame(height: 300)  // You can adjust the height as needed
            
            Spacer()
            
            List {
                ForEach(locationService.completions) { completion in
                    Button(action: { didTapOnCompletion(completion) }) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(completion.title)
                                .font(.headline)
                                .fontDesign(.rounded)
                            Text(completion.subTitle)
                            if let url = completion.url {
                                Link(url.absoluteString, destination: url)
                                    .lineLimit(1)
                            }
                        }
                    }
                    .listRowBackground(Color.clear)
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
        }
        .onChange(of: search) {
            locationService.update(queryFragment: search)
        }
        .onChange(of: selectedLocation) { newLocation in
            if let newLocation {
                region.center = newLocation.location
            }
        }
        .interactiveDismissDisabled()
        .presentationDetents([.height(200), .large])
        .presentationBackground(.regularMaterial)
        .presentationBackgroundInteraction(.enabled(upThrough: .large))
    }

    private func didTapOnCompletion(_ completion: SearchCompletions) {
        Task {
            if let singleLocation = try? await locationService.search(with: "\(completion.title) \(completion.subTitle)").first {
                searchResults = [singleLocation]
            }
        }
    }
}

struct TextFieldGrayBackgroundColor: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(12)
            .background(.gray.opacity(0.1))
            .cornerRadius(8)
            .foregroundColor(.primary)
    }
}
