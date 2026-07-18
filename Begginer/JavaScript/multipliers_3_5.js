function solution(number){
  let suma=0;
  if(number>=0){
    for(let i=1;i<number;i++){
      if(i%5==0 || i%3==0){
        suma=suma+i;
      }
    }
  }
  return(suma);
}