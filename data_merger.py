from petl import fromxml, look,tocsv,fromcsv
import csv
import pandas

xml_records = fromxml('Country_location.xml','tr', 'td')
countries = ['Aruba','Afghanistan','Angola','Anguilla','Albania','Andorra','United Arab Emirates','Argentina','Armenia','Antigua and Barbuda','Australia','Austria','Azerbaijan','Burundi','Belgium','Benin','Bonaire Sint Eustatius and Saba','Burkina Faso','Bangladesh','Bulgaria','Bahrain','Bahamas','Bosnia and Herzegovina','Belarus','Belize','Bolivia','Aruba']
#countries = ['Aruba', ' Afghanistan',  'Angola',  'Anguilla',  'Albania',  'Andorra',  'United Arab Emirates',  'Argentina', ' Armenia',  'Australia','Austria','Azerbaijan','Burundi','Belgium']


countries_xml = []
records_from_github = []
new_records = []

for item in xml_records:
    row = list(item)
    for i in row:
        if i in countries:
            countries_xml.append(row)


with open('from_github.csv', 'r') as read_obj:

    csv_reader = csv.reader(read_obj)

    records_from_github = list(csv_reader)


for i in records_from_github:
    for j in countries_xml:
        if j[3] == i[0]:
            i[11] = j[1]
            i[12] = j[2]
            new_records.append(i)


new_records.insert(0,records_from_github[0])

with open('covid_countries.csv', 'a') as outcsv:
    #configure writer to write standard csv file
    writer = csv.writer(outcsv, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL, lineterminator='\n')
    writer.writerow(i for i in new_records[0])
    new_records.pop(0)
    for item in new_records:
        #Write item to outcsv
        writer.writerow(item)
