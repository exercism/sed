v 4.9

/-|[0-9]{13}/ {
    s/.*/input out of range/
    q 1
}

s/([1-9]{1,3})([0-9]{9})/\1 billion \2/
s/([a-z]+)\s0+/\1 /

s/([1-9]{1,3})([0-9]{6})/\1 million \2/
s/([a-z]+)\s0+/\1 /

s/([1-9]{1,3})([0-9]{3})/\1 thousand \2/
s/([a-z]+)\s0+/\1 /

s/([1-9])([0-9]{2})/\1 hundred \2/g
s/([a-z]+)\s0+/\1 /

s/10/ten/g
s/11/eleven/g
s/12/twelve/g
s/13/thirteen/g
s/14/fourteen/g
s/15/fifteen/g
s/16/sixteen/g
s/17/seventeen/g
s/18/eighteen/g
s/19/nineteen/g
s/20/twenty/g
s/30/thirty/g
s/40/forty/g
s/50/fifty/g
s/60/sixty/g
s/70/seventy/g
s/80/eighty/g
s/90/ninety/g
s/2([1-9])/twenty-\1/g
s/3([1-9])/thirty-\1/g
s/4([1-9])/forty-\1/g
s/5([1-9])/fifty-\1/g
s/6([1-9])/sixty-\1/g
s/7([1-9])/seventy-\1/g
s/8([1-9])/eighty-\1/g
s/9([1-9])/ninety-\1/g

s/0/zero/g
s/1/one/g
s/2/two/g
s/3/three/g
s/4/four/g
s/5/five/g
s/6/six/g
s/7/seven/g
s/8/eight/g
s/9/nine/g

s/\s+$//
