#!/usr/bin/env bash


check_changed_lines() {
	# ANSI color codes
	GREEN='\033[1;32m'
	YELLOW='\033[1;33m'
	NO_COLOR='\033[0m'

	# Emojis
	START_EMOJI="🚀"
	WARNING_EMOJI="🤔"

	# Start message
	echo -e "${GREEN}${START_EMOJI} My pre-commit checks starting...${NO_COLOR}"

	# Set the maximum number of lines you consider acceptable for a commit.
	MAX_LINES=250

	# Calculate the number of lines added or removed in the commit.
	TOTAL_LINES_CHANGED=$(git diff --cached --numstat | awk '{ lines += $1 + $2 } END { print lines }')
	# Default TOTAL_LINES_CHANGED to 0 if it is empty.
	TOTAL_LINES_CHANGED=${TOTAL_LINES_CHANGED:-0}

	if [ "$TOTAL_LINES_CHANGED" -eq 0 ]; then
		return 0
	fi

	# Check if the total number of lines changed exceeds the maximum.
	if [ "$TOTAL_LINES_CHANGED" -gt "$MAX_LINES" ]; then
		echo -e "${YELLOW}Warning: ${WARNING_EMOJI} Large commit detected ($TOTAL_LINES_CHANGED lines changed, max is $MAX_LINES). Consider breaking it down into smaller commits.${NO_COLOR}"
	fi

	# Exit with zero to allow the commit to proceed anyway
	return 0
}

check_changed_lines "$@"
