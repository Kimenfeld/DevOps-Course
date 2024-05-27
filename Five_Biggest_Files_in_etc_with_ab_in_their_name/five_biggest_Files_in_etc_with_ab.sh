#!/bin/bash

# Find the five biggest files in /etc/ and its subfolders that have "ab" in their name
find /etc -type f -iname '*ab*' -printf '%s %p\n' 2>/dev/null | sort -nr | head -n 5 | awk '{print $2}'
