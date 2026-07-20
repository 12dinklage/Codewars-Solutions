!INSTRUCCIONES
!John has some amount of money of which he wants to deposit a part f0 to the bank at the beginning of year 1. He wants to withdraw each year for his living an amount c0.
!Here is his banker plan:
!deposit f0 at beginning of year 1
!his bank account has an interest rate of p percent per year, constant over the years
!John can withdraw each year c0, taking it whenever he wants in the year; he must take account of an inflation of i percent per year in order to keep his quality of living. i is supposed to stay constant over the years.
!all amounts f0..fn-1, c0..cn-1 are truncated by the bank to their integral part
!Given f0, p, c0, i the banker guarantees that John will be able to go on that way until the nth year.
!Example:
!f0 = 100000, p = 1 percent, c0 = 2000, n = 15, i = 1 percent
!beginning of year 2 -> f1 = 100000 + 0.01*100000 - 2000 = 99000;  c1 = c0 + c0*0.01 = 2020 (with inflation of previous year)
!beginning of year 3 -> f2 =  99000 + 0.01*99000 - 2020  = 97970;  c2 = c1 + c1*0.01 = 2040.20 
!(with inflation of previous year, truncated to 2040)
!beginning of year 4 -> f3 =  97970 + 0.01*97970 - 2040  = 96909.7 (truncated to 96909); 
!c3 = c2 + c2*0.01 = 2060.4 (with inflation of previous year, truncated to 2060)
!and so on...
!John wants to know if the banker's plan is right or wrong. Given parameters f0, p, c0, n, i build a function fortune which returns true if John can make a living until the nth year and false if it is not possible.

!COMENTARIO
! Esta solución no me la reconoce codewars, pero aquí está el programa que verifica los tests
! y sí salen los mismos resultados
!Entonces creo que la función está bien

!      CALL testing(100000, 1.0, 2000, 15, 1.0, .TRUE.) ok
!      CALL testing(100000, 1.0, 9185, 12, 1.0, .FALSE.) ok
!      CALL testing(100000000, 1.0, 100000, 50, 1.0, .TRUE.) ok
!      CALL testing(100000000, 1.5, 10000000, 50, 1.0, .FALSE.) ok
!      CALL testing(100000000, 5.0, 1000000, 50, 1.0, .TRUE.) ok

  

PROGRAM main
    IMPLICIT NONE
    INTEGER :: f0, c0, n
    LOGICAL :: actual
    REAL :: p, i
	f0=100000000
	p=5.0
	c0=1000000
	n=50
	i=1.0
    actual = fortune(f0, p, c0, n, i)
    
    PRINT *, "El valor es:", actual

CONTAINS

    ! Definición de la función
    LOGICAL FUNCTION fortune(f0, p, c0, n, i)
    ! your code
    REAL :: f, c, p, i
    INTEGER :: cont, n, f0, c0
    LOGICAL :: res
    
    f = REAL(f0)
    c = REAL(c0)
    cont = 1
    res = .FALSE.
    IF (f > c) THEN
      res = .TRUE.
      p = p / 100
      i = i / 100
      f = AINT(f * (1 + p) - c)
      c = AINT(c * (1 + i))
      DO WHILE (f > 0 .AND. cont <= n)
        f = AINT(f * (1 + p) - c)
        c = AINT(c * (1 + i))
        cont = cont + 1
      END DO
      IF (f <= 0) THEN
        res = .FALSE.
      END IF
    ELSE
      res = .FALSE.
    END IF
    
    fortune = res
  END FUNCTION fortune

END PROGRAM main