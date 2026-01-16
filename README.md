# ewidencja

A simple Flask application for recording harvests, work entries, presences and reports.

## Quick start (recommended: use the fix/setup branch)

1. Clone the repo and switch to the branch:
   ```bash
   git clone https://github.com/ReusQ11/ewidencja.git
   cd ewidencja
   git checkout fix/setup
   ```

2. Copy `.env.example` to `.env` and set values (at least set a secure SECRET_KEY):
   ```bash
   cp .env.example .env
   # edit .env and set SECRET_KEY
   ```

3. Create and activate a virtualenv, then install dependencies:
   ```bash
   python -m venv venv
   source venv/bin/activate   # Windows: venv\Scripts\activate
   pip install -r requirements.txt
   ```

4. Initialize the database (optional):
   If you want the app to automatically create the DB and an admin user, set AUTO_INIT_DB=1 in your .env before starting. Alternatively run migrations manually (recommended):

   ```bash
   export FLASK_APP=app.py
   flask db init   # only if migrations/ doesn't exist
   flask db migrate -m "initial"
   flask db upgrade
   ```

5. Run the app:
   ```bash
   export FLASK_APP=app.py
   export FLASK_ENV=development
   flask run
   ```

6. Open http://127.0.0.1:5000/ in your browser.

Security notes:
- Do not commit `.env` to the repository. Put secret values in environment variables or a secure secrets manager.
- The repository previously created a default admin user with password `admin`. This is insecure; use the management command to create admin users instead (see PATCH_APP.md).

