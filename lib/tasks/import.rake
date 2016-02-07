namespace :import do

  desc "delete data"
  task delete_anonymous: :environment do
    url = "https://dubpy8abnqmkw.cloudfront.net/images/anonymous/anonymous-company.png"
    Startup.where(logo_url: url).order(:like_count).limit(500).destroy_all
  end

  desc "update data"
  task update: :environment do
    datas = File.open("#{Rails.root}/lib/data/data2.json").read
    JSON.parse(datas).each do |data|
      next if !data["lat"] || !data["lng"]
      startup = Startup.find_or_initialize_by(name: data["name"])
      startup.description     = data["about_me"]
      startup.company_name    = data["company_name"]
      startup.foundation_date = data["foundation_date"]
      startup.address         = data["address"]
      startup.logo_url        = data["logo_url"]
      startup.company_url     = data["company_url"]
      startup.job_count       = data["job_count"]
      startup.employee_count  = data["employee_count"]
      startup.lat             = data["lat"].to_f
      startup.lng             = data["lng"].to_f
      startup.save!
      puts "saved #{startup.name}"
    end
  end

  desc "import data"
  task data: :environment do
    datas = File.open("#{Rails.root}/lib/data/data.json").read

    # まどろっこしいけどクエリ発行数を減らさないとClearDBの制限に引っかかるので
    names = []
    startups = []

    JSON.parse(datas).each do |data|
      next if names.include?(data["name"])
      next if !data["lat"] || !data["lng"]
      names.push(data["name"])

      startups.push Startup.new(
        name:           data["name"],
        description:    data["about_me"],
        company_name:   data["company_name"],
        foundation_date: data["foundation_date"],
        address:        data["address"],
        logo_url:       data["logo_url"],
        company_url:    data["company_url"],
        job_count:      data["job_count"],
        employee_count: data["employee_count"],
        lat:            data["lat"].to_f,
        lng:            data["lng"].to_f,
      )
    end
    Startup.import startups
  end
end
