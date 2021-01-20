package UUID::Random::PERLANCAR;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use warnings;

sub generate {
    sprintf(
        "%08x-%04x-%04x-%04x-%04x%08x",
        rand(2**32),
        rand(2**16),
        rand(2**16),
        rand(2**16),
        rand(2**16), rand(2**32),
    );
}

sub generate_rfc {
    sprintf(
        "%08x-%04x-%04x-%04x-%04x%08x",
        rand(2**32),
        rand(2**16),
        int(rand(2**16)) & 0x00ff | 0x4000,
        int(rand(2**16)) & 0xbfff | 0x8000,
        rand(2**16), rand(2**32),
    );
}

1;
# ABSTRACT: Another implementation of UUID::Random

=head1 SYNOPSIS

Use like you would L<UUID::Random>:

 use UUID::Random::PERLANCAR;
 say UUID::Random::PERLANCAR::generate();


=head1 DESCRIPTION

This is another implementation of L<UUID::Random> with improved speed and an
extra function L</generate_rfc>.


=head1 FUNCTIONS

=head2 generate

Generate a single v4 UUID string in the formatted 32 hexadecimal digits:

 xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

Note that this module does not produce RFC 4122-compliant v4 (random) UUIDs (no
encoding of variant and version information into the UUID). See L</generate_rfc>
for UUIDs that comply to RFC 4122.

=head2 generate_rfc

Generate RFC-compliant a single v4 UUID string in the form of:

 xxxxxxxx-xxxx-Mxxx-Nxxx-xxxxxxxxxxxx

where C<x> is any hexadecimal digits ([0-9a-f]), C<M> is C<4>, and N is either
C<8>, C<9>, C<a>, or C<b> (1000, 1001, 1010, or 1011 in binary).


=head1 SEE ALSO

L<UUID::Random>

Benchmark in L<Acme::CPANModules::UUID>

L<Crypt::Misc>

=cut
