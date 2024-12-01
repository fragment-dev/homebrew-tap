require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5843.0.0-darwin-x64.tar.gz"
    sha256 "d0d20a2585674fad165a83a8f239d77c39ff90c21f25ef646d7dff2a91566ad0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5843.0.0-darwin-arm64.tar.gz"
      sha256 "8a86c207ae96dddcd017d2ee7fe36281ec9586baf149b75a2da1715f8d03e322"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5843.0.0-linux-x64.tar.gz"
    sha256 "bc72dbdfbfa12b4d917370b2bc1cb81cc0a9178689bd77519b9e0c3e6ce5aec2"
  end
  version "5843.0.0"
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
