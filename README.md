# �C���X�g�[��
```sh
$ cd ~/
$ git clone https://github.com/takxlz/dotfiles.git
```

## Vim
Vim�́A\~/.(g)vimrc�ȊO�ɂ��AWindows�ł́u\~/vimfiles/(g)vimrc�v�AUnix�ł́u\~/.vim/(g)vimrc�v��ǂݍ��ނ��Ƃ��ł��邽�߁A
[vimfiles|.vim]/(g)vimrc�ɂ��đS�Ă̐ݒ�t�@�C����[vimfiles|.vim]�ɏW�񂷂�悤�ɂ��Ă���B

### Windows
Windows�ł́AVim�̃z�[���f�B���N�g�����uvimfiles�v�Ƃ��ăV���{���b�N�����N��\��B
```sh
# mklink {link} -> {target}
$ mklink /D %HOMEPATH%\vimfiles %HOMEPATH%\dotfiles\vim
```

### Unux
Unix�ł́AVim�̃z�[���f�B���N�g�����u.vim�v�Ƃ��ăV���{���b�N�����N��\��B
```sh
# ln -s {target} <- {link}
$ ln -sf ~/dotfiles/vim ~/.vim
```
