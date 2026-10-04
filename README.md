# WhatsApp iOS Clone (SwiftUI)

Modern **SwiftUI** ve **MVVM + Repository** mimarisi kullanılarak geliştirilmiş, WhatsApp UI iOS klonu.

---

## 📱 Uygulama Görselleri

| Sohbetler | Sohbet Detayı | Güncellemeler | Aramalar | Ayarlar |
|:---:|:---:|:---:|:---:|:---:|
| <img src="Screenshots/chats.png" width="165"/> | <img src="Screenshots/chat_detail.png" width="165"/> | <img src="Screenshots/updates.png" width="165"/> | <img src="Screenshots/calls.png" width="165"/> | <img src="Screenshots/settings.png" width="165"/> |

---

## 📁 Klasör Yapısı

```text
WhatsAppClone/
├── WhatsAppCloneApp.swift                # Uygulama giriş noktası (@main)
├── Package.swift                         # SPM yapılandırması
├── Resources/
│   └── mock_data.json                    # Simüle edilmiş JSON veri kaynağı
├── Core/
│   ├── Constants/                        # AppConstants, AppStrings
│   ├── Theme/                            # AppColors, AppIcons
│   └── Extensions/                       # Color+Hex, RoundedCornerShape, View+Extensions
├── Models/                               # User, Message, Chat, StatusItem, CallLog vb.
├── Services/                             # JsonDataLoaderProtocol, LocalJsonService
├── Repositories/                         # WhatsAppRepositoryProtocol, WhatsAppRepository
├── ViewModels/                           # ChatList, ChatDetail, Status, Calls, Settings ViewModels
├── Views/
│   ├── Main/                            # MainTabView (5 Sekmeli TabBar)
│   ├── Chats/                           # ChatListView, ChatDetailView, MessageBubbleView vb.
│   ├── Status/                          # StatusListView, StatusRowView, ChannelsSectionView vb.
│   ├── Calls/                           # CallsListView, CallRowView, CreateCallLinkRowView
│   ├── Communities/                     # CommunitiesView, CommunityHeroView
│   ├── Settings/                        # SettingsView, SettingsRowView, ProfileHeaderCardView
│   └── Components/                      # Reusable bileşenler (Avatar, SearchBar, FilterChip vb.)
└── Screenshots/                         # Ekran görüntüleri
```

---

## 🛠 Mimari & Özellikler

* **MVVM + Repository**: UI, iş mantığı ve veri katmanı tamamen birbirinden izole edilmiştir.
* **Mock Servis Katmanı**: `LocalJsonService`, `mock_data.json` dosyasını asenkron olarak 200 ms ağ gecikmesi simülasyonuyla yükler.

---

## 🚀 Projeyi Çalıştırma

Projeyi doğrudan Xcode ile açıp istediğiniz simülatörde çalıştırabilirsiniz:

```bash
open -a Xcode Package.swift
```
veya
```bash
swift run WhatsAppClone
```
