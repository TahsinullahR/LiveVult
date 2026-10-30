PRAGMA foreign_keys = ON;
CREATE TABLE IF NOT EXISTS folders (id TEXT PRIMARY KEY,name TEXT NOT NULL,parent_id TEXT,created_at TEXT NOT NULL,FOREIGN KEY(parent_id) REFERENCES folders(id));
CREATE INDEX IF NOT EXISTS folders_parent_idx ON folders(parent_id);
CREATE TABLE IF NOT EXISTS files (id TEXT PRIMARY KEY,name TEXT NOT NULL,object_key TEXT NOT NULL UNIQUE,mime_type TEXT NOT NULL,size INTEGER NOT NULL,folder_id TEXT,created_at TEXT NOT NULL,updated_at TEXT NOT NULL,deleted_at TEXT,FOREIGN KEY(folder_id) REFERENCES folders(id));
CREATE INDEX IF NOT EXISTS files_folder_idx ON files(folder_id,deleted_at);
CREATE INDEX IF NOT EXISTS files_name_idx ON files(name);
CREATE INDEX IF NOT EXISTS files_deleted_idx ON files(deleted_at);