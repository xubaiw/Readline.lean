import Readline

open Readline

/-
A REPL-like example
-/

def main : IO Unit := do
  -- count variable
  let mut i := 0
  repeat do
    -- get input
    let line ← readline "> "
    -- break loop if input is empty
    if line.length = 0 then
      break
    -- print out and add to history
    IO.println s!"[{i}]: {line}"
    addHistory line
    -- count
    i := i + 1
