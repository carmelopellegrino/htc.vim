" Vim syntax file
" Language:         HTCondor submit file
" Maintainer:       Carmelo Pellegrino <carmelo.pellegrino@cnaf.infn.it>
" Latest Revision:  2026-02-04

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim
syn case ignore

" HTC constants
syn region htcVariable     start="\$("  end=")" end=/$/ keepend contained
syn region htcString       start=/"/  end=/"/  end=/$/  skip=/\\./ contains=htcVariable
syn region htcString       start=/`/  end=/`/  end=/$/  skip=/\\./ contains=htcVariable
syn region htcString       start=/\(s\)\@<!'\(s \|t \)\@!/  end=/'/  end=/$/  skip=/\\./ contains=htcVariable

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

syn cluster htcValues contains=htcString,htcNumber,htcNumberFloat,htcBool,htcUniverse,htcTransOut,htcVariable

syn region htcValue oneline contains=@htcValues start=/=/  end=/$/ transparent

" Comments
syn region htcComment oneline start=/^\s*#/ end=/$/

" HTC commands
syn keyword htcCommand WantNameTag
syn keyword htcCommand accounting_group
syn keyword htcCommand accounting_group_user
syn keyword htcCommand allowed_execute_duration
syn keyword htcCommand allowed_job_duration
syn keyword htcCommand arc_application
syn keyword htcCommand arc_data_staging
syn keyword htcCommand arc_resources
syn keyword htcCommand arc_rte
syn keyword htcCommand arguments
syn keyword htcCommand aws_access_key_id_file
syn keyword htcCommand aws_region
syn keyword htcCommand aws_secret_access_key_file
syn keyword htcCommand azure_admin_key
syn keyword htcCommand azure_admin_username
syn keyword htcCommand azure_auth_file
syn keyword htcCommand azure_image
syn keyword htcCommand azure_location
syn keyword htcCommand azure_size
syn keyword htcCommand batch_extra_submit_args
syn keyword htcCommand batch_name
syn keyword htcCommand batch_project
syn keyword htcCommand batch_queue
syn keyword htcCommand batch_runtime
syn keyword htcCommand checkpoint_destination
syn keyword htcCommand checkpoint_exit_code
syn keyword htcCommand cloud_label_names
syn keyword htcCommand concurrency_limits
syn keyword htcCommand concurrency_limits_expr
syn keyword htcCommand container_image
syn keyword htcCommand container_is_common
syn keyword htcCommand container_service_names
syn keyword htcCommand container_target_dir
syn keyword htcCommand copy_to_spool
syn keyword htcCommand coresize
syn keyword htcCommand cron_day_of_month
syn keyword htcCommand cron_day_of_week
syn keyword htcCommand cron_hour
syn keyword htcCommand cron_minute
syn keyword htcCommand cron_month
syn keyword htcCommand cron_prep_time
syn keyword htcCommand cron_window
syn keyword htcCommand cuda_version
syn keyword htcCommand dagman_log
syn keyword htcCommand deferral_prep_time
syn keyword htcCommand deferral_time
syn keyword htcCommand deferral_window
syn keyword htcCommand delegate_job_GSI_credentials_lifetime
syn keyword htcCommand description
syn keyword htcCommand docker_image
syn keyword htcCommand docker_network_type
syn keyword htcCommand docker_override_entrypoint
syn keyword htcCommand docker_pull_policy
syn keyword htcCommand dont_encrypt_input_files
syn keyword htcCommand dont_encrypt_output_files
syn keyword htcCommand ec2_access_key_id
syn keyword htcCommand ec2_ami_id
syn keyword htcCommand ec2_availability_zone
syn keyword htcCommand ec2_block_device_mapping
syn keyword htcCommand ec2_ebs_volumes
syn keyword htcCommand ec2_elastic_ip
syn keyword htcCommand ec2_iam_profile_arn
syn keyword htcCommand ec2_iam_profile_name
syn keyword htcCommand ec2_instance_type
syn keyword htcCommand ec2_keypair
syn keyword htcCommand ec2_keypair_file
syn keyword htcCommand ec2_parameter_names
syn keyword htcCommand ec2_secret_access_key
syn keyword htcCommand ec2_security_groups
syn keyword htcCommand ec2_security_ids
syn keyword htcCommand ec2_spot_price
syn keyword htcCommand ec2_tag_names
syn keyword htcCommand ec2_user_data
syn keyword htcCommand ec2_user_data_file
syn keyword htcCommand ec2_vpc_ip
syn keyword htcCommand ec2_vpc_subnet
syn keyword htcCommand email_attributes
syn keyword htcCommand encrypt_execute_directory
syn keyword htcCommand encrypt_input_files
syn keyword htcCommand encrypt_output_files
syn keyword htcCommand environment
syn keyword htcCommand erase_output_and_error_on_restart
syn keyword htcCommand error
syn keyword htcCommand executable
syn keyword htcCommand gce_account
syn keyword htcCommand gce_auth_file
syn keyword htcCommand gce_image
syn keyword htcCommand gce_json_file
syn keyword htcCommand gce_machine_type
syn keyword htcCommand gce_metadata
syn keyword htcCommand gce_metadata_file
syn keyword htcCommand gce_preemptible
syn keyword htcCommand getenv
syn keyword htcCommand gpus_maximum_capability
syn keyword htcCommand gpus_minimum_capability
syn keyword htcCommand gpus_minimum_memory
syn keyword htcCommand gpus_minimum_runtime
syn keyword htcCommand grid_resource
syn keyword htcCommand gs_access_key_id_file
syn keyword htcCommand gs_secret_access_key_file
syn keyword htcCommand hold
syn keyword htcCommand hold_kill_sig
syn keyword htcCommand image_size
syn keyword htcCommand initialdir
syn keyword htcCommand input
syn keyword htcCommand jar_files
syn keyword htcCommand java_vm_args
syn keyword htcCommand job_ad_information_attrs
syn keyword htcCommand job_lease_duration
syn keyword htcCommand job_machine_attrs
syn keyword htcCommand job_machine_attrs_history_length
syn keyword htcCommand job_max_vacate_time
syn keyword htcCommand keep_claim_idle
syn keyword htcCommand kill_sig
syn keyword htcCommand kill_sig_timeout
syn keyword htcCommand leave_in_queue
syn keyword htcCommand load_profile
syn keyword htcCommand log
syn keyword htcCommand log_xml
syn keyword htcCommand machine_count
syn keyword htcCommand manifest
syn keyword htcCommand manifest_dir
syn keyword htcCommand match_list_length
syn keyword htcCommand max_idle
syn keyword htcCommand max_job_retirement_time
syn keyword htcCommand max_materialize
syn keyword htcCommand max_retries
syn keyword htcCommand max_transfer_input_mb
syn keyword htcCommand max_transfer_output_mb
syn keyword htcCommand mount_under_scratch
syn keyword htcCommand next_job_start_delay
syn keyword htcCommand nice_user
syn keyword htcCommand noop_job
syn keyword htcCommand noop_job_exit_code
syn keyword htcCommand noop_job_exit_signal
syn keyword htcCommand notification
syn keyword htcCommand notify_user
syn keyword htcCommand on_exit_hold
syn keyword htcCommand on_exit_hold_reason
syn keyword htcCommand on_exit_hold_subcode
syn keyword htcCommand on_exit_remove
syn keyword htcCommand output
syn keyword htcCommand output_destination
syn keyword htcCommand periodic_hold
syn keyword htcCommand periodic_hold_reason
syn keyword htcCommand periodic_hold_subcode
syn keyword htcCommand periodic_release
syn keyword htcCommand periodic_remove
syn keyword htcCommand periodic_vacate
syn keyword htcCommand preserve_relative_paths
syn keyword htcCommand primary_unix_group
syn keyword htcCommand priority
syn keyword htcCommand public_input_files
syn keyword htcCommand rank
syn keyword htcCommand remote_initialdir
syn keyword htcCommand remove_kill_sig
syn keyword htcCommand rendezvousdir
syn keyword htcCommand request_GPUs
syn keyword htcCommand request_cpus
syn keyword htcCommand request_disk
syn keyword htcCommand request_gpus
syn keyword htcCommand request_memory
syn keyword htcCommand require_gpus
syn keyword htcCommand requirements
syn keyword htcCommand retry_request_memory
syn keyword htcCommand retry_request_memory_increase
syn keyword htcCommand retry_request_memory_max
syn keyword htcCommand retry_until
syn keyword htcCommand run_as_owner
syn keyword htcCommand s3_access_key_id_file
syn keyword htcCommand s3_secret_access_key_file
syn keyword htcCommand scitokens_file
syn keyword htcCommand shell
syn keyword htcCommand should_transfer_files
syn keyword htcCommand skip_filechecks
syn keyword htcCommand skip_if_dataflow
syn keyword htcCommand stack_size
syn keyword htcCommand starter_debug
syn keyword htcCommand starter_log
syn keyword htcCommand stream_error
syn keyword htcCommand stream_input
syn keyword htcCommand stream_output
syn keyword htcCommand submit_event_notes
syn keyword htcCommand success_exit_code
syn keyword htcCommand transfer_checkpoint_files
syn keyword htcCommand transfer_container
syn keyword htcCommand transfer_error
syn keyword htcCommand transfer_executable
syn keyword htcCommand transfer_input
syn keyword htcCommand transfer_input_files
syn keyword htcCommand transfer_output
syn keyword htcCommand transfer_output_files
syn keyword htcCommand transfer_output_remaps
syn keyword htcCommand transfer_plugins
syn keyword htcCommand ulog_execute_attrs
syn keyword htcCommand universe
syn keyword htcCommand use_oauth_services
syn keyword htcCommand use_scitokens
syn keyword htcCommand use_x509userproxy
syn keyword htcCommand vm_checkpoint
syn keyword htcCommand vm_disk
syn keyword htcCommand vm_macaddr
syn keyword htcCommand vm_memory
syn keyword htcCommand vm_networking
syn keyword htcCommand vm_networking_type
syn keyword htcCommand vm_no_output_vm
syn keyword htcCommand vm_type
syn keyword htcCommand want_graceful_removal
syn keyword htcCommand want_io_proxy
syn keyword htcCommand want_job_networking
syn keyword htcCommand when_to_transfer_output
syn keyword htcCommand x509userproxy
syn keyword htcCommand xen_initrd
syn keyword htcCommand xen_kernel
syn keyword htcCommand xen_kernel_params
syn keyword htcCommand xen_root
syn match   htcCommand display '[a-zA-Z0-9]_HostPort'
syn match   htcCommand display '[a-zA-Z0-9]_container_port'
syn match   htcCommand display 'cloud_label_[a-zA-Z0-9]'
syn match   htcCommand display 'ec2_parameter_[a-zA-Z0-9]'
syn match   htcCommand display 'ec2_tag_[a-zA-Z0-9]'
syn match   htcCommand display 'request_[a-zA-Z\.]\+'
syn match   htcCommand display '[a-zA-Z0-9]\+_oauth_permissions'
syn match   htcCommand display '[a-zA-Z0-9]\+_oauth_resource'
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
hi def link htcVariable         Statement

let b:current_syntax = "htc"

let &cpo = s:cpo_save
unlet s:cpo_save
