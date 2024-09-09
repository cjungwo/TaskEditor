//
//  MemoListView.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 2/9/2024.
//

import SwiftUI

struct IdeaListView: View {
  @State var text: String = ""

    var body: some View {
      NavigationStack {
        // TODO: - priority sorting
        List {
          ForEach(Mocks.mockIdeaList, id: \.id) { idea in
            HStack {
              VStack(alignment: .leading) {
                Text(idea.title)
                  .bold()

                if idea.content != nil {
                  Text(idea.content!)
                    .font(.subheadline)
                    .lineLimit(1)
                }
              }

              Spacer()

              Text("\(idea.createdDate.formatted(date: .abbreviated, time: .omitted))")
            }
            .frame(height: 40)
          }
          .swipeActions(edge: .trailing) {
            Button("Delete") {
              //
            }
            .tint(.red)
          }
          .swipeActions(edge: .leading) {
            Button("Edit") {
              //
            }
            .tint(.green)
          }
        }
        .searchable(text: $text)
        .navigationTitle("Idea List")
        .toolbar {
          ToolbarItem {
            Button("Create") {
              // TODO: - link CreateTaskView or CreateTaskSheet
            }
          }
        }
      }
    }
}

#Preview {
    IdeaListView()
}
