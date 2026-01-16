# PowerShell script to setup and run the Flask application

# Create the virtual environment
python -m venv venv

# Activate the virtual environment
.\venv\Scripts\Activate.ps1

# Install requirements
pip install -r requirements.txt

# Run migrations
flask db upgrade

# Create admin user
python create_admin.py

# Run the Flask application
flask run