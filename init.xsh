#!/usr/bin/env xonsh

import sys
import os
import shutil
import glob
from pathlib  import Path

modeGist = {
  '537c5fed0748cb2cf889bab3ff866667' : {'folder':'m1NOR'      	,'file':'m1NOR' },
  '7a5ff7b6fb13e52ad1ae63445536ca4b' : {'folder':'m2INS'      	,'file':'m2INS' },
  'cd44f7fd307f22d52d59f74c0967faaf' : {'folder':'m3SEL'      	,'file':'m3SEL' },
  '476cb89ca592befe598617a4af733910' : {'folder':'nSpace'     	,'file':'nSpace' },
  '235396cdfbd07f19f6af1e26dff1e949' : {'folder':'nGoTo'      	,'file':'nGoTo' },
  'b885c21cc83ae06108b3da6728148191' : {'folder':'nUnimpaired'	,'file':'nUnimpaired' },
  '22a4426747d045cc828e0d125af3a540' : {'folder':'nWindow'    	,'file':'nWindow' },
  '1b083641d649a424a7edbf1a491aff75' : {'folder':'nMatch'     	,'file':'nMatch' },
  '94d728fc74d61af4de9ed17ff7d8566d' : {'folder':'nView'      	,'file':'nView' },
  '393740006d033466442e89fb6fd23d96' : {'folder':'nTemplate'  	,'file':'nTemplate' },
  '99fc2826e486cb1fac7ab574e43c17d2' : {'folder':'nLabelMod'  	,'file':'nLabelMod' },
  '221315196dc4c3aba34b3f4412708746' : {'folder':'nLabelKey'  	,'file':'nLabelKey' },
}

gist_url_pre	= 'https://gist.github.com/eugenesvk'
kle_name_pre	= 'helix-keymap-modifew-'
kle_url_pre 	= 'http://www.keyboard-layout-editor.com/#/gists'
kle_name_pre	= 'helix-keymap-modifew-'
target_files=["t2.json", "test.json"]
for gist, v in modeGist.items():
  gist_url   	= f"{gist_url_pre}/{gist}"
  folder_name	= v['folder']
  gist_path  	= Path(f"./{folder_name}")
  kle_name   	= v['file']
  if not True: # 1 add submodules
    git submodule add f"{gist_url}" f"{gist_path}"
  if not True: # 2 remove edit history junk (find a way to not exit here)
    if gist_path.exists():
      cd f"{gist_path}"
      pwd
      git rebase -i --root
      git push -f
  if not True: # 3 copy&rename KLE config files
    kle_glob = glob.glob(f"{gist_path}/*Helix*modi*.json")
    kle_path = Path(f"./build/{kle_name_pre}{kle_name}.json")
    for f in kle_glob:
      print(f"copying {f} to\t {kle_path}")
      os.makedirs(os.path.dirname(kle_path), exist_ok=True)
      shutil.copy(f, kle_path)
      break
  if True: # 4 create KLE url files
    kle_url 	= f"{kle_url_pre}/{gist}"
    kle_path	= Path(f"./build/{kle_name_pre}{kle_name}.url")
    print(f"creating url {kle_url} at\t {kle_path}")
    os.makedirs(os.path.dirname(kle_path), exist_ok=True)
    with open(f'{kle_path}','w') as file:
      file.write(f'[InternetShortcut]\nURL={kle_url}')

# print(f"Initializing")
# git submodule update --init --recursive
# print(f"Updating all submodules")
# git submodule update --recursive --remote
