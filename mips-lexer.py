#! /usr/bin/env python

# Pygmentize in one .py file: https://github.com/gpoore/minted/issues/176#issuecomment-1041378800

import argparse
import sys
import pygments.cmdline as _cmdline
import re

from pygments.lexer import RegexLexer, include, bygroups, default, using, \
    this, words, combined
from pygments.token import Text, Comment, Operator, Keyword, Name, String, \
    Number, Punctuation, Other
import pygments.unistring as uni


def main(args):
    parser = argparse.ArgumentParser()
    parser.add_argument('-l', dest='lexer', type=str)
    opts, rest = parser.parse_known_args(args[1:])
    if opts.lexer == 'mips':
        args = [__file__, '-l', __file__ + ':MIPSLexer', '-x', *rest]
    _cmdline.main(args)

# Pygments Lexer based off: https://github.com/sunjerry019/20SS-RA-uebungen/blob/06dc004bbb7fca0fb5a44d9eb710dd73f3f70146/hausarbeit/ha05/mipslexer.py
# Source for Name.Variable.Instance (with minor modifications): https://github.com/Xodarap/Mips-Assembly-Syntax-Highlighting/blob/master/mal.lang
class MIPSLexer(RegexLexer):
    
    """
    Pygments Lexer for MIPS files (.s, .asm).
    """

    name = 'MIPS_Assembly'
    aliases = ['mips']
    filenames = ['*.s', '*.asm']
    mimetypes = ['text/asm']

    flags = re.DOTALL | re.UNICODE | re.IGNORECASE | re.MULTILINE

    tokens = {
        'commentsandwhitespace': [
            (r'\s+', Text),
            # (r'#', Comment),
            (r'#.*?\n', Comment.Single),
            # (r'/\*.*?\*/', Comment.Multiline)
        ],
        'root': [
            include('commentsandwhitespace'),
            (r'(\.[a-z]+)\b', Keyword),
            (r'(\$(3[01]|[12]\d|\d|(ra)|([vk][01])|(a[0-3t])|(t[0-9])|(s[0-7p])|([gsf]p)|(zero)|(hi)|(lo)|(f3[01]|f[12]\d|f\d)))\b', Name.Variable.Instance),
            (r'[$a-zA-Z_][\w.\-:$]*\s*[:=]\s', Name.Variable),
            #(r'\$[$a-zA-Z_][\w.\-:$]*\s*[:=]\s', Name.Variable.Instance),
            (r'(\.\d+|[0-9]+\.[0-9]*)([eE][-+]?[0-9]+)?', Number.Float),
            (r'0[bB][01]+', Number.Bin),
            (r'0[oO][0-7]+', Number.Oct),
            (r'0[xX][0-9a-fA-F]+', Number.Hex),
            (r'[0-9]+', Number.Integer),
            (r'\.\.\.|=>', Punctuation),
            (r'\+\+|--|~|&&|\?|:|\|\||\\(?=\n)|'
             r'(<<|>>>?|==?|!=?|[-<>+*%&|^/])=?', Operator),
            (r'[{(\[;,]', Punctuation),
            (r'[})\].]', Punctuation),
            # (r'(for|in|while|do|return|if|else)\b', Keyword, 'slashstartsregex'),
            # (r'(var|macro|function)\b', Keyword.Declaration, 'slashstartsregex'),
            (r'(add|sub|addu|subu|addi|addiu|andi|div|rem|mfhi|mflo|mul|mult|b|j|jal|jr|beq|beqz|bne|bnez|bge|bgeu|'
                r'begz|bgt|bgtu|bgtz|ble|bleu|blez|blt|bltu|bltz|sltu|not|and|or|ori|syscall|move|'
                r'la|lb|lbu|lh|li|lui|lw|sb|sll|sh|sra|srl|sw)\b', Name.Builtin),
            (r'(\'.\')', String.Char),
            (r'"(\\\\|\\"|[^"])*"', String.Double),
            (r"'(\\\\|\\'|[^'])*'", String.Single),
            (r'`', String.Backtick, 'interp'),
            (r'\$', Name.Other),
            (r'\$?[$a-zA-Z_][\w-]*', Name.Other),
        ],
        'interp': [
            (r'`', String.Backtick, '#pop'),
            (r'\\\\', String.Backtick),
            (r'\\`', String.Backtick),
            (r'\$\{', String.Interpol, 'interp-inside'),
            (r'\$', String.Backtick),
            (r'[^`\\$]+', String.Backtick),
        ],
        'interp-inside': [
            # TODO: should this include single-line comments and allow nesting strings?
            (r'\}', String.Interpol, '#pop'),
            include('root'),
        ],            

    }

if __name__ == '__main__':
    main(sys.argv)
