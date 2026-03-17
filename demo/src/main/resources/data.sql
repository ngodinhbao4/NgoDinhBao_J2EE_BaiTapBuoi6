INSERT INTO categories (name) SELECT 'Điện thoại' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Điện thoại');
INSERT INTO categories (name) SELECT 'Laptop' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Laptop');

-- Roles
INSERT INTO role (name) SELECT 'ROLE_ADMIN' WHERE NOT EXISTS (SELECT 1 FROM role WHERE name = 'ROLE_ADMIN');
INSERT INTO role (name) SELECT 'ROLE_USER' WHERE NOT EXISTS (SELECT 1 FROM role WHERE name = 'ROLE_USER');

-- Accounts (password encoded with BCrypt)
-- admin password: admin123
INSERT INTO account (login_name, password) SELECT 'admin', '$2b$12$QyRvQf69bvbDjODCLI0mReuS.hEIMyGrnuirS3.7cdEoutlJUWyGq' WHERE NOT EXISTS (SELECT 1 FROM account WHERE login_name = 'admin');
-- user1 password: 123456
INSERT INTO account (login_name, password) SELECT 'user1', '$2b$12$jdPdtRJ0Uy4gKLGGQWORZOpsA5gra0dUthvqenosbcKVXLmFQMI6u' WHERE NOT EXISTS (SELECT 1 FROM account WHERE login_name = 'user1');

-- Account-Role relationships
INSERT INTO account_role (account_id, role_id) SELECT a.id, r.id FROM account a, role r WHERE a.login_name = 'admin' AND r.name = 'ROLE_ADMIN' AND NOT EXISTS (SELECT 1 FROM account_role ar WHERE ar.account_id = a.id AND ar.role_id = r.id);
INSERT INTO account_role (account_id, role_id) SELECT a.id, r.id FROM account a, role r WHERE a.login_name = 'user1' AND r.name = 'ROLE_USER' AND NOT EXISTS (SELECT 1 FROM account_role ar WHERE ar.account_id = a.id AND ar.role_id = r.id);
