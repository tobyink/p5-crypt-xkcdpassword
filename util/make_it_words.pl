use 5.010;
use strict;
use utf8::all;
use Web::Magic;

print <<'HEADER';
package Crypt::XkcdPassword::Words::IT;
my @words;
sub words
{
	unless (@words)
	{
		while (<DATA>)
		{
			chomp;
			push @words, $_ if length;
		}
	}
	
	\@words
}
__PACKAGE__
__DATA__
HEADER

my $magic  = Web::Magic->new("http://en.wiktionary.org/wiki/Wiktionary:Frequency_lists/Italian50k?action=raw");
my $count = 0;
$magic =~ s{ \[\[ (\w+) \]\] }
{
	if (length $1 and $count++ < 20_000) {
		say lc $1;
	}
	$1;
}gex;