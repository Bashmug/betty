#-*- coding: utf-8-*-
import csv
def urban_dict(word):
	with open('urban_dictonary/urban_dictionary.csv', 'rt', encoding="utf8") as f:
		reader = csv.reader(f, delimiter=',')
		for row in reader:
			if word == row[1]:#what to do with duplicates ? remove them , how ?
				print (row[0])
		else:
			return 0

def entries_with(subs):
	with open('urban_dictonary/urban_dictionary.csv', 'rt', encoding="utf8") as f:
		reader = csv.reader(f, delimiter=',')
		for row in reader:
			if row[1].find(subs) != -1:#searching for an entry with the substring within it
				print ("Word:",row[1],"\nDefinition:",row[0],"\n\n")
		else:
			return 0
