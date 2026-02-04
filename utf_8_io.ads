-- Operations to encode Unicode as UTF-8 and write it to a text file, and to read and decode UTF-8 from a text file
-- Copyright (C) by PragmAda Software Engineering
-- SPDX-License-Identifier: BSD-3-Clause
-- See https://spdx.org/licenses/
-- If you find this software useful, please let me know, either through
-- github.com/jrcarter or directly to pragmada@pragmada.x10hosting.com

with Ada.Text_IO;

package UTF_8_IO is
   subtype File_Handle is Ada.Text_IO.File_Type;

   procedure Put_Line (Item : in Wide_Wide_String; File : in File_Handle := Ada.Text_IO.Current_Output) with
      Pre => Ada.Text_IO.Is_Open (File) and then Ada.Text_IO.Mode (File) in Ada.Text_IO.Out_File .. Ada.Text_IO.Append_File;
   -- Encodes Item as UTF-8 and writes the resulting sequence of bytes to File

   use type Ada.Text_IO.File_Mode;

   function Next_Line (File : in File_Handle := Ada.Text_IO.Current_Input) return Wide_Wide_String with
      Pre => Ada.Text_IO.Is_Open (File) and then Ada.Text_IO.Mode (File) = Ada.Text_IO.In_File;
   -- Reads a line from File and returns the decoding of the UTF-8 contents of the line
end UTF_8_IO;
