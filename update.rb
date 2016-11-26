require 'csv'

# HANDLE COMMAND LINE ARGS
# add, remove

# READ FILE
filepath = File.dirname(__FILE__) + '/courses.csv'
csv = CSV.read(filepath, headers: true, header_converters: :symbol)

# HELPER METHODS
def parse_repo_name(url)
  url.gsub(/^(\S+)\//, '').gsub('.git', '')
end

def fetch_origin(repo_name, remote)
  Dir.chdir(repo_name)
  puts "*** FETCHING REMOTE ORIGIN FOR #{repo_name.upcase} ***"
  %x(git fetch #{remote})
  Dir.chdir("..")
end

def clone_repo(url)
  puts "*** CLONING INTO #{url.upcase} ***"
  %x(git clone #{url})
end

def get(repo)
  repo_name = parse_repo_name(repo[:repo_url])
  if File.directory?(repo_name)
    fetch_origin(repo_name, repo[:remote])
  else
    clone_repo(repo[:repo_url])
  end
end

# RUN
csv.each do |row|
  get(row)
end
