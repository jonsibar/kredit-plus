-- name: GetUser :one
SELECT * FROM users
WHERE id = $1 LIMIT 1;

-- name: ListUsers :many
SELECT * FROM users
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: CreateUser :one
INSERT INTO users (
  nik, 
  full_name,
  legal_name,
  tempat_lahir,
  tanggal_lahir,
  gaji,
  foto_ktp,
  foto_selfie
) VALUES (
  $1, $2, $3, $4, $5, $6, $7, $8
)
RETURNING *;

-- name: UpdateUser :exec
UPDATE users
  set nik = $2, 
  full_name = $3,
  legal_name = $4,
  tempat_lahir = $5,
  tanggal_lahir = $6,
  gaji = $7,
  foto_ktp = $8,
  foto_selfie = $9
WHERE id = $1
RETURNING *;

-- name: DeleteUser :exec
DELETE FROM users
WHERE id = $1;