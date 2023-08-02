require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3211.0.0-darwin-x64.tar.gz"
    sha256 "93d8bbaccf2b403b14aaa0512d41d95dbff8202c3225de8e700bf11a4aa1a439"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3211.0.0-darwin-arm64.tar.gz"
      sha256 "70cd88ce2179c81c5320d8f63fdf7ff190df00dc0f3174ee0a9b9966f3070a95"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3211.0.0-linux-x64.tar.gz"
    sha256 "ca53352a7bd738488689f99f6af54dd2c5b468d82dc3b85106996c8c7515d1c8"
  end
  version "3211.0.0"
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
