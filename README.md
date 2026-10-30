# LiveVult — Private Personal Cloud

A private, single-owner cloud drive with a mobile-first web interface. Files are stored privately in Cloudflare R2; metadata lives in Cloudflare D1. The app is deployed as one Cloudflare Worker with static assets.

## Important
- This repository contains the editable source code; it does not yet contain your cloud files.
- LiveVult does **not** claim that storage is configured until you create the R2 bucket, D1 database, and secrets.
- The initial upload endpoint accepts files up to **90 MB each**. The 15 GB figure is a storage target/quota, not a promise of provider-provisioned space.
- Keep this repository private if you do not want others to inspect the app source. Never commit passwords, API tokens, or private file data.

## Deploy (one-time setup)
1. Create a Cloudflare account and an R2 bucket named `livevult-files`.
2. Create a D1 database named `livevult-db`.
3. In this repo, edit `wrangler.jsonc`: replace `REPLACE_WITH_D1_DATABASE_ID` with the D1 database ID from Cloudflare. Keep the R2 bucket name consistent.
4. From a terminal with Wrangler installed, run:
   ```sh
   npm install
   npx wrangler d1 execute livevult-db --remote --file=./schema.sql
   npx wrangler secret put LIFEVAULT_PASSWORD
   npx wrangler secret put SESSION_SECRET
   npm run deploy
   ```
   Use a long unique password and a random session secret (at least 32 characters). Do not share either.
5. Open the Worker URL. Sign in with the password you configured.

## Edit from Android
Open this repository on GitHub, tap `.` (period) or visit `https://github.dev/TahsinullahR/LiveVult`. Edit files and commit changes. GitHub's browser editor is for source editing; it does not run the app. Deploy updated commits using Wrangler from a cloud development environment such as Cloudflare's supported tooling.

## Features
- Password-protected single-owner access
- Upload, download, search, folders, rename/move, trash, restore, permanent delete
- Storage usage meter and mobile-first layout
- Private R2 object storage and D1 metadata

## Security and limitations
Use HTTPS. Do not expose R2 publicly. The Worker checks the signed session cookie on every data route. This starter is intended for one owner, not public multi-user registration. Keep backups of important files in another location. Cloud-provider charges, request limits, and account policies apply.
