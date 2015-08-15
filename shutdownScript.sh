#!/bin/bash
echo "Killing all Ruby processes..."
$(pgrep ruby | xargs kill -9 &> /dev/null) && echo "Success!" || echo "No processes to kill..."
