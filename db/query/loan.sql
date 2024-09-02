
-- name: GetLoan :one
SELECT * FROM loans
WHERE id = $1 LIMIT 1;

-- name: ListLoans :many
SELECT * FROM loans
WHERE user_id = $1
ORDER BY id
LIMIT $2
OFFSET $3;

-- name: CreateLoan :one
INSERT INTO loans (
  user_id, 
  loan_limit,
  term,
  remaining_limit
) VALUES (
  $1, $2, $3, $4
)
RETURNING *;

-- name: UpdateLoanLimit :exec
UPDATE loans
  set remaining_limit = $2
WHERE id = $1
RETURNING *;