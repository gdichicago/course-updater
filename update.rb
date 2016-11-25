require 'csv'

# READ FILE
filepath = File.dirname(__FILE__) + '/courses.csv'
csv = CSV.read(filepath, headers: true, header_converters: :symbol)

# HELPER METHODS
def fetch_origin(dirname)
  Dir.chdir(dirname)
  puts "*** FETCHING REMOTE ORIGIN FOR #{dirname.upcase} ***"
  %x(git fetch origin)
  Dir.chdir("..")
end

def clone_repo(url)
  puts "*** CLONING INTO #{url.upcase} ***"
  %x(git clone #{url})
end

def get(repo)
  if File.directory?(repo[:directory_name])
    fetch_origin(repo[:directory_name])
  else
    clone_repo(repo[:repo_url])
  end
end

# RUN
csv.each do |row|
  get(row)
end
