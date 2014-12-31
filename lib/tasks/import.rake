namespace :import do

  desc "delete data"
  task delete: :environment do
    Startup.delete_all
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
