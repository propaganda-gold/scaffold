py3 << EOF

import vim

kSuffix = ".focus"

def number_starting_tabs(line):
	for idx, c in enumerate(line):
		if c != '\t':
			return idx
	return len(line)
def current_file_name():
	return vim.eval('@%')
def FullCurrentFileName():
	return vim.eval("expand('%:p')")
def FindEndPoint(start_ln, buffer_lines):
	start_line = buffer_lines[start_ln]
	start_number = number_starting_tabs(start_line)
	curr_ln = start_ln + 1
	while curr_ln < len(buffer_lines):
		curr_number = number_starting_tabs(buffer_lines[curr_ln])
		if curr_number <= start_number:
			return curr_ln
		curr_ln += 1
	return curr_ln
def current_ln():
	ln_str = vim.eval('line(".")')
	return int(ln_str) - 1
def remove_tabs(lines, num_tabs):
	result = []
	for line in lines:
		result.append(line[num_tabs:])
	return result
def add_tabs(lines, num_tabs):
	result = []
	for line in lines:
		result.append('\t' * num_tabs + line)
	return result

def HashLines(part_contents):
	list_ = list(part_contents)
	hash_ = hash(''.join(part_contents))
	hex_ = hex(hash_)
	summary = hex_[-8:]
	return summary

def CreateHash(file_name, start_ln, end_ln):
	with open(file_name, 'r') as f:
		contents = [s for s in f.readlines()]
	part_contents = contents[start_ln:end_ln]
	return HashLines(part_contents)

def ParseName2(file_name):
	try:
		hash_parts = file_name.split('_')
		hash_part = hash_parts[1]
		parts = hash_parts[0].split('.')
		last_parts = parts[-1].split('-')
		if len(last_parts) != 2:
			return None
		file_path = '.'.join(parts[:-1])
		return (file_path, int(last_parts[0]), int(last_parts[1]), hash_part)
	except IndexError:
		return None

def ParseName(file_name):
	try:
		dot_parts = file_name.split('.')
		print('dot_parts', dot_parts)

		underscore_parts = dot_parts[-1].split('_')
		print('underscore_parts', underscore_parts)

		dash_parts = underscore_parts[0].split('-')
		print('dash_parts', dash_parts)

		file_path = '.'.join(dot_parts[0:-1])
		return (file_path, int(dash_parts[0]), int(dash_parts[1]), underscore_parts[-1])
	except IndexError:
		return None
	except ValueError:
		return None

def CreateName(file_name, start_ln, end_ln):
	return file_name + '.' + str(start_ln) + '-' + str(end_ln) + '_' + CreateHash(file_name, start_ln, end_ln)

import random
def CreateRandomHash():
	characters = '0123456789abcdefgh'
	buf = ''
	for i in range(0, 8):
		c = random.randint(0, len(characters))
		buf += characters[c]

	return buf

def InsertRandomHash():
	ln = current_ln()
	vim.current.buffer[ln] += ' #' + CreateRandomHash()

def SaveAll():
	curr_file_name = current_file_name()
	while True:
		print('curr_file_name', curr_file_name)
		parsed_file_name = ParseName(curr_file_name)
		if not parsed_file_name:
			break
		curr_file_name = parsed_file_name[0]
	print('done')

def ZoomIn(stop_after_hash=False):
	start_ln = current_ln()
	end_ln = FindEndPoint(start_ln, vim.current.buffer)
	focus_name = CreateName(current_file_name(), start_ln, end_ln)
	if stop_after_hash:
		return
	vim.command(':w')
	if start_ln == 0 and end_ln == len(vim.current.buffer):
		return
	selected_lines = vim.current.buffer[start_ln:end_ln]
	shifted_lines = remove_tabs(selected_lines, number_starting_tabs(vim.current.buffer[start_ln]))
	vim.command(':e ' + focus_name)
	vim.current.buffer[:] = shifted_lines
	vim.command(':w')

def WriteBack():
	vim.command(':w')
	file_name = current_file_name()
	parsed_file_name = ParseName(file_name)
	if not parsed_file_name:
		return
	lines = vim.current.buffer[:]
	vim.command(':bw')

	import os
	# os.remove(file_name)
	vim.command(':e ' + parsed_file_name[0])
	assert len(parsed_file_name) > 0
	current_vim_range = list(vim.current.buffer[parsed_file_name[1]:parsed_file_name[2]])
	current_lines = []
	for line in current_vim_range:
		current_lines.append(line)
	saved_hash = parsed_file_name
	[start_ln, end_ln] = [parsed_file_name[1], parsed_file_name[2]]
	fresh_hash = CreateHash(parsed_file_name[0], start_ln, end_ln)
	assert len(current_vim_range) > 0
	num_tabs_needed = number_starting_tabs(current_vim_range[0])
	vim.current.buffer[parsed_file_name[1]:parsed_file_name[2]] = add_tabs(lines, num_tabs_needed)
	vim.command(':w')

EOF

