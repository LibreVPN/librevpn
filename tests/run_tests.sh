#!/bin/bash

curdir="${0%/*}"
export PATH="${curdir}/..:$PATH"

mkdir -p tmp

OKS=0
FAILS=0
SKIPS=0

test_msg_title() {
  local title="$@"
  printf -v padding '%*s' ${#title}
  echo
  echo "Testing $title"
  echo "========${padding// /=}"
  echo
}

test_msg_title_2() {
  local title="$@"
  printf -v padding '%*s' ${#title}
  echo
  echo "$title"
  echo "${padding// /-}"
  echo
}

test_msg_start() {
  echo -n "Test: $@"
}

test_msg_stop_ok() {
  echo " [OK]"
  let OKS++ || true
}

test_msg_stop_fail() {
  echo " [ERROR]"
  let FAILS++ || true
}

test_msg_stop_skip() {
  echo " [SKIP]"
  let SKIPS++ || true
}

assert() {
  test_msg_start "$@"
  if eval "$@ &>/dev/null" ; then
    test_msg_stop_ok
  else
    test_msg_stop_fail
  fi
}

assert_not() {
  test_msg_start "$@"
  if ! eval "$@ &>/dev/null" ; then
    test_msg_stop_ok
  else
    test_msg_stop_fail
  fi
}

skip() {
  test_msg_start "$@"
  test_msg_stop_skip
}

assert_content() {
  f=$1 ; shift
  test_msg_start "$f contiene $@"
  if test "$(cat $f)" = "$@"; then
    test_msg_stop_ok
  else
    test_msg_stop_fail
  fi
}

assert_equal() {
  eq=$1; shift
  test_msg_start "$eq = $@"
  if test "$eq" = "$(eval "$@ 2>/dev/null")"; then
    test_msg_stop_ok
  else
    test_msg_stop_fail
  fi
}

assert_not_empty_file() {
  test_msg_start "Not empty $1"
  if test $(stat -c %s "$1") -ne 0; then
    test_msg_stop_ok
  else
    test_msg_stop_fail
  fi
}

assert_not_empty_output() {
  test_msg_start "Not empty output for $@"
  if test $(eval "$@" | wc -l) -ne 0; then
    test_msg_stop_ok
  else
    test_msg_stop_fail
  fi
}

for _test in "${curdir}"/test_*; do
  source "${_test}" || continue
done

echo

test_msg_title "Summary"
echo "${OKS} passed, ${FAILS} failed, ${SKIPS} skipped"
echo

test ${FAILS} -eq 0 && rm -rf tmp
