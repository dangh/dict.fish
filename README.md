# dict.fish
simple dictionary for fish shell

### Installation

```sh
fisher install dangh/dict.fish
```

### Usage

```sh
# set key value
$ dict my-map set key1 value1
# print dictionary
$ dict my-map
key1 value1
$ dict my-map set key2 value2
$ dict my-map
key1 value1
key2 value2
# get key
$ dict my-map get key2
value2
$ dict my-map get key1
value1
# delete key
$ dict my-map delete key1
$ dict my-map
key2 value2
```
