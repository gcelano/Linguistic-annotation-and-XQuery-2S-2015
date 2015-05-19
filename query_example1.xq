xquery version "3.0" encoding "utf-8";

declare variable $y := doc("/Users/mycomputer/Documents/mywork/Linguistic_annotation_and_XQuery_2S_2015/example1.xml");

for $o in $y//POS
let $i := $o = "DT"
let $p := $o/ancestor::sentence/dependencies[@type="basic-dependencies"]//dependent[@idx= $o/parent::token/@id]
(:
let $m := $o/ancestor::sentence//token[@id = $p/preceding-sibling::governor/@idx]/(POS = "NN" or POS= "NNS")
:)
let $l := $o//ancestor::sentence/tokens//word
where $i and $p (: and $m :) 
return
<r>{data($l)}</r>




