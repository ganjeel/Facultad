from os import system

while True:
    n = float(input('\n\nIngrese el número: \n\n'))
    stopProgram = False
    bin = []
    while not stopProgram:
        if n % 2 == 0:
            n = n / 2
            print('      0')
            bin.append(0)
            print(round(n))
        else:
            n = (n - 1) / 2
            print('      1')
            bin.append(1)
            print(round(n))
        if n == 0:
            stopProgram = True
    nbin = []
    for n in range(len(bin)):
        nbin.append(bin[len(bin)-n-1])
    print('\n',nbin)
    input()
    system("clear")
