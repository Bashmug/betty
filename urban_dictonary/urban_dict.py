import csv
def urban_dict(word):
	with open('urban_dictonary/urban_dictionary.csv', 'rt') as f:
		reader = csv.reader(f, delimiter=',')
		for row in reader:
			if word == row[1]:#what to do with dublicates ? remove them , how ?
				print (row[0])
		else:
			return 0
