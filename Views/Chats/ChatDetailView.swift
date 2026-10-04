import SwiftUI
public struct ChatDetailView: View {
    public let chat: Chat
    @StateObject private var viewModel = ChatDetailViewModel()
    @Environment(\.presentationMode) private var presentationMode
    public init(chat: Chat) {
        self.chat = chat
    }
    public var body: some View {
        VStack(spacing: 0) {
            ChatDetailNavigationBarView(
                chat: chat,
                onBack: {
                    presentationMode.wrappedValue.dismiss()
                }
            )
            Divider()
            ZStack {
                AppColors.chatBackground
                    .ignoresSafeArea()
                ScrollViewReader { proxy in
                    ScrollView {
                        VStack(spacing: 6) {
                            EncryptedNoticeBannerView()
                            ForEach(viewModel.messages) { message in
                                MessageBubbleView(message: message)
                                    .id(message.id)
                            }
                        }
                        .padding(.vertical, AppConstants.paddingSmall)
                    }
                    .onChange(of: viewModel.messages.count) { _ in
                        if let lastMessage = viewModel.messages.last {
                            withAnimation {
                                proxy.scrollTo(lastMessage.id, anchor: .bottom)
                            }
                        }
                    }
                }
            }
            ChatInputBarView(
                text: $viewModel.messageText,
                onSend: {
                    Task {
                        await viewModel.sendMessage(for: chat.id)
                    }
                }
            )
        }
        #if os(iOS)
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .navigationBar)
        .toolbar(.hidden, for: .tabBar)
        #endif
        .task {
            await viewModel.loadMessages(for: chat.id)
        }
    }
}
