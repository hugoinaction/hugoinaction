Markdown
===========

I am a paragraph in markdown with line
wrapping so fit in this width.
I am a continuation of the first paragraph
as there is no empty line before me.

I am in the second paragraph.


I am the third one. Even though there are
two line breaks before me, this does not
create any newline characters. After me there
are two spaces before the newline character.  
I have a line break before me. Even though
I am not a new paragraph, I do start on a
new line due to the manual line break via
spaces before the newline character.

Top Level H1
=============
H2
---

#Just a tag
\# Not a heading
Also a # tag.
# Alternate H1
## Alternate H2
### H3
###### H6

* This is a list element
+ This is also a list element
- This is also a list element
     - This is a sublist element
     + Also a sublist element
       + Sublist level 2
       1. Numbered sublist
       2. Next item
             1. Next indent level

1) Numbered list
2) Next item
     1. Next indent level
        * Sublist non numbered
3. Back

Horizontal Lines:

------------------------------------
.
***********************************
.
***
.

---

> Block Quote

    Preformatted text

## Inline formatting

*Italics*

_Italics_

__Bold__

__*Bold+Italics*__

**_Bold+Italics_**

this_is_not_emphasis

~~Strike-through~~

Content with a -- (dash) and a --- (long dash).

[link](http://link/path/to/target)

[link](http://link/path/to/target "TITLE ON LINK")

[Shared links with footnotes][target 1]

[Second shared link][target 1]

[target 1]

[target 1]: http://footnote.com

Sample inline code `a++` can be specified here.

![Alt Text](/path/to/image "Optional Tooltip")


## HTML escaped characters and inline HTML

Copyright: &copy;

Registered: &reg;

Trademark: &trade;

Less Than: &lt;

Greater Than: &gt;

Ampersand: &amp;

Smiley: &#x1F604;

Embedded HTML: x<sup>2</sup>

Floating image via HTML: <img src="/image/logo.png" style="float: right; padding: 0 0 0 10px"> Follow up text after the image. This honors the floats and wraps around the image, automatically going into the next line.

## Tables, code blocks and task lists

   Name | Job
--------|------
   Alex | Web Developer
    Bob | Sys Admin
   Gabby| Technical Writer


### Alternate table


|  Name | Mantra |
|  ---  | --- |
| Alex  | There must be a better way. |
| Bob   | Play it safe. |
| Gabby | Try everything, but do what you like. |

### Table alignment

| Index |  Product | Edges |
| --:   |  :--  | :-: |
| 1.  | Circle  | 0 |
| 2.  | Line   | 1 |
| 3.  | Square | 4 |

## Acme website task list

- [x] Get the home page up
- [x] Update Privacy Policy and Terms of Use
- [ ] Add the about page
- [ ] Start the blog
- [ ] Enable contact us

## Code block

```javascript
var x= 10;
x++;
console.log(x);
```

With highlighting:

```javascript {linenos=true,hl_lines=[2,"4-6"],linenostart=199}
while (!success) {
  tryAgain();
  attempt++;
  if (Dead) {
    break;
  }
}
```

## Direct Emojis
Smile please :smile:

I :heart: Hugo

Wink :wink:

A link to [Emojis](#direct-emojis)

## Smart conversion

This will convert to a dash --

This is followed by ellipses ...

## This is extra highlighted{style="background: yellow"}


## Definition Lists

Alex
: Hippy Web Developer
: Technophile

Bob
: Classic SysAdmin
: Conservative

Gabby
: Cool Content Master
: Cautious
