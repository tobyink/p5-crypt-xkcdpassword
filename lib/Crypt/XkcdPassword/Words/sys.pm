package Crypt::XkcdPassword::Words::sys;

BEGIN {
	$Crypt::XkcdPassword::Words::sys::AUTHORITY = 'cpan:TOBYINK';
	$Crypt::XkcdPassword::Words::sys::VERSION   = '0.008';
}

use Carp;

sub filehandle
{
	my $name = '/usr/share/dict/words';
	-f $name or croak("$name does not exist; bailing out");
	
	open my $fh, '<:utf8', $name;
	$fh;
}

my @words;

sub words
{
	unless (@words)
	{
		my $handle = $_[0]->filehandle;
		while (<$handle>)
		{
			chomp;
			push @words, $_;
		}
	}
	\@words;
}

1;
