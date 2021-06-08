// Copyright (c) 2019-2021 Alexander Medvednikov. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module token

pub struct Token {
pub:
	kind    Kind   // the token number/enum; for quick comparisons
	lit     string // literal representation of the token
	col     int    // the column in the source where the token occured
	line_nr int    // the line number in the source where the token occured
	pos     int    // the position of the token in scanner text
	len     int    // length of the literal
	//	tidx    int    // the index of the token
}

pub enum Kind {
	unknown
	eof
	name // user
	number // 123
	string // 'foo', "foo", """foo""" or '''foo'''
	chartoken // `A` - rune
	plus // +
	minus // -
	comma // ,
	colon // :
	hash // # comment
	assign // =
	lsbr // [
	rsbr // ]
	nl // linefeed / newline character
	cr // carrige return
	dot // .
	_end_
}

[inline]
pub fn (tok &Token) position() Position {
	return Position{
		len: tok.len
		line_nr: tok.line_nr - 1
		pos: tok.pos
		col: tok.col - 1
	}
}
