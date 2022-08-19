Regular Expression Engine Comparison Chart
==========================================

Many different applications claim to support regular expressions. But what does 
that even mean?

Well there are lots of different regular expression engines, and they all have 
different feature sets and different time-space efficiencies.

The information here is just copied from: http://regular-expressions.mobi/refflavors.html

But for some reason, it's not accessible unless you have a mobile phone user agent.

Go to the main site for lots of regular expression information and their commercial 
product called RegexBuddy.

## Regular Expression Flavors (Engines) ##

<ul>
    <li><a href="http://www.regular-expressions.info/jgsoft.html">JGsoft</a>: This flavor is used by the Just Great Software products, including <a href="http://www.regular-expressions.info/powergrep.html">PowerGREP</a> and <a href="http://www.regular-expressions.info/editpadpro.html">EditPad Pro</a>. </li>
    <li><a href="http://www.regular-expressions.info/dotnet.html">.NET</a>: This flavor is used by programming languages based on the <a href="http://www.regular-expressions.info/dotnet.html">Microsoft .NET framework</a> versions 1.x, 2.0 or 3.x. It is generally also the regex flavor used by applications developed in these programming languages. </li>
    <li><a href="http://www.regular-expressions.info/java.html">Java</a>: The regex flavor of the java.util.regex package, available in the Java 4 (JDK 1.4.x) and later. A few features were added in Java 5 (JDK 1.5.x) and Java 6 (JDK 1.6.x). It is generally also the regex flavor used by applications developed in Java. </li>
    <li><a href="http://www.regular-expressions.info/perl.html">Perl</a>: The regex flavor used in the Perl programming language, versions 5.6 and 5.8. Versions prior to 5.6 do not support Unicode. </li>
    <li><a href="http://www.regular-expressions.info/pcre.html">PCRE</a>: The open source PCRE library. The feature set described here is available in PCRE 5.x and 6.x. PCRE is the regex engine used by the <a href="http://www.regular-expressions.info/delphi.html">TPerlRegEx Delphi component</a> and the RegularExrpessions and RegularExpressionsCore units in Delphi XE and C++Builder XE. </li>
    <li><a href="http://www.regular-expressions.info/javascript.html">ECMA (JavaScript)</a>: The regular expression syntax defined in the 3rd edition of the ECMA-262 standard, which defines the scripting language commonly known as JavaScript. </li>
    <li><a href="http://www.regular-expressions.info/python.html">Python</a>: The regex flavor supported by Python's built-in <span class="code">re</span> module. </li>
    <li><a href="http://www.regular-expressions.info/ruby.html">Ruby</a>: The regex flavor built into the Ruby programming language. </li>
    <li><a href="http://www.regular-expressions.info/tcl.html">Tcl ARE</a>: The regex flavor developed by Henry Spencer for the <span class="code">regexp</span> command in Tcl 8.2 and 8.4, dubbed Advanced Regular Expressions. </li>
    <li><a href="http://www.regular-expressions.info/posix.html#bre">POSIX BRE</a>: Basic Regular Expressions as defined in the IEEE POSIX standard 1003.2. </li>
    <li><a href="http://www.regular-expressions.info/posix.html#ere">POSIX ERE</a>: Extended Regular Expressions as defined in the IEEE POSIX standard 1003.2. </li>
    <li><a href="http://www.regular-expressions.info/gnu.html#bre">GNU BRE</a>: GNU Basic Regular Expressions, which are POSIX BRE with GNU extensions, used in the GNU implementations of classic UNIX tools. </li>
    <li><a href="http://www.regular-expressions.info/gnu.html#ere">GNU ERE</a>: GNU Extended Regular Expressions, which are POSIX ERE with GNU extensions, used in the GNU implementations of classic UNIX tools. </li>
    <li><a href="http://www.regular-expressions.info/xml.html">XML</a>: The regular expression flavor defined in the XML Schema standard. </li>
    <li><a href="http://www.regular-expressions.info/xpath.html">XPath</a>: The regular expression flavor defined in the XQuery 1.0 and XPath 2.0 Functions and Operators standard. </li>
</ul>

## Applications Implementing a Regular Expression Flavor ##

<ul>
    <li>AceText: Version 2 and later use the JGsoft engine. Version 1 did not support regular expressions at all. </li>
    <li>awk: The awk UNIX tool and programming language uses POSIX ERE. </li>
    <li><a href="http://www.regular-expressions.info/dotnet.html">C#</a>: As a .NET programming language, C# can use the <a href="http://www.regular-expressions.info/dotnet.html">System.Text.RegularExpressions classes</a>, listed as ".NET" below. </li>
    <li><a href="http://www.regular-expressions.info/delphi.html">Delphi for .NET</a>: As a .NET programming language, the .NET version of Delphi can use the <a href="http://www.regular-expressions.info/dotnet.html">System.Text.RegularExpressions classes</a>, listed as ".NET" below. </li>
    <li><a href="http://www.regular-expressions.info/delphi.html">Delphi for Win32</a>: Delphi for Win32 does not have built-in regular expression support. Many free <a href="http://www.regular-expressions.info/pcre.html">PCRE</a> wrappers are available. </li>
    <li><a href="http://www.regular-expressions.info/editpadpro.html">EditPad Pro</a>: Version 6 and later use the JGsoft engine. Earlier versions used PCRE, without Unicode support. </li>
    <li><a href="http://www.regular-expressions.info/grep.html">egrep</a>: The traditional UNIX egrep command uses the "POSIX ERE" flavor, though not all implementations fully adhere to the standard. Linux usually ships with the GNU implementation, which use "GNU ERE". </li>
    <li><a href="http://www.regular-expressions.info/grep.html">grep</a>: The traditional UNIX grep command uses the "POSIX BRE" flavor, though not all implementations fully adhere to the standard. Linux usually ships with the GNU implementation, which use "GNU BRE". </li>
    <li>Emacs: The GNU implementation of this classic UNIX text editor uses the "GNU ERE" flavor, except that POSIX classes, collations and equivalences are not supported. </li>
    <li><a href="http://www.regular-expressions.info/java.html">Java</a>: The regex flavor of the java.util.regex package is listed as "Java" in the table below. </li>
    <li><a href="http://www.regular-expressions.info/javascript.html">JavaScript</a>: JavaScript's regex flavor is listed as "ECMA" in the table below. </li>
    <li><a href="http://www.regular-expressions.info/mysql.html">MySQL</a>: MySQL uses <a href="http://www.regular-expressions.info/posix.html#ere">POSIX Extended Regular Expressions</a>, listed as "POSIX ERE" in the table below. </li>
    <li><a href="http://www.regular-expressions.info/oracle.html">Oracle</a>: Oracle Database 10g implements <a href="http://www.regular-expressions.info/posix.html#ere">POSIX Extended Regular Expressions</a>, listed as "POSIX ERE" in the table below. Oracle supports backreferences <span class="code">\1</span> through <span class="code">\9</span>, though these are not part of the POSIX ERE standard. </li>
    <li><a href="http://www.regular-expressions.info/perl.html">Perl</a>: Perl's regex flavor is listed as "Perl" in the table below. </li>
    <li><a href="http://www.regular-expressions.info/php.html">PHP</a>: PHP's <span class="code">ereg</span> functions implement the "POSIX ERE" flavor, while the <span class="code">preg</span> functions implement the "PCRE" flavor. </li>
    <li><a href="http://www.regular-expressions.info/postgresql.html">PostgreSQL</a>: PostgreSQL 7.4 and later uses Henry Spencer's "Advanced Regular Expressions" flavor, listed as "Tcl ARE" in the table below. Earlier versions used POSIX Extended Regular Expressions, listed as POSIX ERE. </li>
    <li><a href="http://www.regular-expressions.info/powergrep.html">PowerGREP</a>: Version 3 and later use the JGsoft engine. Earlier versions used PCRE, without Unicode support. </li>
    <li><a href="http://www.regular-expressions.info/powershell.html">PowerShell</a>: PowerShell's built-in -match and -replace operators use the <a href="http://www.regular-expressions.info/dotnet.html">.NET regex flavor</a>. PowerShell can also use the System.Text.RegularExpressions classes directly. </li>
    <li><a href="http://www.regular-expressions.info/python.html">Python</a>: Python's regex flavor is listed as "Python" in the table below. </li>
    <li><a href="http://www.regular-expressions.info/rlanguage.html">R</a>: The regular expression functions in the R language for statistical programming use either the POSIX ERE flavor (default), the PCRE flavor (perl = true) or the POSIX BRE flavor (perl = false, extended = false). </li>
    <li><a href="http://www.regular-expressions.info/realbasic.html">REALbasic</a>: REALbasic's RegEx class is a wrapper around PCRE. </li>
    <li><a href="http://www.regular-expressions.info/regexbuddy.html">RegexBuddy</a>: Version 3 and later use a special version of the JGsoft engine that emulates all the regular expression flavors in this comparison. Version 2 supported the JGsoft regex flavor only. Version 1 used PCRE, without Unicode support. </li>
    <li><a href="http://www.regular-expressions.info/ruby.html">Ruby</a>: Ruby's regex flavor is listed as "Ruby" in the table below. </li>
    <li>sed: The sed UNIX tool uses POSIX BRE. Linux usually ships with the GNU implementation, which use "GNU BRE". </li>
    <li><a href="http://www.regular-expressions.info/tcl.html">Tcl</a>: Tcl's Advanced Regular Expression flavor, the default flavor in Tcl 8.2 and later, is listed as "Tcl ARE" in the table below. Tcl's Extended Regular Expression and Basic Regular Expression flavors are listed as "POSIX ERE" and "POSIX BRE" in the table below. </li>
    <li><a href="http://www.regular-expressions.info/vbscript.html">VBScript</a>: VBScript's RegExp object uses the same regex flavor as JavaScript, which is listed as "ECMA" in the table below. </li>
    <li><a href="http://www.regular-expressions.info/vb.html">Visual Basic 6</a>: Visual Basic 6 does not have built-in support for regular expressions, but can easily use the "Microsoft VBScript Regular Expressions 5.5" COM object, which implements the "ECMA" flavor listed below. </li>
    <li><a href="http://www.regular-expressions.info/dotnet.html">Visual Basic.NET</a>: As a .NET programming language, VB.NET can use the <a href="http://www.regular-expressions.info/dotnet.html">System.Text.RegularExpressions classes</a>, listed as ".NET" below. </li>
    <li><a href="http://www.regular-expressions.info/wxwidgets.html">wxWidgets</a>: The wxRegEx class supports 3 flavors. wxRE_ADVANCED is the "Tcl ARE" flavor, wxRE_EXTENDED is "POSIX ERE" and wxRE_BASIC is "POSIX BRE". </li>
    <li><a href="http://www.regular-expressions.info/xml.html">XML Schema</a>: The XML Schema regular expression flavor is listed as "XML" in the table below. </li>
    <li><a href="http://www.regular-expressions.info/xpath.html">XPath</a>: The regex flavor used by XPath functions is listed as "XPath" in the table below. </li>
    <li><a href="http://www.regular-expressions.info/xpath.html">XQuery</a>: The regex flavor used by XQuery functions is listed as "XPath" in the table below. </li>
</ul>

## Feature Comparison ##

<style>
/* this entire CSS block is mine */

/* .no { color: green; } */
.no {
    color: red;
}
.no {
    color: rgba(200, 40, 44, 0.5);
}
.code {
    font-family: monospace;
    /* background-color: "#feffff"; */
    background-color: '#0000ff';
    /* color: "#0000ff" !important; */
}
/* TABLE.table > * > TR > :nth-child(3) */
table tr td:nth-child(2) {
    border: 2px solid blue !important;
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
        <td><span class="code">\x00</span> through <span class="code">\xFF</span> (ASCII character)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td><span class="code">\n</span> (LF), <span class="code">\r</span> (CR) and <span class="code">\t</span> (tab)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
    </tr>
    <tr>
        <td><span class="code">\f</span> (form feed) and <span class="code">\v</span> (vtab)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td><span class="code">\a</span> (bell)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td><span class="code">\e</span> (escape)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td><span class="code">\b</span> (backspace) and <span class="code">\B</span> (backslash)</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td><span class="code">\cA</span> through <span class="code">\cZ</span> (control character)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td><span class="code">\ca</span> through <span class="code">\cz</span> (control character)</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <th colspan="16"><a href="http://www.regular-expressions.info/charclass.html">Character Classes or Character Sets</a> [abc]</th>
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
        <td valign="top"><span class="code">[abc]</span> character class</td>
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
        <td valign="top"><span class="code">[^abc]</span> negated character class</td>
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
        <td valign="top"><span class="code">[a-z]</span> character class range</td>
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
        <td valign="top">Hyphen in [\d-z] is a literal</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
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
    <tr>
        <td valign="top">Hyphen in [a-\d] is a literal</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
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
    <tr>
        <td>Backslash escapes one character class metacharacter</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
    </tr>
    <tr>
        <td>\Q...\E escapes a string of character class metacharacters</td>
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
    <tr>
        <td valign="top"><span class="code">\d</span> shorthand for digits</td>
        <td>YES</td>
        <td>YES</td>
        <td>ascii</td>
        <td>YES</td>
        <td>ascii</td>
        <td>ascii</td>
        <td>option</td>
        <td>ascii</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\w</span> shorthand for word characters</td>
        <td>YES</td>
        <td>YES</td>
        <td>ascii</td>
        <td>YES</td>
        <td>ascii</td>
        <td>ascii</td>
        <td>option</td>
        <td>ascii</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\s</span> shorthand for whitespace</td>
        <td>YES</td>
        <td>YES</td>
        <td>ascii</td>
        <td>YES</td>
        <td>ascii</td>
        <td>YES</td>
        <td>option</td>
        <td>ascii</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td>ascii</td>
        <td>ascii</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\D</span>, <span class="code">\W</span> and <span class="code">\S</span> shorthand negated character classes</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">[\b]</span> backspace</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <th colspan="16"><a href="http://www.regular-expressions.info/dot.html">Dot</a></th>
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
        <td valign="top"><span class="code">.</span> (dot; any character except line break)</td>
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
        <th colspan="16"><a href="http://www.regular-expressions.info/anchors.html">Anchors</a></th>
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
        <td valign="top"><span class="code">^</span> (start of string/line)</td>
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
        <td class="no">no</td>
        <td>YES</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">$</span> (end of string/line)</td>
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
        <td class="no">no</td>
        <td>YES</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\A</span> (start of string)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\Z</span> (end of string, before final line break)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\z</span> (end of string)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td><span class="code">\Z</span></td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\`</span> (start of string)</td>
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
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\'</span> (end of string)</td>
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
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <th colspan="16"><a href="http://www.regular-expressions.info/wordboundaries.html">Word Boundaries</a></th>
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
        <td valign="top"><span class="code">\b</span> (at the beginning or end of a word)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>ascii</td>
        <td>ascii</td>
        <td>option</td>
        <td>ascii</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\B</span> (NOT at the beginning or end of a word)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>ascii</td>
        <td>ascii</td>
        <td>option</td>
        <td>ascii</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\y</span> (at the beginning or end of a word)</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\Y</span> (NOT at the beginning or end of a word)</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\m</span> (at the beginning of a word)</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\M</span> (at the end of a word)</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\<</span> (at the beginning of a word)</td>
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
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\></span> (at the end of a word)</td>
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
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <th colspan="16"><a href="http://www.regular-expressions.info/alternation.html">Alternation</a></th>
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
        <td valign="top"><span class="code">|</span> (alternation)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>\|</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
    </tr>
    <tr>
        <th colspan="16"><a href="http://www.regular-expressions.info/repeat.html">Quantifiers</a></th>
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
        <td valign="top"><span class="code">?</span> (0 or 1)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>\?</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">*</span> (0 or more)</td>
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
        <td valign="top"><span class="code">+</span> (1 or more)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>\+</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">{n}</span> (exactly n)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>\{n\}</td>
        <td>YES</td>
        <td>\{n\}</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">{n,m}</span> (between n and m)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>\{n,m\}</td>
        <td>YES</td>
        <td>\{n,m\}</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">{n,}</span> (n or more)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>\{n,\}</td>
        <td>YES</td>
        <td>\{n,\}</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">?</span> after any of the above quantifiers to make it "lazy"</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
    </tr>
    <tr>
        <th colspan="16"><a href="http://www.regular-expressions.info/brackets.html">Grouping and Backreferences</a></th>
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
        <td valign="top"><span class="code">(regex)</span> (numbered capturing group)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>\( \)</td>
        <td>YES</td>
        <td>\( \)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">(?:regex)</span> (non-capturing group)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\1</span> through <span class="code">\9</span> (backreferences)</td>
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
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\10</span> through <span class="code">\99</span> (backreferences)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">n/a</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">n/a</td>
        <td>YES</td>
    </tr>
    <tr>
        <td valign="top">Forward references <span class="code">\1</span> through <span class="code">\9</span></td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">n/a</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">n/a</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top">Nested references <span class="code">\1</span> through <span class="code">\9</span></td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">n/a</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">n/a</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top">Backreferences non-existent groups are an error</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">n/a</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">n/a</td>
        <td>YES</td>
    </tr>
    <tr>
        <td valign="top">Backreferences to failed groups also fail</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">n/a</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">n/a</td>
        <td>YES</td>
    </tr>
    <tr>
        <th colspan="16"><a href="http://www.regular-expressions.info/modifiers.html">Modifiers</a></th>
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
        <td valign="top"><span class="code">(?i)</span> (case insensitive)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">/i only</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">flag</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">(?s)</span> (dot matches newlines)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>(?m)</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">flag</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">(?m)</span> (<span class="code">^</span> and <span class="code">$</span> match at line breaks)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">/m only</td>
        <td>YES</td>
        <td class="no">always on</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">flag</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">(?x)</span> (free-spacing mode)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">flag</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">(?n)</span> (explicit capture)</td>
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
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">(?-ismxn)</span> (turn off mode modifiers)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">(?ismxn:group)</span> (mode modifiers local to group)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <th colspan="16"><a href="http://www.regular-expressions.info/atomic.html">Atomic Grouping and Possessive Quantifiers</a></th>
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
        <td valign="top"><span class="code">(?>regex)</span> (atomic group)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">?+</span>, <span class="code">*+</span>, <span class="code">++</span> and <span class="code">{m,n}+</span> (possessive quantifiers)</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
        <td class="no">no</td>
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
    <tr>
        <th colspan="16"><a href="http://www.regular-expressions.info/lookaround.html">Lookaround</a></th>
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
        <td valign="top"><span class="code">(?=regex)</span> (positive lookahead)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">(?!regex)</span> (negative lookahead)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">(?&lt;=text)</span> (positive lookbehind)</td>
        <td>full regex</td>
        <td>full regex</td>
        <td>finite length</td>
        <td>fixed length</td>
        <td>fixed + alternation</td>
        <td class="no">no</td>
        <td>fixed length</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">(?&lt;!text)</span> (negative lookbehind)</td>
        <td>full regex</td>
        <td>full regex</td>
        <td>finite length</td>
        <td>fixed length</td>
        <td>fixed + alternation</td>
        <td class="no">no</td>
        <td>fixed length</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <th colspan="16"><a href="http://www.regular-expressions.info/continue.html">Continuing from The Previous Match</a></th>
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
        <td valign="top"><span class="code">\G</span> (start of match attempt)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <th colspan="16"><a href="http://www.regular-expressions.info/conditional.html">Conditionals</a></th>
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
        <td valign="top"><span class="code">(?(?=regex)then|else)</span> (using any lookaround)</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
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
    <tr>
        <td valign="top"><span class="code">(?(regex)then|else)</span></td>
        <td class="no">no</td>
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
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">(?(1)then|else)</span></td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">(?(group)then|else)</span></td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <th colspan="16"><a href="http://www.regular-expressions.info/comments.html">Comments</a></th>
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
        <td valign="top"><span class="code">(?#comment)</span></td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <th colspan="16"><a href="http://www.regular-expressions.info/freespacing.html">Free-Spacing Syntax</a></th>
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
        <td valign="top">Free-spacing syntax supported</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
    </tr>
    <tr>
        <td valign="top">Character class is a single token</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">n/a</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">n/a</td>
        <td class="no">n/a</td>
        <td class="no">n/a</td>
        <td class="no">n/a</td>
        <td class="no">n/a</td>
        <td>YES</td>
    </tr>
    <tr>
        <td valign="top"># starts a comment</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">n/a</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">n/a</td>
        <td class="no">n/a</td>
        <td class="no">n/a</td>
        <td class="no">n/a</td>
        <td class="no">n/a</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <th colspan="16"><a href="http://www.regular-expressions.info/unicode.html">Unicode Characters</a></th>
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
        <td valign="top"><span class="code">\X</span> (Unicode grapheme)</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>option</td>
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
    <tr>
        <td valign="top"><span class="code">\u0000</span> through <span class="code">\uFFFF</span> (Unicode character)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>u"string"</td>
        <td class="no">no</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\x{0}</span> through <span class="code">\x{FFFF}</span> (Unicode character)</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>option</td>
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
    <tr>
        <th colspan="16"><a href="http://www.regular-expressions.info/unicode.html#prop">Unicode Properties, Scripts and Blocks</a></th>
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
        <td valign="top"><span class="code">\pL</span> through <span class="code">\pC</span> (Unicode properties)</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td>option</td>
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
    <tr>
        <td valign="top"><span class="code">\p{L}</span> through <span class="code">\p{C}</span> (Unicode properties)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>option</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\p{Lu}</span> through <span class="code">\p{Cn}</span> (Unicode property)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>option</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\p{L&amp;}</span> and <span class="code">\p{Letter&amp;}</span> (equivalent of <span class="code">[\p{Lu}\p{Ll}\p{Lt}]</span> Unicode properties)</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>option</td>
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
    <tr>
        <td valign="top"><span class="code">\p{IsL}</span> through <span class="code">\p{IsC}</span> (Unicode properties)</td>
        <td>YES</td>
        <td class="no">no</td>
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
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\p{IsLu}</span> through <span class="code">\p{IsCn}</span> (Unicode property)</td>
        <td>YES</td>
        <td class="no">no</td>
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
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\p{Letter}</span> through <span class="code">\p{Other}</span> (Unicode properties)</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
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
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\p{Lowercase_Letter}</span> through <span class="code">\p{Not_Assigned}</span> (Unicode property)</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
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
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\p{IsLetter}</span> through <span class="code">\p{IsOther}</span> (Unicode properties)</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
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
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\p{IsLowercase_Letter}</span> through <span class="code">\p{IsNot_Assigned}</span> (Unicode property)</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
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
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\p{Arabic}</span> through <span class="code">\p{Yi}</span> (Unicode script)</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>option</td>
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
    <tr>
        <td valign="top"><span class="code">\p{IsArabic}</span> through <span class="code">\p{IsYi}</span> (Unicode script)</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
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
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\p{BasicLatin}</span> through <span class="code">\p{Specials}</span> (Unicode block)</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
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
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\p{InBasicLatin}</span> through <span class="code">\p{InSpecials}</span> (Unicode block)</td>
        <td>YES</td>
        <td class="no">no</td>
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
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\p{IsBasicLatin}</span> through <span class="code">\p{IsSpecials}</span> (Unicode block)</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
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
        <td>YES</td>
        <td>YES</td>
    </tr>
    <tr>
        <td valign="top">Part between <span class="code">{}</span> in all of the above is case insensitive</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
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
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top">Spaces, hyphens and underscores allowed in all long names listed above (e.g. BasicLatin can be written as Basic-Latin or Basic_Latin or <span class="nobr">Basic Latin</span>)</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>Java 5</td>
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
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\P</span> (negated variants of all <span class="code">\p</span> as listed above)</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>option</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\p{^...}</span> (negated variants of all <span class="code">\p{...}</span> as listed above)</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>option</td>
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
    <tr>
        <th colspan="16"><a href="http://www.regular-expressions.info/named.html">Named Capture and Backreferences</a></th>
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
        <td valign="top"><span class="code">(?&lt;name&gt;regex)</span> (.NET-style named capturing group)</td>
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
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">(?'name'regex)</span> (.NET-style named capturing group)</td>
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
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\k&lt;name&gt;</span> (.NET-style named backreference)</td>
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
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\k'name'</span> (.NET-style named backreference)</td>
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
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">(?P&lt;name&gt;regex)</span> (Python-style named capturing group</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">(?P=name)</span> (Python-style named backreference)</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top">multiple capturing groups can have the same name</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">n/a</td>
        <td class="no">n/a</td>
        <td class="no">no</td>
        <td class="no">n/a</td>
        <td class="no">no</td>
        <td class="no">n/a</td>
        <td class="no">n/a</td>
        <td class="no">n/a</td>
        <td class="no">n/a</td>
        <td class="no">n/a</td>
        <td class="no">n/a</td>
        <td class="no">n/a</td>
        <td class="no">n/a</td>
    </tr>
    <tr>
        <th colspan="16"><a href="http://www.regular-expressions.info/xmlcharclass.html">XML Character Classes</a></th>
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
        <td valign="top"><span class="code">\i</span>, <span class="code">\I</span>, <span class="code">\c</span> and <span class="code">\C</span> shorthand XML name character classes</td>
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
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">[abc-[abc]]</span> character class subtraction</td>
        <td>YES</td>
        <td>2.0</td>
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
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
    </tr>
    <tr>
        <th colspan="16"><a href="http://www.regular-expressions.info/posixbrackets.html">POSIX Bracket Expressions</a></th>
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
        <td valign="top"><span class="code">[:alpha:]</span> POSIX character class</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>ascii</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\p{Alpha}</span> POSIX character class</td>
        <td>YES</td>
        <td class="no">no</td>
        <td>ascii</td>
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
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">\p{IsAlpha}</span> POSIX character class</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
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
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">[.span-ll.]</span> POSIX collation sequence</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
    <tr>
        <td valign="top"><span class="code">[=x=]</span> POSIX character equivalence</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td class="no">no</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td>YES</td>
        <td class="no">no</td>
        <td class="no">no</td>
    </tr>
</table>