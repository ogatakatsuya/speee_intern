# frozen_string_literal: true

# crumb :root do
#   link "店舗一覧", root_path
# end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).

crumb :branch_index do
  link '店舗一覧', branches_path
end

crumb :branch_show do |branch|
  link branch.name, branch_path(branch)
  parent :branch_index
end

crumb :review_show do |review|
  link "#{review.branch.name}の口コミ", review_path(review)
  parent :branch_show, review.branch
end
