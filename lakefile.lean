import Lake
open Lake DSL

package readline {
  moreLinkArgs := #["-lreadline"]
}

require alloy from
  git "https://github.com/tydeu/lean4-alloy"@"main"

module_data alloy.c.o : ActiveFileTarget

lean_lib Readline {
  precompileModules := true
  nativeFacets := #[Module.oFacet, `alloy.c.o]
}

@[defaultTarget]
lean_exe Main

