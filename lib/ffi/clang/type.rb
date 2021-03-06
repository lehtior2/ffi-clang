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

module FFI
	module Clang
		class Type
			def initialize(type)
				@type = type
			end

			def kind
				@type[:kind]
			end

			def kind_spelling
				Lib.extract_string Lib.get_type_kind_spelling @type[:kind]
			end

			def spelling
				Lib.extract_string Lib.get_type_spelling(@type)
			end

			def variadic?
				Lib.is_function_type_variadic(@type) != 0
			end

			def pod?
				Lib.is_pod_type(@type) != 0
			end

			def num_arg_types
				Lib.get_num_arg_types(@type)
			end

			def pointee
				Type.new Lib.get_pointee_type @type
			end

			def canonical
				Type.new Lib.get_canonical_type(@type)
			end

			def const_qualified?
				Lib.is_const_qualified_type(@type) != 0
			end

			def arg_type(i)
				Type.new Lib.get_arg_type(@type, i)
			end

			def result_type
				Type.new Lib.get_result_type(@type)
			end
		end
	end
end
