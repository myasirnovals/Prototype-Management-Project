-- =========================================================================
-- SCRIPT INJEKSI AWAL DATABASE SUPABASE
-- Salin seluruh teks ini, buka menu SQL Editor di Supabase Dashboard, lalu klik Run
-- =========================================================================

-- 1. STRUKTUR KOLOM TABEL LENGKAP
ALTER TABLE IF EXISTS public.users ADD COLUMN IF NOT EXISTS username VARCHAR(100);
ALTER TABLE IF EXISTS public.users ADD COLUMN IF NOT EXISTS full_name VARCHAR(150);
ALTER TABLE IF EXISTS public.users ADD COLUMN IF NOT EXISTS nip VARCHAR(50);
ALTER TABLE IF EXISTS public.users ADD COLUMN IF NOT EXISTS position VARCHAR(150);
ALTER TABLE IF EXISTS public.users ADD COLUMN IF NOT EXISTS school VARCHAR(150);
ALTER TABLE IF EXISTS public.users ADD COLUMN IF NOT EXISTS assigned_project_id VARCHAR(100);
ALTER TABLE IF EXISTS public.users ADD COLUMN IF NOT EXISTS assigned_workspace VARCHAR(100);
ALTER TABLE IF EXISTS public.users ADD COLUMN IF NOT EXISTS assigned_board_name VARCHAR(150);
ALTER TABLE IF EXISTS public.users ADD COLUMN IF NOT EXISTS assigned_task_id VARCHAR(100);
ALTER TABLE IF EXISTS public.users ADD COLUMN IF NOT EXISTS assigned_task_title VARCHAR(255);
ALTER TABLE IF EXISTS public.users ADD COLUMN IF NOT EXISTS device VARCHAR(255);
ALTER TABLE IF EXISTS public.users ADD COLUMN IF NOT EXISTS is_device_bound BOOLEAN DEFAULT false;
ALTER TABLE IF EXISTS public.users ADD COLUMN IF NOT EXISTS qr_data VARCHAR(255);
ALTER TABLE IF EXISTS public.users ADD COLUMN IF NOT EXISTS workspace_access JSONB;
ALTER TABLE IF EXISTS public.users ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT NOW();

-- 2. INJEKSI PAPAN PROYEK (projects: 0)
-- 3. INJEKSI PENGGUNA TERDAFTAR (users: 1)
INSERT INTO public.users (id, name, full_name, username, role, title, jobdesk, email, nip, position, school, assigned_project_id, assigned_workspace, assigned_board_name, assigned_task_id, assigned_task_title, device, is_device_bound, qr_data, workspace_access, updated_at)
VALUES ('usr-001', 'Admin', 'Admin', '@admin', 'admin', 'Project Administrator', 'Project Administrator', 'admin@project.local', '001', 'Project Administrator', '', '', '', '', 'all', 'Seluruh Papan (Semua Tugas)', 'Belum Terikat', false, '@admin', '[]'::jsonb, NOW())
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, name = EXCLUDED.name, username = EXCLUDED.username, role = EXCLUDED.role, position = EXCLUDED.position, assigned_project_id = EXCLUDED.assigned_project_id, assigned_workspace = EXCLUDED.assigned_workspace, assigned_board_name = EXCLUDED.assigned_board_name, assigned_task_id = EXCLUDED.assigned_task_id, assigned_task_title = EXCLUDED.assigned_task_title, updated_at = NOW();

-- 4. INJEKSI TUGAS KANBAN (tasks: 0)
