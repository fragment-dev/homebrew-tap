require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6140.0.0-darwin-x64.tar.gz"
    sha256 "612ce5b637f7eb11db0d0008bcb37cd911fb321637140b1993c6034717d8e789"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6140.0.0-darwin-arm64.tar.gz"
      sha256 "4d8ffe3e28b9422fbe648331d35c5de030c84f0521b891f491312f9fa16aef50"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6140.0.0-linux-x64.tar.gz"
    sha256 "c811884e5164568109ba4c80446d7536a5864c59eb5dbb52b790cc8d75b140ba"
  end
  version "6140.0.0"
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
