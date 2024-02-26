require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4634.0.0-darwin-x64.tar.gz"
    sha256 "56feb3f8e0e949109485127cb382fdada3452d8b32ce2a90b42797c9f2b5386c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4634.0.0-darwin-arm64.tar.gz"
      sha256 "2087ea8b4749dbba3ee5ac8761b24a021a67037d1baf6b59c25bbe9135d79470"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4634.0.0-linux-x64.tar.gz"
    sha256 "57abe17329e409421a65ae038dd221411868b3c7e748cd4d1bac20c319ef2ca4"
  end
  version "4634.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
