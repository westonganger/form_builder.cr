require "spec"
require "../src/form_builder"

alias StringHash = Hash(String, String)

TESTED_FIELD_TYPES = {"checkbox", "file", "hidden", "password", "radio", "select", "text", "textarea", "date", "datetime-local", "time"}
NON_INPUT_TYPES = {"select", "textarea"}
