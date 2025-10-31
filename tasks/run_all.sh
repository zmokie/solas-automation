#!/bin/bash
ping -c1 8.8.8.8 >/dev/null 2>&1 && echo "Internet OK" || echo "No internet"
