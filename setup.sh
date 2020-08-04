#!/bin/bash

for f in .*; do
  case $f in
    '.'|'..'|'.git') ;;
    *)               echo "ln -s ~/.dotfiles/$f ~/$f";;
  esac
done
