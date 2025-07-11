class File(object):
    def __init__(self, name, method):
        self.name= open(name, method)
    def __enter__(self):
        return self.name
    def __exit__(self, type, value, traceback):
        self.name.close()
f = File()
with f("demo.txt") as fil:
    fil.read()