# WhatsApp Clone (SwiftUI)

Tamamen **SwiftUI** ve modern **MVVM + Repository** mimarisi ile geliştirilmiş, %100 Türkçe WhatsApp iOS klonu.

## 📁 Proje Dizin Yapısı

```text
WhatsAppClone/
├── WhatsAppCloneApp.swift                # Uygulama Başlangıç Noktası (@main)
├── Package.swift                         # Swift Package Manager Tanımı
├── Resources/
│   └── mock_data.json                    # Simüle Edilen Servis Mock Verisi
├── Core/
│   ├── Constants/
│   │   ├── AppConstants.swift            # Sabit Boyut, Boşluk ve Yapılandırmalar
│   │   └── AppStrings.swift              # %100 Türkçe Metin Sabitleri
│   ├── Theme/
│   │   ├── AppColors.swift               # WhatsApp Renk Paleti (Hex Tabanlı)
│   │   └── AppIcons.swift                # SF Symbols İkon Eşlemeleri
│   └── Extensions/
│       ├── Color+Hex.swift               # Hex Renk Desteği
│       ├── RoundedCornerShape.swift      # Özel Köşe Yuvarlama Şekli
│       └── View+CornerRadius.swift       # View Genişletmeleri
├── Models/
│   ├── User.swift                        # Kullanıcı Modeli
│   ├── Message.swift                     # Mesaj Modeli
│   ├── MessageStatus.swift               # Mesaj Durumu Enum (sent, delivered, read)
│   ├── Chat.swift                        # Sohbet Özeti Modeli
│   ├── ChatFilterType.swift              # Liste Filtresi Enum (Tümü, Okunmamış, Gruplar)
│   ├── StatusItem.swift                  # Durum / Hikaye Modeli
│   ├── CallLog.swift                     # Arama Kaydı Modeli
│   ├── CallType.swift                    # Arama Türü Enum (incoming, outgoing, missed)
│   └── MockDataContainer.swift           # Kök JSON Veri Taşıyıcısı
├── Services/
│   ├── JsonDataLoaderProtocol.swift      # Veri Yükleme Protokolü
│   └── LocalJsonService.swift            # JSON Çözümleyici & Ağ Simülasyonu
├── Repositories/
│   ├── WhatsAppRepositoryProtocol.swift  # Repository Sözleşmesi
│   └── WhatsAppRepository.swift          # Veri Yönetimi & Mesajlaşma Simülasyonu
├── ViewModels/
│   ├── ChatListViewModel.swift           # Sohbet Listesi & Filtre Mantığı
│   ├── ChatDetailViewModel.swift         # Aktif Mesajlaşma & Gönderme Mantığı
│   ├── StatusViewModel.swift             # Durum / Güncellemeler Mantığı
│   ├── CallsViewModel.swift              # Arama Geçmişi Mantığı
│   └── SettingsViewModel.swift           # Profil & Ayarlar Mantığı
└── Views/
    ├── Main/
    │   └── MainTabView.swift             # 5 Temel Sekmeli WhatsApp Navigasyonu
    ├── Chats/
    │   ├── ChatListView.swift            # Sohbet Listesi Ekranı
    │   ├── ChatRowView.swift             # Sohbet Satır Bileşeni
    │   ├── ChatDetailView.swift          # Mesajlaşma Detay Ekranı
    │   ├── MessageBubbleView.swift       # Mesaj Baloncuğu
    │   └── ChatInputBarView.swift        # Mesaj Yazma Çubuğu
    ├── Status/
    │   ├── StatusListView.swift          # Güncellemeler Ekranı
    │   └── StatusRowView.swift           # Durum Satır Bileşeni
    ├── Calls/
    │   ├── CallsListView.swift           # Aramalar Ekranı
    │   └── CallRowView.swift             # Arama Satır Bileşeni
    ├── Communities/
    │   └── CommunitiesView.swift         # Topluluklar Ekranı
    ├── Settings/
    │   ├── SettingsView.swift            # Profil ve Ayarlar Ekranı
    │   └── SettingsRowView.swift         # Ayar Menüsü Satırı
    └── Components/
        ├── AvatarImageView.swift         # Yeniden Kullanılabilir Avatar
        ├── SearchBarView.swift           # Arama Çubuğu Bileşeni
        ├── FilterChipView.swift          # Filtre Çipi Butonu
        ├── BadgeView.swift               # Okunmamış Sayacı Rozeti
        └── StatusCheckmarkView.swift     # Çift Mavi/Gri Tik Bileşeni
```

## ✨ Mimari ve Tasarım Prensipleri

1. **Tek Dosya - Tek Tip İlkesi**: Her dosya strictly yalnızca tek bir sınıf, yapı veya protokol içerir.
2. **Hardcoded Değerlerin Engellenmesi**: Bütün renkler `AppColors`, sabitler `AppConstants`, ikonlar `AppIcons` ve metinler `AppStrings` içerisinden çekilir.
3. **Repository Deseni**: UI bileşenleri verileri doğrudan bilmez; `WhatsAppRepository` üzerinden asenkron `async/await` çağrılarıyla alır.
4. **Mock Servis Katmanı**: `LocalJsonService`, `mock_data.json` dosyasını sanki uzak bir sunucudan çekiyormuş gibi 200 ms ağ gecikmesi simüle ederek yükler.
5. **Dinamik Mesaj Gönderimi**: Sohbet detay ekranında yeni mesaj yazıp gönderdiğinizde repository katmanı mesajı kaydeder ve ekran otomatik olarak en son mesaja kaydırılır.
