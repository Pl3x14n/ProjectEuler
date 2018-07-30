content = open("..\Inputs\Input059.txt", "r").read()
nums = [int(x) for x in content.replace("\n", "").split(",")]
valid = [ord(c) for c in "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 ;,.!?'()"]

for x in range(97, 123):
    for y in range(97, 123):
        for z in range(97, 123):
            key = (x, y, z)
            text = ""
            for idx, char in enumerate(nums):
                char = char ^ key[idx % 3]

                if (char not in valid):
                    break

                text += chr(char)
            else:
                sum = sum(ord(c) for c in text)
                print(sum)
                #print(key)
                #print(text)



            