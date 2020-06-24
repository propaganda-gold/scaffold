py3 << EOF

import vim

def debug_print():
	line_num_str = vim.eval('line(".")')
	line_num_py = int(line_num_str) - 1
	line = vim.current.buffer[line_num_py]
	trimmed = line.strip()
	whitespace_chars = len(line) - len(line.lstrip())
	white = ' ' * whitespace_chars
	nontriv = "%sprint '%s: ', %s" % (white, trimmed, trimmed)
	vim.current.buffer[line_num_py] = nontriv

EOF
