# coding : utf-8
EXT_TO_CONVERT = ['mov','avi','mkv','wmv']
dir_to_explore = [ ARGV[0] ]

while curr_dir = dir_to_explore.pop
	Dir.chdir(curr_dir)
	Dir['*'].each do |file|
		if File.stat(file).directory?
			dir_to_explore << File.absolute_path(file)
		end
		extname = File.extname(file)
		extname = extname[1..-1].downcase if ! extname.empty?
		if EXT_TO_CONVERT.find_index(extname)
			outfile = File.basename(file, ".*") + ".m4v"
			puts "Converting: " + File.absolute_path(file)
		#	puts "To: " + outfile
			`/usr/bin/HandBrakeCLI -i "#{file}" -o "#{outfile}" --preset "iPad" 2>1&`
		#	file.delete(file)
		end
		#puts Dir.getwd + '/' + file
	end
end
