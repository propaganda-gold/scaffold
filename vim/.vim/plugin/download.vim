py3 << EOF

import vim

import os

def SummarizeWebPage():
	vim.command(':w')
	start_ln = current_ln()
	url = vim.current.buffer[start_ln].strip()
	file_name = current_file_name()
	file_name =  FullCurrentFileName()
	os.system('python /home/gcop/cryptoboss/cryptoboss/scraping/download_text.py ' + url + ' ' + file_name)
	vim.command(':e ' + file_name)
EOF

