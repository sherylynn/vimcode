SetCapsLockState , AlwaysOff
CapsLock & b::SendInput {Left}
CapsLock & n::SendInput {Down}
CapsLock & p::SendInput {Up}
CapsLock & f::SendInput {Right}
CapsLock & a::SendInput {Home}
CapsLock & e::SendInput {End}
CapsLock & d::SendInput {Delete}
CapsLock & k::SendInput, +{End}^{x}
CapsLock & y::SendInput, ^{v}
;CapsLock & c::SendInput {Esc}
;CapsLock & c::SendInput, ^{[}
CapsLock & c::SendInput, ^{C}
CapsLock & v::SendInput, ^{v}
;Shift & CapsLock::SendInput, {Shift Down}{Blind}{Esc}{Shift Up}
;用^表示ctrl 用+表示 shift
CapsLock::SendInput ^
;Esc::CapsLock
;下面是以前自己做给windows和mac键位兼容的映射
;Capslock::Ctrl
;LWin::Alt
;Alt::Ctrl
Ctrl & b::SendInput {Left}
Ctrl & n::SendInput {Down}
Ctrl & p::SendInput {Up}
Ctrl & f::SendInput {Right}
Ctrl & a::SendInput {Home}
Ctrl & e::SendInput {End}
Ctrl & d::SendInput {Delete}
;Ctrl & k::SendInput, +{End}{Delete}
Ctrl & k::SendInput, +{End}^{x}
Ctrl & y::SendInput, ^{v}
Alt & a::SendInput, ^{A}
Alt & x::SendInput, ^{X}
Alt & c::SendInput, ^{C}
Alt & v::SendInput, ^{V}
Alt & f::SendInput, ^{F}
Alt & s::SendInput, ^{S}
Alt & z::SendInput, ^{Z}
;先注释避免影响vim中效果
;~y::
;Keywait, y, , t0.5
;if errorlevel = 1
;return
;else
;Keywait, y, d, t0.1
;if errorlevel = 0
;{
;Send +{End} {Delete}
;return
;}
;return
