require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4498.0.0-darwin-x64.tar.gz"
    sha256 "b8299dbfdfde1a0165bad09e22a24c879cb6763247905909ce88e4f43ede375b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4498.0.0-darwin-arm64.tar.gz"
      sha256 "523acd0fabed4c5f3a4fb9ac167e6060ed81c8738561a4dc7a858453c713522d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4498.0.0-linux-x64.tar.gz"
    sha256 "17c153711bc10d09d6ca6f899fabb98882a3ed84632fd54c4218265e5c9395f2"
  end
  version "4498.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
