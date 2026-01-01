# 🛡️ Windows 10 Stay - Force Update Fixer

**[English]** Prevent Windows 10 from forcibly upgrading to Windows 11 and remove pending update notifications.  
**[Türkçe]** Windows 10'un zorla Windows 11'e güncellenmesini engelleyin ve bekleyen güncelleme bildirimlerini kaldırın.

---

## 🇬🇧 English Description

### What is this?
This is a batch script designed for Windows 10 users who are being forced to upgrade to Windows 11. If you are stuck with "Pending Restart" notifications or cannot dismiss the Windows 11 upgrade screen, this script is the solution.

### Features
1.  **Stops Update Services:** Forcefully stops `wuauserv`, `bits`, and `dosvc`.
2.  **Wipes Update Cache:** Deletes the `SoftwareDistribution` and `catroot2` folders. This removes the already downloaded (pending) Windows 11 files, clearing the "Restart Required" flags.
3.  **Registry Lock:** Sets the `TargetReleaseVersion` to **22H2** in the Registry, telling Windows that the maximum allowed version is Windows 10.
4.  **UI Cleanup:** Modifies the Registry to remove "Update and Restart" / "Update and Shutdown" options from the Power Menu.

### How to Use
1.  Download the `dont_update_to_win11.bat` file (or create a new text file, paste the code below, and save it as `.bat`).
2.  **Right-Click** the file and select **Run as Administrator**.
3.  Wait for the "OPERATION SUCCESSFUL" message.
4.  **Restart** your computer.

⚠️ **Disclaimer:** This script modifies Windows Registry keys and system services. Use it at your own risk.

---

## 🇹🇷 Türkçe Açıklama

### Bu Nedir?
Bu script, Windows 10 kullanan ancak sürekli Windows 11'e geçmeye zorlanan kullanıcılar için tasarlanmıştır. Eğer bilgisayarınızda sürekli "Yeniden Başlatma Bekleniyor" uyarısı varsa veya Windows 11 güncellemesini iptal edemiyorsanız, bu script sorunu çözer.

### Özellikler
1.  **Servisleri Durdurur:** `wuauserv`, `bits` ve `dosvc` gibi güncelleme servislerini zorla durdurur.
2.  **Güncelleme Önbelleğini Temizler:** `SoftwareDistribution` ve `catroot2` klasörlerini siler. Bu işlem, halihazırda inmiş olan Windows 11 dosyalarını fiziksel olarak diskten siler ve "Yeniden Başlat" uyarısını kaldırır.
3.  **Registry Kilidi:** Kayıt Defteri'ne `TargetReleaseVersion` olarak **22H2** değerini girer. Bu, Windows'a "Çıkabileceğin en yüksek sürüm Windows 10'dur" emrini verir.
4.  **Arayüz Temizliği:** Başlat menüsündeki "Güncelle ve Kapat" / "Güncelle ve Yeniden Başlat" seçeneklerini gizler.

### Nasıl Kullanılır?
1.  `dont_update_to_win11.bat` dosyasını indirin (veya aşağıdaki kodu bir metin belgesine yapıştırıp uzantısını `.bat` olarak kaydedin).
2.  Dosyaya **Sağ Tıklayın** ve **Yönetici Olarak Çalıştır** deyin.
3.  "OPERATION SUCCESSFUL" yazısını bekleyin.
4.  Bilgisayarınızı **Yeniden Başlatın**.

⚠️ **Sorumluluk Reddi:** Bu script Windows Kayıt Defteri ve sistem servislerinde değişiklik yapar. Kullanım sorumluluğu size aittir.

---

## 💻 The Script (Kod)

Download the code (.bat file) and just run as Administrator / Kodu indirin (.bat dosyası) ve sadece yönetici olarak çalıştırın.
Finally, Restart your PC / Son olarak bilgisayarı yeniden başlat.
