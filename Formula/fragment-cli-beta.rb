require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4598.0.0-darwin-x64.tar.gz"
    sha256 "3365c34086115ba1dde17f09264c1b6de570f04a448e821995a0710f9b2e1926"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4598.0.0-darwin-arm64.tar.gz"
      sha256 "b8d171e8c5209b5450e5a772c8aa7c0e3af3a27de8c36aa70dc3c42ebcaaf542"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4598.0.0-linux-x64.tar.gz"
    sha256 "308c120d1bc88a441aabfb56df536da368acf39d757fc17b6f57a44c5b4eea07"
  end
  version "4598.0.0"
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
