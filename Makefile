migrate:
	migrate create -ext sql -dir db/migration -seq init_schema
migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:54320/kredit_plus?sslmode=disable" -verbose up
migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:54320/kredit_plus?sslmode=disable" -verbose down
sqlc:
	sqlc generate