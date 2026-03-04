#!/bin/bash

# Check if both title and folder name were provided
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Please provide both blog title and folder name"
    echo "Usage: ./new_post.sh 'My Long Blog Title' 'short-folder-name'"
    exit 1
fi

BLOG_TITLE="$1"
FOLDER_NAME="$2"
FOLDER_PATH="blog/$FOLDER_NAME"

# Create folder
mkdir -p "$FOLDER_PATH"

# Create index.qmd with frontmatter
cat > "$FOLDER_PATH/index.qmd" << EOL
---
title: "$BLOG_TITLE"
author: "Peyman Kor"
date: "$(date +%Y-%m-%d)"
categories: []
description: "Add your description here"
---

## Introduction

Your content here...

EOL

echo "Created new blog post at $FOLDER_PATH/index.qmd" 