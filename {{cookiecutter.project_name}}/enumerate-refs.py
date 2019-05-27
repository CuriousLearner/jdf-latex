#!/usr/bin/env python
# Script to modify the default main.bbl file to generate intended and enumerated
# reference list.


def apply_numbers_to_ref_list():
    count = 0
    write_lines = []

    with open('./main.bbl', 'r+') as file:
        read_lines = file.readlines()
        write_lines = read_lines[:]

        enumerated = None

        for i in range(len(read_lines) - 1):
            if "bibitem" in read_lines[i]:
                # Mark the beginning of a new bibliography item
                count = count + 1
                enumerated = False
            elif not enumerated and "begin{APACrefauthors}" in read_lines[i]:
                write_lines[i + 1] = (
                    '\hspace*{7.3mm}' + str(count) + '.\hspace*{2.4mm}' + write_lines[i + 1]
                )
                enumerated = True
            elif not enumerated and "\APACrefbtitle" in read_lines[i]:
                write_lines[i] = (
                    '\hspace*{7.3mm}' + str(count) + '.\hspace*{2.4mm}' + write_lines[i]
                )

        file.seek(0)
        file.writelines(write_lines)


if __name__ == '__main__':
    apply_numbers_to_ref_list()

