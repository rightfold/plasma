# vim: ft=plasma
# This is free and unencumbered software released into the public domain.
# See ../LICENSE.unlicense

module Vars_6

export main

# Import modules that we'll need.
import io

func main() -> Int uses IO {
    _ = foo(1)

    # It is an error to read from _.
    print!(int_to_string(_))

    return 0
}

func foo(n : Int) -> Int { return n + 3 }
