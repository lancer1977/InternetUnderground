# Issue #2 Deployment Health

This note captures the current evidence for GitHub issue #2, "Enable and verify
static archive hosting."

## Acceptance Criteria Status

| Requirement | Current status | Evidence |
| --- | --- | --- |
| Decide intended hosting target | Complete | GitHub Pages is the primary static archive target; IU-HD is a separate R620/Cloudflare lane tracked by issue #10. |
| Verify `index.html` entry point | Live and locally healthy | `https://lancer1977.github.io/InternetUnderground/` returns `HTTP/2 200`; `./scripts/validate-iu-hd.sh` returns `200 OK` for `/` through the local Nginx deployment. |
| Confirm `/iu/` archive entry point | Live and locally healthy | `https://lancer1977.github.io/InternetUnderground/iu/` returns `HTTP/2 200`; `./scripts/validate-iu-hd.sh` returns `200 OK` for `/iu/` through the local Nginx deployment. |
| Confirm relative links and assets | Not complete | `python3 scripts/check-archive-links.py --limit 50` finds deeper archive misses; see `BROKEN_LINKS.md` and issue #11. |
| Add deployment notes to README | Complete | `README.md` lists the live GitHub Pages URL, planned custom domain, IU-HD endpoint, and verification commands. |
| Document public archive URL once live | Complete for the primary URL | GitHub Pages is live at `https://lancer1977.github.io/InternetUnderground/`; the custom archive domain remains pending DNS/Pages configuration. |

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

Fix requirements:

- Create DNS for `internetunderground.polyhydragames.com` to the intended Pages
  target.
- Configure the GitHub Pages custom domain, either through Pages settings or by
  publishing `CNAME` in the Pages artifact.
- Re-run the Pages deployment after the environment branch policy is corrected.

Verification after the fix:

```bash
dig +short internetunderground.polyhydragames.com
gh api repos/lancer1977/InternetUnderground/pages --jq '{html_url,cname,status,build_type}'
curl -I https://internetunderground.polyhydragames.com/
curl -I https://internetunderground.polyhydragames.com/iu/
```

### IU-HD R620/Cloudflare Lane

The repo-local IU-HD contract and local Nginx smoke checks pass. The public
hostname is not proven healthy and is tracked separately by issue #10.

Current public probe result on 2026-06-24:

- `https://iu-hd.polyhydragames.com/` resolves through Cloudflare but returns
  `HTTP/2 404` with GitHub Pages-style headers.
- `https://iu-hd.polyhydragames.com/iu/` returns the same `HTTP/2 404`.

Fix requirements:

- Point `iu-hd.polyhydragames.com` at the actual R620 ingress path.
- Deploy `deploy/iu-hd/r620-compose.yml` on the R620 host with the expected
  static site root.
- Validate Traefik TLS routing to the Nginx container.

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
