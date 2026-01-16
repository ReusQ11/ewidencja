PATCH NOTES / INSTRUCTIONS

I have added supporting files (requirements, .env.example, Dockerfile, .gitignore, README) to the fix/setup branch.

Important: the repository's app.py contains some behavior that runs on import (automatic DB creation and migration). To avoid unexpected automatic migrations or DB changes, please do one of the following before running the app:

1) Easiest (recommended for testing):
   - Edit `app.py` and find occurrences where `db.create_all()` and/or `upgrade()` are called inside `with app.app_context():` blocks.
   - Wrap those blocks with a check for environment variables, for example:

```python
if os.environ.get('AUTO_INIT_DB', '0') == '1':
    with app.app_context():
        db.create_all()
        # create admin user code...

# and for migrations:
if os.environ.get('AUTO_MIGRATE', '0') == '1':
    from flask_migrate import upgrade
    with app.app_context():
        upgrade()
```

Then run with `AUTO_INIT_DB=0` and `AUTO_MIGRATE=0` (the defaults in .env.example). Create users with the provided management commands or via the UI.

2) Preferable (refactor):
   - Move DB initialization and admin-creation into a Flask CLI command or separate management script (e.g., `manage.py`) so they are run explicitly.

If you want, I can proceed to apply these code changes directly in the branch (modify `app.py` to read SECRET_KEY from env and wrap the init/upgrade calls with environment checks) and open a Pull Request. Tell me to proceed and I'll commit the patch to `fix/setup` and create a PR.
