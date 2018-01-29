jupyter notebook --generate-config
echo "Modify .ip (and .open_browser) for remote access"
nano ~/.jupyter/jupyter_notebook_config.py
jupyter notebook password
