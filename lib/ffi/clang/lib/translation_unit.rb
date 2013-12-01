# Copyright, 2010-2012 by Jari Bakken.
# Copyright, 2013, by Samuel G. D. Williams. <http://www.codeotaku.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'ffi/clang/lib/index'

module FFI
	module Clang
		module Lib
			typedef :pointer, :CXTranslationUnit

			TranslationUnitFlags = enum [:none, :detailed_preprocessing_record, :incomplete, :precompiled_preamble, :cache_completion_results]

			# Source code translation units:
			attach_function :parse_translation_unit, :clang_parseTranslationUnit, [:CXIndex, :string, :pointer, :int, :pointer, :uint, :uint], :CXTranslationUnit
			attach_function :dispose_translation_unit, :clang_disposeTranslationUnit, [:CXTranslationUnit], :void

            # Translation unit from AST file (-emit-ast)
            attach_function :create_translation_unit, :clang_createTranslationUnit, [:CXIndex, :string], :CXTranslationUnit
		end
	end
end
