namespace :import do

  desc "import data"
  task data: :environment do
    datas = File.open("#{Rails.root}/lib/data/data.json").read
    JSON.parse(datas).each do |data|
      Startup.create(
        name:           data["name"],
        description:    data["about_me"],
        company_name:   data["company_name"],
        foundation_date: data["foundation_date"],
        address:        data["address"],
        logo_url:       data["logo_url"],
        company_url:    data["company_url"],
        job_count:      data["job_count"],
        employee_count: data["employee_count"],
        lat:            data["lat"],
        lng:            data["lng"],
      )
    end
  end
end
