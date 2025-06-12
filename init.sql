-- Connect to user_service database (will be created by POSTGRES_DB env var)
\c user_service;

-- Create extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create users table (optional - GORM will auto-migrate)
CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role user_role DEFAULT 'buyer',
    is_active BOOLEAN DEFAULT true,
    creat_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

-- Create user role enum
DO $$ BEGIN
    CREATE TYPE user_role AS ENUM ('admin', 'partner', 'buyer');
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_role ON users(role);
CREATE INDEX IF NOT EXISTS idx_users_is_active ON users(is_active);