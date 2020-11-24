Markdown
===========

I am a paragraph in markdown with line
wrapping so fit in this width.
I am a continuation of the first paragraph
as there is no empty line before me.

I am the second paragraph.


I am the third one. Even though there are
two line breaks before me, this does not
create any newline characters. After me there
are two spaces before the newline character.
I have line break before me and even though
I am not a new paragraph, I do start on a
new line due to the manual line break via
spaces before the newline character.

Top Level H1
=============
H2
---

#Just a tag
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
        3. Next indent level

1. Numbered sublist
2. Next item
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

## Inline Formatting

*Italics*

_Italics_

__Bold__

___Bold+Italics___

this_is_not_emphasis

~~Strikethough~~

Content with a -- (dash) and a --- (long dash).

[link](http://link/path/to/target)

[link](http://link/path/to/target "TITLE ON LINK")

[Shared Links with footnotes][target 1]

[Second shared link][target 1]

[target 1]

[target 1]: http://footnote.com

Sample inline code `a++` can be specified here.

![Alt Text](/path/to/image "Optional Tooltip")


## HTML Escaped characters and inline HTML

Copyright: &copy;

Registered: &reg;

Trademark: &trade;

Less Than: &lt;

Greater Than: &gt;

Ampersand: &gt;

Smiley: &#x1F604;

Embedded HTML: x<sup>2</sup>

Floating image via HTML: <img src="/image/logo.png" style="float: right; padding: 0 0 0 10px"> Follow up text after the image. This honors the floats and wraps around the image, automatically going into the next line.

## Tables, Code Blocks and Task lists

   Name | Job
--------|------
   Alex | Web Developer
    Bob | Sys Admin
   Gabby| Technical Writer


### Alternate Table


|  Name | Mantra |
|  ---  | --- |
| Alex  | There must be a better way. |
| Bob   | Play it safe. |
| Gabby | Try everything, but do what you like. |

## Acme Website task list

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

## Direct Emojis
Smile please :smile:

I :heart: Hugo

Wink :wink:


## Fractions

1/2

100/999

Not a Number/5

A link to [Fractions](#fractions)


## Definition List

Alex
: Hippy Web Developer
: Technofile

Bob
: Classic SysAdmin
: Conservative

Gabby
: Cool Content Master
: Cautious


## Shortcodes

*Youtube*
{{< youtube nLAVanlu5js >}}


*Highlight*
{{< highlight js "linenos=table,hl_lines=3-4,linenostart=1080" >}}
// Enjoy your work
if (!tired()) {
    keepCoding();
} else {
    drinkCoffee();
}
{{</ highlight >}}

{{< highlight html "linenos=table,hl_lines=2 ,linenostart=1080" >}}
<!-- Generated Youtube source code for video -->
{{</* youtube nLAVanlu5js */>}}
<!-- Output -->
{{< youtube nLAVanlu5js >}}
{{</ highlight >}}

