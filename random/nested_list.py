def even_list(list):

    temp = []
    even_bool = []

    for sublist in list:

        for i in sublist:
            if i % 2 == 0:
                x = True
            else:
                x = False
            temp.append(x)

        y = all(temp)
        even_bool.append(y)
        temp = []

    result = [x for x, y in zip(list, even_bool) if y == True]
    print(result)


even_list([[1, 2, 4], [2, 4, 6], [6, 8, 10], [2]])