class FavoriteMailer < ApplicationMailer

    default from: 'NateSrkn@gmail.com'

    def new_comment(user, post, comment)
        headers["Message-ID"] = "<comments/#{comment.id}@pacific-oasis-57727>"
        headers["In-Reply-To"] = "<post/#{post.id}@pacific-oasis-57727>"
        headers["References"] = "<post/#{post.id}@pacific-oasis-57727>"

        @user = user
        @post = post 
        @comment = comment

        mail(to: user.email, subject: "New comment on #{post.title}")
    end
end
