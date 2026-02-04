" Vim syntax file
" Language:         HTCondor submit file
" Maintainer:       Carmelo Pellegrino <carmelo.pellegrino@cnaf.infn.it>
" Latest Revision:  2024-04-30

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim
syn case ignore

" HTC constants
syn region htcString       start=/"/  end=/"/  end=/$/  skip=/\\./
syn region htcString       start=/`/  end=/`/  end=/$/  skip=/\\./
syn region htcString       start=/\(s\)\@<!'\(s \|t \)\@!/  end=/'/  end=/$/  skip=/\\./

syn keyword htcBool        true false undefined yes no
syn match   htcNumber      display '\<\d\+\>'
syn match   htcNumberFloat display '\<\d\+\.\d\+\([eE][+-]\?\d\+\)\?\>'

" HTC universe
syn keyword htcUniverse    vanilla
syn keyword htcUniverse    scheduler
syn keyword htcUniverse    local
syn keyword htcUniverse    grid
syn keyword htcUniverse    java
syn keyword htcUniverse    vm
syn keyword htcUniverse    parallel
syn keyword htcUniverse    docker
syn keyword htcUniverse    container
syn keyword htcTransOut    ON_EXIT ON_EXIT_OR_EVICT ON_SUCCESS

syn cluster htcValues contains=htcString,htcNumber,htcNumberFloat,htcBool,htcUniverse,htcTransOut

syn region htcValue oneline contains=@htcValues start=/=/  end=/$/ transparent

" Comments
syn region htcComment oneline start=/^\s*#/ end=/$/

" HTC command
syn keyword htcCommand arguments
syn keyword htcCommand batch_name
syn keyword htcCommand copy_to_spool
syn keyword htcCommand environment
syn keyword htcCommand error
syn keyword htcCommand executable
syn keyword htcCommand getenv
syn keyword htcCommand input
syn keyword htcCommand log
syn keyword htcCommand notification
syn keyword htcCommand notify_user
syn keyword htcCommand output
syn keyword htcCommand priority
syn keyword htcCommand request_cpus
syn keyword htcCommand request_disk
syn keyword htcCommand request_gpus
syn keyword htcCommand request_memory
syn keyword htcCommand requirements
syn keyword htcCommand scitokens_file
syn keyword htcCommand should_transfer_files
syn keyword htcCommand transfer_executable
syn keyword htcCommand transfer_input_files
syn keyword htcCommand transfer_output_files
syn keyword htcCommand universe
syn keyword htcCommand use_oauth_services
syn keyword htcCommand use_scitokens
syn keyword htcCommand use_x509userproxy
syn keyword htcCommand want_io_proxy
syn keyword htcCommand when_to_transfer_output
syn keyword htcCommand x509userproxy
syn match   htcCommand display 'request_[a-zA-Z\.]\+'
syn match   htcCommand display '[a-zA-Z0-9]\+_oauth_permissions'
syn match   htcCustomCommand display '^+[a-zA-Z0-9]\+'
syn keyword htcQueueCommand queue

" Highlight Links
hi def link htcNumber           Number
hi def link htcNumberFloat      Float

hi def link htcComment          Comment

hi def link htcBool             Boolean
hi def link htcString           String

hi def link htcUrl              Underlined
hi def link htcIPv4             Underlined
hi def link htcIPv6             Underlined
hi def link htcPath             Keyword

hi def link htcCommand          Structure
hi def link htcQueueCommand     Function
hi def link htcCustomCommand    Keyword

hi def link htcUniverse         Identifier
hi def link htcTransOut         Identifier

let b:current_syntax = "htc"

let &cpo = s:cpo_save
unlet s:cpo_save
