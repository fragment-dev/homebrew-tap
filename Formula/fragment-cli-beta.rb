require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5553.0.0-darwin-x64.tar.gz"
    sha256 "1b2cfe7f2870e8e42ba9703e203cfc5d50776cdb55bad1f3ba1140c35d5c5920"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5553.0.0-darwin-arm64.tar.gz"
      sha256 "5678f2efeedcb8d0d962ba21883a2e3337d3c3f9345b28d0700838994d272301"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5553.0.0-linux-x64.tar.gz"
    sha256 "5ae5f9abd9227b3b00cafee5f07693530c5df18bac20254511a3b14df155dd3c"
  end
  version "5553.0.0"
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
