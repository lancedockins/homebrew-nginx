class NjsNginxModule < Formula
  desc "Adds support for njs scripting to nginx"
  homepage "https://github.com/nginx/njs"
  url "https://github.com/nginx/njs/archive/0.7.10.tar.gz"
  sha256 "fa69ce6819f172c34338dc23ba5126ac986caf4652c7c01ea02bcef93d558cc4"
  head "https://github.com/nginx/njs.git", branch: "master"

  depends_on "pcre2" => :build
  depends_on "readline" => :build

  def install
    # First, configure and install the njs command-line binary
    system "./configure"
    system "make", "njs"
    bin.install "build/njs"

    # Then, copy the rest of the module code over to the share to be used by
    # the `nginx-full` formula.
    pkgshare.install Dir["*"]
  end

  test do
    system "njs", "-v"
  end
end
