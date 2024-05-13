require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5039.0.0-darwin-x64.tar.gz"
    sha256 "cd2ef5fe62cfd77ada7d7071099087eebc55c16d62fbf290ab40170e9c8cb7db"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5039.0.0-darwin-arm64.tar.gz"
      sha256 "f9d4b80429ac6cf027f95a1ad03d19e1b43963f8390aba744f1504f33dfd2a70"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5039.0.0-linux-x64.tar.gz"
    sha256 "7b870f930580004b6e7ea6aac712c99768b843395ace556100718c015e175b03"
  end
  version "5039.0.0"
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
