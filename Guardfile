
# https://github.com/guard/guard-minitest
# gem install guard-minitest
# gem install minitest-reporters

guard :shell do
	# all files containing "_test.rb"
  watch(%r{^(.*_test\.rb)$}) { |m| system("ruby -r ./test_helper.rb ./#{m[1]}") }

	# all ruby files NOT containing "_test.rb"
  watch(%r{^((?!.*_test\.rb).*)\.rb$})     { |m| system("ruby -r ./test_helper.rb ./#{m[1]}_test.rb") }
end

# guard :minitest, test_folders: ['test', '.' ] do
# 	# all files containing "_test.rb"
# 	watch(%r{^(.*_test\.rb)$})
# 
# 	# all ruby files NOT containing "_test.rb"
# 	watch(%r{^((?!.*_test\.rb).*)\.rb$})     { |m| "#{m[1]}_test.rb" }
# 
# 	# watch for changes to the test_helper
# 	watch(%r{^test/test_helper\.rb$})  { 'test' }
# end
