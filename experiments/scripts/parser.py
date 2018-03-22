import sys


if __name__ == "__main__":
    mapfile = sys.argv[1]
    lines = open(mapfile, "r").read().splitlines()
    split = [l.split(";") for l in lines[:len(lines)-1]]
    split = list(map(lambda x : [x[1],x[4]], split))

    initial = split[0][0].split("=")[1]

    data = []
    for x in split:
    	timestamp = int(x[0].split("=")[1]) - int(initial)
    	power = x[1].split("=")[1]
    	data.append((str(timestamp), power[:len(power)-3]))

    data_file = mapfile[:len(mapfile)-4] + "_parsed.txt"
    with open(data_file, 'w') as f:
    	for (timestamp, power) in data:
    		f.write(timestamp + " " + power + "\n")