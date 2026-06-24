# Scripts

This folder contains repo-local validation and generation helpers.

## Deployment Checks

- `test-iu-hd-deploy.sh`: validates the IU-HD compose and Nginx deployment
  contract.
- `validate-iu-hd.sh`: starts the local IU-HD Nginx deployment and verifies
  `/` plus `/iu/` for the configured host names.

## Archive Checks

- `check-archive-links.py`: scans preserved HTML files for missing local links
  and assets. It exits nonzero while missing local targets remain.

Example:

```bash
python3 scripts/check-archive-links.py --limit 25
```
