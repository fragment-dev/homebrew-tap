require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3772.0.0-darwin-x64.tar.gz"
    sha256 "a62740c9e2598501ce8f834f1bf0e305a7f28bb21e2f996bf907734dc49c0b42"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3772.0.0-darwin-arm64.tar.gz"
      sha256 "3f4463087a15e24017ceb941cc73adb1f46f69321177dfe625bbff978e2cf7ac"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3772.0.0-linux-x64.tar.gz"
    sha256 "94da8c2e211dbc2a7f0f534cadc2695de3297d9066df66dc60628a3130e93c4d"
  end
  version "3772.0.0"
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
