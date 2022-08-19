$map = @{
    color = "red"
    person = @{
        firstname = "Bob"
        lastname  = "Smith"
    }
    gender = "His"
}

$template = @"
This a block of text. Here is a color {{color}}.
{{person.firstname}} should be able to read this with {{gender}} name in it
"@

$re = [regex]::New("\{{(.*?)\}}")
$re.Replace($template, {
    param($s)
    foreach($i in $s.Groups[1].Value.Split('.')) {
        $map = $map[$i]
    }
    $map
})
