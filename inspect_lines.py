path = "c:/Users/'tzert/RST/Features/Automation/AutoConjuring.lua"
with open(path, 'rb') as f:
    lines = f.read().split(b'\n')
for i, line in enumerate(lines[221:230], start=222):
    print(i, repr(line))
