#!/bin/bash

# Define the cleanup function (Your ExecStopPost logic)
cleanup() {
    echo "Running exit script..."
    /usr/share/oem/confidential_space/exit_script.sh
}

# Trap signals: EXIT (script ends), SIGINT (Ctrl+C), SIGTERM (systemd stop)
trap cleanup EXIT SIGINT SIGTERM

echo "Starting Confidential Space launcher..."

# Run the launcher
# We don't use 'exec' here because 'exec' would replace the shell 
# and the trap would never fire.
/usr/share/oem/confidential_space/cs_container_launcher