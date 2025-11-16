# Lorem Ipsum: Markdown Feature Showcase

> Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur.

## Paragraphs, Emphasis, and Inline Code

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean `inline_code()` vehicula.

- **Bold** text emphasizes importance.
- *Italic* text for subtle emphasis.
- ~~Strikethrough~~ for removals.
- ***Bold and italic*** when needed.
- Superscript and subscript: X^2^ and H~2~O.

A link to [example](https://example.com) and a reference link to [Search](https://duckduckgo.com).

## Lists

- Unordered item 1
  - Nested item A
    - Nested item i
- Unordered item 2
- [ ] Task item unchecked
- [x] Task item checked

1. Ordered item one
2. Ordered item two
   1. Sub-item a
   2. Sub-item b

## Blockquotes

> Blockquote level 1

> Nested blockquote level 2

---

## Code Blocks

```python
from typing import List

def greet(names: List[str]) -> None:
    for name in names:
        print(f"Hello, {name}!")
```

```json
{
  "lorem": "ipsum",
  "dolor": [1, 2, 3]
}
```

    # Indented code block
    for i in range(3):
        print(i)

---

## Tables

Caption: Simple alignment table

---

## Images

Inline image with alt text:

![Sample Diagram](image-1.png)

Figure-style image syntax:

![Another Image](image-2.png)

---

## Footnotes, Abbreviations, Definition Lists

Footnote example: Lorem ipsum dolor sit amet[^1] consectetur adipiscing elit.

Abbreviations:

Definition list:

<dl>
<dt>Term</dt>
<dd>Definition for the term using lorem ipsum dolor sit amet.</dd>
<dt>Another term</dt>
<dd>Another definition with more content and examples.</dd>
</dl>

---

## Headings H4–H6

#### H4 — Lorem ipsum dolor sit amet

Curabitur non nulla sit amet nisl tempus convallis quis ac lectus.

##### H5 — Consectetur adipiscing elit

Praesent sapien massa, convallis a pellentesque nec, egestas non nisi.

###### H6 — Sed porttitor lectus nibh

Donec sollicitudin molestie malesuada. Nulla quis lorem ut libero malesuada feugiat.

---

## Inline HTML (allowed by Markdown)

Inline **HTML** paragraph with *emphasis* and a [link](https://example.com).

---

## Horizontal Rule, Line Breaks, and Escapes

First line  
Second line with two-space break.

Literal characters: \*escaped asterisks\*, \_underscores\_, and \[brackets\].

---

## Math-like Text (displayed as plain text here)

Not rendered as math but included for completeness:

- Inline: $a^2 + b^2 = c^2$
- Block:

```
E = mc^2
∑_{i=1}^{n} i = n(n+1)/2
```

---

## TOC Marker Example

- [Lorem Ipsum: Markdown Feature Showcase](#lorem-ipsum-markdown-feature-showcase)
  - [Paragraphs, Emphasis, and Inline Code](#paragraphs-emphasis-and-inline-code)
    - [Lists](#lists)
      - [Blockquotes](#blockquotes)
    - [Code Blocks](#code-blocks)
    - [Tables](#tables)
    - [Images](#images)
    - [Footnotes, Abbreviations, Definition Lists](#footnotes-abbreviations-definition-lists)
    - [Headings H4–H6](#headings-h4h6)
      - [H4 — Lorem ipsum dolor sit amet](#h4-lorem-ipsum-dolor-sit-amet)
        - [H5 — Consectetur adipiscing elit](#h5-consectetur-adipiscing-elit)
          - [H6 — Sed porttitor lectus nibh](#h6-sed-porttitor-lectus-nibh)
  - [Inline HTML (allowed by Markdown)](#inline-html-allowed-by-markdown)
  - [Horizontal Rule, Line Breaks, and Escapes](#horizontal-rule-line-breaks-and-escapes)
  - [Math-like Text (displayed as plain text here)](#math-like-text-displayed-as-plain-text-here)
  - [TOC Marker Example](#toc-marker-example)
  - [Long Lorem Ipsum Paragraph](#long-lorem-ipsum-paragraph)

---

## Long Lorem Ipsum Paragraph

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sagittis, sem vitae fermentum porta, risus orci dictum nisl, in tincidunt augue purus sit amet eros. Proin sed mi in ipsum ultrices euismod. Aenean feugiat, lacus nec efficitur facilisis, lacus felis blandit justo, nec condimentum elit dolor at justo. Cras in lorem ac neque lacinia dapibus. Donec at risus sed odio viverra faucibus. Integer vitae risus a nulla pulvinar hendrerit. Suspendisse potenti. Nam a orci arcu. Nunc efficitur, lorem a iaculis aliquam, ligula ante gravida enim, et gravida lorem eros id est.

---

[^1]: Footnote text with additional details using lorem ipsum.
