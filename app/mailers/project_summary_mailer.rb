class ProjectSummaryMailer < ApplicationMailer
  layout 'pdf'

  def send_project_summary
    @project = params[:project]
    email = params[:email]
    attachments["project_#{@project.id}.pdf"] = WickedPdf.new.pdf_from_string(
                                                         render_to_string(
                                                           pdf: 'project',
                                                           template: "projects/pdf_show.html.erb",
                                                           layout: "pdf.html"
                                                         ))

    mail(to: email, subject: "Project #{@project.title} Progress Summary", project: @project)
  end
end
