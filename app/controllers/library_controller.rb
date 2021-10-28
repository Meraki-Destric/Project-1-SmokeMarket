class LibraryController < ApplicationController
  # Required the user be logged-in before being able to access this data
  before_action :authenticate_user!

  def index
    # Grabs all of the items currently in the users library
    @library_books = current_user.library_additions
  end
end
