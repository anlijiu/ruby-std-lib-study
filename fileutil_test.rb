#!/usr/bin/env ruby

require 'fileutils'

#unix 命令， 没什么好说的

FileUtils.cd(dir, options)
FileUtils.cd(dir, options) {|dir| .... }
FileUtils.pwd()
FileUtils.mkdir(dir, options)
FileUtils.mkdir(list, options)
FileUtils.mkdir_p(dir, options)
FileUtils.mkdir_p(list, options)
FileUtils.rmdir(dir, options)
FileUtils.rmdir(list, options)
FileUtils.ln(old, new, options)
FileUtils.ln(list, destdir, options)
FileUtils.ln_s(old, new, options)
FileUtils.ln_s(list, destdir, options)
FileUtils.ln_sf(src, dest, options)
FileUtils.cp(src, dest, options)
FileUtils.cp(list, dir, options)
FileUtils.cp_r(src, dest, options)
FileUtils.cp_r(list, dir, options)
FileUtils.mv(src, dest, options)
FileUtils.mv(list, dir, options)
FileUtils.rm(list, options)
FileUtils.rm_r(list, options)
FileUtils.rm_rf(list, options)
FileUtils.install(src, dest, mode = <src''s>, options)
FileUtils.chmod(mode, list, options)
FileUtils.chmod_R(mode, list, options)
FileUtils.chown(user, group, list, options)
FileUtils.chown_R(user, group, list, options)
FileUtils.touch(list, options)
