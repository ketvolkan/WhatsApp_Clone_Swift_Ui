import SwiftUI
public struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    public init() {}
    public var body: some View {
        NavigationView {
            List {
                Section {
                    ProfileHeaderCardView(user: viewModel.currentUser)
                }
                Section {
                    SettingsRowView(
                        iconName: "person.crop.artframe",
                        iconColor: Color.blue,
                        title: AppStrings.settingsAvatar
                    )
                }
                Section {
                    SettingsRowView(
                        iconName: "star.fill",
                        iconColor: Color.yellow,
                        title: AppStrings.settingsStarred
                    )
                    SettingsRowView(
                        iconName: "laptopcomputer",
                        iconColor: Color.teal,
                        title: AppStrings.settingsLinkedDevices
                    )
                }
                Section {
                    SettingsRowView(
                        iconName: AppIcons.keyAccount,
                        iconColor: AppColors.tealGreen,
                        title: AppStrings.settingsAccount
                    )
                    SettingsRowView(
                        iconName: AppIcons.lockPrivacy,
                        iconColor: Color.cyan,
                        title: AppStrings.settingsPrivacy
                    )
                    SettingsRowView(
                        iconName: AppIcons.chatSettings,
                        iconColor: AppColors.primaryGreen,
                        title: AppStrings.settingsChats
                    )
                    SettingsRowView(
                        iconName: AppIcons.bellNotifications,
                        iconColor: Color.red,
                        title: AppStrings.settingsNotifications
                    )
                    SettingsRowView(
                        iconName: AppIcons.storage,
                        iconColor: Color.green,
                        title: AppStrings.settingsStorage
                    )
                }
                Section {
                    SettingsRowView(
                        iconName: AppIcons.questionHelp,
                        iconColor: Color.blue,
                        title: AppStrings.settingsHelp
                    )
                    SettingsRowView(
                        iconName: AppIcons.heartInvite,
                        iconColor: Color.pink,
                        title: AppStrings.settingsInvite
                    )
                }
            }
            #if os(iOS)
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitleDisplayMode(.large)
            #endif
            .navigationTitle(AppStrings.tabSettings)
            .task {
                await viewModel.loadUser()
            }
        }
    }
}
