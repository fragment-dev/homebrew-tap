require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1965.0.0-darwin-x64.tar.gz"
    sha256 "9225d67b77359d46ca80b5716d6b1bc6a0bc10ed4650938f7cb288a7d2f3a736"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1965.0.0-darwin-arm64.tar.gz"
      sha256 "50323579012e868f4ea9b395a4d85675b2c8d9c262de2cf1ace601e969642d96"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1965.0.0-linux-x64.tar.gz"
    sha256 "502d3f75d62b064a9ea680580630358485131750d9a56f66a7e8dd51bb04e847"
  end
  version "1965.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
