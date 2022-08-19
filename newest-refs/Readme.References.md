
## Notice


### Table header

- title `characters` is an additional label , in addition to promoted `<tr>`s
- scrolls horizontal (probably automatic)
- some **CSS** works

```html
<style>
    /* td */

.no { color: red; }
.no { color: rgba(200, 40, 44, .5); }
.code {
    font-family: monospace;
    /* background-color: "#feffff"; */
    /* background-color: "#0000ff"; */
    /* color: "#0000ff" !important; */

}
</style>
<table class="body">
    <tr>
        <th colspan="16"><a href="http://www.regular-expressions.info/characters.html">Characters</a></th>
    </tr>
    <tr>
        <th>Feature</th>
        <th><a href="http://www.regular-expressions.info/jgsoft.html">JGsoft</a></th>
        <th><a href="http://www.regular-expressions.info/dotnet.html">.NET</a></th>
        <th><a href="http://www.regular-expressions.info/java.html">Java</a></th>
        <th><a href="http://www.regular-expressions.info/perl.html">Perl</a></th>
        <th><a href="http://www.regular-expressions.info/pcre.html">PCRE</a></th>
        <th><a href="http://www.regular-expressions.info/javascript.html">ECMA</a></th>
        <th><a href="http://www.regular-expressions.info/python.html">Python</a></th>
        <th><a href="http://www.regular-expressions.info/ruby.html">Ruby</a></th>
        <th><a href="http://www.regular-expressions.info/tcl.html">Tcl ARE</a></th>
        <th><a href="http://www.regular-expressions.info/posix.html#bre">POSIX BRE</a></th>
        <th><a href="http://www.regular-expressions.info/posix.html#ere">POSIX ERE</a></th>
        <th><a href="http://www.regular-expressions.info/gnu.html#bre">GNU BRE</a></th>
        <th><a href="http://www.regular-expressions.info/gnu.html#ere">GNU ERE</a></th>
        <th><a href="http://www.regular-expressions.info/xml.html">XML</a></th>
        <th><a href="http://www.regular-expressions.info/xpath.html">XPath</a></th>
    </tr>
        <tr>
        <td>Backslash escapes one metacharacter</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
    </tr>
    <tr>
        <td>\Q...\E escapes a string of metacharacters</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>Java 6</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
</table>
```