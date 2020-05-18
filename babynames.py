#########################################################
###    Run This Code To Download And Load The Data    ###
#########################################################

# This code creates a dataset called `babynames`, which is
# the dataset on baby names from the Social Security
# Administration.  Data is organized by state, then year,
# then gender, then name, and then finally the number of
# babies born that year with that name.  Names that
# occurred less than 5 times that year are not included.
# The code also saves a copy of the dataset in a file on
# your computer.  The next time that you run the script,
# it will first try to load the dataset directly from your
# computer.  If it doesn't find it, then it will go ahead
# and try to download the file.
import matplotlib.pyplot as plt
from zipfile import ZipFile
import sqlite3

babylist = []
def readnames(path):
    babynames = {}
    with ZipFile(path) as babyzip:
        for filename in [filename for filename in babyzip.namelist() if ".TXT" in filename]:
            if __name__ == '__main__':
                print("Loading data for " + (filename[:2]))
            with babyzip.open(filename) as state:
                for line in [line for line in state.read().decode().splitlines() if line != '']:
                    state, sex, year, name, count = line.split(',')
                    babylist.append((state, sex, year, name, count))
                    year = int(year)
                    count = int(count)
                    if state not in babynames:
                        babynames[state] = {sex:{year:{name:count}}}
                    elif sex not in babynames[state]:
                        babynames[state][sex] = {year:{name:count}}
                    elif year not in babynames[state][sex]:
                        babynames[state][sex][year] = {name: count}
                    else:
                        babynames[state][sex][year][name] = count
    return babynames


babynames = {}
zipname = "babynames.zip"
try:
    # Assume the file exists.  Try to open it.
    babynames = readnames(zipname)
except:
    # The file open() failed.
    try:
        # Try to download the file.
        from urllib.request import urlopen
        if __name__ == '__main__':
            print("Fetching the file from the interwebs...")
            print("NOTE: This will take a while. The file is around 20 megabytes!  And that's compressed, too!")
        response = urlopen("https://www.ssa.gov/oact/babynames/state/namesbystate.zip")

        # Write the downloaded data to a file.
        with open(zipname, 'wb') as babyfile:
            babyfile.write(response.read())
        babynames = readnames(zipname)
    except:
        # Something else went wrong.
        # Raise another Exception, which will cause
        # the script to stop running (with an error).
        if __name__ == '__main__':
            raise Exception("Could not load file.")

        
total = 0
for state in babynames:
    for sex in babynames[state]:
        for year in babynames[state][sex]:
            total += len(babynames[state][sex][year])


males = 0
females = 0
for state in babynames:
    for sex in babynames[state]:
        for year in babynames[state][sex]:
            for name in babynames[state]["M"][year]:
                males += babynames[state]["M"][year][name]
            for name in babynames[state]["F"][year]:
                females += babynames[state]["F"][year][name]
            #total += len(babynames[state][sex][year])
if __name__ == '__main__':
    print("There are {} males and {} females".format(males,females))
            
            
if __name__ == '__main__':
    print('Baby Names data is loaded.  There are %d records.' % total)
    #print("There are {} males and {} females".format(males,females))
# Code from previous semester

def get_frequency(name):  
    f = {}
    
    db = sqlite3.connect("babynames.db")
    db.row_factory = sqlite3.Row
    cursor = db.cursor()
    
    cursor.execute("""SELECT total, year
                   FROM data
                   WHERE name = ?
                   ORDER BY year ASC""", [name])
    
    #row = cursor.fetchone()
    
    
    for row in cursor.fetchall():
        print(row["total"])
        f[row["year"]] = row["total"]
    
    return f


plt.figure()
if __name__ == '__main__':
    for name in ["Ringo", "Paul", "John", "George"]:
        totals = get_frequency(name)
        plt.plot([*totals.keys()], [*totals.values()], label=name)
    plt.legend()