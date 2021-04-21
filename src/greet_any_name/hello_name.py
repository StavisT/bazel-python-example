import sys

from src.greet_any_name.greeting import greet

def run_greet():
    if len(sys.argv) == 1:
        print("No input arguments provided")
        return
    
    name= sys.argv[1]
    greet(name)

if __name__ == "__main__":
    run_greet()
