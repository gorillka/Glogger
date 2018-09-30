#! /usr/bin/env bash

if ! which swiftformat &> /dev/null; then
  printf "\e[1;31mYou don't have SwiftFormat installed.  Please install swift format by visiting https://github.com/nicklockwood/SwiftFormat.\e[0m\n"
  exit 1
fi

OUTPUT=$(swiftformat \
  --cache ignore \
  --indent 4 \
  --allman false \
  --wraparguments afterfirst \
  --wrapelements beforefirst \
  --exponentcase uppercase \
  --binarygrouping none \
  --empty tuples \
  --ranges nospace \
  --trimwhitespace always \
  --hexliteralcase lowercase \
  --linebreaks lf \
  --decimalgrouping none \
  --commas inline \
  --comments ignore \
  --octalgrouping none \
  --hexgrouping none \
  --semicolons inline \
  --disable redundantSelf,unusedArguments,hoistPatternLet,redundantBackticks,redundantReturn,linebreakAtEndOfFile \
  --exclude tooling \
  .)

if [ "$OUTPUT" ]; then
  echo "$OUTPUT" >&2
  exit 0
fi
