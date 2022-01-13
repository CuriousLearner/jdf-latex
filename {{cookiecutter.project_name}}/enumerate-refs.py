#!/usr/bin/env python3
# Script to modify the default main.bbl file to generate
# intended and enumerated reference list.


def apply_numbers_to_ref_list():
    bib_count = 0

    with open('./main.bbl', 'r+') as file:
        read_lines = file.readlines()
        write_lines = read_lines[:]

        enumerated = None

        for i in range(len(read_lines) - 1):
            if "bibitem" in read_lines[i]:
                # Mark the beginning of a new bibliography item
                bib_count = bib_count + 1
                enumerated = False
            if not enumerated:
                if "begin{APACrefauthors}" in read_lines[i]:
                    # Add number & indentation to authored bibliography
                    write_lines[i + 1] = (
                        '\hspace*{7.3mm}' + str(bib_count) +
                        '.\hspace*{2.4mm}' + write_lines[i + 1]
                    )
                    enumerated = True
                elif "\APACrefbtitle" in read_lines[i]:
                    # Add number & indentation to non-author bibliography
                    write_lines[i] = (
                        '\hspace*{7.3mm}' + str(bib_count) +
                        '.\hspace*{2.4mm}' + write_lines[i]
                    )
                    enumerated = True

        file.seek(0)
        file.writelines(write_lines)


if __name__ == '__main__':
    apply_numbers_to_ref_list()
