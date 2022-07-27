import Alloy.C
open scoped Alloy.C

namespace Readline

alloy c include <stdio.h> <stdint.h> <stdlib.h> <string.h> <lean/lean.h> <readline/readline.h> <readline/history.h>

alloy c extern "lean_readline"
def readline (prompt : @& String) : BaseIO String := {
  const char *p = lean_string_cstr(prompt);
  char *line = readline(p);
  lean_object *s = lean_mk_string(line);
  free(((void *)line));
  return lean_io_result_mk_ok(s);
}

alloy c extern "lean_add_history"
def addHistory (history : @& String) : BaseIO Unit := {
  const char *h = lean_string_cstr(history);
  add_history(h);
  return lean_io_result_mk_ok(lean_box(0));
}

end Readline
