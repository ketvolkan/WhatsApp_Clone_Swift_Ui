import SwiftUI
public struct ChatFilterBarView: View {
    @Binding public var searchText: String
    @Binding public var selectedFilter: ChatFilterType
    public init(
        searchText: Binding<String>,
        selectedFilter: Binding<ChatFilterType>
    ) {
        self._searchText = searchText
        self._selectedFilter = selectedFilter
    }
    public var body: some View {
        VStack(spacing: AppConstants.paddingSmall) {
            SearchBarView(text: $searchText)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: AppConstants.paddingSmall) {
                    ForEach(ChatFilterType.allCases) { filter in
                        FilterChipView(
                            title: filter.rawValue,
                            isSelected: selectedFilter == filter,
                            action: {
                                selectedFilter = filter
                            }
                        )
                    }
                }
            }
        }
        .padding(.vertical, 4)
    }
}
