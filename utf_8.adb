-- Test program for UTF_8_IO
-- Copyright (C) by PragmAda Software Engineering
-- SPDX-License-Identifier: BSD-3-Clause
-- See https://spdx.org/licenses/
-- If you find this software useful, please let me know, either through
-- github.com/jrcarter or directly to pragmada@pragmada.x10hosting.com

with Ada.Command_Line;
with Ada.Text_IO;
with UTF_8_IO;

procedure UTF_8 is
   File : UTF_8_IO.File_Handle;
begin --UTF_8
   Ada.Text_IO.Open (File => File, Mode => Ada.Text_IO.In_File, Name => Ada.Command_Line.Argument (1) );

   All_Lines : loop
      exit All_Lines when Ada.Text_IO.End_Of_File (File);

      One_Line : declare
         Line : constant Wide_Wide_String := UTF_8_IO.Next_Line (File);
      begin -- One_Line
         Dump : for C of Line loop
            Ada.Text_IO.Put (Item => Wide_Wide_Character'Pos (C)'Image);
         end loop Dump;

         Ada.Text_IO.New_Line;
         UTF_8_IO.Put_Line (Item => Line);
      end One_Line;
   end loop All_Lines;

   Ada.Text_IO.Close (File => File);
end UTF_8;
