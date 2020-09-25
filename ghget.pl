#!/bin/perl

# 实现原理如下：
#    通过 https://g.ioiox.com/ 提供的免费代理下载服务来实现快速下载
#
#
# 目前无法不支持断点下载



use strict;
use warnings;
use Getopt::Long;

my $help = '';
GetOptions ('h'   => \$help, 
            'help'  => \$help);


sub print_usage(){
    print "usage of ghget:\n";
    print "    ghget <httpurl> 下载连接执行指向的文件\n";
    print "\n";
    print "感谢 https://g.ioiox.com/ 提供的免费服务\n\n";
}

if ($help) {
    print_usage();
    exit(0);
}

my $argc = @ARGV;
if ($argc == 0) {
    print_usage();
    exit(1);
}

my $proxy = "https://g.ioiox.com/";
my $target = $ARGV[0];
my $url = $proxy . $target;
system("wget  $url");
