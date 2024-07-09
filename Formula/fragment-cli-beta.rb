require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5369.0.0-darwin-x64.tar.gz"
    sha256 "6fe3a1ba217215348785b572d69bcc7adb7c5f6d5ef17654446b7539fa05b1fb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5369.0.0-darwin-arm64.tar.gz"
      sha256 "7541c6f333bf8773cddc2e9914e998f1218c932aaa04f3ce5af746f8926feba1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5369.0.0-linux-x64.tar.gz"
    sha256 "406573ec800b72cffa5b5acea729c6403e83bd1cd35eca562ba592641c04ff53"
  end
  version "5369.0.0"
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
