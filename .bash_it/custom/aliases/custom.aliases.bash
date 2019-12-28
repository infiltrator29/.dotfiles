#Aliases

#Color cat
ccat() {
    highlight --delim-cr --out-format=ansi "$1" | sed -e "s/^/│/" | cat -n 
}

#Color cat (no line nubers)
alias ccatn='highlight --delim-cr --out-format=ansi'

