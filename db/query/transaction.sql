
-- name: GetTransaction :one
SELECT * FROM transactions
WHERE id = $1 LIMIT 1;

-- name: ListTransactions :many
SELECT * FROM transactions
WHERE user_id = $1
ORDER BY id
LIMIT $2
OFFSET $3;

-- name: CreateTransaction :one
INSERT INTO transactions (
  user_id, 
  loan_id,
  otr,
  admin_fee,
  jumlah_cicilan,
  jumlah_bunga,
  nama_asset
) VALUES (
  $1, $2, $3, $4, $5, $6, $7
)
RETURNING *;