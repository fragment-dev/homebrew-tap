require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4375.0.0-darwin-x64.tar.gz"
    sha256 "d5145984b63b73469bd8d76cc1223840f13ede934df8bdfe542c7cec3a5a991a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4375.0.0-darwin-arm64.tar.gz"
      sha256 "e38841db6a264fc6af21c868f8487d0d0acc3c2015a9809c17732c564671c739"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4375.0.0-linux-x64.tar.gz"
    sha256 "5ae978aeb923048cb6c677ad10fad7a0e53eaad3147230dc38da8e124604930b"
  end
  version "4375.0.0"
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
