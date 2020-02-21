# Configure a new ubuntu14.04 container with necessary tools and configuration
include stdlib

# Add file lines to bashrc
file_line { 'gs' :
  path => '/root/.bashrc',
  line => 'alias gs="git status"'
}
file_line { 'ga' :
  path => '/root/.bashrc',
  line => 'alias ga="git add"'
}
file_line { 'gc' :
  path => '/root/.bashrc',
  line => 'alias gc="git commit -m"'
}
file_line { 'gp' :
  path => '/root/.bashrc',
  line => 'alias gp="git push"'
}
file_line { 'git name' :
  path => '/root/.bashrc',
  line => 'git config user.name "will"'
}
file_line { 'git email' :
  path => '/root/.bashrc',
  line => 'git config user.email "818@holbertonschool.com"'
}
file_line { 'credential cache' :
  path => '/root/.bashrc',
  line => "git config credential.helper 'cache --timeout=99999'"
}

# Install puppet-lint
package { 'puppet-lint':
  ensure   => '2.1.1',
  provider => 'gem',
}

# Install mysql 5.7
package { 'mysql-server-5.7':
  ensure => present,
}

# Install flask
package { 'python3-flask':
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

# install git
package { 'git':
  name => 'git',
}

# git cache
exec { 'git-cache-and-aliases':
  command => "git config credential.helper \'cache --timeout 99999\'",
  path    => '/usr/local/bin/:/usr/bin/:/bin/'
}
# install shellcheck
package { 'shellcheck':
  ensure => present,
}

# install python3
package { 'python3.4':
  name => 'python3',
}
