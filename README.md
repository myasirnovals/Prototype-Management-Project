# Project Management Portal — Capstone Project Hub

Portal manajemen proyek modern, modular, dan responsif dengan dukungan Monday-style table, Kanban board, kalender tugas, dan autentikasi QR Code terintegrasi database PostgreSQL Supabase.

Proyek ini dibangun menggunakan Vanilla JavaScript (ES6 Modules) dengan arsitektur SOLID, dipadukan dengan **Vite.js** sebagai build tool modern untuk performa tinggi dan kemudahan deployment ke platform cloud seperti **Vercel** serta database **Supabase**.

---

## 🚀 Memulai (Local Development)

### Prasyarat
- [Node.js](https://nodejs.org/) (versi 18+ direkomendasikan)
- NPM atau PNPM / Yarn

### 1. Instalasi Dependensi
```bash
npm install
```

### 2. Jalankan Mode Pengembangan (Dev Server)
```bash
npm run dev
```
Buka browser di alamat yang tertera (biasanya `http://localhost:3000`).

### 3. Build untuk Produksi
```bash
npm run build
```
Hasil bundling yang teroptimasi dan siap deploy akan berada di folder `dist/`.

### 4. Preview Hasil Build
```bash
npm run preview
```

---

## 🌐 Panduan Deploy ke Vercel

Proyek ini sudah dikonfigurasi secara optimal dengan `vercel.json` dan Vite output settings.

### Opsi 1: Deploy via Vercel Dashboard & GitHub (Direkomendasikan)
1. Push proyek ini ke repository GitHub:
   ```bash
   git add .
   git commit -m "Migrasi ke Vite.js dan konfigurasi Vercel deployment"
   git push origin main
   ```
2. Buka [vercel.com](https://vercel.com) dan login/signup.
3. Klik tombol **"Add New..."** > **"Project"**.
4. Pilih repository `Prototype-Management-Project` dari daftar GitHub Anda dan klik **"Import"**.
5. Vercel akan secara otomatis mendeteksi konfigurasi:
   - **Framework Preset**: `Vite`
   - **Build Command**: `npm run build`
   - **Output Directory**: `dist`
6. Klik **"Deploy"**. Dalam beberapa detik website Anda sudah online dengan URL gratis `https://<nama-proyek>.vercel.app`.

### Opsi 2: Deploy via Vercel CLI
1. Pastikan Vercel CLI terpasang di komputer:
   ```bash
   npm install -g vercel
   ```
2. Jalankan perintah deploy di terminal direktori proyek:
   ```bash
   vercel
   ```
   Ikuti petunjuk prompt di layar (pilih pengaturan default).
3. Untuk deployment produksi:
   ```bash
   vercel --prod
   ```

---

## 📁 Struktur Direktori

```
├── public/                 # Aset statis murni yang langsung disalin ke dist
│   └── assets/logo.svg
├── css/                    # Desain sistem & stylesheet utama
│   └── style.css
├── js/
│   ├── app.js             # Bootstrap & Dependency Injection Root
│   ├── components/        # UI Shell & Modals
│   ├── core/              # DIContainer, EventBus, BaseView, BaseModal
│   ├── models/            # Entity Data Models
│   ├── services/          # Business logic & state management
│   └── views/             # Halaman-halaman modular (Dashboard, Table, Kanban, dll)
├── index.html             # Entry point HTML & Tailwind configuration
├── package.json           # Dependensi & NPM scripts
├── vite.config.js         # Konfigurasi bundler Vite
├── vercel.json            # Konfigurasi deployment Vercel
└── .gitignore             # File yang dikecualikan dari version control
```
