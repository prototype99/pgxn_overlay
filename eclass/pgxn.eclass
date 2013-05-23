# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# @MAINTAINER:
# Ronan Dunklau <ronan@dunklau.fr>
# @ECLASS: pgxn.eclass
# @DESCRIPTION: The pgxn eclass provides function to fetch and install
# postgresql extensions from the Postgresql extension network (PGXN).

inherit eutils

DEPEND=">=dev-db/postgresql-server-9.1"

SRC_URI="http://api.pgxn.org/dist/${PN}/${PV}/${P}.zip"
SLOT=0

pgxn_src_compile() {
	emake USE_PGXS=1 || die
}

src_install() {
	emake DESTDIR="${D}" USE_PGXS=1 install || die
}
