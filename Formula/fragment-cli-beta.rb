require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5450.0.0-darwin-x64.tar.gz"
    sha256 "e98f9421e9a37911caa959a07b587a5869d97a39eb2927de96e0ec3c87a6c424"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5450.0.0-darwin-arm64.tar.gz"
      sha256 "4ec2c442276ed36441138449bdb7e335533ccf2167a2e5d3a24484b747e1b03d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5450.0.0-linux-x64.tar.gz"
    sha256 "ba814a3a22c7399e2f4eafbbbcb3c34163379a1e4ca48b6f14baf1dfa39b1da2"
  end
  version "5450.0.0"
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
