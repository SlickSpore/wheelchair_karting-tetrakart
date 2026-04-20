def on_starting(server):
    import subprocess
    subprocess.run(["bash", "access_point/ap_start.sh"])
