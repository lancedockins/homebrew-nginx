class BrotliNginxModule < Formula
  desc "NGINX module for Brotli compression"
  homepage "https://github.com/google/ngx_brotli"
  url "https://github.com/google/ngx_brotli.git", :using => :git
  head "https://github.com/google/ngx_brotli.git", branch: "master"
  version "0.1.3"

  def install
    pkgshare.install Dir["*"]
  end
end
