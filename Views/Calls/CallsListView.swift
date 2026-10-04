import SwiftUI
public struct CallsListView: View {
    @StateObject private var viewModel = CallsViewModel()
    public init() {}
    public var body: some View {
        NavigationView {
            List {
                Section {
                    SearchBarView(text: $viewModel.searchText)
                        .listRowInsets(EdgeInsets())
                        .padding(.vertical, 4)
                }
                .listRowBackground(Color.clear)
                Section {
                    CreateCallLinkRowView()
                }
                Section(header: Text(AppStrings.recentCalls).font(.system(size: 14, weight: .semibold))) {
                    ForEach(viewModel.filteredCalls) { call in
                        CallRowView(call: call)
                    }
                }
            }
            #if os(iOS)
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitleDisplayMode(.large)
            #endif
            .navigationTitle(AppStrings.tabCalls)
            .toolbar {
                #if os(iOS)
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(AppStrings.editButton) {}
                        .foregroundColor(AppColors.tealGreen)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "phone.badge.plus")
                            .foregroundColor(AppColors.tealGreen)
                    }
                }
                #else
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {}) {
                        Image(systemName: "phone.badge.plus")
                            .foregroundColor(AppColors.tealGreen)
                    }
                }
                #endif
            }
            .task {
                await viewModel.loadCalls()
            }
        }
    }
}
