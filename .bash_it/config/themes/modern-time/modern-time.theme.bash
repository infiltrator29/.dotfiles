# Modified version of the original modern theme in bash-it
# Removes the battery charge and adds the current time

SCM_THEME_PROMPT_PREFIX=""
SCM_THEME_PROMPT_SUFFIX=""

SCM_THEME_PROMPT_DIRTY=" \[\e[1;34m\]✗${normal}"
SCM_THEME_PROMPT_CLEAN=" \[\e[1;35m\]✓${normal}"
SCM_GIT_CHAR="${bold_red}±${normal}"
SCM_SVN_CHAR="${bold_white}⑆${normal}"
SCM_HG_CHAR="${bold_blue}☿${normal}"

case $TERM in
	xterm*)
	TITLEBAR="\[\033]0;\w\007\]"
	;;
	*)
	TITLEBAR=""
	;;
esac

PS3=">> "

is_vim_shell() {
	if [ ! -z "$VIMRUNTIME" ]
	then
		echo "[\[\e[1;35m\]vim shell${normal}]"
	fi
}

modern_scm_prompt() {
	CHAR=$(scm_char)
	if [ $CHAR = $SCM_NONE_CHAR ]
	then
		return
	else
		echo "[$(scm_char)][$(scm_prompt_info)]"
	fi
}

modern_current_time_prompt() {
	echo "[\[\e[1;35m\]$(date '+%l:%M%p')${normal}]"
}

#Show virtualenv prompt
pythonP() {
    echo "$(python_version_prompt | sed s/py-.*$//)"
}

prompt() {
	if [ $? -ne 0 ]
	then
		# Yes, the indenting on these is weird, but it has to be like
		# this otherwise it won't display properly.

        PS1="${TITLEBAR}${bold_blue}┌─${reset_color}$(modern_scm_prompt)$(modern_current_time_prompt)[${bold_red}\W${normal}]$(is_vim_shell)$(pythonP)
${bold_blue}└─▪${normal} "
	else
            PS1="${TITLEBAR}┌─$(modern_scm_prompt)$(modern_current_time_prompt)[${bold_red}\W${normal}]$(is_vim_shell)$(pythonP)
└─▪ "
	fi
}

PS2="└─▪ "



safe_append_prompt_command prompt
