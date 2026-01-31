#!/bin/bash

version=$( git describe --tags --always )
tag=$( git describe --tags --always --abbrev=0 )

if [ "$version" = "$tag" ]; then # on a tag
  current="$tag"
  previous=$( git describe --tags --abbrev=0 HEAD~ )
  if [[ $previous == *beta* ]]; then
    if [[ $tag == *beta* ]]; then
      previous=$( git describe --tags --abbrev=0 HEAD~ )
    else
      previous=$( git describe --tags --abbrev=0 --exclude="*beta*" HEAD~ )
    fi
  else
    previous=$( git describe --tags --abbrev=0 HEAD~ )
  fi
else
  current=$( git log -1 --format="%H" )
  previous="$tag"
fi

date=$( git log -1 --date=short --format="%ad" )
url=$( git remote get-url origin | sed -e 's/^git@\(.*\):/https:\/\/\1\//' -e 's/\.git$//' )

# Changlog.md
echo -ne "# [${version}](${url}/tree/${current}) ($date)\n\n[Full Changelog](${url}/compare/${previous}...${current})\n\n" > "CHANGELOG.md"

if [ "$version" = "$tag" ]; then # on a tag
  highlights=$( git cat-file -p "$tag" | sed -e '1,5d' -e '/^-----BEGIN PGP/,/^-----END PGP/d' )
  echo -ne "## Highlights\n\n${highlights}\n\n## Commits\n\n" >> "CHANGELOG.md"
fi

git shortlog --no-merges --reverse "$previous..$current" | sed -e  '/^\w/G' -e 's/^      /- /' >> "CHANGELOG.md"

# Changelog.lua
echo -ne "if not MateAuras.IsLibsOK() then return end\n---@type string\nlocal AddonName = ...\n---@class OptionsPrivate\nlocal OptionsPrivate = select(2, ...)\n" >> "MateAurasOptions/Changelog.lua"
echo -ne "OptionsPrivate.changelog = {\n" >> "MateAurasOptions/Changelog.lua"
echo -ne "  versionString = '$version',\n" >> "MateAurasOptions/Changelog.lua"
echo -ne "  dateString = '$date',\n" >> "MateAurasOptions/Changelog.lua"
echo -ne "  fullChangeLogUrl = '${url}/compare/${previous}...${current}',\n" >> "MateAurasOptions/Changelog.lua"
if [ "$version" = "$tag" ]; then # on a tag
  echo -ne "  highlightText = [==[\n" >> "MateAurasOptions/Changelog.lua"
  echo -ne "$highlights" >> "MateAurasOptions/Changelog.lua"
  echo -ne "]==]," >> "MateAurasOptions/Changelog.lua"
fi
echo -ne "  commitText = [==[" >> "MateAurasOptions/Changelog.lua"
git shortlog --no-merges --reverse "$previous..$current" | sed -e  '/^\w/G' -e 's/^      /- /' >> "MateAurasOptions/Changelog.lua"
echo -ne "]==]\n}" >> "MateAurasOptions/Changelog.lua"
