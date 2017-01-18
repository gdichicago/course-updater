require 'csv'

# READ FILE
filepath = File.dirname(__FILE__) + '/courses.csv'
csv = CSV.read(filepath, headers: true, header_converters: :symbol)

# HELPER METHODS
def parse_repo_name(url)
  url.gsub(/^(\S+)\//, '').gsub('.git', '')
end

def clone_repo(url)
  puts "*** CLONING INTO #{url.upcase} ***"
  %x(git clone #{url})
end

def get(repo)
  repo_name = parse_repo_name(repo[:repo_url])
  %x(rm -rf #{repo_name}) if File.directory?(repo_name)
  clone_repo(repo[:repo_url])
  %x(rm -rf #{repo_name}/.git)
end

# RUN
csv.each do |row|
  get(row)
end
