namespace :db do

    desc "Dumps the database to backups"
    task :dump => :environment do
        cmd = nil
        with_config do |app, host, db, user|
            cmd = "pg_dump -F c -v -h #{host} -d #{db} -w -f #{Rails.root}/db/backups/#{Time.now.strftime("%Y%m%d%H%M%S")}_#{db}.psql"
        end
        puts cmd
        exec cmd
    end

    desc "Dumps the database to backups"
    task :dumpplain => :environment do
        cmd = nil
        with_config do |app, host, db, user|
            cmd = "pg_dump -F p -v -h #{host} -d #{db} -w -f #{Rails.root}/db/backups/#{Time.now.strftime("%Y%m%d%H%M%S")}_#{db}.txt"
        end
        puts cmd
        exec cmd
    end

    desc "Dumps the database to backups"
    task :dumpzip => :environment do
        cmd = nil
        with_config do |app, host, db, user|
            cmd = "pg_dump -F t -v -h #{host} -d #{db} -w -f #{Rails.root}/db/backups/#{Time.now.strftime("%Y%m%d%H%M%S")}_#{db}.gzip"
        end
        puts cmd
        exec cmd
    end

    desc "Dumps the database to backups"
    task :dumptopath, [:path] => :environment do |task,args|
        cmd = nil
        with_config do |app, host, db, user|
            cmd = "pg_dump -F t -v -h #{host} -d #{db} -w -f #{args.path}_#{db}.gzip"
        end
        puts cmd
        exec cmd
    end   

    desc "Dumps the database to backups"
    task :dumpwname, [:nam] => :environment do |task,args|
        cmd = nil
        with_config do |app, host, db, user|
            cmd = "pg_dump -F c -v -h #{host} -d #{db} -w -f #{Rails.root}/db/backups/#{args.nam}_#{db}.psql"
        end
        puts cmd
        exec cmd
    end     

    desc "Restores the database from backups"
    task :restore, [:date] => :environment do |task,args|
        if args.date.present?
            cmd = nil
            with_config do |app, host, db, user|
                cmd = "pg_restore -F c -v -c -C #{Rails.root}/db/backups/#{args.date}_#{db}.psql"
            end
            Rake::Task["db:drop"].invoke
            Rake::Task["db:create"].invoke
            puts cmd
            exec cmd
        else
            puts 'Please pass a date to the task'
        end
    end

    desc "Restores the database from backups"
    task :restoredos, [:a] => :environment do |task,args|
            ActiveRecord::Base.connection.execute <<-SQL
              SELECT 
                pg_terminate_backend(pid) 
              FROM 
                pg_stat_activity 
              WHERE 
                -- don't kill my own connection!
                pid <> pg_backend_pid()
                -- don't kill the connections to other databases
                AND datname = '#{ActiveRecord::Base.connection.current_database}';
            SQL
            cmd = nil
            with_config do |app, host, db, user|
                cmd = "pg_restore -F c -v -c -C #{Rails.root}/db/backups/#{args.a}_#{db}.psql"
            end
            #Rake::Task["db:drop"].invoke
            #Rake::Task["db:create"].invoke
            puts cmd
            exec cmd
            puts "Finaliza"
    end


    private

    def with_config
        yield Rails.application.class.parent_name.underscore,
        ActiveRecord::Base.connection_config[:host],
        ActiveRecord::Base.connection_config[:database],
        ActiveRecord::Base.connection_config[:username],
        ActiveRecord::Base.connection_config[:password]
    end

end