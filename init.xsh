#!/usr/bin/env xonsh

import sys
import os
import shutil
from pathlib  import Path

modeGist = {
  '537c5fed0748cb2cf889bab3ff866667' : {'name':'m1NOR'},
  '7a5ff7b6fb13e52ad1ae63445536ca4b' : {'name':'m2INS'},
  'cd44f7fd307f22d52d59f74c0967faaf' : {'name':'m3SEL'},
  '476cb89ca592befe598617a4af733910' : {'name':'nSpace'},
  '235396cdfbd07f19f6af1e26dff1e949' : {'name':'nGoTo'},
  'b885c21cc83ae06108b3da6728148191' : {'name':'nUnimpaired'},
  '22a4426747d045cc828e0d125af3a540' : {'name':'nWindow'},
  '1b083641d649a424a7edbf1a491aff75' : {'name':'nMatch'},
  '94d728fc74d61af4de9ed17ff7d8566d' : {'name':'nView'},
}

gist_url_pre = 'https://gist.github.com/eugenesvk'
for gist, v in modeGist.items():
  gist_url   	= f"{gist_url_pre}/{gist}"
  folder_name	= v['name']
  gist_path = Path(f"./{folder_name}")
  git submodule add f"{gist_url}" f"{gist_path}"
  if gist_path.exists():
    cd f"{gist_path}"
    pwd
    git rebase -i --root
    git push -f
  # find a way to not exit here

# print(f"Updating all submodules")
# git submodule update --init --recursive
