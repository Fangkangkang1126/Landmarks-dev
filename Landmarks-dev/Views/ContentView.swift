//
//  ContentView.swift
//  Landmarks-dev
//
//  Created by fkk on 2025/4/22.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
        VStack {
            MapView ()
                .frame(height: 300)
            CircleImage()
                .offset(y:-120)
                .padding(.bottom, -130)
            VStack {
                Text("老君山")
                    .font(.title)
                    .multilineTextAlignment(.trailing)
                    .bold()
                
                HStack {
                    Text ("公园")
//                    Spacer()
                    Divider()
                        .frame(height:1)
                        .padding(.horizontal)
                        .foregroundStyle(.blue)
                    Text("中国")
                    
                }
                Divider()
            }
            .padding()
            
            Spacer()
        }
        
            
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
