require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4180.0.0-darwin-x64.tar.gz"
    sha256 "18b7833a454d6a362a39d5dc5e71084120a4838cd31df7776f9292d1c7476427"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4180.0.0-darwin-arm64.tar.gz"
      sha256 "c27b162de363ca0cfed5c88972fe96abbd6efee6428e9a7542596fb9ba5af582"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4180.0.0-linux-x64.tar.gz"
    sha256 "4023b86c23f2efe174a8fe2c0806658bd3b9304791cf5cfb5174f636b8867f15"
  end
  version "4180.0.0"
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
