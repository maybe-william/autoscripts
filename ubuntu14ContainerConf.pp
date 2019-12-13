# Configure a new ubuntu14.04 container with necessary tools and configuration

# Install puppet-lint
package { 'puppet-lint':
  ensure   => '2.1.1',
  provider => 'gem',
}

# Install mysql 5.7
package { 'mysql-server-5.7': 
  ensure => present,
}

# Configure vim !!! -- assumes home folder as /root
file { 'vim-config':
  ensure  => present,
  path    => '/root/.vimrc',
  content => "
runtime! debian.vim

if has(\"syntax\")
  syntax on
endif

set background=dark

if has(\"autocmd\")
  filetype plugin indent on
endif

set showmatch		\" Show matching brackets.
set mouse=a		\" Enable mouse usage (all modes)

if filereadable(\"/etc/vim/vimrc.local\")
  source /etc/vim/vimrc.local
endif

inoremap ;l <Esc>
inoremap ;k <Esc>:update<Cr>
inoremap ;j <C-O>:update<Cr>
nnoremap ;j :update<CR>
",
}

# install python3
package { 'python3.4':
  name => 'python3',
}

# install shellcheck
package { 'shellcheck':
  ensure => '0.3.3-1~ubuntu14.04.1',
}

# install git
package { 'git':
  name => 'git',
}
