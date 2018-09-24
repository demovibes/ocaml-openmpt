(* test driver for libopenmpt ocaml bindings *)

open Libopenmpt;;

print_string "openmpt library version:\n";;

print_int (openmpt_get_library_version());;

(* external openmpt_get_core_version : unit -> int
	= "camlidl_libopenmpt_openmpt_get_core_version" *)
