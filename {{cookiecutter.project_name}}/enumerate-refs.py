#!/usr/bin/env python
# Script to modify the default main.bbl file to generate intended and enumerated
# reference list.


def apply_numbers_to_ref_list():
    count = 1
    write_lines = []
    with open('./main.bbl', 'r+') as file:
        read_lines = file.readlines()
        write_lines = read_lines[:]
        for i in range(len(read_lines) - 1):
            if "\APACrefbtitle" in read_lines[i]:
                write_lines[i] = (
                    '\hspace*{7.3mm}' + str(count) + '.\hspace*{2.4mm}' + write_lines[i]
                )
                count = count + 1
        file.seek(0)
        file.writelines(write_lines)


if __name__ == '__main__':
    apply_numbers_to_ref_list()

