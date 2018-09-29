(* test driver for libopenmpt ocaml bindings *)

open Openmpt

(* print some info about underlying libopenmpt *)
let () =
  print_string "openmpt library version: ";
  print_int (openmpt_get_library_version());
  print_newline ()

let () =
  print_string "openmpt core version: ";
  print_int (openmpt_get_core_version());
  print_newline ()

(* get all the detailed info *)
let () =
  let keys = ["library_version"; "library_version_is_release"; "library_features"; "core_version"; "source_url"; "source_date"; "source_revision"; "source_is_modified"; "source_has_mixed_revisions"; "source_is_package"; "build"; "build_compiler"; "credits"; "contact"; "license"; "url"; "support_forum_url"; "bugtracker_url"] in
  List.iter (fun s -> print_string (s ^ ": "); print_endline (openmpt_get_string s)) keys

(* list of supported file extensions *)
let () =
  print_string "openmpt supported extensions: ";
  print_endline (openmpt_get_supported_extensions())

(* ***************************************************** *)
(* try to parse the file finally *)
let input_filename = Sys.argv.(1)

(*
// Query whether a file extension is supported
int openmpt_is_extension_supported( [in,string] const char * extension );
*)

(* helper function: read entire file and return *)
let slurp_channel channel =
  let buffer_size = 4096 in
  let buffer = Buffer.create buffer_size in
  let string = String.create buffer_size in
  let chars_read = ref 1 in
  while !chars_read <> 0 do
    chars_read := input channel string 0 buffer_size;
    Buffer.add_substring buffer string 0 !chars_read
  done;
  Buffer.contents buffer

(* Read entire file to RAM *)
let contents =
  let ic = open_in_bin input_filename in
  let contents = slurp_channel ic in
  let () = close_in ic in

  print_string "BYTES READ: ";
  print_int (String.length contents);
  print_newline ();
  contents

(* Test the probability of opening it *)
let () =
  let buffer = openmpt_stream_buffer_init contents in
  let probability = openmpt_could_open_probability_buffer buffer 1.0 in

  print_float probability;
  print_newline()
    
