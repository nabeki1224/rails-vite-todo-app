10.times do |n|
  List.find_or_create_by!(title: "やること#{n+1}", content: "詳細#{n+1}")
end