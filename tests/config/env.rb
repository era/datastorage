ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"
ActiveRecord::Migrator.up "../../db/migrate"

$config = Hash.to_ostructs(YAML.load_file(File.join('../config/', 'upload.yml')))
