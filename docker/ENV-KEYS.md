# Docker runtime security keys

The Compose deployment mounts the project `.env` file read-only. Do not run
`php spark env:provision` in this setup: the security helper uses an atomic
temporary-file-and-rename operation, which cannot safely replace a Windows
host file bind-mounted into the container.

Instead, provide stable secrets through the Docker interpolation file
(`.env.docker`). Compose passes them to the application as
`ENCRYPTION_KEY` and `THROTTLE_KEY`; the application reads these values
without rewriting the mounted `.env`.

Add these two entries to the existing, untracked `.env.docker` file:

```dotenv
OSPOS_ENCRYPTION_KEY=<64 hexadecimal characters>
OSPOS_THROTTLE_KEY=<64 hexadecimal characters>
```

Generate two independent values once in PowerShell, from the repository root:

```powershell
$encryptionKey = -join (1..32 | ForEach-Object { '{0:x2}' -f (Get-Random -Maximum 256) })
$throttleKey = -join (1..32 | ForEach-Object { '{0:x2}' -f (Get-Random -Maximum 256) })
```

Use a cryptographically secure generator instead of PowerShell's
`Get-Random` for production deployments. For a secure Windows PowerShell
generation, use PHP if installed:

```powershell
php -r "echo bin2hex(random_bytes(32)), PHP_EOL;"
```

Run that PHP command twice and put the two different outputs in the entries
above. Keep `.env.docker` private and backed up securely. Never commit it.
Do not regenerate either value after the application has stored encrypted
data: changing `OSPOS_ENCRYPTION_KEY` can make existing encrypted values
unreadable.

Start the stack with:

```powershell
docker compose --env-file .env.docker up -d --build
```

The database named volume is not removed or recreated by this procedure.
