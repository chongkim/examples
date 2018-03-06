tree
#=>
# .
# ├── a
# │   ├── first.txt
# │   └── second.txt
# └── b
#     ├── first.txt
#     └── second.txt

ag 'pattern' -G first
# a/first.txt
# 1:one
#
# b/first.txt
# 1:one
