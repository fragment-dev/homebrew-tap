require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3645.0.0-darwin-x64.tar.gz"
    sha256 "a6dd50b207540e80d672b827e80adc3127c7ac9823758c6490c78f4e596a2c13"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3645.0.0-darwin-arm64.tar.gz"
      sha256 "8751fb28b5cea2518617cfe3d04fa11351f1b26fcd34c9d5a13a1950feefe222"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3645.0.0-linux-x64.tar.gz"
    sha256 "0a5af9d4f0ae73e3e666bb6c39ec89571761e75b2fe03b8d8de5272d8b4c0f9d"
  end
  version "3645.0.0"
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
