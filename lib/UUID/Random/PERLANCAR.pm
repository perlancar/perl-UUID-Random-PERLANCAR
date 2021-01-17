package UUID::Random::PERLANCAR;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use warnings;

sub generate {
    sprintf(
        "%04x%04x-%04x-%04x-%04x-%04x%04x%04x",
        rand(2**16),
        rand(2**16),
        rand(2**16),
        rand(2**16),
        rand(2**16),
        rand(2**16),
        rand(2**16),
        rand(2**16),
    );
}

1;
# ABSTRACT: Another implementation of UUID::Random

=head1 SYNOPSIS

Use like you would L<UUID::Random>:

 use UUID::Random::PERLANCAR;
 say UUID::Random::PERLANCAR::generate();


=head1 DESCRIPTION


=head1 SEE ALSO

L<UUID::Random>

Benchmark in L<Acme::CPANModules::UUID>

=cut
