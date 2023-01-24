# shellcheck shell=bash
# shellcheck disable=SC2034 # Expected behavior for themes.

SCM_THEME_PROMPT_DIRTY=" ${red?}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green?}✓"
SCM_THEME_PROMPT_PREFIX=" ${green?}|"
SCM_THEME_PROMPT_SUFFIX="${green?}|"

GIT_THEME_PROMPT_DIRTY=" ${red?}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green?}✓"
GIT_THEME_PROMPT_PREFIX=" ${green?}|"
GIT_THEME_PROMPT_SUFFIX="${green?}|"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

function __bobby_clock() {
	printf '%s' "$(clock_prompt) "

	if [[ "${THEME_SHOW_CLOCK_CHAR:-}" == "true" ]]; then
		printf '%s' "$(clock_char) "
	fi
}

function prompt_command() {
	PS1="\n$(battery_char) $(__bobby_clock)"
	PS1+="${yellow?}$(ruby_version_prompt) "
	PS1+="${purple?}\h "
	PS1+="${reset_color?}in "
	PS1+="${green?}\w\n"
	PS1+="${bold_cyan?}$(scm_prompt_char_info) "

	tfworkspace=$(terraform_workspace_prompt)
	if [ -n "$tfworkspace" ]; then
		PS1+="${bold_cyan?}TF:${tfworkspace} "
	fi

	direnv_loaded=$(direnv status | grep -c "Found RC path")
	if [ "$direnv_loaded" -eq 1 ]; then
		rcfile=$(direnv status | grep "Found RC path" | awk '{print $4}')
		if [ -L "$rcfile" ]; then
			rcfile=$(readlink "$rcfile")
		fi
		PS1+="${purple?}$(basename $rcfile) "
	fi

	PS1+="${green?}→${reset_color?} "
}

: "${THEME_SHOW_CLOCK_CHAR:="true"}"
: "${THEME_CLOCK_CHAR_COLOR:=${red?}}"
: "${THEME_CLOCK_COLOR:=${bold_cyan?}}"
: "${THEME_CLOCK_FORMAT:="%Y-%m-%d %H:%M:%S"}"

safe_append_prompt_command prompt_command
