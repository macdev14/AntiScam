//
//  ContentView.swift
//  igolpe
//
//  Created by Lauro Pimentel on 25/06/24.
//

import SwiftUI
import SwiftData

struct MyItemsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var show = false

    var body: some View {
        if show{
            ModalView(show: $show)
        }else{
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
                   
                    ToolbarItem(placement: .principal) {
                       
                        Text("My Cases").font(.title2).fontWeight(.semibold)
                      
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        EditButton() .foregroundColor(.black)
                    }
                    ToolbarItem {
                        Button(action: addItem) {
                               HStack {
                                   Image(systemName: "plus")
                                       .foregroundColor(.black)
                                   
                               }
                           }
                    }
                }
            } detail: {
                Text("Select an item")
            }
        }
    }

    private func addItem() {
        withAnimation(.snappy) {
           show = true
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
    MyItemsView()
        .modelContainer(for: Item.self, inMemory: true)
}
