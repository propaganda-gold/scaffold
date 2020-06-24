python3 << EOF
import vim

def SwitchFileType(type_key):
	current_fname = vim.eval("@%")
	base_part = current_fname.split('.')[0]
	if base_part.endswith('_test'):
		base_part = base_part[0:-5]
	dir_parts = current_fname.split('/')
	dir_part = '/'.join(dir_parts[:-1])

	new_file = None
	if type_key == 'h':
		new_file = base_part + '.h'
	if type_key == 'cc':
		new_file = base_part + '.cc'
	if type_key == 'test':
		new_file = base_part + '_test.cc'
	if type_key == 'b':
		new_file = dir_part + '/BUILD'

	if new_file:
		vim.command(":edit " + new_file)
EOF
