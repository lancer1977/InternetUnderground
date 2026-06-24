# Issue #2 Deployment Health

This note captures the current evidence for GitHub issue #2, "Enable and verify
static archive hosting."

## Acceptance Criteria Status

| Requirement | Current status | Evidence |
| --- | --- | --- |
| Decide intended hosting target | Complete | GitHub Pages is the primary static archive target; IU-HD is a separate R620/Cloudflare lane now live and tracked by issue #10. |
| Verify `index.html` entry point | Live and locally healthy | `https://lancer1977.github.io/InternetUnderground/` returns `HTTP/2 200`; `./scripts/validate-iu-hd.sh` returns `200 OK` for `/` through the local Nginx deployment. |
| Confirm `/iu/` archive entry point | Live and locally healthy | `https://lancer1977.github.io/InternetUnderground/iu/` returns `HTTP/2 200`; `./scripts/validate-iu-hd.sh` returns `200 OK` for `/iu/` through the local Nginx deployment. |
| Confirm relative links and assets | Not complete | `python3 scripts/check-archive-links.py --limit 50` finds deeper archive misses; see `BROKEN_LINKS.md` and issue #11. |
| Add deployment notes to README | Complete | `README.md` lists the live GitHub Pages URL, planned custom domain, IU-HD endpoint, and verification commands. |
| Document public archive URL once live | Complete for the primary URL | GitHub Pages is live at `https://lancer1977.github.io/InternetUnderground/`; the custom archive domain remains pending DNS/Pages configuration in issue #12. |

## Current Blockers

### GitHub Pages

GitHub Pages is healthy for the primary archive URL.

Evidence from the successful Pages run:

- Workflow: `Deploy archive to GitHub Pages`
- Branch: `master`
- Run: `28078178443`
- Commit: `759ce6c577c9bd48f9e1796e06711d5be5aeb3dd`
- Result: success

```bash
gh run list --workflow pages.yml --limit 5
curl -I https://lancer1977.github.io/InternetUnderground/
curl -I https://lancer1977.github.io/InternetUnderground/iu/
```

### Custom Archive Domain

`internetunderground.polyhydragames.com` does not currently resolve from this
machine. The repository has a `CNAME` file, but the current Pages artifact
workflow does not publish it and GitHub Pages reports `cname: null`.
Track this path in GitHub issue #12.

Read-only Cloudflare DNS inventory from 2026-06-24:

- `internetunderground.polyhydragames.com`: no DNS record found.
- `iu.polyhydragames.com`: proxied CNAME to `internetunderground.pages.dev`.
- Existing homelab records such as `radio.polyhydragames.com`,
  `dreadtv.polyhydragames.com`, and `identity.polyhydragames.com` use proxied
  `A` records to `131.241.115.72`.

Do not publish the `CNAME` file in the Pages artifact until DNS and Pages
custom-domain binding are intentionally configured. Publishing it too early can
risk redirecting the working `github.io` URL to a hostname that does not resolve.

Fix requirements:

- Create DNS for `internetunderground.polyhydragames.com` to the intended Pages
  target.
- Configure the GitHub Pages custom domain, either through Pages settings or by
  publishing `CNAME` in the Pages artifact.
- Re-run the Pages deployment after the environment branch policy is corrected.

Repo-local guarded DNS plan:

```bash
./scripts/plan-cloudflare-dns.sh --target archive
```

After operator approval, apply the DNS record with:

```bash
CONFIRM_CLOUDFLARE_DNS_APPLY=yes ./scripts/plan-cloudflare-dns.sh --target archive --apply
```

Verification after the fix:

```bash
dig +short internetunderground.polyhydragames.com
gh api repos/lancer1977/InternetUnderground/pages --jq '{html_url,cname,status,build_type}'
curl -I https://internetunderground.polyhydragames.com/
curl -I https://internetunderground.polyhydragames.com/iu/
```

### IU-HD R620/Cloudflare Lane

The repo-local IU-HD contract, R620 stack, Traefik route, and public hostname
are healthy. This path is tracked by issue #10.

Current public probe result on 2026-06-24:

- `https://iu-hd.polyhydragames.com/` returns `HTTP/2 200` through Cloudflare.
- `https://iu-hd.polyhydragames.com/iu/` returns `HTTP/2 200` through Cloudflare.
- Cloudflare DNS has a proxied `A` record from `iu-hd.polyhydragames.com` to
  `131.241.115.72`.
- R620 local Traefik probes for `/` and `/iu/` return `HTTP/2 200`.

R620 findings:

- R620 is reachable at `192.168.0.21` as `dell-r620-1`.
- `/home/lancer1977/servers/internetunderground` exists and contains the static
  archive entry files.
- The `traefik-public` overlay network exists.
- `iu-hd_web` is deployed with one running replica.
- `docker-compose -f deploy/iu-hd/r620-compose.yml config` renders cleanly on
  R620; `docker compose` v2 is not installed there.
- `./scripts/deploy-iu-hd-r620.sh` runs the R620 preflight without mutating the
  host; `--apply` is required for deployment.
- `./scripts/plan-cloudflare-dns.sh --target iu-hd` shows the DNS change needed
  to point the public hostname at R620; `--apply` plus
  `CONFIRM_CLOUDFLARE_DNS_APPLY=yes` is required for DNS mutation.

Verification after the fix:

```bash
./scripts/test-iu-hd-deploy.sh
./scripts/validate-iu-hd.sh
curl -I https://iu-hd.polyhydragames.com/
curl -I https://iu-hd.polyhydragames.com/iu/
```

## Commands Run

```bash
gh issue view 2 --json number,title,state,body,labels,comments,url
gh issue view 10 --json number,title,state,body,comments,url,labels
./scripts/test-iu-hd-deploy.sh
./scripts/validate-iu-hd.sh
python3 scripts/check-archive-links.py --limit 50
gh run watch 28078178443 --exit-status
curl -L -I --max-time 20 https://lancer1977.github.io/InternetUnderground/
curl -L -I --max-time 20 https://lancer1977.github.io/InternetUnderground/iu/
curl -k -I --max-time 15 --resolve iu-hd.polyhydragames.com:443:131.241.115.72 https://iu-hd.polyhydragames.com/
gh run list --limit 10 --json databaseId,workflowName,headBranch,status,conclusion,createdAt,updatedAt,url
gh api repos/lancer1977/InternetUnderground/pages
gh api repos/lancer1977/InternetUnderground/environments/github-pages/deployment-branch-policies
curl -k -L -I --max-time 15 https://lancer1977.github.io/InternetUnderground/
curl -k -L -I --max-time 15 https://lancer1977.github.io/InternetUnderground/iu/
curl -k -L -I --max-time 15 https://internetunderground.polyhydragames.com/
curl -k -L -I --max-time 15 https://internetunderground.polyhydragames.com/iu/
curl -k -L -I --max-time 15 https://iu-hd.polyhydragames.com/
curl -k -L -I --max-time 15 https://iu-hd.polyhydragames.com/iu/
```
