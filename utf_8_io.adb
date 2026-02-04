-- Operations to encode Unicode as UTF-8 and write it to a text file, and to read and decode UTF-8 from a text file
-- Copyright (C) by PragmAda Software Engineering
-- SPDX-License-Identifier: BSD-3-Clause
-- See https://spdx.org/licenses/
-- If you find this software useful, please let me know, either through
-- github.com/jrcarter or directly to pragmada@pragmada.x10hosting.com

with Ada.Strings.UTF_Encoding.Wide_Wide_Strings;

package body UTF_8_IO is
   procedure Put_Line (Item : in Wide_Wide_String; File : in File_Handle := Ada.Text_IO.Current_Output) is
      -- Empty
   begin -- Put_Line
      Ada.Text_IO.Put_Line
         (File => File, Item => Ada.Strings.UTF_Encoding.Wide_Wide_Strings.Encode (Item, Ada.Strings.UTF_Encoding.UTF_8) );
   end Put_Line;

   function Next_Line (File : in File_Handle := Ada.Text_IO.Current_Input) return Wide_Wide_String is
      (Ada.Strings.UTF_Encoding.Wide_Wide_Strings.Decode (Ada.Text_IO.Get_Line (File), Ada.Strings.UTF_Encoding.UTF_8) );
end UTF_8_IO;
