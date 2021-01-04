# ADGroup-Tree
Small PowerShell Skript which shows AD-Group Memberships as a Tree of Users and Groups and traverses the List down recursively

```
Usage:
Just Pipe the Output of builtin Get-ADGroup CMDlet to this skript
Get-ADGroup -Identity "testgroup" | ADGroup-Tree

Example-Output:
PS C:\Users\me\>Get-ADGroup -Identity "testgroup" | ADGroup-Tree
      |    Members of CN=testgroup,OU=Groups,DC=company,DC=local
      |--- User Clinton, Bill
      |--- User Dole, Bob
      |--- Group testgroup_sub1
           |    Members of CN=testgroup_sub1,OU=Groups,DC=company,DC=local
           |--- User Bush, George
           |--- User Simpson, Homer
           |--- Group testgroup_sub_sub1
                |    Members of CN=testgroup_sub_sub1,OU=Groups,DC=company,DC=local
                |--- User Dole, Bob
                |--- User Simpson, Bart
           |--- Group testgroup_sub_sub2
                |    Members of CN=testgroup_sub_sub2,OU=Groups,DC=company,DC=local
                |--- User Simpson, Lisa
```
