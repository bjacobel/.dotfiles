#!/bin/bash

for f in .*; do
  case $f in
    '.'|'..'|'.git') ;;
    *)               ln -s ~/.dotfiles/$f ~/$f;;
  esac
done
