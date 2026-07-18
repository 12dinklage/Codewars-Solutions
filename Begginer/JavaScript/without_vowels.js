/* INSTRUCTIONS
Trolls are attacking your comment section!

A common way to deal with this situation is to remove all of the vowels from the trolls' comments, neutralizing the threat.

Your task is to write a function that takes a string and return a new string with all vowels removed.

For example, the string "This website is for losers LOL!" would become "Ths wbst s fr lsrs LL!".

Note: for this kata y isn't considered a vowel.
*/



function disemvowel(str) {
  var num;
  let vocales = ["a","e","i","o","u"];
  for(i=0;i<vocales.length;i++){
    num=str.toLowerCase().indexOf(vocales[i]);
    while(num!=-1){
      if(num>0){
        if(num==(str.length-1)){
          str=str.substring(0,num);
        }
        else{
          str=str.substring(0,num)+str.substring(num+1);
        }
      }
      else{
        str=str.substring(num+1);
      }
      num=str.toLowerCase().indexOf(vocales[i]);
    }
  }
  return str;
}