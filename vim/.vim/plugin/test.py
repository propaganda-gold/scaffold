
def CreateHash(file_name, start_ln, end_ln):
	with open(file_name, 'r') as f:
		contents = f.readlines()
	part_contents = contents[start_ln:end_ln]
	hash_ = hash(''.join(part_contents))
	hex_ = hex(hash_)
	summary = hex_[-6:]
	print summary
	return summary

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

file_name = 'essay/0.1-9_0c84acd3.1-8_08ac2460.1-6_f54291eb'
print ParseName(file_name)
