module CoursesHelper
  def getYouTubeVideoID(video_url)
    YoutubeID.from(video_url)
  end
end
