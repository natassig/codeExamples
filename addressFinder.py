# addressFinder.py - searches the clipboard text for an address pattern and copies any matches it finds back to the clipboard.

import re, pyperclip

'''
1. make regex for adresses
2. search the clipboard
3. copy matchs to the clipboard
'''

addressRE = re.compile(r'''(
[a-z]+(-[a-z]+)?(weg|strasse|straße|platz|allee)
\s
\d{1,3}[a-z]?
\s+
\d{5}
\s[a-z]+(-[a-z]+)?
)''', re.IGNORECASE|re.VERBOSE)

# addressRE = re.compile(r'''
# [a-z]+(-[a-z]+)?(weg|strasse|platz|allee)         #street name
# \s                                                #space
# \d{1,3}[a-z]?                                     #house number and optional letter
# \s+                                               #new line, tab, etc.
# \d{5}                                             #5-digit zip code
# \s[a-z]+(-[a-z]+)?                                #town name
# ''', re.IGNORECASE|re.VERBOSE)

text = pyperclip.paste()
matches = addressRE.findall(text)

if matches == []:
    print('No email addresses or phone numbers found in clipboard text.')
else:
    formatted = ''
    for i in matches:
        formatted += i[0]+'\n'
        # findall returns a list of tuples of all matched groups. Only the first tuple in each list item is the full length match.
    pyperclip.copy(formatted)
    print(formatted)
