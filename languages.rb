class Languages
  Popular = [
    'ActionScript', 'C', 'C#', 'C++', 'Common Lisp', 'CSS', 'Diff', 'Emacs Lisp', 'Erlang',
    'Haskell', 'HTML', 'Java', 'JavaScript', 'Lua', 'Objective-C', 'Perl', 'PHP', 'Python',
    'Ruby', 'Scala', 'Scheme', 'TeX', 'XML'
  ]
  
  EverythingElseString =<<-END
    Ada
    AppleScript
    Arc
    ASP
    Assembly
    Batchfile
    Befunge
    BlitzMax
    Boo
    Brainfuck
    C-ObjDump
    ChucK
    Clojure
    CMake
    CoffeeScript
    ColdFusion
    Cpp-ObjDump
    Cucumber
    Cython
    D
    D-ObjDump
    Darcs Patch
    Delphi
    Dylan
    Eiffel
    F#
    Factor
    Fancy
    FORTRAN
    GAS
    Genshi
    Gentoo Ebuild
    Gentoo Eclass
    Go
    Groff
    Groovy
    Haml
    HaXe
    HTML+Django
    HTML+ERB
    HTML+PHP
    INI
    Io
    IRC log
    Java Server Pages
    LilyPond
    Literate Haskell
    LLVM
    Makefile
    Mako
    Markdown
    Matlab
    Max/MSP
    Mirah
    Moocode
    mupad
    Myghty
    Nemerle
    Nimrod
    Nu
    NumPy
    ObjDump
    Objective-J
    OCaml
    ooc
    OpenCL
    Parrot Internal Representation
    Prolog
    Pure Data
    R
    Racket
    Raw token data
    Rebol
    Redcode
    reStructuredText
    RHTML
    Rust
    Sass
    Self
    Shell
    Smalltalk
    Smarty
    Standard ML
    SuperCollider
    Tcl
    Tcsh
    Text
    Textile
    Vala
    Verilog
    VHDL
    VimL
    Visual Basic
    XQuery
    XS
    YAML
  END
  
  EverythingElse = EverythingElseString.split("\n").map{|x| x.strip }
  
end