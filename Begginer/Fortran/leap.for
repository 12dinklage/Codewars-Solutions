! In this kata you should simply determine, whether a given year is a leap year or not. In case you don't know the rules, here they are:
!       Years divisible by 4 are leap years,
!       but years divisible by 100 are not leap years,
!       but years divisible by 400 are leap years.
! Tested years are in range 1600 ≤ year ≤ 4000.

module Solution
  implicit none
contains

  function isLeapYear(year) result(leap)
    integer, intent(in) :: year
    logical :: leap
    
    leap = .TRUE.
    
    if ((year>=1600) .and. (year<=4000)) then
      if (MOD(year,4)==0) then
        if (MOD(year,100)==0) then
          leap = .FALSE.
          if (MOD(year,400)==0) then
            leap = .TRUE.
          end if
        end if
      else
        leap = .FALSE.
      end if
    end if
    
  end function 
end module