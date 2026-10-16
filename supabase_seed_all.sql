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

-- 2. INJEKSI 6 PAPAN PROYEK UTAMA (projects)
INSERT INTO public.projects (id, code, name, description, workspace, status, type, progress, priority, start_date, due_date, members, tasks_count, budget, theme, is_user_created, updated_at)
VALUES ('proj-main', 'CAPSTONE-01', 'Proyek Capstone', 'Pengembangan sistem utama dan deliverables untuk mata kuliah Capstone Project', 'workspace-capstone', 'active', 'existing', 33, 'High', '01 Okt 2026', '30 Des 2026', '[]'::jsonb, '{"total":3,"completed":1}'::jsonb, '-', 'null'::jsonb, true, NOW())
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, workspace = EXCLUDED.workspace, tasks_count = EXCLUDED.tasks_count, updated_at = NOW();

-- 3. INJEKSI 7 PENGGUNA TERDAFTAR (users)
INSERT INTO public.users (id, name, full_name, username, role, title, jobdesk, email, nip, position, school, assigned_project_id, assigned_workspace, assigned_board_name, assigned_task_id, assigned_task_title, device, is_device_bound, qr_data, workspace_access, updated_at)
VALUES ('usr-001', 'Project Lead', 'Project Lead', '@admin', 'admin', 'Project Lead', 'Project Lead', 'admin@project.local', '001', 'Project Lead', '', 'proj-main', 'workspace-capstone', 'Capstone Board', 'all', 'Seluruh Papan (Semua Tugas)', 'Belum Terikat', false, '@admin', '["workspace-capstone","proj-main"]'::jsonb, NOW())
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, name = EXCLUDED.name, username = EXCLUDED.username, role = EXCLUDED.role, position = EXCLUDED.position, assigned_project_id = EXCLUDED.assigned_project_id, assigned_workspace = EXCLUDED.assigned_workspace, assigned_board_name = EXCLUDED.assigned_board_name, assigned_task_id = EXCLUDED.assigned_task_id, assigned_task_title = EXCLUDED.assigned_task_title, updated_at = NOW();

INSERT INTO public.users (id, name, full_name, username, role, title, jobdesk, email, nip, position, school, assigned_project_id, assigned_workspace, assigned_board_name, assigned_task_id, assigned_task_title, device, is_device_bound, qr_data, workspace_access, updated_at)
VALUES ('usr-002', 'Project Manager', 'Project Manager', '@pm', 'manajement-project', 'Project Manager', 'Project Manager', 'pm@project.local', '002', 'Project Manager', '', 'proj-main', 'workspace-capstone', 'Capstone Board', 'all', 'Seluruh Papan (Semua Tugas)', 'Belum Terikat', false, '@pm', '["workspace-capstone","proj-main"]'::jsonb, NOW())
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, name = EXCLUDED.name, username = EXCLUDED.username, role = EXCLUDED.role, position = EXCLUDED.position, assigned_project_id = EXCLUDED.assigned_project_id, assigned_workspace = EXCLUDED.assigned_workspace, assigned_board_name = EXCLUDED.assigned_board_name, assigned_task_id = EXCLUDED.assigned_task_id, assigned_task_title = EXCLUDED.assigned_task_title, updated_at = NOW();

INSERT INTO public.users (id, name, full_name, username, role, title, jobdesk, email, nip, position, school, assigned_project_id, assigned_workspace, assigned_board_name, assigned_task_id, assigned_task_title, device, is_device_bound, qr_data, workspace_access, updated_at)
VALUES ('usr-003', 'Team Member', 'Team Member', '@member', 'user', 'Software Developer', 'Software Developer', 'member@project.local', '003', 'Software Developer', '', 'proj-main', 'workspace-capstone', 'Capstone Board', 'all', 'Seluruh Papan (Semua Tugas)', 'Belum Terikat', false, '@member', '["workspace-capstone","proj-main"]'::jsonb, NOW())
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, name = EXCLUDED.name, username = EXCLUDED.username, role = EXCLUDED.role, position = EXCLUDED.position, assigned_project_id = EXCLUDED.assigned_project_id, assigned_workspace = EXCLUDED.assigned_workspace, assigned_board_name = EXCLUDED.assigned_board_name, assigned_task_id = EXCLUDED.assigned_task_id, assigned_task_title = EXCLUDED.assigned_task_title, updated_at = NOW();

-- 4. INJEKSI 31 TUGAS KANBAN (tasks)
INSERT INTO public.tasks (id, code, title, description, workspace, board, status, priority, pic, timeline, hours, assets, qa_progress, is_starred, tags, location, resolution, project_id, updated_at)
VALUES ('task-001', '#CP-101', 'Analisis Kebutuhan & Spesifikasi Proyek', 'Menyusun dokumen analisis kebutuhan sistem dan arsitektur proyek.', 'workspace-capstone', 'sprint-1', 'done', 'High', '{"name":"Project Lead","initials":"PL","role":"Project Lead"}'::jsonb, '01 - 07 Okt', 10, '[]'::jsonb, '{"passed":3,"total":3}'::jsonb, true, '["Analisis","Dokumentasi"]'::jsonb, '', '', 'proj-main', NOW())
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, workspace = EXCLUDED.workspace, status = EXCLUDED.status, priority = EXCLUDED.priority, pic = EXCLUDED.pic, updated_at = NOW();

INSERT INTO public.tasks (id, code, title, description, workspace, board, status, priority, pic, timeline, hours, assets, qa_progress, is_starred, tags, location, resolution, project_id, updated_at)
VALUES ('task-002', '#CP-102', 'Perancangan UI/UX & Prototipe', 'Membuat wireframe dan desain interaktif antarmuka pengguna.', 'workspace-capstone', 'sprint-1', 'in-progress', 'Medium', '{"name":"Team Member","initials":"TM","role":"Software Developer"}'::jsonb, '08 - 15 Okt', 16, '[]'::jsonb, '{"passed":1,"total":3}'::jsonb, false, '["Design","UI/UX"]'::jsonb, '', '', 'proj-main', NOW())
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, workspace = EXCLUDED.workspace, status = EXCLUDED.status, priority = EXCLUDED.priority, pic = EXCLUDED.pic, updated_at = NOW();

INSERT INTO public.tasks (id, code, title, description, workspace, board, status, priority, pic, timeline, hours, assets, qa_progress, is_starred, tags, location, resolution, project_id, updated_at)
VALUES ('task-003', '#CP-103', 'Setup Database & Backend Services', 'Inisialisasi schema database di Supabase dan konfigurasi endpoint.', 'workspace-capstone', 'sprint-1', 'todo', 'Critical', '{"name":"Project Manager","initials":"PM","role":"Project Manager"}'::jsonb, '16 - 22 Okt', 20, '[]'::jsonb, '{"passed":0,"total":2}'::jsonb, false, '["Backend","Database"]'::jsonb, '', '', 'proj-main', NOW())
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, workspace = EXCLUDED.workspace, status = EXCLUDED.status, priority = EXCLUDED.priority, pic = EXCLUDED.pic, updated_at = NOW();

